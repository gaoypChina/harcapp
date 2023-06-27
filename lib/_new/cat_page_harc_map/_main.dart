import 'dart:collection';
import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_harc_map/utils.dart';
import 'package:harcapp/_new/cat_page_home/community/communities_loader.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:polybool/polybool.dart' as pb;
import 'package:provider/provider.dart';
import 'package:semaphore/semaphore.dart';

import '../../values/consts.dart';
import '../api/harc_map.dart';
import '../app_drawer.dart';
import 'app_marker.dart';
import 'sample_points_optimizer.dart';
import 'model/marker_data.dart';
import 'marker_editor/_main.dart';

class CreateSamplePointsArgs{
  final double northLat;
  final double southLat;
  final double westLng;
  final double eastLng;
  final double zoom;
  final bool skipCached;
  final bool inUnseenMapOnly;
  final HashMap<int, HashMap<double, HashMap<double, bool>>> cached;
  final double? cachedZoom;
  final pb.Polygon seenMap;
  final List<MarkerData> allMarkers;

  const CreateSamplePointsArgs(this.northLat, this.southLat, this.westLng, this.eastLng, this.zoom, this.skipCached, this.inUnseenMapOnly, this.cached, this.cachedZoom, this.seenMap, this.allMarkers);
}

(List<LatLng>, List<List<bool>>, bool) createSamplePoints(
    CreateSamplePointsArgs args
){

  SamplePointsOptimizer.cached = args.cached;
  SamplePointsOptimizer.cachedZoom = args.cachedZoom;
  SamplePointsOptimizer.seenMap = args.seenMap;
  MarkerData.addAllToAll(args.allMarkers);

  return SamplePointsOptimizer.createSamplePoints(
      args.northLat,
      args.southLat,
      args.westLng,
      args.eastLng,

      args.zoom,

      skipCached: args.skipCached,
      inUnseenMapOnly: args.inUnseenMapOnly,
  );

}

class CatPageHarcMap extends StatefulWidget{

  static const double maxZoom = 18.0;
  static const String tileServer = 'https://tile.osmand.net/hd/{z}/{x}/{y}.png';
  static const int interactiveFlags = InteractiveFlag.drag |
  InteractiveFlag.flingAnimation |
  InteractiveFlag.pinchMove |
  InteractiveFlag.pinchZoom |
  InteractiveFlag.doubleTapZoom;

  const CatPageHarcMap({super.key});

  @override
  State<StatefulWidget> createState() => CatPageHarcMapState();

}

class CatPageHarcMapState extends State<CatPageHarcMap> with AfterLayoutMixin{

  static const Duration requestDuration = Duration(milliseconds: 1100);

  static int requestIndex = 0;

  static const double maxLatSpan = 85.0;
  static const double maxLngSpan = 180.0;

  static LatLng lastCenter = LatLng(54.5, 19.5);
  static double lastZoom = 5;

  @override
  void afterFirstLayout(BuildContext context) =>
    post((){
      if(mounted)
        Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHarcMap();
    });

  late LoginListener loginListener;

  late MapController mapController;

  List<LatLng>? lastRequestedSamples;
  List<LatLng>? otherMarkersUncertaintySamples;

  late Semaphore markerLoaderSemaphore;
  late int markerLoaderIndex;
  late bool markersLoading;

  late List<AppMarker> markersToDisplay;
  List<AppMarker> calculateMarkersToDisplay() => (MarkerData.all??[])
      .where((marker) => zoom > marker.minZoomAppearance)
      .map((m) => AppMarker(marker: m))
      .toList();

  Future<int> markerLoadingStarted() async {
    await markerLoaderSemaphore.acquire();
    int thisMarkerLoaderIndex = ++markerLoaderIndex;
    if(!markersLoading && mounted) setState(() => markersLoading = true);
    markerLoaderSemaphore.release();
    return thisMarkerLoaderIndex;
  }

  Future<void> markerLoadingEnded(int markerLoaderIndex) async {
    await markerLoaderSemaphore.acquire();
    if(this.markerLoaderIndex == markerLoaderIndex)
      if(mounted) setState(() => markersLoading = false);
    markerLoaderSemaphore.release();
  }

  Future<void> tryGetMarkers({required bool publicOnly}) async {
    if(!await isNetworkAvailable()) return;

    double thisNorthBound = northBound;
    double thisSouthBound = southBound;
    double thisWestBound = westBound;
    double thisEastBound = eastBound;
    double thisZoom = zoom;

    CustomPoint northWestDist = const SphericalMercator().project(LatLng(northBound, westBound));
    CustomPoint southEastDist = const SphericalMercator().project(LatLng(southBound, eastBound));

    double boundExtensionRation = publicOnly?1:.5;

    if(publicOnly) {
      bool fragmentAlreadySeen = SamplePointsOptimizer.isPublicMapSeen(
          northDist: northWestDist.y.toDouble(),
          southDist: southEastDist.y.toDouble(),
          westDist: northWestDist.x.toDouble(),
          eastDist: southEastDist.x.toDouble(),
          zoom: thisZoom
      );
      if(fragmentAlreadySeen){
        logger.d('Public map fragment already seen.');
        return;
      }
    } else {
      var (requestSamples, _, _) = await compute(
          createSamplePoints,
          CreateSamplePointsArgs(
            thisNorthBound,
            thisSouthBound,
            thisWestBound,
            thisEastBound,

            thisZoom,
            true,
            // skipCached
            true,
            // inUnseenMapOnly,

            SamplePointsOptimizer.cached,
            SamplePointsOptimizer.cachedZoom,
            SamplePointsOptimizer.seenMap,
            MarkerData.all ?? [],
          )
      );

      lastRequestedSamples = requestSamples;

      if(requestSamples.isEmpty)
        // This means everything we want to sample for markers is already cached.
        return;
    }

    int thisRequestIndex = ++requestIndex;

    await Future.delayed(requestDuration);

    // It means that another request has been made in the meantime.
    if(requestIndex != thisRequestIndex) return;
    else requestIndex = 0;

    int thisMarkerLoaderIndex = await markerLoadingStarted();

    int latDist = northWestDist.y.toInt() - southEastDist.y.toInt();
    int lngDist = southEastDist.x.toInt() - northWestDist.x.toInt();

    CustomPoint reqNorthWestDist = CustomPoint(
        northWestDist.x - boundExtensionRation*lngDist,
        northWestDist.y + boundExtensionRation*latDist
    );
    CustomPoint reqSouthEastDist = CustomPoint(
        southEastDist.x + boundExtensionRation*lngDist,
        southEastDist.y - boundExtensionRation*latDist
    );

    LatLng reqNorthWest = const SphericalMercator().unproject(reqNorthWestDist);
    LatLng reqSouthEast = const SphericalMercator().unproject(reqSouthEastDist);

    double reqNorthBound = reqNorthWest.latitude;
    double reqSouthBound = reqSouthEast.latitude;
    double reqWestBound = reqNorthWest.longitude;
    double reqEastBound = reqSouthEast.longitude;
    // If public only, we want to request a ceil zoom level in order to store the seen public map.
    // If not public, we want to request a floor zoom level in order to match the sampling points.
    double reqZoom = publicOnly?thisZoom.ceilToDouble():thisZoom;

    // The following variables are only used if publicOnly is false.
    late List<LatLng> requestSamples;
    late List<List<bool>> rectDecompMatrix;
    late bool noSamplesSkipped;

    if(!publicOnly)
      (requestSamples, rectDecompMatrix, noSamplesSkipped) = await compute(
          createSamplePoints,
          CreateSamplePointsArgs(
            reqNorthBound,
            reqSouthBound,
            reqWestBound,
            reqEastBound,

            reqZoom,
            true, // skipCached
            true, // inUnseenMapOnly

            SamplePointsOptimizer.cached,
            SamplePointsOptimizer.cachedZoom,
            SamplePointsOptimizer.seenMap,
            MarkerData.all??[],
          )
      );

    if(AppSettings.devMode && mounted && !publicOnly)
      showAppToast(context, text: 'Requested ${requestSamples.length} samples');

    await ApiHarcMap.getAllMarkers(
        publicOnly: publicOnly,

        northLat: reqNorthBound,
        southLat: reqSouthBound,
        westLng: reqWestBound,
        eastLng: reqEastBound,
        zoom: reqZoom,

        samples: publicOnly || noSamplesSkipped?null:rectDecompMatrix,

        onSuccess: (markers) {
          markers = MarkerData.addAllToAll(markers);
          markersToDisplay = calculateMarkersToDisplay();
          if(mounted) setState(() {});

          if(publicOnly){
            SamplePointsOptimizer.addSeenPublicMapFragment(
              northDist: reqNorthWestDist.y.toDouble(),
              southDist: reqSouthEastDist.y.toDouble(),
              westDist: reqNorthWestDist.x.toDouble(),
              eastDist: reqSouthEastDist.x.toDouble(),
              zoom: reqZoom
            );
            return;
          }
          SamplePointsOptimizer.cacheSamplePoints(
            requestSamples,
            reqZoom,
          );

          SamplePointsOptimizer.addSeenMapFragment(
            northDist: reqNorthWestDist.y.toDouble(),
            southDist: reqSouthEastDist.y.toDouble(),
            westDist: reqNorthWestDist.x.toDouble(),
            eastDist: reqSouthEastDist.x.toDouble(),
          );

          for(MarkerData marker in markers){
            var (latDistDelta, lngDistDelta) = HarcMapUtils.getDistanceDeltas(zoom);
            int newPotentialUncertaintyDist = max(latDistDelta, lngDistDelta);
            if(2*newPotentialUncertaintyDist < marker.otherMarkersUncertaintyDist)
              marker.otherMarkersUncertaintyDist = 2*newPotentialUncertaintyDist;
          }

          otherMarkersUncertaintySamples = SamplePointsOptimizer.otherMarkersUncertaintySamplePoints(
              reqNorthBound,
              reqSouthBound,
              reqWestBound,
              reqEastBound,
              reqZoom,
          );

          logger.d(
              'Loaded area:'
              '\nZ: ${reqZoom.toStringAsFixed(3)}'
              '\nN: ${reqNorthBound.toStringAsFixed(3)}'
              '\nS: ${reqSouthBound.toStringAsFixed(3)}'
              '\nW: ${reqWestBound.toStringAsFixed(3)}'
              '\nE: ${reqEastBound.toStringAsFixed(3)}'
              '\nFound markers: ${markers.length}'
          );

        },
        // onForceLoggedOut: () => This will never be called.
        onServerMaybeWakingUp: () {
          if (!mounted) return true;
          showServerWakingUpToast(context);
          return true;
        },
        onError: (_) {
          if (!mounted) return;
          showAppToast(context, text: simpleErrorMessage);
        }
    );

    await markerLoadingEnded(thisMarkerLoaderIndex);
  }

  @override
  void initState() {

    markerLoaderSemaphore = LocalSemaphore(999999999999);
    markerLoaderIndex = 0;
    markersLoading = false;

    mapController = MapController();
    markersToDisplay = calculateMarkersToDisplay();

    loginListener = LoginListener(
      onLogin: (emailConf) async {
        MarkerData.clear();
        SamplePointsOptimizer.clear();
        tryGetMarkers(publicOnly: !AccountData.loggedIn);
      },
      onRegistered: (){
        MarkerData.clear();
        SamplePointsOptimizer.clear();
        tryGetMarkers(publicOnly: !AccountData.loggedIn);
      },
      onEmailConfirmChanged: (emailConf){
        MarkerData.clear();
        SamplePointsOptimizer.clear();
        tryGetMarkers(publicOnly: !AccountData.loggedIn);
      },
      onLogout: (force){
        // The following commented are handled in `main` loginListener.
        // MarkerData.clear();
        // SamplePointsOptimizer.clear();
        tryGetMarkers(publicOnly: !AccountData.loggedIn);
      }
    );

    AccountData.addLoginListener(loginListener);

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    super.dispose();
  }

  double get northBound{
    try{
      return mapController.bounds!.north;
    } catch(e){
      return double.nan;
    }
  }

  double get southBound{
    try{
      return mapController.bounds!.south;
    } catch(e){
      return double.nan;
    }
  }

  double get westBound{
    try{
      return mapController.bounds!.west;
    } catch(e){
      return double.nan;
    }
  }

  double get eastBound{
    try{
      return mapController.bounds!.east;
    } catch(e){
      return double.nan;
    }
  }

  double get zoom{
    try{
      return mapController.zoom;
    } catch(e){
      return lastZoom;
    }
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MapEventChangedProvider()),
    ],
    builder: (context, child) => AppScaffold(
      bottomNavigationBar: const AppBottomNavigator(),
      body: Stack(
        children: [

          FlutterMap(
            options: MapOptions(
              center: lastCenter,
              crs: const Epsg3857(),
              maxBounds: LatLngBounds(LatLng(-maxLatSpan, -maxLngSpan), LatLng(maxLatSpan, maxLngSpan)),
              zoom: lastZoom,
              minZoom: 2,
              maxZoom: CatPageHarcMap.maxZoom,

              interactiveFlags: CatPageHarcMap.interactiveFlags,

              onMapReady: () => tryGetMarkers(publicOnly: !AccountData.loggedIn),

              onMapEvent: (event){

                lastCenter = event.center;
                lastZoom = event.zoom;

                if(event is MapEventMoveEnd || event is MapEventDoubleTapZoomEnd)
                  tryGetMarkers(publicOnly: !AccountData.loggedIn);

                markersToDisplay = calculateMarkersToDisplay();
                if(mounted) post(() => setState((){}));

                // MapEventChangedProvider.notify_(context);
              },
            ),
            mapController: mapController,
            children: [
              TileLayer(
                // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                // urlTemplate: 'http://mt{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                // urlTemplate: 'https://cdn.lima-labs.com/{z}/{x}/{y}.png?api=demo',
                urlTemplate: CatPageHarcMap.tileServer,
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              if(MarkerData.all != null)
                MarkerLayer(rotate: true, markers: markersToDisplay),

              if(AppSettings.devMode)
                IgnorePointer(
                  child: SamplingPointsLayerWidget(
                    markersToDisplay.hashCode,

                    lastRequestedSamples,
                    otherMarkersUncertaintySamples,
                    mapController
                  ),
                ),

              if(AppSettings.devMode)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: background_(context).withOpacity(.7),
                    child: Consumer<MapEventChangedProvider>(
                      builder: (context, prov, child){

                        CustomPoint center = const SphericalMercator().project(LatLng(mapController.center.latitude, mapController.center.longitude));
                        var (latDistDelta, lngDistDelta) = HarcMapUtils.getDistanceDeltas(zoom);

                        return Text(
                            'cntr X: ${center.x.toStringAsFixed(3)}\n'
                            'cntr Y: ${center.y.toStringAsFixed(3)}\n'
                            '\n'
                            'Z: ${zoom.toStringAsFixed(3)}\n'
                            'N: ${northBound.toStringAsFixed(3)}\n'
                            'S: ${southBound.toStringAsFixed(3)}\n'
                            'W: ${westBound.toStringAsFixed(3)}\n'
                            'E: ${eastBound.toStringAsFixed(3)}\n'
                            '\n'
                            'ΔscrnLat: ${(northBound - southBound).toStringAsFixed(3)}\n'
                            'ΔscrnLng: ${(eastBound - westBound).toStringAsFixed(3)}\n'
                            '\n'
                            'ΔlatDist: $latDistDelta\n'
                            'ΔlngDist: $lngDistDelta'
                        );
                      },
                    ),
                  ),
                ),

              if(AppSettings.devMode && !AccountData.loggedIn)
                SeenPublicMapLayerWidget(zoom.ceil())

            ],
          ),

          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SearchField(
                    elevation: AppCard.defElevation,
                    leading: const AccountHeaderIcon(),
                    hint: 'Szukaj...',
                    trailing:
                    markersLoading?Padding(
                      padding: const EdgeInsets.only(right: Dimen.ICON_MARG),
                      child: SpinKitSpinningLines(
                        size: Dimen.ICON_SIZE,
                        color: iconEnab_(context)
                      ),
                    ):null
                  ),

                  // SingleChildScrollView(
                  //   physics: const BouncingScrollPhysics(),
                  //   scrollDirection: Axis.horizontal,
                  //   clipBehavior: Clip.none,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: const [
                  //       TagWidget(MdiIcons.handshake, 'Służba'),
                  //       TagWidget(MdiIcons.accountChild, 'Zuchy'),
                  //       TagWidget(MdiIcons.account, 'Harcerze'),
                  //       TagWidget(MdiIcons.accountStar, 'Harcerze Starsi'),
                  //       TagWidget(MdiIcons.accountCowboyHat, 'Wędrownicy'),
                  //       TagWidget(MdiIcons.school, 'Krąg akademicki'),
                  //       TagWidget(MdiIcons.candle, 'Duszpasterstwa'),
                  //       TagWidget(MdiIcons.tent, 'Miejsca biwakowe'),
                  //       TagWidget(MdiIcons.flagTriangle, 'Miejsca obozowe'),
                  //     ],
                  //   ),
                  // )
                ],
              )
          ),

        ],
      ),

      floatingActionButton: Consumer2<LoginProvider, CommunityListProvider>(
          builder: (context, loginProv, commListProv, child) {

            if(!loginProv.loggedIn)
              return ExtendedFloatingButton(
                  MdiIcons.plus,
                  'Zaloguj się i dodawaj',
                  background: background_(context),
                  onTap: () => AccountPage.open(context)
              );

            if(Community.all == null && communitiesLoader.running)
              return FloatingActionButton(
                  backgroundColor: background_(context),
                  child: SpinKitChasingDots(
                    color: iconEnab_(context),
                    size: Dimen.ICON_SIZE,
                  ),
                  onPressed: () => showAppToast(context, text: 'Ładowanie środowisk...')
              );

            if(Community.all == null && !communitiesLoader.running)
              return FloatingActionButton(
                  backgroundColor: background_(context),
                  child: Icon(MdiIcons.alertCircleOutline),
                  onPressed: () => showAppToast(context, text: 'Problem z ładowaniem')
              );

            return FloatingActionButton(
                backgroundColor: background_(context),
                child: Icon(MdiIcons.plus, color: iconEnab_(context)),
                onPressed: () => pushPage(
                    context,
                    builder: (context) => MarkerEditorPage(
                      initZoom: mapController.zoom,
                      initCenter: mapController.center,
                      onSuccess: (marker){
                        MarkerData.addToAll(marker);
                        setState(() {});

                        mapController.moveAndRotate(
                          LatLng(marker.lat, marker.lng),
                          15,
                          0
                        );

                        showAppToast(context, text: 'Dodano miejsce');

                      },
                    )
                )
            );

          }
      ),

    ),
  );

}

class TagWidget extends StatelessWidget{

  final IconData icon;
  final String text;

  const TagWidget(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.defRadius,
      padding: const EdgeInsets.all(SearchField.defMargVal),
      margin: const EdgeInsets.all(SearchField.defMargVal),
      color: cardEnab_(context),
      elevation: AppCard.defElevation,
      child: Row(
        children: [
          Icon(icon, size: 20.0),
          const SizedBox(width: Dimen.ICON_MARG),
          Text(text, style: AppTextStyle(color: iconEnab_(context), fontWeight: weight.halfBold)),
          const SizedBox(width: Dimen.ICON_MARG),
        ],
      ),
      onTap: (){}
  );

}

class MapEventChangedProvider extends ChangeNotifier{

  static MapEventChangedProvider of(BuildContext context) => Provider.of<MapEventChangedProvider>(context, listen: false);
  static notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class SamplingPointsLayerWidget extends StatefulWidget{

  final int markersToDisplayHash;
  final List<LatLng>? lastRequestedSamples;
  final List<LatLng>? otherMarkersUncertaintySamples;
  final MapController mapController;

  const SamplingPointsLayerWidget(
      this.markersToDisplayHash,
      this.lastRequestedSamples,
      this.otherMarkersUncertaintySamples,
      this.mapController,
      { super.key });

  @override
  State<StatefulWidget> createState() => SamplingPointsLayerWidgetState();

}

class SamplingPointsLayerWidgetState extends State<SamplingPointsLayerWidget>{

  int get markersToDisplayHash => widget.markersToDisplayHash;
  List<LatLng>? get lastRequestedSamples => widget.lastRequestedSamples;
  List<LatLng>? get otherMarkersUncertaintySamples => widget.otherMarkersUncertaintySamples;
  MapController get mapController => widget.mapController;

  double get northLat => mapController.bounds!.north;
  double get southLat => mapController.bounds!.south;
  double get westLng => mapController.bounds!.west;
  double get eastLng => mapController.bounds!.east;

  double get zoom => mapController.zoom;

  Future<void> run() async {
    while(true){
      await Future.delayed(const Duration(milliseconds: 1000~/30));
      if(!mounted) return;
      int currentMapViewHash = calculateLastMapViewHash();
      if(currentMapViewHash == lastMapViewHash) continue;

      markers = calculateMarkers();
      lastMapViewHash = calculateLastMapViewHash();
      setState(() {});
    }
  }

  late List<Marker> markers;

  late int lastMapViewHash;

  int calculateLastMapViewHash() => markersToDisplayHash + northLat.hashCode + southLat.hashCode + westLng.hashCode + eastLng.hashCode + zoom.hashCode;

  List<Marker> calculateMarkers() => SamplePointsOptimizer.createSamplePoints(
      northLat,
      southLat,
      westLng,
      eastLng,
      zoom
  ).$1
      .map((samplePoint) => Marker(
      point: samplePoint,
      builder: (context) => Icon(
          MdiIcons.circleSmall,
          color: (
              (lastRequestedSamples??[]).contains(samplePoint)?
              // Recently requested.
              Colors.blue:
              SamplePointsOptimizer.isSamplePointCached(samplePoint, zoom)?
              // Cached long time ago.
              Colors.deepPurple:
              // Not requested before.
              Colors.red
          ).withOpacity(.8)
      )
  )).toList() +

      (otherMarkersUncertaintySamples??[])
          .map((emptySpaceSample) => Marker(
          point: emptySpaceSample,
          builder: (context) => Icon(
            MdiIcons.plusThick,
            color: Colors.deepPurple.withOpacity(.8),
            size: 12,
          )
      )).toList();

  @override
  void initState() {
    lastMapViewHash = calculateLastMapViewHash();
    markers = calculateMarkers();
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MarkerLayer(
      markers: markers
  );

}

class SeenPublicMapLayerWidget extends StatelessWidget{

  final int zoom;

  const SeenPublicMapLayerWidget(this.zoom, {super.key});

  @override
  Widget build(BuildContext context) => PolygonLayer(
      polygons: (SamplePointsOptimizer.seenPublicMap[zoom]?.regions??[]).map((coordinates) => Polygon(
          points: coordinates.map((coord) => const SphericalMercator().unproject(CustomPoint(coord.x, coord.y))).toList(),
          isFilled: true,
          color: Colors.blue.withOpacity(.2),
          borderColor: Colors.blue.withOpacity(.5),
          borderStrokeWidth: 1.0
      )).toList()
  );

}
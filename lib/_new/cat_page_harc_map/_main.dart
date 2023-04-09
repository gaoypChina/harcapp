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
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
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
import 'package:provider/provider.dart';
import 'package:semaphore/semaphore.dart';
import 'package:tuple/tuple.dart';

import '../../values/consts.dart';
import '../api/harc_map.dart';
import '../app_drawer.dart';
import 'app_marker.dart';
import 'sample_points_optimizer.dart';
import 'model/marker_data.dart';
import 'marker_editor/_main.dart';

Tuple3<List<LatLng>, List<List<bool>>, bool> createSamplePoints(
    Tuple7<
        double, // northBound
        double, // southBound
        double, // westBound
        double, // eastBound

        double, // zoom

        bool, // skipCached
        bool // inUnseenMapOnly
    > args
) => SamplePointsOptimizer.createSamplePoints(
    args.item1,
    args.item2,
    args.item3,
    args.item4,

    args.item5,

    skipCached: args.item6,
    inUnseenMapOnly: args.item7
);

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

  static const double maxLatSpan = 85.0;
  static const double maxLngSpan = 180.0;

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHarcMap());
  }

  late LoginListener loginListener;

  late MapController mapController;

  List<LatLng>? lastRequestedSamples;
  List<LatLng>? otherMarkersUncertaintySamples;

  late Semaphore markerLoaderSemaphore;
  late int markerLoaderIndex;
  late bool markersLoading;

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
    if(!await isNetworkAvailable())
      return;

    double thisNorthBound = northBound;
    double thisSouthBound = southBound;
    double thisWestBound = westBound;
    double thisEastBound = eastBound;
    double thisZoom = zoom;

    Tuple3<List<LatLng>, List<List<bool>>, bool> samplePointsResult = await compute(
        createSamplePoints,
        Tuple7(
            thisNorthBound,
            thisSouthBound,
            thisWestBound,
            thisEastBound,

            thisZoom,
            true, // skipCached
            true, // inUnseenMapOnly
        )
    );

    List<LatLng> requestSamples = samplePointsResult.item1;
    List<List<bool>> rectDecompMatrix = samplePointsResult.item2;
    bool noSamplesSkipped = samplePointsResult.item3;

    lastRequestedSamples = requestSamples;

    if(requestSamples.isEmpty)
      // This means everything we want to sample for markers is already cached.
      return;

    int thisMarkerLoaderIndex = await markerLoadingStarted();

    await ApiHarcMap.getAllMarkers(
        publicOnly: publicOnly,

        northLat: thisNorthBound,
        southLat: thisSouthBound,
        westLng: thisWestBound,
        eastLng: thisEastBound,
        zoom: thisZoom,

        samples: noSamplesSkipped?null:rectDecompMatrix,

        onSuccess: (markers) {
          markers = MarkerData.addAllToAll(markers);
          if(mounted) setState(() {});

          if(publicOnly) return;
          SamplePointsOptimizer.cacheSamplePoints(
            requestSamples,
            thisZoom,
          );

          CustomPoint northWestDist = const SphericalMercator().project(LatLng(thisNorthBound, thisWestBound));
          CustomPoint southEastDist = const SphericalMercator().project(LatLng(thisSouthBound, thisEastBound));

          SamplePointsOptimizer.addSeenMapFragment(
            northDist: northWestDist.y,
            southDist: southEastDist.y,
            westDist: northWestDist.x,
            eastDist: southEastDist.x,
          );

          for(MarkerData marker in markers){
            Tuple2<int, int> distDeltas = HarcMapUtils.getDistanceDeltas(zoom);
            int latDistDelta = distDeltas.item1;
            int lngDistDelta = distDeltas.item2;
            int newPotentialUncertaintyDist = max(latDistDelta, lngDistDelta);
            if(2*newPotentialUncertaintyDist < marker.otherMarkersUncertaintyDist)
              marker.otherMarkersUncertaintyDist = 2*newPotentialUncertaintyDist;
          }

          otherMarkersUncertaintySamples = SamplePointsOptimizer.otherMarkersUncertaintySamplePoints(
              thisNorthBound,
              thisSouthBound,
              thisWestBound,
              thisEastBound,
              thisZoom,

              requestSamples
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
      onForceLogout: (){
        MarkerData.clear();
        SamplePointsOptimizer.clear();
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
      return -1;
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
              center: LatLng(54.5, 19.5),
              crs: const Epsg3857(),
              maxBounds: LatLngBounds(LatLng(-maxLatSpan, -maxLngSpan), LatLng(maxLatSpan, maxLngSpan)),
              zoom: 5,
              minZoom: 2,
              maxZoom: CatPageHarcMap.maxZoom,

              interactiveFlags: CatPageHarcMap.interactiveFlags,

              onMapReady: () => tryGetMarkers(publicOnly: !AccountData.loggedIn),

              onMapEvent: (event){
                if(event is MapEventMoveEnd || event is MapEventDoubleTapZoomEnd)
                  tryGetMarkers(publicOnly: !AccountData.loggedIn);

                MapEventChangedProvider.notify_(context);
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
                MarkerLayer(rotate: true, markers: MarkerData.all!
                  .where((marker) => zoom > marker.minZoomAppearance)
                  .map((m) => AppMarker(marker: m))
                  .toList()
                ),

              if(AppSettings.devMode)
                IgnorePointer(
                  child: SamplingPointsLayerWidget(
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
                      builder: (context, prov, child) => Text(
                        'X: ${const SphericalMercator().project(LatLng(mapController.center.latitude, mapController.center.longitude)).x.toStringAsFixed(3)}\n'
                        'Y: ${const SphericalMercator().project(LatLng(mapController.center.latitude, mapController.center.longitude)).y.toStringAsFixed(3)}\n'
                        '\n'
                        'Z: ${zoom.toStringAsFixed(3)}\n'
                        'N: ${northBound.toStringAsFixed(3)}\n'
                        'S: ${southBound.toStringAsFixed(3)}\n'
                        'W: ${westBound.toStringAsFixed(3)}\n'
                        'E: ${eastBound.toStringAsFixed(3)}\n'
                        '\n'
                        'ΔLat: ${(northBound - southBound).toStringAsFixed(3)}\n'
                        'ΔLng: ${(eastBound - westBound).toStringAsFixed(3)}'
                      ),
                    ),
                  ),
                ),

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

            if(Community.all == null)
              return FloatingActionButton(
                  backgroundColor: background_(context),
                  child: SpinKitChasingDots(
                    color: iconEnab_(context),
                    size: Dimen.ICON_SIZE,
                  ),
                  onPressed: () => showAppToast(context, text: 'Ładowanie środowisk...')
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

  final List<LatLng>? lastRequestedSamples;
  final List<LatLng>? otherMarkersUncertaintySamples;
  final MapController mapController;

  const SamplingPointsLayerWidget(
      this.lastRequestedSamples,
      this.otherMarkersUncertaintySamples,
      this.mapController,
      { super.key });

  @override
  State<StatefulWidget> createState() => SamplingPointsLayerWidgetState();

}

class SamplingPointsLayerWidgetState extends State<SamplingPointsLayerWidget>{

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
      setState(() {});
    }
  }

  @override
  void initState() {
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MarkerLayer(
      markers: SamplePointsOptimizer.createSamplePoints(
          northLat,
          southLat,
          westLng,
          eastLng,
          zoom
      ).item1
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
      )).toList()
  );

}
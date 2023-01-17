import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../values/consts.dart';
import '../api/harc_map.dart';
import '../app_drawer.dart';
import 'app_marker.dart';
import 'model/marker_data.dart';
import 'marker_editor/_main.dart';

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

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHarcMap());
  }

  // static List<MarkerData>? markers;
  // static List<MarkerData>? publicOnlyMarkers;

  late LoginListener loginListener;

  late MapController mapController;

  void getMarkers({required bool publicOnly}) => ApiHarcMap.getAllMarkers(
      publicOnly: publicOnly,

      northLat: mapController.bounds!.north,
      southLat: mapController.bounds!.south,
      westLng: mapController.bounds!.west,
      eastLng: mapController.bounds!.east,
      zoom: mapController.zoom,

      onSuccess: (markers){
        // CatPageHarcMapState.publicOnlyMarkers = markers;
        MarkerData.addAllToAll(markers);
        if(mounted) setState((){});
      },
      // onForceLoggedOut: () => This will never be called.
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        return true;
      },
      onError: (_){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      }
  );

  @override
  void initState() {

    mapController = MapController();

    loginListener = LoginListener(
      onLogin: (emailConf){
        getMarkers(publicOnly: !AccountData.loggedIn);
      },
      onRegistered: (){
        getMarkers(publicOnly: !AccountData.loggedIn);
      },
      onEmailConfirmChanged: (emailConf){
        getMarkers(publicOnly: !AccountData.loggedIn);
      },
      onForceLogout: (){
        getMarkers(publicOnly: !AccountData.loggedIn);
      }
    );

    AccountData.addLoginListener(loginListener);

    post(() => getMarkers(publicOnly: !AccountData.loggedIn));

    super.initState();
  }

  @override
  void dispose() {
    AccountData.removeLoginListener(loginListener);
    super.dispose();
  }

  double getZoom(){

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
              zoom: 5,
              minZoom: 2,
              maxZoom: CatPageHarcMap.maxZoom,

              interactiveFlags: CatPageHarcMap.interactiveFlags,

              onMapEvent: (event){
                if(event is MapEventMoveEnd || event is MapEventDoubleTapZoomEnd)
                  getMarkers(publicOnly: !AccountData.loggedIn);

                MapEventChangedProvider.notify_(context);
                // print('${mapController.zoom}\t' // zoom
                //     '${mapController.bounds?.northWest.latitude}\t' // lat1
                //     '${mapController.bounds?.northWest.longitude}\t' //lng1
                //     '${mapController.bounds?.southEast.latitude}\t' // lat2
                //     '${mapController.bounds?.southEast.longitude}'); //lng2
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
                    .where((marker) => mapController.zoom > marker.minZoomAppearance)
                    .map((m) => AppMarker(marker: m))
                    .toList()
                ),

              if(AppSettings.devMode)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    color: background_(context),
                    child: Consumer<MapEventChangedProvider>(
                      builder: (context, prov, child) => Text('Zoom: ${getZoom()}'),
                    ),
                  ),
                )
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
              return Container();

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
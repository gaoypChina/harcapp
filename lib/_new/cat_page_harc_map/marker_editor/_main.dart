import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/danger_part.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:latlong2/latlong.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'communities_part.dart';
import 'info_part.dart';
import 'location_part.dart';

class MarkerEditorPage extends StatefulWidget{

  final MarkerData? initMarker;
  final double? initZoom;
  final LatLng? initCenter;
  final void Function(MarkerData marker)? onSuccess;

  const MarkerEditorPage({this.initMarker, this.initZoom, this.initCenter, this.onSuccess, super.key});

  @override
  State<StatefulWidget> createState() => MarkerEditorPageState();

}

class MarkerEditorPageState extends State<MarkerEditorPage> with TickerProviderStateMixin{

  MarkerData? get initMarker => widget.initMarker;
  double? get initZoom => widget.initZoom;
  LatLng? get initCenter => widget.initCenter;

  void Function(MarkerData marker)? get onSuccess => widget.onSuccess;

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: initMarker==null?3:4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PositionProvider(
        initLat: initMarker?.lat??initCenter?.latitude,
        initLng: initMarker?.lng??initCenter?.longitude,
      )),

      ChangeNotifierProvider(create: (context) => NameProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => MarkerTypeProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => MarkerVisibilityProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => ContactProvider(initMarker: initMarker)),
      ChangeNotifierProvider(create: (context) => BindedCommunitiesProvider(initMarker: initMarker)),
    ],
    builder: (context, child) => BottomNavScaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          // SliverOverlapAbsorber does not work with SliverAppBar(pinned = true);
          // SliverOverlapAbsorber(
          //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          //   sliver:
            SliverAppBar(
              title: Text(initMarker == null?'Dodaj miejsce':'Edytuj miejsce'),
              forceElevated: innerBoxIsScrolled,
              centerTitle: true,
              pinned: true,

              actions: [
                IconButton(
                  icon: const Icon(MdiIcons.check),
                  onPressed: (){

                    PositionProvider positionProv = PositionProvider.of(context);

                    if(positionProv.editMode)
                      positionProv.applyPosition();

                    if(positionProv.lat == wawelLat && positionProv.lng == wawelLng){

                      controller.animateTo(2);
                      showAppToast(
                        context,
                        text: 'No halo, może zmień lokalizację z trawnika przed Wawelem...',
                        duration: const Duration(seconds: 8)
                      );
                      return;
                    }

                    NameProvider nameProv = NameProvider.of(context);

                    // if(nameProv.name.isEmpty){
                    //
                    //   controller.animateTo(0);
                    //   nameProv.focusNode.requestFocus();
                    //   showAppToast(
                    //       context,
                    //       text: 'Wypadałoby podać jakąś nazwę, nie...?',
                    //       duration: const Duration(seconds: 8)
                    //   );
                    //   return;
                    // }

                    MarkerTypeProvider markerTypeProv = MarkerTypeProvider.of(context);
                    MarkerVisibilityProvider markerVisibilityProv = MarkerVisibilityProvider.of(context);
                    ContactProvider contactProv = ContactProvider.of(context);
                    BindedCommunitiesProvider bindedCommProv = BindedCommunitiesProvider.of(context);

                    if(initMarker == null)
                      ApiHarcMap.create(
                        name: nameProv.name,
                        contact: contactProv.contact,
                        lat: positionProv.lat,
                        lng: positionProv.lng,
                        type: markerTypeProv.markerType,
                        visibility: markerVisibilityProv.markerVisibility,

                        communityKeys: bindedCommProv.addedCommunities,

                        onSuccess: (MarkerData marker){
                          onSuccess?.call(marker);
                          Navigator.pop(context);
                        },
                        onForceLoggedOut: (){
                          return true;
                        },
                        onServerMaybeWakingUp: (){
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: (){
                          if(mounted) showAppToast(context, text: simpleErrorMessage);
                        },
                      );
                    else
                      ApiHarcMap.update(
                        markerKey: initMarker!.key,

                        name: initMarker!.name == nameProv.name?
                        null:
                        Optional.of(nameProv.name),

                        contact: initMarker!.contact == contactProv.contact?
                        null:
                        Optional.of(Tuple2(initMarker!.contact, contactProv.contact)),

                        lat: initMarker!.lat != positionProv.lat?
                        positionProv.lat:
                        null,

                        lng: initMarker!.lng != positionProv.lng?
                        positionProv.lng:
                        null,

                        type: initMarker!.type != markerTypeProv.markerType?
                        markerTypeProv.markerType:
                        null,

                        visibility: initMarker!.visibility != markerVisibilityProv.markerVisibility?
                        markerVisibilityProv.markerVisibility:
                        null,

                        addCommunity: bindedCommProv.addedCommunities,
                        editCommunity: bindedCommProv.editedCommunities,
                        removeCommunity: bindedCommProv.removedCommunities,

                        onSuccess: (MarkerData marker){
                          onSuccess?.call(marker);
                          Navigator.pop(context);
                        },
                        onForceLoggedOut: (){
                          return true;
                        },
                        onServerMaybeWakingUp: (){
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: (){
                          if(mounted) showAppToast(context, text: simpleErrorMessage);
                        },
                      );

                  },
                )
              ],
              bottom: TabBar(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                isScrollable: initMarker != null,
                indicator: AppTabBarIncdicator(context: context),
                tabs: [
                  const Tab(text: 'Informacje'),
                  const Tab(text: 'Środowiska'),
                  const Tab(text: 'Lokalizacja'),
                  if(initMarker != null)
                    const Tab(text: 'Strefa zagrożenia'),
                ],
              ),

            )
          // )

        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children: [
            const InfoPart(),
            const CommunitiesPart(),
            LocationPart(initZoom: initZoom),
            if(initMarker != null)
              DangerPart(
                initMarker!,
                onDeleted: (){
                  Navigator.pop(context);
                  setState(() {});
                },
              )
          ],
        ),

      ),
    ),

  );

}
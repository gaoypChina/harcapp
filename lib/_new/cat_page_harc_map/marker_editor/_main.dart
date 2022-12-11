import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:optional/optional_internal.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'communities_part.dart';
import 'info_part.dart';
import 'location_part.dart';

class MarkerEditorPage extends StatefulWidget{

  final MarkerRespBody? initMarker;
  final void Function(MarkerRespBody marker)? onSuccess;

  const MarkerEditorPage({this.initMarker, this.onSuccess, super.key});

  @override
  State<StatefulWidget> createState() => MarkerEditorPageState();

}

class MarkerEditorPageState extends State<MarkerEditorPage> with TickerProviderStateMixin{

  MarkerRespBody? get initMarker => widget.initMarker;
  void Function(MarkerRespBody marker)? get onSuccess => widget.onSuccess;

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PositionProvider(initMarker: initMarker)),

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

                    if(nameProv.name.isEmpty){

                      controller.animateTo(0);
                      nameProv.focusNode.requestFocus();
                      showAppToast(
                          context,
                          text: 'Wypadałoby podać jakąś nazwę, nie...?',
                          duration: const Duration(seconds: 8)
                      );
                      return;
                    }

                    MarkerTypeProvider markerTypeProv = MarkerTypeProvider.of(context);
                    MarkerVisibilityProvider markerVisibilityProv = MarkerVisibilityProvider.of(context);
                    ContactProvider contactProv = ContactProvider.of(context);
                    BindedCommunitiesProvider bindedCommProv = BindedCommunitiesProvider.of(context);

                    if(initMarker == null)
                      ApiHarcMap.createMarker(
                        name: nameProv.name,
                        contact: contactProv.contactData,
                        lat: positionProv.lat,
                        lng: positionProv.lng,
                        type: markerTypeProv.markerType,
                        visibility: markerVisibilityProv.markerVisibility,

                        communityKeys: bindedCommProv.addedCommunities,

                        onSuccess: (MarkerRespBody marker){
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

                        },
                      );
                    else
                      ApiHarcMap.updateMarker(
                        markerKey: initMarker!.key,
                        name: nameProv.name,
                        contact: initMarker!.contact == contactProv.contactData?
                        const Optional.empty():
                        Optional.of(Tuple2(initMarker!.contact, contactProv.contactData)),

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

                        onSuccess: (MarkerRespBody marker){
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

                        },
                      );

                  },
                )
              ],
              bottom: TabBar(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                indicator: AppTabBarIncdicator(context: context),
                tabs: const [
                  Tab(text: 'Informacje'),
                  Tab(text: 'Środowiska'),
                  Tab(text: 'Lokalizacja'),
                ],
              ),

            )
          // )

        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children: const [
            InfoPart(),
            CommunitiesPart(),
            LocationPart(),
          ],
        ),

      ),
    ),

  );

}
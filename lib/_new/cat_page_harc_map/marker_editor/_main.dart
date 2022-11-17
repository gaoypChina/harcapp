import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'info_part.dart';
import 'location_part.dart';

class MarkerEditorPage extends StatefulWidget{

  final MarkerRespBody? initMarker;

  const MarkerEditorPage({this.initMarker, super.key});

  @override
  State<StatefulWidget> createState() => MarkerEditorPageState();

}

class MarkerEditorPageState extends State<MarkerEditorPage> with TickerProviderStateMixin{

  MarkerRespBody? get initMarker => widget.initMarker;

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
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
          SliverAppBar(
            title: Text(initMarker == null?'Dodaj miejsce':'Edytuj miejsce'),
            centerTitle: true,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.check),
                onPressed: (){

                  PositionProvider positionProv = PositionProvider.of(context);

                  if(positionProv.lat == wawelLat &&
                      positionProv.lng == wawelLng){

                    controller.animateTo(1);

                    showAppToast(
                      context,
                      text: 'No halo, może zmień lokalizację z trawnika przed Wawelem...',
                      duration: const Duration(seconds: 8)
                    );
                    return;
                  }

                  NameProvider nameProv = NameProvider.of(context);
                  MarkerTypeProvider markerTypeProv = MarkerTypeProvider.of(context);
                  MarkerVisibilityProvider markerVisibilityProv = MarkerVisibilityProvider.of(context);
                  ContactProvider contactProv = ContactProvider.of(context);
                  BindedCommunitiesProvider bindedCommProv = BindedCommunitiesProvider.of(context);

                  if(initMarker == null)
                    ApiHarcMap.createMarker(
                        name: nameProv.name,
                        lat: positionProv.lat,
                        lng: positionProv.lng,
                        type: markerTypeProv.markerType,
                        visibility: markerVisibilityProv.markerVisibility,

                        communityKeys: bindedCommProv.communityKeys,

                        onSuccess: (MarkerRespBody marker){},
                    );

                },
              )
            ],
            bottom: TabBar(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              tabs: const [
                Tab(text: 'Informacje'),
                Tab(text: 'Lokalizacja'),
              ],
            ),
          )
        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children: const [
            InfoPart(),
            LocationPart(),
          ],
        ),
      ),
    ),

  );

}
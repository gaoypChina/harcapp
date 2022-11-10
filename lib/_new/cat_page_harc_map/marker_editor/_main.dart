import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
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
      ChangeNotifierProvider(create: (context) => MarkerRespBodyProvider(initMarker: initMarker)),
    ],
    builder: (context, child) => BottomNavScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(initMarker == null?'Dodaj miejsce':'Edytuj miejsce'),
            centerTitle: true,
            pinned: true,
            bottom: TabBar(
              controller: controller,
              tabs: const [
                Tab(text: 'Informacje'),
                Tab(text: 'Lokalizacja'),
              ],
            ),
          )
        ],
        body: TabBarView(
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
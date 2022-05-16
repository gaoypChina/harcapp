import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp/_new/details/part_info.dart';
import 'package:harcapp/_new/details/part_settings.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppDetails extends StatefulWidget{

  static const IconData icon = MdiIcons.tuneVariant; //MdiIcons.dotsGrid;
  static open(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => const AppDetails()));

  final int initPage;
  const AppDetails({this.initPage = 0, super.key});

  @override
  State<StatefulWidget> createState() => AppDetailsState();

}

class AppDetailsState extends State<AppDetails> with TickerProviderStateMixin{

  late TabController _tabController;
  String? title;

  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: Platform.isAndroid?5:4, initialIndex: widget.initPage);
    _tabController.addListener((){
      hideKeyboard(context);
    });

    scaffoldKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
      scaffoldKey: scaffoldKey,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              centerTitle: true,
              title: HarcApp(size: Dimen.TEXT_SIZE_APPBAR, color: iconEnab_(context)),
              backgroundColor: background_(context),
              floating: true,
              pinned: true,
              bottom: TabBar(
                physics: const BouncingScrollPhysics(),
                tabs: const [
                  Tab(text: 'O aplikacji'),
                  Tab(text: 'Ustawienia aplikacji')
                ],
                indicator: AppTabBarIncdicator(context: context),
              ),
            )
          ],
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [

              PartInfo(),

              PartSettings(),

            ],

          ),
        ),
      )
  );

}
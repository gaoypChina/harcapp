import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../module_statistics_registrator.dart';
import 'child_dokumenty.dart';
import 'child_faktury.dart';

class DokumentyFragment extends StatefulWidget {

  const DokumentyFragment({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DokumentyFragmentState();

}

class DokumentyFragmentState extends State<DokumentyFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.dokumenty;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Dokumenty i faktury'),
            centerTitle: true,
            backgroundColor: background_(context),
            pinned: true,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              tabs: const <Tab>[
                Tab(icon: Icon(MdiIcons.fileDocumentOutline)),
                Tab(icon: Icon(MdiIcons.cashCheck)),
              ],
              indicator: AppTabBarIncdicator(context: context),
              //controller: _tabController,
            ),
          ),
        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            ChildDokumenty(),
            ChildFaktury()
          ],
          //controller: _tabController,
        ),
      ),
    ),
  );

}
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'child_kodeks.dart';
import 'child_metodyki.dart';
import 'child_misja.dart';
import 'child_stopnie.dart';

class StrefaInstruktoraFragment extends StatefulWidget {

  const StrefaInstruktoraFragment({super.key});

  @override
  State<StatefulWidget> createState() => StrefaInstruktoraFragmentState();

}

class StrefaInstruktoraFragmentState extends State<StrefaInstruktoraFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.strefaInstruktora;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: DefaultTabController(
      length: 4,
      child: Stack(
        children: [

          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              'ZHP',
              style: AppTextStyle(
                  color: backgroundIcon_(context),
                  fontSize: backgroundTextSize(context),
                  fontWeight: weight.bold
              ),
            ),
          ),

          ExtendedNestedScrollView(
            floatHeaderSlivers: true,
            physics: const BouncingScrollPhysics(),
            pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                title: const Text('Strefa instruktora'),
                centerTitle: true,
                backgroundColor: background_(context),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabs: const <Tab>[
                    Tab(icon: Icon(MdiIcons.lightbulbOutline)),
                    Tab(icon: Icon(MdiIcons.clockOutline)),
                    Tab(icon: Icon(MdiIcons.fileDocumentOutline)),
                    Tab(icon: Icon(MdiIcons.chevronTripleUp)),
                  ],
                  indicator: AppTabBarIncdicator(color: orgColor[Org.zhp]),
                  //controller: _tabController,
                ),
              ),
            ],
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                ChildMisja(),
                const ChildMetodyki(),
                ChildKodeks(),
                const ChildStopnie()
              ],
              //controller: _tabController,
            ),
          ),
        ],
      ),
    ),
  );


}
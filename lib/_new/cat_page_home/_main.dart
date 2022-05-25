import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_common_widgets/drawer_tile.dart';
import '../../_common_widgets/harc_app.dart';
import '../app_bottom_navigator.dart';
import 'circles/all_circles_page.dart';
import 'circles/model/circle.dart';
import 'circles/circle_page.dart';
import 'competitions/all_competition_page.dart';
import 'competitions/competitions_widget.dart';
import 'competitions/indiv_comp/indiv_comp_preview_widget.dart';

enum DrawerPage{
  overview,
  comp,
  favorite,
  cached,
}

class CatPageHome extends StatefulWidget{

  const CatPageHome({super.key});

  @override
  State<StatefulWidget> createState() => CatPageHomeState();

}

class CatPageHomeState extends State<CatPageHome> with AfterLayoutMixin{

  static const drawerPageOverview = 'overview';
  static const drawerPageCompetitions = 'competitions';
  static const drawerPageCircles = 'circles';

  static String? selectedDrawerPage;

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHome());
  }

  @override
  void initState() {
    selectedDrawerPage ??= drawerPageOverview;
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
  AppScaffold(
    body: Builder(builder: (context){
      if(selectedDrawerPage == drawerPageCompetitions)
        return const CompetitionsPage();
      else if(selectedDrawerPage == drawerPageCircles)
        return AllCirclesPage(
          onCircleTap: (circle) => pushPage(
            context,
            builder: (context) => CirclePage(
              circle,
              onLeft: () => setState(() => selectedDrawerPage = drawerPageCircles),
              onDeleted: () =>
                  setState(() => selectedDrawerPage = drawerPageCircles),
              key: ValueKey(selectedDrawerPage),
            )
          ),
        );

      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: background_(context),
            title: const HarcApp(size: Dimen.TEXT_SIZE_APPBAR),
            floating: true,
            centerTitle: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.only(top: Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([
              const CirclePreviewWidget()
            ])),
          )

        ],
      );
    }),
    drawer: AppDrawer(
        body: Column(
          children: [
            DrawerTile<String?>(
              icon: MdiIcons.squareRoundedOutline,
              title: 'Podgląd',
              source: drawerPageOverview,
              selectedSource: selectedDrawerPage,
              onSelect: (source){
                setState(() => selectedDrawerPage = source);
                AppBottomNavigatorProvider.of(context).background = null;
                Navigator.pop(context);
              },
            ),

            DrawerTile(
              icon: MdiIcons.trophyVariantOutline,
              title: 'Współzawodnictwa',
              source: drawerPageCompetitions,
              selectedSource: selectedDrawerPage,
              onSelect: (dynamic source){
                setState(() => selectedDrawerPage = source);
                AppBottomNavigatorProvider.of(context).background = null;
                Navigator.pop(context);
              },
            ),

            DrawerTile(
              icon: MdiIcons.googleCircles,
              title: 'Kręgi',
              source: drawerPageCircles,
              selectedSource: selectedDrawerPage,
              onSelect: (dynamic source){
                setState(() => selectedDrawerPage = source);
                AppBottomNavigatorProvider.of(context).background = null;
                Navigator.pop(context);
              },
            ),

          ],
        )
    ),
    bottomNavigationBar: const AppBottomNavigator(),
  );

}

class CirclePreviewWidget extends StatelessWidget{

  const CirclePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) => CompetitionsWidget(
      singleLine: true,
      competitionWidgetBuilder: (allCompList) => SizedBox(
        height: IndivCompThumbnailWidget.defSize,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: allCompList.length,
          itemBuilder: (context, index) => IndivCompPreviewWidget(allCompList[index]),
          separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
        ),
      )
  );

}

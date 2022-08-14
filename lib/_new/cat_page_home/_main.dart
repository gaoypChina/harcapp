import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_home/preview_part.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_common_widgets/drawer_tile.dart';
import '../app_bottom_navigator.dart';
import 'community/all_comunities_page.dart';
import 'community/circle/circle_page.dart';
import 'community/circle/model/circle.dart';
import 'community/forum/forum_page.dart';
import 'community/forum/model/forum.dart';
import 'competitions/all_competitions_page.dart';
import 'competitions/indiv_comp/indiv_comp_page.dart';
import 'competitions/indiv_comp/models/indiv_comp.dart';

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

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHome());
  }

  @override
  Widget build(BuildContext context) =>
  Consumer<HomePartProvider>(
    builder: (context, prov, child) => AppScaffold(
      body: Builder(builder: (context){
        if(prov.selectedDrawerPage == HomePartProvider.drawerPageCompetitions)
          return AllCompetitionsPage(
            onCompetitionTap: (comp) => openCompPage(context, comp),
          );
        else if(prov.selectedDrawerPage == HomePartProvider.drawerPageCommunities)
          return AllCommunitiesPage(
            onCircleTap: (circle) => openCirclePage(context, circle),
            onForumTap: (forum) => openForumPage(context, forum),
          );

        return PreviewPart(
            onCompHeaderOpen: () => prov.selectedDrawerPage = HomePartProvider.drawerPageCompetitions,
            onAllAnnouncementsHeaderOpen: () => prov.selectedDrawerPage = HomePartProvider.drawerPageCommunities,
            onCircleTap: (circle){
              prov.selectedDrawerPage = HomePartProvider.drawerPageCommunities;
              openCirclePage(context, circle);
            },
            onForumTap: (forum){
              prov.selectedDrawerPage = HomePartProvider.drawerPageCommunities;
              openForumPage(context, forum);
            },
        );

      }),
      drawer: AppDrawer(
          body: Column(
            children: [
              DrawerTile<String>(
                icon: MdiIcons.squareRoundedOutline,
                title: 'Podgląd',
                source: HomePartProvider.drawerPageOverview,
                selectedSource: prov.selectedDrawerPage,
                onSelect: (String source){
                  prov.selectedDrawerPage = source;
                  AppBottomNavigatorProvider.of(context).background = null;
                  Navigator.pop(context);
                },
              ),

              DrawerTile<String>(
                icon: MdiIcons.trophyVariantOutline,
                title: 'Współzawodnictwa',
                source: HomePartProvider.drawerPageCompetitions,
                selectedSource: prov.selectedDrawerPage,
                onSelect: (String source){
                  prov.selectedDrawerPage = source;
                  AppBottomNavigatorProvider.of(context).background = null;
                  Navigator.pop(context);
                },
              ),

              DrawerTile<String>(
                icon: MdiIcons.googleCirclesCommunities,
                title: 'Środowiska',
                source: HomePartProvider.drawerPageCommunities,
                selectedSource: prov.selectedDrawerPage,
                onSelect: (String source){
                  prov.selectedDrawerPage = source;
                  AppBottomNavigatorProvider.of(context).background = null;
                  Navigator.pop(context);
                },
              ),

            ],
          )
      ),
      bottomNavigationBar: const AppBottomNavigator(),
    ),
  );

  static void openCirclePage(BuildContext context, Circle circle) => pushPage(
      context,
      builder: (context) => CirclePage(
        circle,
        onLeft: () => HomePartProvider.of(context).selectedDrawerPage = HomePartProvider.drawerPageCommunities,
        onDeleted: () => HomePartProvider.of(context).selectedDrawerPage = HomePartProvider.drawerPageCommunities,
        key: ValueKey(HomePartProvider.of(context).selectedDrawerPage),
      )
  );

  static void openForumPage(BuildContext context, Forum forum) => pushPage(
      context,
      builder: (context) => ForumPage(
        forum,
        onDeleted: () => HomePartProvider.of(context).selectedDrawerPage = HomePartProvider.drawerPageCommunities,
        key: ValueKey(HomePartProvider.of(context).selectedDrawerPage),
      )
  );
  
  static void openCompPage(BuildContext context, IndivComp comp) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IndivCompPage(comp))
  );

}

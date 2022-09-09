import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/community_preview_page.dart';
import 'package:harcapp/_new/cat_page_home/feed_page.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../app_bottom_navigator.dart';
import 'community/all_comunities_page.dart';
import 'community/circle/circle_page.dart';
import 'community/circle/model/circle.dart';
import 'community/forum/forum_page.dart';
import 'community/forum/model/forum.dart';
import 'community/model/community.dart';
import 'competitions/all_competitions_page.dart';
import 'competitions/indiv_comp/indiv_comp_page.dart';
import 'competitions/indiv_comp/models/indiv_comp.dart';


class CatPageHome extends StatefulWidget{

  const CatPageHome({super.key});

  @override
  State<StatefulWidget> createState() => CatPageHomeState();

}

class CatPageHomeState extends State<CatPageHome> with AfterLayoutMixin, TickerProviderStateMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHome());
  }

  late TabController tabController;

  late ValueNotifier<double> notifier;
  late bool showNewButton;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.animation?.addListener((){
      notifier.value = tabController.animation!.value;

      bool newShowNewButton = tabController.animation!.value > .5;
      if(showNewButton != newShowNewButton)
        setState(() => showNewButton = newShowNewButton);

    });


    notifier = ValueNotifier(0);
    showNewButton = tabController.index != 0;

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: notifier,
    child: AppScaffold(
      backgroundColor: Colors.transparent,
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: const AccountHeaderIcon(),
            title: const HarcApp(size: Dimen.TEXT_SIZE_APPBAR),
            centerTitle: true,
            floating: true,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              controller: tabController,
              isScrollable: true,
              indicator: AppTabBarIncdicator(color: iconEnab_(context)),
              tabs: [
                Tab(
                    child: Row(
                      children: [
                        const Icon(MdiIcons.squareRoundedOutline),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text('Potok', style: AppTextStyle(fontWeight: weight.halfBold))
                      ],
                    )
                ),
                Tab(
                    child: Row(
                      children: [
                        const Icon(Community.icon),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text('Środowiska', style: AppTextStyle(fontWeight: weight.halfBold))
                      ],
                    )
                ),
                Tab(
                    child: Row(
                      children: [
                        const Icon(MdiIcons.trophyVariantOutline),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text('Współzawodnictwa', style: AppTextStyle(fontWeight: weight.halfBold))
                      ],
                    )
                ),
              ],
            ),
            actions: [

              AnimatedOpacity(
                opacity: showNewButton?1:0,
                duration: const Duration(milliseconds: 300),
                child: AnimatedBuilder(
                  animation: notifier,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(0, -Dimen.ICON_FOOTPRINT*sin(pi*notifier.value).abs()),
                    child: child,
                  ),
                  child: IconButton(
                    icon: const Icon(MdiIcons.plus),
                    onPressed: (){

                      if(tabController.index == 0)
                        return;
                      else if(tabController.index == 1)
                        NewCommunityButton.newCommunity(context);
                      else if(tabController.index == 2)
                        NewIndivCompButton.newCompetition(context);
                    },
                  ),

                )
              )


            ],
          )
        ],
        body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            children: [

              FeedPage(
                onCircleTap: (circle){
                  openCirclePage(context, circle);
                },
                onForumTap: (forum){
                  openForumPage(context, forum);
                },
              ),

              AllCommunitiesPage(
                onCircleTap: (circle) => openCirclePage(context, circle),
                onForumTap: (forum) => openForumPage(context, forum),
              ),

              AllCompetitionsPage(
                onCompetitionTap: (comp) => openCompPage(context, comp),
              ),

            ]
        ),
      ),
      // drawer: AppDrawer(
      //     body: Column(
      //       children: [
      //         DrawerTile<String>(
      //           icon: MdiIcons.squareRoundedOutline,
      //           title: 'Mój potok',
      //           source: HomePartProvider.drawerPageOverview,
      //           selectedSource: prov.selectedDrawerPage,
      //           onSelect: (String source){
      //             prov.selectedDrawerPage = source;
      //             AppBottomNavigatorProvider.of(context).background = null;
      //             Navigator.pop(context);
      //           },
      //         ),
      //
      //         DrawerTile<String>(
      //           icon: MdiIcons.trophyVariantOutline,
      //           title: 'Współzawodnictwa',
      //           source: HomePartProvider.drawerPageCompetitions,
      //           selectedSource: prov.selectedDrawerPage,
      //           onSelect: (String source){
      //             prov.selectedDrawerPage = source;
      //             AppBottomNavigatorProvider.of(context).background = null;
      //             Navigator.pop(context);
      //           },
      //         ),
      //
      //         DrawerTile<String>(
      //           icon: Community.icon,
      //           title: 'Środowiska',
      //           source: HomePartProvider.drawerPageCommunities,
      //           selectedSource: prov.selectedDrawerPage,
      //           onSelect: (String source){
      //             prov.selectedDrawerPage = source;
      //             AppBottomNavigatorProvider.of(context).background = null;
      //             Navigator.pop(context);
      //           },
      //         ),
      //
      //       ],
      //     )
      // ),
      bottomNavigationBar: const AppBottomNavigator(),
    ),
    builder: (context, child) => Container(
      color:
      // loginProv.loggedIn?
      // CommunityCoverColors.nonPaletteBackgroundColor():
      // CommunityCoverColors.nonPaletteCardColor(context),
      CommunityCoverColors.nonPaletteBackgroundColor().withOpacity(max(0, 1 - notifier.value)),
      child: Consumer<HomePartProvider>(
          builder: (context, prov, _) => child!
      ),
    )
  );

  static void openCommunityPage(
      BuildContext context,
      Community community,
      { bool replacePage = false,
      }) => (replacePage?pushReplacePage:pushPage).call(
      context,
      builder: (context) => CommunityPreviewPage(
        community,
        key: ValueKey(HomePartProvider.of(context).selectedDrawerPage),
      )
  );

  static void openCirclePage(
      BuildContext context,
      Circle circle,
      { AnnouncementCategories? initTab,
        bool replacePage = false,
      }) => (replacePage?pushReplacePage:pushPage).call(
      context,
      builder: (context) => CirclePage(
        circle,
        initTab: initTab,
        onLeft: () {
          Navigator.pop(context); // Close circle page.
        },
        onDeleted: () {
          Navigator.pop(context); // Close circle page.
        },
        key: ValueKey(HomePartProvider.of(context).selectedDrawerPage),
      )
  );

  static void openForumPage(
      BuildContext context,
      Forum forum,
      { void Function()? onDeleted,
        void Function(bool)? onFollowChanged,
        void Function(bool)? onLikeChanged,
        bool replacePage = false,
      }) => (replacePage?pushReplacePage:pushPage).call(
      context,
      builder: (context) => ForumPage(
        forum,
        onDeleted: (){
          Navigator.pop(context); // Close forum page.
          onDeleted?.call();
        },
        onFollowChanged: onFollowChanged,
        onLikeChanged: onLikeChanged,
        key: ValueKey(HomePartProvider.of(context).selectedDrawerPage),
      )
  );

  static void openCompPage(
      BuildContext context,
      IndivComp comp,
      { bool replacePage = false }) => (replacePage?pushReplacePage:pushPage).call(
        context,
        builder: (context) => IndivCompPage(comp)
      );

}

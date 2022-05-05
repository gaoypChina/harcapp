import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../_common_widgets/app_toast.dart';
import '../../_common_widgets/drawer_tile.dart';
import '../../_common_widgets/harc_app.dart';
import '../../account/account.dart';
import '../../account/account_page/account_page.dart';
import '../../account/login_provider.dart';
import '../app_bottom_navigator.dart';
import 'circles/circle.dart';
import 'circles/circle_page.dart';
import 'competitions/competition_page.dart';
import 'competitions/competitions_widget.dart';
import 'competitions/indiv_comp/indiv_comp_loader.dart';
import 'competitions/indiv_comp/indiv_comp_preview_widget.dart';
import 'competitions/indiv_comp/models/indiv_comp.dart';
import 'competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'competitions/start_widgets/indiv_comp_preview_grid.dart';
import 'competitions/start_widgets/indiv_comp_prompt.dart';
import 'competitions/start_widgets/indiv_comp_prompt_login.dart';

enum DrawerPage{
  overview,
  comp,
  favorite,
  cached,
}

class CatPageHome extends StatefulWidget{

  const CatPageHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CatPageHomeState();

}

class CatPageHomeState extends State<CatPageHome> with AfterLayoutMixin{

  static const drawerPageOverview = 'overview';
  static const drawerPageCompetitions = 'competitions';
  static String drawerPageCircle(Circle circle) => 'circle_${circle.key}';

  static String selectedDrawerPage;

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
      else if(selectedDrawerPage.contains('circle_'))
        return CirclePage(Circle.allMap[selectedDrawerPage.replaceAll('circle_', '')]);

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
              const CompetitionPreviewWidget()
            ])),
          )

        ],
      );
    }),
    drawer: AppDrawer(
        body: Column(
          children: [
            DrawerTile<String>(
              icon: MdiIcons.squareRoundedOutline,
              title: 'Podgląd',
              source: drawerPageOverview,
              selectedSource: selectedDrawerPage,
              onSelect: (source){
                setState(() => selectedDrawerPage = source);
                Navigator.pop(context);
              },
            ),

            DrawerTile(
              icon: MdiIcons.trophyVariantOutline,
              title: 'Współzawodnictwa',
              source: drawerPageCompetitions,
              selectedSource: selectedDrawerPage,
              onSelect: (source){
                setState(() => selectedDrawerPage = source);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: Dimen.SIDE_MARG),

            ListTile(
              leading: const SizedBox(),
              title: Text(
                'Kręgi',
                style: AppTextStyle(
                    fontWeight: weight.normal,
                    color: textEnab_(context)
                )
              ),
            ),

            Consumer<CircleListProvider>(
              builder: (context, prov, child){
                if(Circle.all != null)
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => DrawerTile(
                      title: Circle.all[index].name,
                      source: drawerPageCircle(Circle.all[index]),
                      selectedSource: selectedDrawerPage,
                      onSelect: (source){
                        setState(() => selectedDrawerPage = source);
                        Navigator.pop(context);
                      },
                    ),
                    itemCount: Circle.all.length,
                    shrinkWrap: true,
                  );

                return Container();
              },
            )

          ],
        )
    ),
    bottomNavigationBar: const AppBottomNavigator(),
  );

}

class CompetitionPreviewWidget extends StatelessWidget{

  const CompetitionPreviewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CompetitionsWidget(competitionWidgetBuilder: (allCompList) => SizedBox(
    height: IndivCompThumbnailWidget.defSize,
    child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: allCompList.length,
        itemBuilder: (context, index) => IndivCompPreviewWidget(allCompList[index]),
        separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
    ),
  ));

}

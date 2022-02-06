import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/_common_widgets/colored_tab.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';
import 'provider.dart';
import 'strings.dart';

class ChildFSE extends StatelessWidget{

  final TabController controller;
  const ChildFSE(this.controller);

  static List<TabItem> TABS = [
    TabItem(
        text: 'WILCZKI',
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              child: PrzyrzeczenieItem(ppz_przyrz_fse_title, ppz_przyrz_fse_content),
            ),

            SizedBox(height: Dimen.LIST_SEP_MARG),
            PrawoItem(1, MdiIcons.accountSwitch, ppz1_fse),
            PrawoItem(2, MdiIcons.radar, ppz2_fse),
            PrawoItem(3, MdiIcons.showerHead, ppz3_fse),
            PrawoItem(4, MdiIcons.microphonePlus, ppz4_fse),
            PrawoItem(5, MdiIcons.emoticonHappy, ppz5_fse),

          ],
        )
    ),
    TabItem(
        text: 'H-RZE',
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              child: PrzyrzeczenieItem(pph_przyrz_title, pph_przyrz_fse_content),
            ),

            PrawoItem(1, MdiIcons.medal, pph1_fse_c),
            PrawoItem(2, MdiIcons.accountTie, pph2_fse_c),
            PrawoItem(3, MdiIcons.charity, pph3_fse_c),
            PrawoItem(4, MdiIcons.accountMultipleCheck, pph4_fse_c),
            PrawoItem(5, MdiIcons.chessKnight, pph5_fse_c),
            PrawoItem(6, MdiIcons.leafMaple, pph6_fse_c),
            PrawoItem(7, MdiIcons.humanMaleBoard, pph7_fse_c),
            PrawoItem(8, MdiIcons.whiteBalanceSunny, pph8_fse_c),
            PrawoItem(9, MdiIcons.piggyBank, pph9_fse_c),
            PrawoItem(10, MdiIcons.autoFix, pph10_fse_c),
          ],
        )
    ),
    TabItem(
        text: 'H-RKI',
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[

            Padding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              child: PrzyrzeczenieItem(pph_przyrz_title, pph_przyrz_fse_content),
            ),

            PrawoItem(1, MdiIcons.medal, pph1_fse_d),
            PrawoItem(2, MdiIcons.accountTie, pph2_fse_d),
            PrawoItem(3, MdiIcons.charity, pph3_fse_d),
            PrawoItem(4, MdiIcons.accountMultipleCheck, pph4_fse_d),
            PrawoItem(5, MdiIcons.humanFemale, pph5_fse_d),
            PrawoItem(6, MdiIcons.dog, pph6_fse_d),
            PrawoItem(7, MdiIcons.humanMaleBoard, pph7_fse_d),
            PrawoItem(8, MdiIcons.whiteBalanceSunny, pph8_fse_d),
            PrawoItem(9, MdiIcons.piggyBank, pph9_fse_d),
            PrawoItem(10, MdiIcons.autoFix, pph10_fse_d),
          ],
        )
    )
  ];

  @override
  Widget build(BuildContext context) {

    post(() => setTabBar(context));

    return Stack(
      children: [

        Positioned(
          bottom: 0,
          right: 0,
          child: Text(
            'FSE',
            style: AppTextStyle(
                color: backgroundIcon_(context),
                fontSize: BACKGROUND_TEXT_SIZE(context),
                fontWeight: weight.bold
            ),
          ),
        ),

        TabBarView(
            physics: BouncingScrollPhysics(),
            controller: controller,
            children: TABS.map((tab) => tab.child).toList()
        )

      ],
    );

  }

  void setTabBar(BuildContext context) => Provider.of<TabBarProvider>(context, listen: false).tabBarBuilder = (context) => TabBar(
    controller: controller,
    physics: BouncingScrollPhysics(),
    tabs: TABS.map(
            (tab) => Tab(
          text: tab.text,
        )
    ).toList(),
    indicator: AppTabBarIncdicator(color: orgColor[Org.fse]),
  );

}
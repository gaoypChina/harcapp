import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/provider.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/strings.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class ChildZHP extends StatelessWidget{

  final TabController controller;
  const ChildZHP(this.controller, {Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    post(() => setTabBar(context));

    return Stack(
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

        TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            children: [
              ListView(
                physics: const BouncingScrollPhysics(),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(ppz_przyrz_title, ppz_przyrz_content),
                  ),

                  PrawoItem(1, MdiIcons.cross, ppz1),
                  PrawoItem(2, MdiIcons.imageFilterHdr, ppz2),
                  PrawoItem(3, MdiIcons.microphonePlus, ppz3),
                  PrawoItem(4, MdiIcons.school, ppz4),
                  PrawoItem(5, MdiIcons.emoticonHappy, ppz5),
                  PrawoItem(6, MdiIcons.trendingUp, ppz6),

                ],
              ),

              ListView(
                physics: const BouncingScrollPhysics(),
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(pph_przyrz_title, pph_przyrz_content),
                  ),

                  PrawoItem(1, MdiIcons.textBoxCheckOutline, pph1_zhp, comment: kpph1_zhp,),
                  PrawoItem(2, MdiIcons.shieldEdit, pph2, comment: kpph2),
                  PrawoItem(3, MdiIcons.charity, pph3, comment: kpph3),
                  PrawoItem(4, MdiIcons.accountMultipleCheck, pph4, comment: kpph4),
                  PrawoItem(5, MdiIcons.chessKnight, pph5, comment: kpph5),
                  PrawoItem(6, MdiIcons.nature, pph6, comment: kpph6),
                  PrawoItem(7, MdiIcons.humanMaleBoard, pph7, comment: kpph7),
                  PrawoItem(8, MdiIcons.whiteBalanceSunny, pph8, comment: kpph8),
                  PrawoItem(9, MdiIcons.piggyBank, pph9, comment: kpph9),
                  PrawoItem(10, MdiIcons.trendingUp, pph10_zhp, comment: kpph10_zhp + pph10_zhr + '\n\n' + kpph10_zhr),
                ],
              ),

            ]
        )

      ],
    );

  }

  void setTabBar(BuildContext context) => Provider.of<TabBarProvider>(context, listen: false).tabBarBuilder = (context) => TabBar(
    controller: controller,
    physics: const BouncingScrollPhysics(),
    tabs: const [
      Tab(text: 'ZUCH'),
      Tab(text: 'HARC'),
    ],
    indicator: AppTabBarIncdicator(color: orgColor[Org.zhp]),
  );

}
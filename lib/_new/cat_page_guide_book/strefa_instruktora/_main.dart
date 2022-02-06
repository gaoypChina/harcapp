import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/colored_tab.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'child_kodeks.dart';
import 'child_metodyki.dart';
import 'child_misja.dart';
import 'child_stopnie.dart';

class StrefaInstruktoraFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
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
                    fontSize: BACKGROUND_TEXT_SIZE(context),
                    fontWeight: weight.bold
                ),
              ),
            ),

            NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverAppBar(
                    title: Text('Strefa instruktora'),
                    centerTitle: true,
                    backgroundColor: background_(context),
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      tabs: <Tab>[
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
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  ChildMisja(),
                  ChildMetodyki(),
                  ChildKodeks(),
                  ChildStopnie()
                ],
                //controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );

  }

}
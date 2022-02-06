import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'child_dokumenty.dart';
import 'child_faktury.dart';

class DokumentyFragment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: Text('Dokumenty i faktury'),
              centerTitle: true,
              backgroundColor: background_(context),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                tabs: <Tab>[
                  Tab(icon: Icon(MdiIcons.fileDocumentOutline)),
                  Tab(icon: Icon(MdiIcons.cashCheck)),
                ],
                indicator: AppTabBarIncdicator(context: context),
                //controller: _tabController,
              ),
            ),
          ],
          body: TabBarView(
            physics: BouncingScrollPhysics(),
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

}

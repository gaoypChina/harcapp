import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/colored_tab.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp/_new/details/part_info.dart';
import 'package:harcapp/_new/details/part_report/part_report.dart';
import 'package:harcapp/_new/details/part_settings.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppDetails extends StatefulWidget{

  static const IconData icon = MdiIcons.tuneVariant;//MdiIcons.dotsGrid;
  static open(BuildContext context) => Navigator.push(context, MaterialPageRoute(builder: (context) => AppDetails()));

  final int initPage;
  const AppDetails({this.initPage: 0});

  @override
  State<StatefulWidget> createState() => AppDetailsState();

}

class AppDetailsState extends State<AppDetails> with TickerProviderStateMixin{

  TabController _tabController;
  String title;

  GlobalKey<ScaffoldState> scaffoldKey;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: Platform.isAndroid?5:4, initialIndex: widget.initPage);
    _tabController.addListener((){
      hideKeyboard(context);
    });

    scaffoldKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      scaffoldKey: scaffoldKey,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              centerTitle: true,
              title: HarcApp(size: Dimen.TEXT_SIZE_APPBAR, color: iconEnab_(context)),
              //actions: [SizedBox(width: Dimen.ICON_FOOTPRINT)],
              backgroundColor: background_(context),
              floating: true,
              pinned: true,
              bottom: TabBar(
                physics: BouncingScrollPhysics(),
                tabs: [
                  Tab(icon: Icon(MdiIcons.informationOutline)),
                  Tab(icon: Icon(MdiIcons.cogOutline)),
                  //Tab(icon: Icon(MdiIcons.license)),
                  //Tab(icon: Icon(MdiIcons.codeTags)),
                  //Tab(icon: Icon(MdiIcons.bugOutline))
                ],
                indicator: AppTabBarIncdicator(context: context),
              ),
            )
          ],
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [

              PartInfo(),

              PartSettings(),

              //PartContributors(),

              //PartChangelog(),

              //PartReport('Tu wpisać nazwę modułu'),
            ],

          ),
        ),
      )
    );

    return AppScaffold(
      scaffoldKey: scaffoldKey,
      backgroundColor: background_(context),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background_(context),
        title: Text(title, style: AppTextStyle(color: textEnab_(context))),
        iconTheme: IconThemeData(color: iconEnab_(context)),
      ),
      body: ColoredTabController(
        background: background_(context),
        iconColorEnabled: iconEnab_(context),
        iconColorDisabled: iconDisab_(context),
        controller: _tabController,
        elevated: false,
        tabs: [
          TabItem(
              icon: Icon(MdiIcons.informationOutline),
              child: PartInfo()
          ),
          TabItem(
              icon: Icon(MdiIcons.cog),
              child: PartSettings()
          ),
          TabItem(
              icon: Icon(MdiIcons.medalOutline),
              child: PartContributors()
          ),

          TabItem(
              icon: Icon(MdiIcons.alertOutline),
              child: PartReport('Tu wpisać nazwę modułu')
          )

        ],
      ),
    );
  }

}
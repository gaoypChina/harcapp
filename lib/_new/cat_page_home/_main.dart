import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/harc_app.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';

import '../app_drawer.dart';
import '../cat_page.dart';
import 'competition_preview_widget.dart';
import 'competitions/competition_page.dart';

class CatPageHome extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => CatPageHomeState();

}

class CatPageHomeState extends CatPageState<CatPageHome>{

  @override
  ColorPack get colorPack => ColorPackHome();

  @override
  Widget build(BuildContext context) => CompetitionsPage();

  /*
  AppScaffold(
    body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          leading: AccountHeaderIcon(),
          backgroundColor: background_(context),
          title: HarcApp(size: Dimen.TEXT_SIZE_APPBAR),
          floating: true,
          centerTitle: true,
        ),

        SliverList(delegate: SliverChildListDelegate([
          CompetitionPreviewWidget()
        ]))

      ],
    ),
    bottomNavigationBar: AppBottomNavigator(),
  );
*/
}

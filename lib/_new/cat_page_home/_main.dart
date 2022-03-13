import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';

import 'competitions/competition_page.dart';

class CatPageHome extends StatefulWidget{

  const CatPageHome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CatPageHomeState();

}

class CatPageHomeState extends State<CatPageHome> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) {
    post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHome());
  }

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

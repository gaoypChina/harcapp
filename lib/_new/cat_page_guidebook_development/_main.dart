import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:provider/provider.dart';

import '../app_drawer.dart';
import 'development/_main.dart';
import 'guidebook/_main.dart';

class CatPageGuidebookDevelopment extends StatefulWidget{

  const CatPageGuidebookDevelopment({super.key});

  @override
  State createState() => CatPageGuidebookDevelopmentState();

}

class CatPageGuidebookDevelopmentState extends State<CatPageGuidebookDevelopment> with AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context) =>
      post(() => Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackGuideBook());

  static const double catSeparator = 28;

  static const Color musicCatColor = Colors.orange;
  static const Color musicCatIntr = Colors.lightBlueAccent;
  static const Color musicCatWiedza = Colors.pink;
  static const Color musicCatHistoria = Colors.amber;
  static const Color musicCatTechniki = Colors.teal;

  SynchronizerListener? syncListener;

  @override
  void initState() {

    syncListener = SynchronizerListener(
      onEnd: (oper){
        if(oper == SyncOper.get){
          Provider.of<SprawInProgressListProv>(context, listen: false).notify();
          Provider.of<SprawCompletedListProv>(context, listen: false).notify();
          Provider.of<SprawSavedListProv>(context, listen: false).notify();
        }
      }
    );
    synchronizer.addListener(syncListener);

    super.initState();
  }

  @override
  void dispose() {
    synchronizer.removeListener(syncListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: const AccountHeaderIcon(),
            backgroundColor: background_(context),
            title: const Text('Tajniki harców'),
            forceElevated: innerBoxIsScrolled,
            centerTitle: true,
            floating: true,
            pinned: true,
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              indicator: AppTabBarIncdicator(context: context, color: iconEnab_(context)),
              tabs: const [
                Tab(text: 'Poradnik'),
                Tab(text: 'Rozwój'),
              ],
            ),
          ),

        ],
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [

            GuidebookSubpage(),
            DevelopmentSubpage(),

          ],
        ),

      ),
    ),
    bottomNavigationBar: const AppBottomNavigator(),
  );

}
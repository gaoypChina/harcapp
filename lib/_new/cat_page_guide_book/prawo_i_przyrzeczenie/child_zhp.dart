import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/org/org_switcher.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/strings.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '_main.dart';
import 'common.dart';

class ChildZHP extends StatefulWidget{

  final Pion initPion;
  final List<Org> allowedOrgs;
  final void Function(Pion)? onTabChanged;

  const ChildZHP({required this.initPion, required this.allowedOrgs, this.onTabChanged, Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ChildZHPState();

}

class ChildZHPState extends State<ChildZHP> with TickerProviderStateMixin{

  static Map<int, Pion> indexToPion = {
    0: Pion.zuch,
    1: Pion.harcerz,
    2: Pion.wedrownik
  };

  static Map<Pion, int> pionToIndex = {
    Pion.zuch: 0,
    Pion.harcerz: 1,
    Pion.wedrownik: 2
  };

  Pion get initPion => widget.initPion;
  List<Org> get allowedOrgs => widget.allowedOrgs;
  void Function(Pion)? get onTabChanged => widget.onTabChanged;

  late TabController controller;

  @override
  void initState(){
    controller = TabController(
      vsync: this,
      length: 3,
      initialIndex: pionToIndex[initPion]??1
    );
    controller.addListener(() => onTabChanged?.call(indexToPion[controller.index]??Pion.harcerz));
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Prawo i Przyrzeczenie'),
            centerTitle: true,
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              tabs: const [
                Tab(text: 'ZUCH'),
                Tab(text: 'HARC'),
                Tab(text: 'WĘDRO'),
              ],
              indicator: AppTabBarIncdicator(color: orgColor[Org.zhp]),
            ),
            actions: [
              OrgSwitcher(
                  allowedOrgs: allowedOrgs,
                  onTap: (currentOrg){
                    showAppToast(context, text: orgFullName[currentOrg]);
                  }
              )
            ],
          )
        ],
        body: TabBarView(
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
                  PrawoItem(10, MdiIcons.trendingUp, pph10_zhp, comment: '$kpph10_zhp$pph10_zhr\n\n$kpph10_zhr'),
                ],
              ),

              const WedroTabChild(),

            ]
        ),
      )
  );

}
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/org/org_switcher.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/bottom_nav_scaffold.dart';
import '_main.dart';
import 'common.dart';
import 'strings.dart';

class ChildFSE extends StatefulWidget{

  final Pion initPion;
  final List<Org> allowedOrgs;
  final void Function(Pion)? onTabChanged;

  const ChildFSE({required this.initPion, required this.allowedOrgs, this.onTabChanged, super.key});

  @override
  State<StatefulWidget> createState() => ChildFSEState();

}

class ChildFSEState extends State<ChildFSE> with TickerProviderStateMixin{

  static Map<int, Pion> indexToPion = {
    0: Pion.zuch,
    1: Pion.harcerz,
    2: Pion.harcerz,
  };

  static Map<Pion, int> pionToIndex = {
    Pion.zuch: 0,
    Pion.harcerz: 1,
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
        initialIndex: initPion==Pion.zuch?0:(AccountData.loggedIn && AccountData.sex==Sex.female?2:1)
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
      body: ExtendedNestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            title: const Text('Prawo i Przyrzeczenie'),
            centerTitle: true,
            floating: true,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              tabs: const [
                Tab(text: 'WILCZKI'),
                Tab(text: 'H-RZE'),
                Tab(text: 'H-RKI'),
              ],
              indicator: AppTabBarIncdicator(color: orgColor[Org.fse]),
            ),
            actions: [
              OrgSwitcher(
                  allowedOrgs: allowedOrgs,
                  onTap: (currentOrg){
                    showAppToast(context, text: orgFullName[currentOrg]!);
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

                  SizedBox(height: Dimen.SIDE_MARG),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(ppz_przyrz_fse_title, ppz_przyrz_fse_content),
                  ),

                  SizedBox(height: Dimen.SIDE_MARG),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(
                      'Obietnica wilczka',
                      'Obiecuję - ze wszystkich sił: starać się być wiernym Bogu, moim rodzicom, mojej Ojczyźnie Polsce i Prawu Gromady, oraz każdego dnia czynić komuś dobry uczynek.'
                    ),
                  ),

                  SizedBox(height: Dimen.SIDE_MARG),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(
                        'Dewiza wilczków',
                        'Ja i Ty jesteśmy jednej krwi.'
                    ),
                  ),

                  SizedBox(height: Dimen.SIDE_MARG),
                  SizedBox(height: Dimen.LIST_SEP_MARG),

                  TitleShortcutRowWidget(title: 'Prawo wilczka'),

                  PrawoItem(1, MdiIcons.accountSwitch, ppz1_fse),
                  PrawoItem(2, MdiIcons.radar, ppz2_fse),
                  PrawoItem(3, MdiIcons.showerHead, ppz3_fse),
                  PrawoItem(4, MdiIcons.microphonePlus, ppz4_fse),
                  PrawoItem(5, MdiIcons.emoticonHappy, ppz5_fse),

                ],
              ),

              ListView(
                physics: const BouncingScrollPhysics(),
                children: const <Widget>[

                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(pph_przyrz_title, pph_przyrz_fse_content),
                  ),

                  SizedBox(height: Dimen.LIST_SEP_MARG),

                  TitleShortcutRowWidget(title: 'Prawo harcerskie'),

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
              ),

              ListView(
                physics: const BouncingScrollPhysics(),
                children: const <Widget>[

                  Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: PrzyrzeczenieItem(pph_przyrz_title, pph_przyrz_fse_content),
                  ),

                  SizedBox(height: Dimen.LIST_SEP_MARG),

                  TitleShortcutRowWidget(title: 'Prawo harcerskie'),

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

            ]
        ),
      )
  );

}

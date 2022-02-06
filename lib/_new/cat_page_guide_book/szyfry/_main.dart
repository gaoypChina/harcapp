import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/szyfry/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/colored_tab.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'gaderypoluki/child_gaderypoluki.dart';
import 'child_morse.dart';
import '_description/desc_czekoladka.dart';
import '_description/desc_gaderypoluki.dart';
import '_description/desc_karolinka.dart';
import '_description/desc_komorkowy.dart';
import '_description/desc_matematyczny.dart';
import '_description/desc_morse.dart';
import '_description/desc_tabliczka_mnozenia.dart';
import '_description/desc_ulamkowy.dart';
import '_description/desc_zmiana.dart';

class SzyfryFragment extends StatefulWidget {

  @override
  State createState() => SzyfryFragmentState();

}

class SzyfryFragmentState extends State<SzyfryFragment> with TickerProviderStateMixin{

  List<_TabItem> tabs;

  static const MORSE = "Morse\'a";

  Widget appBarButton;

  ValueNotifier notifier;

  TabController controller;

  ChildMorseCommonValues commonVals;

  AppBarProvider appBarProv;

  @override
  void initState() {

    commonVals = ChildMorseCommonValues();

    tabs = [
      _TabItem(
          title: 'gaderypoluki',
          bottom: DescGaderypoluki(),
          icon: Icon(MdiIcons.swapHorizontal),
          child: ChildGaderypoluki()

      ),
      _TabItem(
          title: MORSE,
          bottom: DescMorse(),
          icon: Icon(MdiIcons.dotsHorizontal),
          child: ChildMorse(commonVals)
      ),
      _TabItem(
          title: 'czekoladka',
          icon: Icon(MdiIcons.apps),
          child: DescCzekoladka()
      ),
      _TabItem(
          title: 'matematyczny',
          icon: Icon(MdiIcons.mathIntegral),
          child: DescMatematyczny()
      ),
      _TabItem(
          title: 'tabl. mnożenia',
          icon: Icon(MdiIcons.close),
          child: DescTabliczkaMnozenia()
      ),
      _TabItem(
          title: 'ułamkowy',
          icon: Icon(MdiIcons.division),
          child: DescUlamkowy()
      ),
      _TabItem(
          title: 'komórkowy',
          icon: Icon(MdiIcons.cellphone),
          child: DescKomorkowy()
      ),
      _TabItem(
          title: 'zamiana',
          icon: Icon(MdiIcons.reload),
          child: DescZamiana()
      ),
      _TabItem(
          title: 'karolinka',
          icon: Icon(MdiIcons.emoticonHappyOutline),
          child: DescKarolinka()
      )
    ];

    controller = TabController(vsync: this, length: tabs.length);

    notifier = ValueNotifier<double>(0);

    controller.animation.addListener(() => notifier.value = controller.index + controller.offset);
    controller.addListener(() => appBarProv.notify());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          appBarProv = AppBarProvider();
          return appBarProv;
        }),
      ],
      builder: (context, child) => BottomNavScaffold(
        appBar: AppBar(
          backgroundColor: background_(context),
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            physics: BouncingScrollPhysics(),
            controller: controller,
            tabs: tabs.map((tab) => Tab(
                text: tab.title[0].toUpperCase() + tab.title.substring(1)
            )).toList(),
            indicator: AppTabBarIncdicator(context: context),
          ),
          actions: <Widget>[

            AnimatedBuilder(
              animation: notifier,
              child: Consumer<AppBarProvider>(
                  builder: (context, prov, child) => IconButton(
                    icon: Icon(MdiIcons.lighthouseOn, color: appBarTextEnab_(context)),
                    onPressed: isMorse?() {

                      hideKeyboard(context);

                      if(commonVals.input.isEmpty) {
                        showAppToast(context, text: 'Wpisz wiadomość');
                        return;
                      }
                      openDialog(
                          context: context,
                          builder: (context) => Center(
                            child: MorseFlash(commonVals),
                          )
                      );

                    }:null,
                  )
              ),
              builder: (context, child) => Opacity(
                child: child,
                opacity: _fadePoint(notifier.value, 1),
              ),
            ),

            AnimatedBuilder(
              animation: notifier,
              builder: (context, child) => Opacity(
                child: IconButton(
                  icon: Icon(MdiIcons.progressQuestion, color: appBarTextEnab_(context)),
                  onPressed: isBottomSheet?() {
                    showScrollBottomSheet(
                      context: context,
                      builder: (BuildContext context) =>
                          BottomSheetDef(
                            title: 'Działanie szyfru',
                            builder: (context) => tabs[controller.index].bottom,
                          ),
                    );
                  }:null,
                ),
                opacity: max(min(-notifier.value + 2, 1), 0),
              ),

            )
          ],
          title: Row(
            children: <Widget>[
              Text(
                'Szyfr ',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: appBarTextEnab_(context)),
              ),

              AnimatedBuilder(
                builder: (BuildContext context, Widget child){
                  return Transform.translate(
                    offset: Offset(0, -controller.animation.value*AppBar().preferredSize.height),
                    child: child,
                  );
                },
                animation: controller.animation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:
                  tabs.sublist(1).map((_TabItem tab) =>
                      Container(height: AppBar().preferredSize.height)).toList() +
                      tabs.map((_TabItem tab) =>
                          Container(
                            height: AppBar().preferredSize.height,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              tab.title,
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: appBarTextEnab_(context), fontWeight: weight.halfBold),
                            ),
                          )
                      ).toList(),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: tabs.map((tab) => tab.child).toList(),
          controller: controller,
        ),
      ),
    );
  }

  bool get isBottomSheet => tabs[controller.index].bottom!=null;
  bool get isMorse => tabs[controller.index].title == MORSE;

}

_fadePoint(double notifier, int point){
  return max(min(-(notifier - point).abs() + 1, 1.0), 0.0);
}

class _TabItem extends TabItem{

  final String title;
  final Widget bottom;
  final Widget appBarButton;

  const _TabItem({this.title, this.bottom, Widget icon, Widget child, this.appBarButton})
      :super(icon: icon, child: child);
}
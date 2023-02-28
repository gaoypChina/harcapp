import 'dart:math';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/patronite_support_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/extended_sliver_app_bar.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/search_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_book_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/spraw_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'data/all_spraw_books.dart';

class SprawnosciPage extends StatefulWidget{

  const SprawnosciPage({super.key});

  @override
  State<StatefulWidget> createState() => SprawnosciPageState();

}

class SprawnosciPageState extends State<SprawnosciPage> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.sprawnosci;

  late ValueNotifier tabNotifier;
  late TabController tabController;

  late _TabScrollProvider tabScrollProvider;

  late List<Color> colorsStart;
  late List<Color> colorsEnd;

  late int initIndex;

  Tab getTab(SprawBookData sprawBookData){

    switch(sprawBookData.id){
      case SprawBookData.ZHP_ZUCH_SIM_2022_ID:
        return Tab(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ZHP', style: AppTextStyle(fontWeight: weight.bold)),
            Text('zuchy', style: AppTextStyle())
          ],
        ));
      case SprawBookData.ZHP_HARC_SIM_2022_ID:
        return Tab(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ZHP', style: AppTextStyle(fontWeight: weight.bold)),
            Text('harcerze', style: AppTextStyle())
          ],
        ));
      case SprawBookData.ZHR_HARC_D:
        return Tab(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ZHR', style: AppTextStyle(fontWeight: weight.bold)),
            Text('pł. piękna', style: AppTextStyle())
          ],
        ));
      case SprawBookData.ZHR_HARC_C:
        return Tab(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ZHR', style: AppTextStyle(fontWeight: weight.bold)),
            Text('pł. silna', style: AppTextStyle())
          ],
        ));
      case SprawBookData.ZHP_HARC_OLD_ID:
        return Tab(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ZHP', style: AppTextStyle(fontWeight: weight.bold)),
            Text('stare', style: AppTextStyle())
          ],
        ));
      case SprawBookData.ZHP_HARC_OLD_WOD_ID:
        return Tab(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ZHP', style: AppTextStyle(fontWeight: weight.bold)),
            Text('stare wodne', style: AppTextStyle())
          ],
        ));
    }

    return Tab();

  }

  @override
  void initState() {

    colorsStart = List.generate(allSprawBooks.length, (index) => allSprawBooks[index].color.colorStartLight);
    colorsEnd = List.generate(allSprawBooks.length, (index) => allSprawBooks[index].color.colorEndLight);

    SprawBook? lastViewed = SprawBookData.lastViewedSprawBook;

    initIndex = lastViewed == null?0:allSprawBooks.indexOf(lastViewed);

    tabNotifier = ValueNotifier(initIndex.toDouble());
    tabController = TabController(
        length: allSprawBooks.length,
        vsync: this,
        initialIndex: initIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<_TabScrollProvider>(
    create: (context){
      tabScrollProvider = _TabScrollProvider();
      return tabScrollProvider;
    },
    builder: (context, child) => BottomNavScaffold(
      body: ExtendedNestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

            Consumer<_TabScrollProvider>(
                builder: (context, prov, child) => ExtendedSliverAppBar(
                    initIndex: initIndex,
                    backgroundColor: averageColorEnd,
                    floating: true,
                    pinned: true,
                    forceElevated: innerBoxIsScrolled,

                    titles: allSprawBooks.map((sprawBookData) => sprawBookData.title).toList(),
                    titleColor: DefColorPack.ICON_ENABLED,

                    tabController: tabController,
                    tabs: allSprawBooks.map(
                            (sprawBook) => getTab(sprawBook.data)//Tab(icon: Icon(sprawBookData.icon))
                    ).toList(),
                    isScrollable: true,

                    onChanged: (int index, double offset){
                      tabNotifier.value = index + offset;
                      tabScrollProvider.notify();
                      SprawBookData.lastViewedSprawBook = allSprawBooks[index];
                    },
                )
            ),
          ],
          body: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: allSprawBooks.map(
                    (sprawBook) => SprawBookPage(sprawBook)
            ).toList(),
          )
      ),
      floatingActionButton: Consumer<_TabScrollProvider>(
        builder: (context, prov, child) => ExtendedFloatingButton(
          MdiIcons.magnify,
          'Szukaj',
          textColor: ColorPack.DEF_ICON_ENAB,
          background: averageColorStart,
          backgroundEnd: averageColorEnd,
          duration: Duration.zero,
          onTap: () => pushPage(context, builder: (context) => SearchPage(
            allSprawBooks[tabController.index],
            allSprawBooks[tabController.index].groups??[],
            onPicked: (Spraw spraw) => pushPage(
                context,
                builder: (context) => AppScaffold(body: SprawWidget(spraw))
            ),
          )),

        ),
      ),
      bottomNavigationBar:
      App.showPatroniteSeasonally?
      Consumer<_TabScrollProvider>(
          builder: (context, prov, child) => PatroniteSupportWidget(
            margin: const EdgeInsets.only(left: Dimen.defMarg, right: Dimen.defMarg, bottom: Dimen.defMarg),
            stateTag: PatroniteSupportWidget.tagSprawnosci,
            title: 'Skąd tyle sprawności?!',
            description: 'Wodospad sprawności ZHP i ZHR <b>nie pojawia się sam z siebie</b>!'
                '\n\nCenisz obecność wszystkich sprawności w swojej kieszeni? Wesprzyj HarcAppkę! <b>c:</b>',
            colorStart: averageColorStart,
            colorEnd: averageColorEnd,
          )):null,
    ),
  );

  Color get averageColorStart{
    int red = 0;
    int green = 0;
    int blue = 0;

    for(int i=0; i<colorsStart.length; i++){
      Color? color = colorsStart[i];
      double dist = (tabNotifier.value - i).abs();
      dist = min(max(dist, 0), 1);
      if(dist == 1) continue;

      red += (color.red * (1 - dist)).floor();
      green += (color.green * (1 - dist)).floor();
      blue += (color.blue * (1 - dist)).floor();
    }
    return Color.fromARGB(255, red, green, blue);
  }

  Color get averageColorEnd{
    int red = 0;
    int green = 0;
    int blue = 0;

    for(int i=0; i<colorsEnd.length; i++){
      Color? color = colorsEnd[i];
      double dist = (tabNotifier.value - i).abs();
      dist = min(max(dist, 0), 1);
      if(dist == 1) continue;

      red += (color.red * (1 - dist)).floor();
      green += (color.green * (1 - dist)).floor();
      blue += (color.blue * (1 - dist)).floor();
    }
    return Color.fromARGB(255, red, green, blue);
  }

}


class TinySprawSetWidget extends StatelessWidget{

  final String mode;
  final List<String> uids;
  final String emptyMessage;
  final IconData icon;
  final bool showProgress;
  final void Function()? onReqComplChanged;

  const TinySprawSetWidget(this.mode, this.uids, {required this.emptyMessage, required this.icon, this.showProgress = false, this.onReqComplChanged, super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(String uid in uids){

      Spraw? spraw = Spraw.fromUID(uid);

      if(spraw == null) continue;

      children.add(SprawWidgetSmall(spraw, mode, showProgress: showProgress, onReqComplChanged: onReqComplChanged));
    }

    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          
          Positioned(
            right: 24,
            bottom: 0,
            child: Hero(
              tag: icon,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: Icon(
                  icon,
                  color: backgroundIcon_(context),
                  size: 140,
                ),
              ),
            )
          ),

          if(children.isEmpty)
            Positioned.fill(
              left: Dimen.ICON_MARG,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  emptyMessage,
                  style: AppTextStyle(
                      fontSize: 64.0,
                      fontWeight: weight.bold,
                      color: backgroundIcon_(context)
                  ),
                ),
              )
            )
          else
            ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: children,
            ),
        ],
      )
    );
  }

}

class _TabScrollProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}
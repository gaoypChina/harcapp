import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/predefined/trop_predef_search_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/predefined/trop_predef_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_editor_page/_main.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';

import '../trop_page.dart';


class TropPredefPage extends StatefulWidget{

  final String metoShort;
  final List<TropBaseData> predefTrops;
  final List<TropCategory> allCategories;

  const TropPredefPage({
    required this.metoShort,
    required this.predefTrops,
    required this.allCategories,
    super.key
  });

  @override
  State<StatefulWidget> createState() => TropPredefPageState();

}

class TropPredefPageState extends State<TropPredefPage> with TickerProviderStateMixin{

  String get metoShort => widget.metoShort;
  List<TropBaseData> get predefTrops => widget.predefTrops;
  List<TropCategory> get allCategories => widget.allCategories;

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: predefTrops.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: ExtendedNestedScrollView(
      floatHeaderSlivers: true,
      pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){

        List<Tab> tabs = [];
        for(int i=0; i<predefTrops.length; i++)
          tabs.add(Tab(text: predefTrops[i].name));

        return [
          SliverAppBar(
            title: Text('Tropy gotowce $metoShort'),
            centerTitle: true,
            floating: true,
            pinned: true,
            bottom: TabBar(
              tabs: tabs,
              controller: controller,
              isScrollable: true,
              indicator: AppTabBarIncdicator(
                  color: AppColors.zhpTropColor
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.magnify),
                onPressed: () => pushPage(
                    context,
                    builder: (context) => TropPredefSearchPage(
                        predefTrops: predefTrops,
                      onSelected: (index) => controller.animateTo(index)
                    )
                ),
              )
            ],
          )
        ];

      },
      body: Builder(
        builder: (context){

          List<Widget> children = [];
          for(int i=0; i<predefTrops.length; i++)
            children.add(CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [

                FloatingContainer.child(
                    height: Dimen.ICON_FOOTPRINT + Dimen.SIDE_MARG,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: Dimen.SIDE_MARG,
                        left: Dimen.SIDE_MARG,
                        right: Dimen.SIDE_MARG,
                      ),
                      child: Material(
                        elevation: AppCard.bigElevation,
                        borderRadius: BorderRadius.circular(AppCard.bigRadius),
                        color: AppColors.zhpTropColor,
                        child: TitleShortcutRowWidget(
                          title: 'Fajne, biorę',
                          titleColor: Colors.white,
                          onOpenIconColor: Colors.white,
                          onOpen: (){
                            Navigator.pop(context);
                            pushPage(
                                context,
                                builder: (context) => TropEditorPage(
                                    initTropBaseData: predefTrops[i],
                                    allCategories: allCategories,
                                    onSaved: (trop){
                                      Navigator.pop(context);
                                      Trop.addToAll(trop, context: context);
                                      pushPage(context, builder: (context) => TropPage(trop));
                                    }
                                )
                            );
                          },
                        ),
                      ),
                    )
                ),

                SliverPadding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  sliver: SliverList(delegate: SliverChildListDelegate([
                    TropPredefWidget(predefTrops[i]),
                  ])),
                )

              ],
            ));

          return TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: controller,
              children: children
          );

        },
      )
    ),
  );

}
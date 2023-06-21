import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/kuchnia_harcerska/products_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/kuchnia_harcerska/providers.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'search_page.dart';
import 'meal.dart';
import 'meal_list_page.dart';
import 'meal_widget.dart';


class KuchniaHarcerskaFragment extends StatefulWidget {

  const KuchniaHarcerskaFragment({super.key});

  @override
  State createState() => KuchniaHarcerskaFragmentState();

}

class KuchniaHarcerskaFragmentState extends State<KuchniaHarcerskaFragment> with TickerProviderStateMixin, ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.kuchniaHarcerska;

  TabController? controller;

  @override
  void initState() {

    controller = TabController(vsync: this, length: Meal.all.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => SelectedMealsProvider(),
    builder: (context, child) => BottomNavScaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
              title: const Text('Kuchnia harcerska'),
              centerTitle: true,
              backgroundColor: background_(context),
              forceElevated: innerBoxIsScrolled,
              actions: [

                Consumer<SelectedMealsProvider>(
                    builder: (context, prov, child) => AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: prov.meals.isEmpty?0:1,
                      child: IconButton(
                        icon: Stack(
                          children: [
                            Icon(MdiIcons.cartOutline, color: appBarTextEnab_(context)),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: AppCard(
                                  padding: const EdgeInsets.all(1.5),
                                  color: accent_(context),
                                  child: Text(
                                      '${prov.meals.length}',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, color: background_(context), fontWeight: weight.bold)
                                  ),
                                )
                            ),
                          ],
                        ),
                        onPressed: () => pushPage(context, builder: (context) => MealListPage(this, prov.meals)),
                      ),
                    )
                ),

                IconButton(
                  icon: Icon(MdiIcons.magnify),
                  onPressed: (){

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage(
                                (Meal meal){
                              int page = Meal.all.indexOf(meal);
                              controller!.animateTo(page, duration: const Duration(milliseconds: 600), curve: Curves.easeOutQuad);
                              Navigator.pop(context);
                            }
                        ))
                    );

                  },
                ),

              ],
              pinned: true,
              floating: true,
              bottom: TabBar(
                controller: controller,
                physics: const BouncingScrollPhysics(),
                isScrollable: true,
                tabs: Meal.all.map((meal) => Tab(text: meal.name)).toList(),
                indicator: AppTabBarIncdicator(context: context),
                //controller: _tabController,
              )
          ),
        ],
        body: TabBarView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          children: Meal.all.map((meal) => MealWidget(
              meal,
              padding: const EdgeInsets.only(
                top: Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG,
                bottom: 2*Dimen.FLOATING_BUTTON_MARG + Dimen.FLOATING_BUTTON_SIZE
              ),
              onSelectedChanged: (meal, selected){}
          ),).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(MdiIcons.formatListBulleted, color: background_(context)),
          onPressed: () => pushPage(context, builder: (context) => const ProductsPage())
      ),
    ),
  );
}
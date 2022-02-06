import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/products_page.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/providers.dart';
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

  @override
  State createState() => KuchniaHarcerskaFragmentState();

}

class KuchniaHarcerskaFragmentState extends State<KuchniaHarcerskaFragment> with TickerProviderStateMixin{

  TabController controller;

  @override
  void initState() {

    controller = TabController(vsync: this, length: Meal.all.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => SelectedMealsProvider(),
      builder: (context, child) => BottomNavScaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
                title: Text('Kuchnia harcerska'),
                centerTitle: true,
                backgroundColor: background_(context),
                actions: [

                  Consumer<SelectedMealsProvider>(
                      builder: (context, prov, child) => AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: prov.meals.isEmpty?0:1,
                        child: IconButton(
                          icon: Stack(
                            children: [
                              Icon(MdiIcons.cartOutline, color: appBarTextEnab_(context)),
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: AppCard(
                                    padding: EdgeInsets.all(1.5),
                                    color: accent_(context),
                                    child: Text(
                                        '${prov.meals.length}',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, color: accentIcon_(context), fontWeight: weight.bold)
                                    ),
                                  )
                              ),
                            ],
                          ),
                          onPressed: (){
                            Navigator.of(context).push(PageTransition(type: PageTransitionType.rippleRightDown, child: MealListPage(this, prov.meals)));
                          },
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
                                controller.animateTo(page, duration: Duration(milliseconds: 600), curve: Curves.easeOutQuad);
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
                  physics: BouncingScrollPhysics(),
                  isScrollable: true,
                  tabs: Meal.all.map((meal) => Tab(text: meal.name)).toList(),
                  indicator: AppTabBarIncdicator(context: context),
                  //controller: _tabController,
                )
            ),
          ],
          body: TabBarView(
            controller: controller,
            physics: BouncingScrollPhysics(),
            children: Meal.all.map((meal) => MealWidget(
                meal,
                onSelectedChanged: (meal, selected){}
            )
            ).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(MdiIcons.formatListBulleted),
            onPressed: () => Navigator.of(context).push(PageTransition(type: PageTransitionType.rippleRightUp, child: ProductsPage()))
        ),
      ),
    );
  }
}
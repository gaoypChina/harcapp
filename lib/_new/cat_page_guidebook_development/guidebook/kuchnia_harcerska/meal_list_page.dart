import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/pola_button.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/kuchnia_harcerska/product.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

import '_main.dart';
import 'common.dart';
import 'equipment.dart';
import 'ingredient.dart';
import 'meal.dart';

class MealListPage extends StatefulWidget{

  final KuchniaHarcerskaFragmentState parent;
  final List<Meal>? meals;

  const MealListPage(this.parent, this.meals);

  @override
  State<StatefulWidget> createState() => MealListPageState();

}

class MealListPageState extends State<MealListPage>{

  KuchniaHarcerskaFragmentState get parent => widget.parent;

  late Map<Meal, PrimitiveWrapper<int>> portionsCount;
  late Map<Product, double> productsCount;
  Map<Equipment, int?>? equipmentCount;

  @override
  void initState() {

    portionsCount = {};
    for(Meal meal in widget.meals!)
      portionsCount[meal] = PrimitiveWrapper(1);

    productsCount = _countProducts();
    equipmentCount = _countEquipment();
    
    super.initState();
  }

  Map<Product, double> _countProducts(){
    Map<Product, double> productsCount = {};
    for(Meal meal in widget.meals!)
      for(Ingredient ingredient in meal.ingredients)
        if(productsCount.containsKey(ingredient.product))
          productsCount[ingredient.product] = productsCount[ingredient.product]! + (ingredient.getAmountInUnit(Unit.g) * portionsCount[meal]!.get());
        else
          productsCount[ingredient.product] = (ingredient.getAmountInUnit(Unit.g) * portionsCount[meal]!.get());

    return productsCount;
  }

  Map<Equipment, int?> _countEquipment(){
    Map<Equipment, int?> equipmentCount = {};
    for(Meal meal in widget.meals!)
      for(Equipment eq in meal.equipment.keys.toList())
        if(equipmentCount.containsKey(eq)) {
          if(meal.equipment[eq]! > equipmentCount[eq]!)
            equipmentCount[eq] = meal.equipment[eq];
        }else
          equipmentCount[eq] = meal.equipment[eq];

    return equipmentCount;
  }

  countProducts() => setState(() => productsCount = _countProducts());
  countEquipment() => setState(() => equipmentCount = _countEquipment());

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: background_(context),
              floating: true,
              title: Text('Lista zapotrzebowania', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR)),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: PolaIcon(color: appBarTextEnab_(context),),
                  onPressed: () => polaTap(context),
                )
              ],
            ),

            SliverList(
              delegate: SliverChildListDelegate([
                Column(children: widget.meals!.map<Widget>((meal) => MealItem(this, meal, portionsCount[meal])).toList()),
                const SizedBox(height: 20.0),
                const KuchSectionHeader(text: 'Wszystkie produkty'),
                Column(children: productsCount.keys.toList().map<Widget>((product) =>
                    IngredientWidgetConv(Ingredient(product, product.unitManager.convert(Unit.g, product.unitManager.defUnit, productsCount[product]), product.unitManager.defUnit), 1)).toList()),
                const SizedBox(height: 20.0),
                EquipmentListWidget(equipmentCount),
              ]),
            )
          ]
      ),
    );


  }
}

class MealItem extends StatefulWidget{

  final MealListPageState parent;

  final Meal meal;
  final PrimitiveWrapper<int>? portions;
  const MealItem(this.parent, this.meal, this.portions);

  @override
  State<StatefulWidget> createState() => MealItemState();

}

class MealItemState extends State<MealItem>{

  @override
  Widget build(BuildContext context) {

    return AppCard(
      margin: AppCard.normMargin,
      elevation: AppCard.bigElevation,
      padding: EdgeInsets.zero,
      child: PortionsSelectorWidget.create(builder:
          (Widget buttons, Widget textField) {
        return Row(
          children: <Widget>[
            const SizedBox(width: Dimen.defMarg),
            SizedBox(width: 50, child: textField),
            const SizedBox(width: Dimen.defMarg),
            Text('x ', style: AppTextStyle(fontWeight: weight.halfBold)),
            Text(widget.meal.name, style: AppTextStyle(fontWeight: weight.halfBold)),
            Expanded(child: Container()),
            buttons
          ],
        );
      },
        onChanged: (portions) => widget.parent.countProducts(),
        portions: widget.portions,
        decoration: null
      ),
    );
  }

}
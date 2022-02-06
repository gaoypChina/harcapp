
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/product.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Ingredient{
  final Product product;
  final double amount;
  final Unit defUnit;

  const Ingredient(this.product, this.amount, this.defUnit);

  double getAmountInUnit(Unit unit){
    return product.unitManager.convert(defUnit, unit, amount);
  }
}

class IngredientWidget extends StatelessWidget{

  final Ingredient ingredient;
  final Unit showUnit;
  final int portions;

  const IngredientWidget(this.ingredient, this.showUnit, this.portions);

  static IngredientWidget from(Ingredient ingredient){
    return IngredientWidget(ingredient, ingredient.defUnit, 1);
  }

  @override
  Widget build(BuildContext context) {

    String amountStr;
    double amount = portions*ingredient.getAmountInUnit(showUnit);
    if(amount == amount.round())
      amountStr = amount.toStringAsFixed(0);
    else
      amountStr = amount.toStringAsFixed(1);

    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(Dimen.ICON_MARG),
          child: SvgPicture.asset(ingredient.product.fileName, width: 24, height: 24,),
        ),
        Text('${ingredient.product.name}', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
        Expanded(child: Container()),
        Text(' $amountStr ${UnitManager.unitName(showUnit)}', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),)

      ],
    );
  }
}

class IngredientWidgetConv extends StatefulWidget{

  final Ingredient ingredient;
  final int portions;

  const IngredientWidgetConv(this.ingredient, this.portions);

  @override
  State<StatefulWidget> createState() => IngredientWidgetConvState();
}

class IngredientWidgetConvState extends State<IngredientWidgetConv>{

  UnitManager get unitManager => widget.ingredient.product.unitManager;

  Unit unit;

  @override
  void initState() {
    unit = widget.ingredient.defUnit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: IngredientWidget(widget.ingredient, unit, widget.portions)),
        if(unitManager.unitCount > 1)
          IconButton(
            icon: Icon(MdiIcons.refresh, color: hintEnab_(context)),
            onPressed: (){
              int unitIndex = Unit.values.indexOf(this.unit);
              Unit unit = Unit.values[(++unitIndex)%Unit.values.length];
              while(unitManager.getGIn(unit) == null)
                unit = Unit.values[(++unitIndex)%Unit.values.length];

              setState(() => this.unit = unit);
            },
          )
        else
          SizedBox(width: Dimen.ICON_FOOTPRINT)
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';
import 'ingredient.dart';
import 'meal.dart';
import 'prep_steps_widget.dart';

class MealWidget extends StatefulWidget{

  final Meal meal;
  final void Function(Meal meal, bool selected) onSelectedChanged;
  const MealWidget(this.meal, {@required this.onSelectedChanged});

  @override
  State<StatefulWidget> createState() => MealWidgetState();

}

class MealWidgetState extends State<MealWidget>{

  TextEditingController textController;
  PrimitiveWrapper<int> portions;

  Meal get meal => widget.meal;

  bool get selected => Provider.of<SelectedMealsProvider>(context, listen: false).isSelected(meal);
  void changeSelection() => Provider.of<SelectedMealsProvider>(context, listen: false).changeMealSelection(meal);


  @override
  void initState() {
    portions = PrimitiveWrapper(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      physics: BouncingScrollPhysics(),
      children: <Widget>[

        TitleShortcutRowWidget(title: meal.name),

        SizedBox(height: Dimen.SIDE_MARG),

        PortionsSelectorWidget.create(builder:
            (Widget buttons, Widget textField) {
          return Row(
            children: <Widget>[
              SizedBox(width: Dimen.ICON_FOOTPRINT),
              Text(
                  'Liczba porcji:',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold
                  )
              ),
              SizedBox(width: 2*Dimen.DEF_MARG),
              Expanded(child: textField),
              buttons
            ],
          );
        },
            onChanged: (portions) => setState(() => this.portions.set(portions)),
            portions: portions
        ),

        SimpleButton(
          margin: EdgeInsets.only(left: Dimen.ICON_FOOTPRINT - Dimen.ICON_MARG),
          radius: AppCard.BIG_RADIUS,
          onTap: (){
            setState(() => changeSelection());
            widget.onSelectedChanged(meal, selected);
          },
          child: Row(
            children: [

              Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(
                    selected?MdiIcons.cartCheck:MdiIcons.cartOutline,
                    color: selected?iconEnab_(context):iconDisab_(context)),
              ),

              Expanded(
                child: Text(
                  selected?
                  'Dodano do listy składników':
                  'Dodaj do listy składników',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: selected?iconEnab_(context):iconDisab_(context)
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),

        ),

        SizedBox(height: 2*Dimen.SIDE_MARG),

        if(meal.tags.isNotEmpty)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: meal.tags.map<Widget>((tag) => Tag(tag)).toList()),
          ),
        if(meal.tags.isNotEmpty)
          SizedBox(height: 28),


        Row(
          children: [
            KuchSectionHeader(text: 'Składniki'),
            KuchSectionHeader(text: ' (porcja: ${meal.totalMass} g)', color: hintEnab_(context), paddingLeft: 0),
          ],
        ),

        Column(children: meal.ingredients.map(
                (ingredient) => IngredientWidgetConv(ingredient, portions.get())).toList()),

        SizedBox(height: 28),

        EquipmentListWidget(meal.equipment),

        SizedBox(height: 28),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(children: [
                Icon(
                    meal.water?MdiIcons.waterOutline:MdiIcons.waterOffOutline,
                    size: 48.0,
                    color: meal.water?iconEnab_(context):iconDisab_(context)),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    meal.water?
                    'Do przygotowania potrzebna jest woda':
                    'Do przygotowania nie jest potrzebna woda',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: meal.water?iconEnab_(context):iconDisab_(context)
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
            ),

            Expanded(
              child: Column(children: [
                Icon(
                    meal.fire?MdiIcons.fire:MdiIcons.bowlMixOutline,
                    size: 48.0,
                    color: meal.fire?iconEnab_(context):iconDisab_(context)),
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    meal.fire?
                    'Do przygotowania potrzebny jest ogień':
                    'Do przygotowania nie jest potrzebny ogień',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold,
                        color: meal.fire?iconEnab_(context):iconDisab_(context)
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
            )

          ],
        ),

        SizedBox(height: 28),

        KuchSectionHeader(text: 'Sposób przygotowania'),
        PrepStepsWidget(meal),

        SizedBox(height: 28),

        KuchSectionHeader(text: 'Wartości odżywcze (na 100 g)'),
        NutritionWidgetFull(
            meal.kcal100, meal.proteins100, meal.carbohyd100,
            meal.fat100, meal.vitamines, meal.other),

      ],
    );

  }
}
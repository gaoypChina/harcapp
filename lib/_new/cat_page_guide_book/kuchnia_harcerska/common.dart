import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/regex_input_formatter.dart';
import 'package:harcapp/_new/cat_page_guide_book/kuchnia_harcerska/product.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'equipment.dart';

const int KUCH_MAX_PORTION_DIGITS = 6;
const int KUCH_MAX_PORTION_COUNT = 999999;

abstract class _NutritionWidget extends StatelessWidget{

  final double kcal100;
  final double proteins100;
  final double carbohyd100;
  final double fat100;

  final List<String> vitamins;
  final List<Subst> other;

  const _NutritionWidget(this.kcal100, this.proteins100, this.carbohyd100, this.fat100, this.vitamins, this.other);

  String getWitaminyString(){
    String text = '';
    for(String vit in vitamins)
      text += vit + ', ';

    if(text.isNotEmpty) text = text.substring(0, text.length-2);
    return text;
  }

  String getOtherString(bool full){
    String text = '';
    for(Subst s in other)
      text += (full?s.name:s.abbr) + ', ';

    if(text.isNotEmpty) text = text.substring(0, text.length-2);
    return text;
  }

  String asString(double amount){

    String amountStr;
    if(amount == amount.round()) amountStr = amount.toStringAsFixed(0);
    else amountStr = amount.toStringAsFixed(1);

    return amountStr;
  }
}

class NutritionWidget extends _NutritionWidget{

  const NutritionWidget(double kcal100, double proteins100, double carbohyd100, double fat100, List<String> vitamins, List<Subst> other)
      :super(kcal100, proteins100, carbohyd100, fat100, vitamins, other);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(asString(kcal100), style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
            Expanded(child: Text(asString(proteins100) + ' g', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
            Expanded(child: Text(asString(carbohyd100) + ' g', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
            Expanded(child: Text(asString(fat100) + ' g', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Expanded(child: Text('kcal', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
            Expanded(child: Text('białko', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
            Expanded(child: Text('węglow', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
            Expanded(child: Text('tłuszcz', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
          ],
        ),
        SizedBox(height: 3),
        Row(
          children: [
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
          ],
        ),

        SizedBox(height: Dimen.ICON_MARG),

        Row(
          children: [
            Expanded(
              child: SimpleButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      getWitaminyString(),
                      style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis
                    ),
                    Text('witaminy', style: AppTextStyle(color: vitamins.isEmpty?hintEnab_(context):textEnab_(context))),
                  ],
                ),
                onTap: vitamins.isEmpty?null:() => showAppToast(context, text: getWitaminyString()),
              ),
            ),
            Expanded(
              child: SimpleButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      getOtherString(false),
                      style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold
                      ),
                      maxLines: 1, overflow: TextOverflow.ellipsis,),
                    Text(
                        'inne',
                        style: AppTextStyle(
                            color: other.isEmpty?hintEnab_(context):textEnab_(context)
                        )
                    ),
                  ],
                ),
                onTap: other.isEmpty?null:() => showAppToast(context, text: getOtherString(true)),
              ),
            )
          ],
        )
      ],
    );
  }
}

class NutritionWidgetFull extends _NutritionWidget{

  const NutritionWidgetFull(double kcal100, double proteins100, double carbohyd100, double fat100, List<String> vitamins, List<Subst> other)
      :super(kcal100, proteins100, carbohyd100, fat100, vitamins, other);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        if(vitamins.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_FOOTPRINT),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                    'Witaminy',
                    style: AppTextStyle(
                      color: hintEnab_(context),
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold
                    )
                ),

                SizedBox(height: Dimen.ICON_MARG),

                Text(
                    getWitaminyString(),
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                ),

              ],
            ),
          ),

        SizedBox(height: 2*Dimen.ICON_MARG),

        if(other.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: Dimen.ICON_FOOTPRINT),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                    'inne',
                    style: AppTextStyle(
                      color: hintEnab_(context),
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold
                    )
                ),

                SizedBox(height: Dimen.ICON_MARG),

                Text(
                  getOtherString(false),
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold
                  ),
                  maxLines: 1, overflow: TextOverflow.ellipsis,),


              ],
            ),
          ),

        SizedBox(height: 2*Dimen.ICON_MARG),

        Row(
          children: [
            Expanded(child: Text(asString(kcal100), style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
            Expanded(child: Text(asString(proteins100) + ' g', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
            Expanded(child: Text(asString(carbohyd100) + ' g', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
            Expanded(child: Text(asString(fat100) + ' g', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: 22.0), textAlign: TextAlign.center)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Expanded(child: Text('kcal', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
            Expanded(child: Text('białko', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
            Expanded(child: Text('węglow', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
            Expanded(child: Text('tłuszcz', style: AppTextStyle(fontSize: 14.0), textAlign: TextAlign.center)),
          ],
        ),
        SizedBox(height: 3),
        Row(
          children: [
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
            Expanded(child: Text('100 g', style: AppTextStyle(fontSize: 14.0, color: hintEnab_(context)), textAlign: TextAlign.center)),
          ],
        ),

        SizedBox(height: 2*Dimen.ICON_MARG),

      ],
    );

  }
}

class KuchSectionHeader extends StatelessWidget{

  final String text;
  final Color color;
  final double paddingLeft;

  const KuchSectionHeader({@required this.text, this.color, this.paddingLeft = Dimen.ICON_FOOTPRINT});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: paddingLeft,
          top: Dimen.ICON_MARG,
          bottom: Dimen.ICON_MARG
        ),
        child: Text(text, style: AppTextStyle(
            fontWeight: weight.halfBold,
          fontSize: Dimen.TEXT_SIZE_BIG,
          color: color??accent_(context)
        ))
    );
  }

}

class EquipmentListWidget extends StatelessWidget{

  final Map<Equipment, int> equipment;

  const EquipmentListWidget(this.equipment);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        KuchSectionHeader(text: 'Ekwipunek'),
        Column(children: equipment.keys.toList()
            .map((eq) => EquipmentWidget(eq, equipment[eq])
        ).toList()),
      ],
    );
  }
}

class PortionsSelectorWidget extends StatefulWidget{

  final Widget Function(Widget buttons, Widget textField) builder;
  final Function(int) onChanged;
  final PrimitiveWrapper<int> portions;
  final InputDecoration decoration;

  PortionsSelectorWidget(this.builder, this.onChanged, this.portions, this.decoration);

  static PortionsSelectorWidget create({@required Function(Widget buttons, Widget textField) builder, @required PrimitiveWrapper<int> portions, Function(int) onChanged, InputDecoration decoration}){
    return PortionsSelectorWidget(builder, onChanged, portions==null?PrimitiveWrapper(1):portions, decoration);
  }

  @override
  State<StatefulWidget> createState() => PortionsSelectorWidgetState();

}

class PortionsSelectorWidgetState extends State<PortionsSelectorWidget>{

  Widget textField;
  Widget buttons;
  TextEditingController textController;

  final Key dismissibleKey = UniqueKey();

  void reloadPortions(){
    int portions;
    try{
      portions = int.parse(textController.text);
      if(portions > KUCH_MAX_PORTION_COUNT) portions = KUCH_MAX_PORTION_COUNT;
    } on Exception {
      portions = 1;
      setState(() => textController.text = '1');
      textController.selection = TextSelection(baseOffset: 1, extentOffset: 1);
    } finally{
      setState(() => widget.portions.set(portions));
      if(widget.onChanged != null) widget.onChanged(portions);
    }
  }

  @override
  void initState() {
    textController = TextEditingController(text: '${widget.portions.get()}');

    textField = TextField(style: AppTextStyle(fontWeight: weight.halfBold),
      controller: textController,
      onChanged: (text) => reloadPortions(),
      inputFormatters: [RegExInputFormatter.withRegex('^[0-9]{1,$KUCH_MAX_PORTION_DIGITS}\$')],
      keyboardType: TextInputType.number,
      decoration: widget.decoration,
    );

    buttons = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(MdiIcons.chevronUp),
          onPressed: () => setState((){
            if(widget.portions.get() == KUCH_MAX_PORTION_COUNT) return;
            widget.portions.set(widget.portions.get() + 1);
            String portStr = widget.portions.get().toString();
            textController.text = portStr;
            textController.selection = TextSelection(baseOffset: portStr.length, extentOffset: portStr.length);
            if(widget.onChanged != null) widget.onChanged(widget.portions.get());
          }),
        ),
        IconButton(
            icon: Icon(MdiIcons.chevronDown),
            onPressed: () => setState((){
              if(widget.portions.get() == 1) return;
              widget.portions.set(widget.portions.get() - 1);
              String portStr = widget.portions.get().toString();
              textController.text = portStr;
              textController.selection = TextSelection(baseOffset: portStr.length, extentOffset: portStr.length);
              if(widget.onChanged != null) widget.onChanged(widget.portions.get());
            })
        )
      ],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return widget.builder(buttons, textField);
  }

}
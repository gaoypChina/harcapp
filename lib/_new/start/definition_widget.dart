import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../values/definition.dart';
import 'quote_widget.dart';
import 'layouts.dart';

class DefinitionWidget extends StatefulWidget{

  final Definition definition;

  const DefinitionWidget({this.definition, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => DefinitionWidgetState();

}

class DefinitionWidgetState extends State<DefinitionWidget>{

  static const double textSize = QuoteWidgetState.textSize;
  static const double iconSize = 42.0;

  Definition _definition;
  Definition get definition => widget.definition??_definition;

  @override
  void initState() {

    if(widget.definition == null)
      _definition = allDefinitions[Random().nextInt(allDefinitions.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[

      const Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: QuoteWidgetState.iconSize,
          height: QuoteWidgetState.iconSize,
          child: Center(
            child: Icon(
              MdiIcons.bookOpenPageVariant,
              size: 38.0,
              color: Colors.white,
            ),
          ),
        ),
      ),

      const SizedBox(height: 18.0),

      Text(
        definition.word,
        style: const TextStyle(
          fontFamily: 'Merriweather',
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontSize: textSize+6,
        ),
      ),
      const Text(
        'Pojęcia szerokiego horyzontu!',
        style: TextStyle(
          fontFamily: 'Merriweather',
          fontWeight: FontWeight.w300,
          color: Colors.white54,
          fontSize: textSize,
        ),
      ),

      const SizedBox(height: 18.0),

      Text(
        definition.description,
        style: AppTextStyle(
          fontSize: textSize,
          color: Colors.white,
          height: 1.3
        )
      ),

      const SizedBox(height: 18.0),


    ],
  );

}
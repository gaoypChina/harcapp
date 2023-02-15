import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:flip_card/flip_card.dart';

import '../common.dart';

class PreviewCardsGridController{

  //List<GlobalKey<FlipCardState>> _globalKeys;
  late List<FlipCardController> _controllers;

  PreviewCardsGridController({List<int> initFlippedCards=const[]}){
    _controllers = [];
    for(int i=0; i<12; i++) {
      //GlobalKey<FlipCardState> globalKey = GlobalKey<FlipCardState>(debugLabel: 'NOSZ KURWA $i');
      FlipCardController controller = FlipCardController();
      _controllers.add(controller);
      //_globalKeys.add(globalKey);
    }
  }

  FlipCardController operator [](int index) => _controllers[index];

}

class PreviewCardsGridWidget extends StatelessWidget{

  final bool withColors;
  final bool withWords;
  final PreviewCardsGridController? controller;

  const PreviewCardsGridWidget({this.withColors=true, this.withWords=false, this.controller, super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {

        double childAspectRatio = (3*constraints.maxWidth)/(4*constraints.maxHeight);

        double textSize = constraints.maxWidth*0.05;

        return GridView.count(
          clipBehavior: Clip.none,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          childAspectRatio: childAspectRatio,
          children: <Widget>[
            _FlipCardWidget(withColors, RED_COLOR, text: withWords?'Kot':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![0]),
            _FlipCardWidget(withColors, GREEN_COLOR, text: withWords?'Żuk':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![1]),
            _FlipCardWidget(withColors, NEUTRAL_COLOR, text: withWords?'Tort':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![2]),
            _FlipCardWidget(withColors, RED_COLOR, text: withWords?'Pies':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![3]),
            _FlipCardWidget(withColors, NEUTRAL_COLOR, text: withWords?'Bieg':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![4]),
            _FlipCardWidget(withColors, BLACK_COLOR, text: withWords?'Piec':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![5]),
            _FlipCardWidget(withColors, RED_COLOR, text: withWords?'Krąg':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![6]),
            _FlipCardWidget(withColors, NEUTRAL_COLOR, text: withWords?'Czas':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![7]),
            _FlipCardWidget(withColors, GREEN_COLOR, text: withWords?'Lód':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![8]),
            _FlipCardWidget(withColors, RED_COLOR, text: withWords?'Kubek':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![9]),
            _FlipCardWidget(withColors, NEUTRAL_COLOR, text: withWords?'Igła':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![10]),
            _FlipCardWidget(withColors, GREEN_COLOR, text: withWords?'Śnieg':(withColors?null:'?'), textSize: textSize, controller:  controller==null?null:controller![11]),
          ],
        );
      },
    );

  }

}

class _FlipCardWidget extends StatelessWidget{

  final bool withColors;
  final Color? color;
  final String? text;
  final double? textSize;
  //final GlobalKey<FlipCardState> flipCardKey;
  final FlipCardController? controller;

  const _FlipCardWidget(this.withColors, this.color, {this.text, this.textSize, this.controller});

  @override
  Widget build(BuildContext context) {
    if(withColors)
      return _CardWidget(color, text: text, textSize: textSize);
    else
      return FlipCard(
        //key: flipCardKey,
        flipOnTouch: false,
        front: _CardWidget(ColorPack.DEF_CARD, text: text, textSize: textSize),
        back: _CardWidget(color, text: text, textSize: textSize),
        controller: controller,
      );
  }

}

class _CardWidget extends StatelessWidget{

  final Color? color;
  final String? text;
  final double? textSize;
  const _CardWidget(this.color, {this.text, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppCard.normMargin,
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.defRadius),
        elevation: AppCard.bigElevation,
        color: color,
        child:
        text == null?null:
        Center(
          child: Text(text!, style: AppTextStyle(
              fontWeight: weight.halfBold,
              color: color==BLACK_COLOR?Colors.white:Colors.black,
              fontSize: textSize)
          ),
        ),
      ),
    );
  }

}
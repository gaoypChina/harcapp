import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core_tags/tag_layout.dart';

import 'data.dart';

const double CARD_HEIGHT = 160;
const double WOOD_PARA_ITEM_HEIGHT = Dimen.ICON_FOOTPRINT;

class TagWidget extends StatelessWidget{

  final ItemData data;

  const TagWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    if(data.tags.isEmpty)
      return Container();

    return SizedBox(
      height: Tag.height(),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          itemBuilder: (context, index) => Tag(
            data.tags[index],
            color: background_(context),
            elevation: AppCard.defElevation,
          ),
          separatorBuilder: (context, index) => const SizedBox(width: Dimen.SIDE_MARG),
          scrollDirection: Axis.horizontal,
          itemCount: data.tags.length
      ),
    );

  }

}

class FirePropertyWidget extends StatelessWidget{

  static const Map<int, String> mapMask = {
    -1: '?',
    0:'zmienny',
    1:'mały',
    2:'średni',
    3:'duży',
    4:'b. duży'
  };
  static const Map<int, String> mapFem = {
    -1: '?',
    0:'zmienna',
    1:'mała',
    2:'średnia',
    3:'duża',
    4:'b. duża'
  };
  static const Map<int, String> mapNeut = {
    -1: '?',
    0:'zmienne',
    1:'małe',
    2:'średnie',
    3:'duże',
    4:'b. duże'
  };

  final ItemData data;
  const FirePropertyWidget(this.data, {super.key});

  Color colorStart(int value, BuildContext context){
    if(value == 1) return Colors.deepPurple[700]!;
    if(value == 2) return Colors.purple[400]!;
    if(value == 3) return Colors.orange;
    if(value == 4) return Colors.deepOrange[600]!;
    return textDisab_(context);
  }

  Color colorEnd(int value, BuildContext context){
    if(value == 1) return Colors.blue[700]!;
    if(value == 2) return Colors.pink[400]!;
    if(value == 3) return Colors.amber;
    if(value == 4) return Colors.orange;
    return textDisab_(context);
  }
  
  Widget wrap(BuildContext context, int value) => SizedBox(
    height: WOOD_PARA_ITEM_HEIGHT,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 6.0),
        Text(
          mapNeut[value]!,
          style: AppTextStyle(
            fontWeight: weight.halfBold, 
            fontSize: Dimen.TEXT_SIZE_NORMAL,
            color: colorStart(value, context)
          )
        ),
        GradientWidget(
          width: max(
            12.0,
            value*MediaQuery.of(context).size.width / (2*MAX_PARAM_VAL),
          ),
          height: 6.0,
          radius: 100,
          colorStart: colorStart(value, context),
          colorEnd: colorEnd(value, context),
        ),
        Text(
            '',
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL)
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) => Row(children: <Widget>[
    const SizedBox(width: Dimen.ICON_MARG),

    Column(crossAxisAlignment:CrossAxisAlignment.start, children: <Widget>[
      if(data.cieplo!=null)
        SizedBox(
          height: Dimen.ICON_FOOTPRINT,
          child: Center(child: Text('Ciepło: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
        ),
      if(data.zar!=null)
        SizedBox(
          height: Dimen.ICON_FOOTPRINT,
          child: Center(child: Text('Il. żaru: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
        ),
      if(data.plomien!=null)
        SizedBox(
          height: Dimen.ICON_FOOTPRINT,
          child: Center(child: Text('Płomień: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
        ),
      if(data.czas!=null)
        SizedBox(
          height: Dimen.ICON_FOOTPRINT,
          child: Center(child: Text('Czas spal.: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))),
        ),
    ],),
    const SizedBox(width: 12),
    Column(crossAxisAlignment:CrossAxisAlignment.start, children: <Widget>[
      if(data.cieplo!=null)
        wrap(context, data.cieplo!),
      if(data.zar!=null)
        wrap(context, data.zar!),
      if(data.plomien!=null)
        wrap(context, data.plomien!),
      if(data.czas!=null)
        wrap(context, data.czas!)
    ],)
  ]);

}
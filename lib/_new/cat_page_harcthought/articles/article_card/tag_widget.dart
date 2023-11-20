
import 'package:flutter/material.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:tuple/tuple.dart';

import '../article.dart';
import 'common.dart';

class TagWidget extends StatelessWidget{

  static const String TAG_ZUCH = '#ZUCHY';
  static const String TAG_HARC = '#HARCERZE';
  static const String TAG_WEDRO = '#WĘDROWNICY';
  static const String TAG_INSTR = '#INSTRUKTORZY';

  static const String TAG_PROGRAM = '#PROGRAM';
  static const String TAG_OBOZ = '#OBÓZ';

  static const List<String> TAGS = [
    TAG_ZUCH,
    TAG_HARC,
    TAG_WEDRO,
    TAG_INSTR,

    TAG_PROGRAM,
    TAG_OBOZ,
  ];

  static const Map<String, Tuple2<Color, Color>> colors = {
    TAG_ZUCH: Tuple2(AppColors.metoZhpZ, Colors.black),
    TAG_HARC: Tuple2(AppColors.metoZhpH, Colors.black),
    TAG_WEDRO: Tuple2(AppColors.metoZhpW, Colors.black),
    TAG_INSTR: Tuple2(Colors.red, Colors.black),

    TAG_PROGRAM: Tuple2(Colors.deepPurpleAccent, Colors.white),
    TAG_OBOZ: Tuple2(Colors.brown, Colors.white),
  };

  final String tag;
  final bool dense;

  const TagWidget(this.tag, {this.dense=false, super.key});

  @override
  Widget build(BuildContext context) {

    Tuple2 colors = TagWidget.colors[tag]??const Tuple2(Colors.white, Colors.black);

    return Material(
      elevation: 4.0,
      color: colors.item1,
      borderRadius: BorderRadius.circular(dense?3:6),
      child: Padding(
        padding: EdgeInsets.all(dense?3.0:8.0),
        child: Text(
          tag,
          style: AppTextStyle(
            fontSize: dense?Dimen.TEXT_SIZE_TINY:Dimen.TEXT_SIZE_NORMAL,
            fontWeight: weight.halfBold,
            color: colors.item2,
          ),
        ),
      )
    );
  }


}

class TagsWidget extends StatelessWidget{

  final Article? article;
  final bool dense;

  const TagsWidget(this.article, {super.key, this.dense = false});

  @override
  Widget build(BuildContext context) {

    List<Widget> tags = [];
    for(int i=0; i<article!.tags!.length; i++){
      tags.add(TagWidget(article!.tags![i], dense: dense));
      if(i < article!.tags!.length-1) tags.add(SizedBox(width: dense?Dimen.defMarg:Dimen.ICON_MARG));
    }

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(
          left: dense?
          CARD_PADDING_DENSE:
          CARD_PADDING_NORM,

          right: dense?
          CARD_PADDING_DENSE:
          CARD_PADDING_NORM
      ),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(children: tags),
    );

  }

}
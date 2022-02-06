import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'data.dart';

const double CARD_HEIGHT = 160;
const double WOOD_PARA_ITEM_HEIGHT = Dimen.ICON_FOOTPRINT;

class TagWidget extends StatelessWidget{

  final ItemData data;

  const TagWidget(this.data);

  @override
  Widget build(BuildContext context) {
    if(data.tags.isEmpty)
      return Container();

    List<Widget> children = [];

    for(int i=0; i<data.tags.length; i++) {
      String tag = data.tags[i];
      children.add(Tag(tag, margin: EdgeInsets.zero));
      if(i < data.tags.length-1)
        children.add(SizedBox(width: Dimen.SIDE_MARG/2));
    }

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: Dimen.SIDE_MARG/2, right: Dimen.SIDE_MARG/2, bottom: Dimen.SIDE_MARG/2),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: children,
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
  const FirePropertyWidget(this.data);

  Widget wrap(BuildContext context, Widget child, int val){

    return SizedBox(
      height: WOOD_PARA_ITEM_HEIGHT,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 6.0),
          child,
          Container(
            width: val*MediaQuery.of(context).size.width / (2*MAX_PARAM_VAL),
            height: 6.0,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(100))
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Column(crossAxisAlignment:CrossAxisAlignment.start, children: <Widget>[
        if(data.cieplo!=null)
          Row(
            children: [

              Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(MdiIcons.thermometerLow, color: hintEnab_(context)),
              ),

              Text('Ciepło: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),

            ],
          ),
        if(data.zar!=null)
          Row(
            children: [

              Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(MdiIcons.speedometer, color: hintEnab_(context)),
              ),

              Text('Il. żaru: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),

            ],
          ),
        if(data.plomien!=null)
          Row(
            children: [

              Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(MdiIcons.fire, color: hintEnab_(context)),
              ),

              Text('Płomień: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),

            ],
          ),
        if(data.czas!=null)
          Row(
            children: [

              Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(MdiIcons.timerSand, color: hintEnab_(context)),
              ),

              Text('Czas spal.: ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),

            ],
          ),
      ],),
      SizedBox(width: 12),
      Column(crossAxisAlignment:CrossAxisAlignment.start, children: <Widget>[
        if(data.cieplo!=null)
          wrap(context, Text(mapNeut[data.cieplo], style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)), data.cieplo),
        if(data.zar!=null)
          wrap(context, Text(mapFem[data.zar], style: AppTextStyle(fontWeight: weight.halfBold, fontSize:Dimen.TEXT_SIZE_BIG)), data.zar),
        if(data.plomien!=null)
          wrap(context, Text(mapMask[data.plomien], style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)), data.plomien),
        if(data.czas!=null)
          wrap(context, Text(mapMask[data.czas], style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)), data.czas)
      ],)
    ],);
  }

}
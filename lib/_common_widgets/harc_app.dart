import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class HarcApp extends StatelessWidget{

  final double size;
  final Color? color;
  final bool shadow;
  const HarcApp({this.size: Dimen.TEXT_SIZE_BIG, this.color, this.shadow=false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('Harc', style: AppTextStyle(
            fontSize: size,
            fontWeight: weight.halfBold,
            color: color??iconEnab_(context),
            shadow: shadow,
            height: 1.0
        )),
        Text('App', style: AppTextStyle(
            fontSize: size,
            fontWeight: weight.normal,
            color: color??iconEnab_(context), //Theme.of(context).iconTheme.color,
            shadow: shadow,
            height: 1.0
        ))
      ],
    );
  }



}
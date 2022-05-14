import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class EmptyMessageWidget extends StatelessWidget{

  final String? text;
  final IconData icon;
  final Color? color;
  final double size;

  const EmptyMessageWidget({
    required this.text,
    required this.icon,
    this.color,
    this.size = 92, //Dimen.ICON_EMPTY_INFO_SIZE,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [

      Icon(icon, color: color??hintEnab_(context), size: size),
      SizedBox(height: .1*size),
      Text(
        text!,
        style: AppTextStyle(
            color: color??hintEnab_(context),
            fontSize: (Dimen.TEXT_SIZE_BIG/Dimen.ICON_EMPTY_INFO_SIZE)*size,
            fontWeight: weight.bold
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),

    ],
  );

}
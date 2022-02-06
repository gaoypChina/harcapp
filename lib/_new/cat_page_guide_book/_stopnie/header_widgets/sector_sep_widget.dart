import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

class SectorSepWidget extends StatelessWidget{

  final String text;
  const SectorSepWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        SizedBox(width: Dimen.ICON_MARG),

        Expanded(
            child: Container(
              color: hintEnab_(context),
              height: 3,
              width: double.infinity,
            )
        ),

        SizedBox(width: Dimen.ICON_MARG),

        Text(text, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context))),

        SizedBox(width: Dimen.ICON_MARG),

        Expanded(
            child: Container(
              color: hintEnab_(context),
              height: 3,
              width: double.infinity,
            )
        ),

        SizedBox(width: Dimen.ICON_MARG),


      ],
    );
  }

}
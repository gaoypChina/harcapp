import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

class SectorSepWidget extends StatelessWidget{

  final String text;
  final bool showSlidePrompt;
  const SectorSepWidget(this.text, {this.showSlidePrompt = false, super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          const SizedBox(width: Dimen.ICON_MARG),

          Expanded(
              child: Container(
                color: hintEnab_(context),
                height: 3,
                width: double.infinity,
              )
          ),

          const SizedBox(width: Dimen.ICON_MARG),

          Text(text, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: hintEnab_(context))),

          const SizedBox(width: Dimen.ICON_MARG),

          Expanded(
              child: Container(
                color: hintEnab_(context),
                height: 3,
                width: double.infinity,
              )
          ),

          const SizedBox(width: Dimen.ICON_MARG),


        ],
      ),
      if(showSlidePrompt)
        Padding(
          padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
          child: Text(
              'Przeciągnij w bok, by edytować',
              style: AppTextStyle(
                  fontWeight: weight.halfBold,
                  color: hintEnab_(context)
              )
          ),
        )

    ],
  );

}
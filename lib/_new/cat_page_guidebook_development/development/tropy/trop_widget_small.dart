import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'open_trop_dialog.dart';

class TropWidgetSmall extends StatelessWidget{

  static const double height = 140.0 - 12.0;
  static const double width = 130.0 - 12.0;

  static const double marginVal = 8.0;

  final TropBaseData trop;
  final bool showProgress;
  final bool clickable;
  final double elevation;
  final Color? backgroundColor;
  final void Function()? onLongPress;

  const TropWidgetSmall(
      this.trop,
      { this.showProgress = true,
        this.clickable = true,
        this.elevation = AppCard.bigElevation,
        this.backgroundColor,
        this.onLongPress,
        super.key
      });

  TropBaseData get heroTag => trop;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: width,
    height: height,
    child: Hero(
      tag: heroTag,
      child: SimpleButton(
          color: backgroundColor??cardEnab_(context),
          onLongPress: onLongPress,
          onTap: clickable?(){

            if(trop is Trop)
              openTropDialog(
                context,
                trop as Trop
              );
            else if(trop is TropSharedPreviewData)
              loadOpenTropDialog(
                context,
                trop as TropSharedPreviewData
              );

          }:null,
          radius: AppCard.bigRadius,
          elevation: elevation,
          padding: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Row(
                  children: [

                    TropIcon(
                      trop.category,
                      zuchTropName: trop.customIconTropName,
                      size: 42.0,
                    ),

                    Expanded(child: Container()),

                    if(showProgress)
                      Text(
                        '${trop.completenessPercent}%',
                        style: AppTextStyle(
                            fontWeight: weight.halfBold,
                            color: hintEnab_(context)
                        ),
                      )

                  ],
                ),

                const SizedBox(height: Dimen.ICON_MARG),

                AutoSizeText(
                  trop.name,
                  wrapWords: false,
                  minFontSize: 10.0,
                  style: AppTextStyle(
                    fontWeight: weight.halfBold,
                  ),
                  textAlign: TextAlign.center,
                ),

                Expanded(child: Container()),

              ],
            ),
          ),
      ),
    ),
  );

}
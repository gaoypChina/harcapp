
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'models_common/rank.dart';

class RankTileWidgetTemplate extends StatelessWidget{

  static const double defTileIconSize = 42.0;
  static const double elevation = 4.0;

  static const double leadingWidth = RankData.iconSizeSmall*3 + 2*Dimen.defMarg;
  static const double leadingAspectRatio = 1.8;

  final Color colorStart;
  final Color colorEnd;
  final List<IconData> icons;
  final double iconSize;
  final bool iconsTrailing;
  final void Function(BuildContext context)? onTap;
  final String? titleTop;
  final String? titleBottom;
  final Color? titleTopColor;
  final Color? titleBottomColor;
  final Widget? trailing;
  final Widget? titleBottomLeading;

  const RankTileWidgetTemplate({
    required this.colorStart,
    required this.colorEnd,
    required this.icons,
    this.iconSize=32.0,
    this.iconsTrailing=false,
    this.onTap,
    required this.titleTop,
    this.titleBottom,
    this.titleTopColor,
    this.titleBottomColor,
    this.trailing,
    this.titleBottomLeading,
    super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
    radius: AppCard.bigRadius,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.none,
    onTap: () => onTap?.call(context),
    child: Row(
      children: [
        SizedBox(
          width: leadingWidth,
          height: 64,
          child: AspectRatio(
            aspectRatio: leadingAspectRatio,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: icons.map((icon) => Icon(icon, size: iconSize,
                  color: Color.fromARGB(
                      255,
                      (colorStart.red + colorEnd.red)~/2,
                      (colorStart.green + colorEnd.green)~/2,
                      (colorStart.blue + colorEnd.blue)~/2
                  )
              )).toList(),
            )
          )
        ),

        const SizedBox(width: Dimen.SIDE_MARG),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                titleTop!,
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold,
                    color: titleTopColor??iconEnab_(context)
                ),
              ),

              if(titleBottomLeading != null || titleBottom != null)
                const SizedBox(height: Dimen.defMarg),

              Row(
                children: [

                  if(titleBottomLeading != null)
                    titleBottomLeading!,

                  if(titleBottom != null)
                    Text(
                      titleBottom!,
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          fontWeight: weight.halfBold,
                          color: titleBottomColor??textEnab_(context)
                      ),
                    )

                ],
              )

            ],
          ),
        ),

        const SizedBox(width: Dimen.SIDE_MARG),

        if(trailing != null)
          trailing!

      ],
    ),
  );

}
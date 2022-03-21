
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'models_common/rank.dart';

class RankTileWidgetTemplate extends StatelessWidget{

  static const double DEF_TILE_ICON_SIZE = 36.0;

  static const double leadingWidth = RankData.iconSizeSmall*3 + 2*Dimen.SIDE_MARG;
  static const double leadingAspectRatio = 1.8;

  final Color colorStart;
  final Color colorEnd;
  final List<IconData> icons;
  final double iconSize;
  final bool iconsTrailing;
  final void Function(BuildContext context) onTap;
  final String titleTop;
  final String titleBottom;
  final Color titleTopColor;
  final Color titleBottomColor;
  final Widget trailing;
  final Widget titleBottomLeading;

  const RankTileWidgetTemplate({
    @required this.colorStart,
    @required this.colorEnd,
    @required this.icons,
    this.iconSize=32.0,
    this.iconsTrailing=false,
    this.onTap,
    @required this.titleTop,
    this.titleBottom,
    this.titleTopColor,
    this.titleBottomColor,
    this.trailing,
    this.titleBottomLeading,
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => SimpleButton(
    radius: AppCard.BIG_RADIUS,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.none,
    onTap: () => onTap?.call(context),
    child: Row(
      children: [
        SizedBox(
          width: leadingWidth,
          child: AspectRatio(
            aspectRatio: leadingAspectRatio,
            child: GradientWidget(
              radius: AppCard.BIG_RADIUS,
              colorStart: colorStart,
              colorEnd: colorEnd,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: icons.map((icon) => Icon(icon, size: iconSize, color: iconEnab_(context))).toList(),
              ),
              elevation: AppCard.bigElevation,
            ),
          ),
        ),

        const SizedBox(width: Dimen.SIDE_MARG),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                titleTop,
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold,
                    color: titleTopColor??iconEnab_(context)
                ),
              ),

              if(titleBottomLeading != null || titleBottom != null)
                const SizedBox(height: Dimen.DEF_MARG),

              Row(
                children: [

                  if(titleBottomLeading != null)
                    titleBottomLeading,

                  if(titleBottom != null)
                    Text(
                      titleBottom,
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
          trailing

      ],
    ),
  );

}
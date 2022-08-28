import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import '../../../details/app_settings.dart';
import 'indiv_comp_thumbnail_widget.dart';
import 'models/indiv_comp.dart';

class IndivCompBasicDataTile extends StatelessWidget{

  final IndivCompBasicData comp;
  final String bottomText;
  final Color? bottomTextColor;
  final Widget? trailing;
  final void Function(IndivCompBasicData)? onTap;

  IndivCompBasicDataTile(this.comp, {this.bottomText='', this.bottomTextColor, this.trailing, this.onTap}): super(key: ValueKey(comp));

  @override
  Widget build(BuildContext context) => SimpleButton(
    clipBehavior: Clip.none,
    radius: AppCard.bigRadius,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    onTap: () => onTap?.call(comp),
    child: Row(
      children: [
        IndivCompThumbnailWidget(
          iconKey: comp.iconKey,
          colorsKey: comp.colorsKey,
          heroTag: comp,
        ),

        const SizedBox(width: Dimen.ICON_MARG),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: Dimen.defMarg),

              Text(
                comp.name,
                style: AppTextStyle(
                  fontSize: 18.0,
                  fontWeight: weight.halfBold,
                  color: AppSettings.isDark?comp.colors.colorStart:comp.colors.colorEnd,
                ),
                maxLines: 2,
              ),

              const SizedBox(height: Dimen.defMarg),

              SizedBox(
                height: PointsIcon.defSize,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    bottomText,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      color: bottomTextColor??hintEnab_(context)
                    )),
                ),
              )
            ],
          ),
        ),

        if(trailing != null)
          trailing!,

      ],
    ),
  );

}

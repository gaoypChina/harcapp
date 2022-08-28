import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'model/circle.dart';

class CircleBasicDataTile extends StatelessWidget{

  final CircleBasicData circle;
  final Widget? trailing;
  final String bottomText;
  final Color? bottomTextColor;
  final void Function(CircleBasicData)? onTap;
  const CircleBasicDataTile(this.circle, {this.trailing, this.bottomText='', this.bottomTextColor, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
    radius: AppCard.bigRadius,
    child: Row(
      children: [

        CoverImage(circle.coverImage),

        const SizedBox(width: Dimen.SIDE_MARG),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(circle.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold)),

            const SizedBox(height: Dimen.defMarg),

            Row(
              children: [
                const SizedBox(height: Dimen.ICON_SIZE),
                Text(
                    bottomText,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold,
                        color: bottomTextColor??hintEnab_(context)
                    )
                )
              ],
            )

          ],
        ),

        if(trailing != null)
          trailing!,

      ],
    ),
    onTap: () => onTap?.call(circle),
  );

}
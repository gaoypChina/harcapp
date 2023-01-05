import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'model/circle.dart';

class CircleTile extends StatelessWidget{

  final Circle circle;
  final void Function(Circle)? onTap;
  const CircleTile(this.circle, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
    radius: AppCard.bigRadius,
    child: Row(
    children: [

      SizedBox(
        height: 72,
        width: 124,
        child: Material(
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          clipBehavior: Clip.antiAlias,
          child: CoverImageWidget(circle.coverImage),
        ),
      ),

      const SizedBox(width: Dimen.SIDE_MARG),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(circle.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold)),

          const SizedBox(height: Dimen.defMarg),

          Row(
            children: [
              Icon(MdiIcons.accountMultiple, color: hintEnab_(context)),
              const SizedBox(width: Dimen.defMarg),
              Text(
                  circle.loadedMembers.length.toString(),
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.bold,
                      color: hintEnab_(context)
                  )
              )
            ],
          )

        ],
      )

    ],
),
    onTap: () => onTap?.call(circle)
  );

}
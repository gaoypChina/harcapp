import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import 'trop_icon.dart';

class TropTile extends StatelessWidget{

  final String name;
  final TropCategory category;
  final String? zuchTropName;
  final double iconSize;

  const TropTile({
    required this.name,
    required this.category,
    this.zuchTropName,
    this.iconSize = TropIcon.defSize,
    super.key
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [

      Row(
        children: [

          TropIcon(category, size: iconSize, zuchTropName: zuchTropName),

          const SizedBox(width: Dimen.SIDE_MARG),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: iconEnab_(context)
                  ),
                ),

                const SizedBox(height: Dimen.defMarg),

                Text(
                  tropCategoryToName(category),
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold,
                    color: hintEnab_(context),
                  ),
                ),

              ],
            ),
          ),

        ],
      )

    ],
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import 'trop_icon.dart';

class TropTile extends StatelessWidget{

  final Trop trop;

  const TropTile(this.trop, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [

      Row(
        children: [

          TropIcon(trop.category),

          const SizedBox(width: Dimen.SIDE_MARG),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  trop.name,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      color: iconEnab_(context)
                  ),
                ),

                Text(
                  tropCategoryToName(trop.category),
                  style: AppTextStyle(
                    color: hintEnab_(context),
                    fontWeight: weight.halfBold
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
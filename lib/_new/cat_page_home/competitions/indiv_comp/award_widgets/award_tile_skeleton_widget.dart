import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import '../../../../../_app_common/common_color_data.dart';
import '../common/indiv_comp_rank_icon.dart';

class AwardTileSkeletonWidget extends StatelessWidget{

  final int position;
  final CommonColorData? colors;
  final IndivCompAward award;
  final Widget text;
  final Widget? titleTrailing;

  const AwardTileSkeletonWidget(
      this.position,
      this.colors,
      this.award,
      this.text,
      { this.titleTrailing,
        super.key
      });

  @override
  Widget build(BuildContext context) => Column(
    children: [

      ListTile(
          leading: IndivCompRankIconTemplate(position, colors: colors),
          title: Row(
            children: [
              Expanded(
                child: Text(
                    'Miejsce ${award.place}',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        fontWeight: weight.bold
                    )
                ),
              ),

              if(titleTrailing != null) titleTrailing!
            ],
          )
      ),

      Row(
        children: [
          const SizedBox(width: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + IndivCompRankIcon.defSize),
          Expanded(child: text),
        ],
      ),

    ],
  );

}

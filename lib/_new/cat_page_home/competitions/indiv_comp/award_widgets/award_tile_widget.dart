
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import '../../../../../_app_common/common_color_data.dart';
import 'award_tile_skeleton_widget.dart';

class AwardTileWidget extends StatelessWidget{

  final int position;
  final CommonColorData? colors;
  final IndivCompAward award;

  const AwardTileWidget(
      this.position,
      this.colors,
      this.award,
      { super.key});

  @override
  Widget build(BuildContext context) => Material(
    borderRadius: BorderRadius.circular(AppCard.bigRadius),
    color: backgroundIcon_(context),
    child: Padding(
      padding: const EdgeInsets.only(
        top: Dimen.SIDE_MARG,
        bottom: Dimen.SIDE_MARG,
        right: Dimen.SIDE_MARG
      ),
      child: AwardTileSkeletonWidget(
          position,
          colors,
          award,
          Text(award.award!, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
      ),
    )
  );

}


import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'award_tile_skeleton_widget.dart';

class AwardTileWidget extends StatelessWidget{

  final int position;
  final IndivCompAward award;

  const AwardTileWidget(this.position, this.award);

  @override
  Widget build(BuildContext context) => AwardTileSkeletonWidget(
      position,
      award,
      Text(award.award, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
  );

}

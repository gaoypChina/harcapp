import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_awards_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class AwardTileDenseWidget extends StatelessWidget{

  static const double height = 72;

  final int position;
  final CommonColorData? colors;
  final IndivCompAward award;

  const AwardTileDenseWidget(
      this.position,
      this.colors,
      this.award,
      {Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    leading: IndivCompRankIconTemplate(position, colors: colors, size: 42.0),
    title: Text(
        'Miejsce ${award.place}',
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            fontWeight: weight.halfBold
        )
    ),
    subtitle: Text(award.award!, style: AppTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
  );

}
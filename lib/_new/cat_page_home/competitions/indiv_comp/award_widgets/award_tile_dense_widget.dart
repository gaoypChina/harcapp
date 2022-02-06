import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_awards_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class AwardTileDenseWidget extends StatelessWidget{

  static const double height = 72;

  final int position;
  final IndivCompAward award;

  const AwardTileDenseWidget(this.position, this.award);

  @override
  Widget build(BuildContext context) => ListTile(
    leading: rankToAwardWidget(position, size: 28.0),
    title: Text(
        'Miejsce ${award.place}',
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            fontWeight: weight.halfBold
        )
    ),
    subtitle: Text(award.award, style: AppTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
  );

}
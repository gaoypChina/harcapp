import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/rank_tile_widget_template.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RankProgressWidget extends StatelessWidget{

  final bool? completed;
  final bool? inProgress;
  final int completenessPercent;

  const RankProgressWidget(this.completed, this.inProgress, this.completenessPercent, {super.key});

  @override
  Widget build(BuildContext context) {

    if(completed!)
      return Icon(
        MdiIcons.trophyAward,
        color: Colors.amber,
        size: RankTileWidgetTemplate.defTileIconSize,
      );

    if(inProgress!)
      return Text(
        '$completenessPercent%',
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_APPBAR,
            fontWeight: weight.halfBold,
            color: textEnab_(context)
        ),
      );

    return Container();

  }

}
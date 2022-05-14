
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_group_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

class RankCatWidget extends StatelessWidget{

  final RankCat cat;
  final void Function(RankTask item, bool completed)? onReqComplChanged;

  const RankCatWidget(this.cat, {this.onReqComplChanged});

  static Widget separator(BuildContext context, int index) => SizedBox(height: 2*Dimen.ICON_MARG);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    if(cat.title != null) {
      children.add(
          Row(
            children: [
              SizedBox(width: Dimen.SIDE_MARG, height: Dimen.ICON_FOOTPRINT),
              if(cat.icon != null) Padding(
                padding: EdgeInsets.all(Dimen.ICON_MARG),
                child: Icon(cat.icon, color: hintEnab_(context)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Kategoria zadań', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context))),
                    Text(cat.title!, style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        color: hintEnab_(context),
                        fontWeight: weight.bold
                    )),
                    Text('', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
                  ],
                ),
              ),
            ],
          )
      );
      children.add(SizedBox(height: Dimen.SIDE_MARG));
    }
    for(int i=0; i<cat.groups!.length; i++){
      RankGroup group = cat.groups![i];
      children.add(RankGroupWidget(group, onReqComplChanged: onReqComplChanged));

      if(i != cat.groups!.length-1)
        children.add(RankGroupWidget.separator(context, i));
    }

    return Column(
      children: children,
    );
  }

}
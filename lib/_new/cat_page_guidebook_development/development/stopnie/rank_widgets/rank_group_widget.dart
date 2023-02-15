import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_task.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/rank_widgets/rank_task_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class RankGroupWidget extends StatelessWidget{

  final RankGroup group;
  final void Function(RankTask item, bool completed)? onReqComplChanged;

  const RankGroupWidget(this.group, {this.onReqComplChanged, super.key});

  static Widget separator(BuildContext context, int index) => const SizedBox(height: 2*Dimen.ICON_MARG);

  @override
  Widget build(BuildContext context) {

    int checkableItemsCount = 1;
    List<Widget> children = [];
    for(int i=0; i<group.tasks!.length; i++){

      RankTask item = group.tasks![i];
      children.add(RankTaskWidget(
          item,
          group.tasks![i].checkable?checkableItemsCount:null,
          hideIndex: group.tasks!.length==1,
          onCompletedChanged: onReqComplChanged
      ));

      if(i != group.tasks!.length-1)
        children.add(RankTaskWidget.separator(context, i));

      if(group.tasks![i].checkable) checkableItemsCount++;

    }

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        if(group.cat?.icon != null)
          const SizedBox(height: Dimen.ICON_MARG),

        const SizedBox(height: Dimen.SIDE_MARG),

        if(group.title != null)
          Padding(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: Row(
                children: [

                  const SizedBox(width: Dimen.SIDE_MARG),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(
                            group.title!,
                            style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_APPBAR,
                              fontWeight: weight.bold,
                              color: hintEnab_(context),
                              decorationThickness: 4.0,
                            ),
                          ),

                          if(group.title != null && group.cat?.title != null)
                            Text(
                              'Kat.: ${group.cat?.title}',
                              style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_NORMAL,
                                fontWeight: weight.halfBold,
                                color: hintEnab_(context),
                              ),
                            ),
                        ],
                      )
                  ),

                  if(group.icon!=null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
                      child: GradientIcon(
                          group.icon,
                          size: 42.0,
                          colorStart: RankData.colors[group.cat!.rank!.data]!.start(false),
                          colorEnd: RankData.colors[group.cat!.rank!.data]!.end(false)
                      ),
                    ),

                ],
              )
          ),

        if(group.title != null)
          const SizedBox(height: 16.0),

        Column(
          children: children,
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

      ],
    );

    return Stack(
      children: [

        Padding(
          padding: EdgeInsets.only(
              top:
              group.cat?.icon == null?
              0:Dimen.ICON_MARG + Dimen.ICON_FOOTPRINT/2
          ),
          child: Material(
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            color: cardEnab_(context),
            child: child,
          ),
        ),

        if(group.cat?.icon != null)
          Center(
            child: SimpleButton(
                padding: EdgeInsets.zero,
                onTap:
                group.cat?.title == null?
                null:
                    () => showAppToast(context, text: 'Kategoria: ${group.cat?.title}'),
                radius: 100,
                color: cardEnab_(context),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: background_(context),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      child: Icon(group.cat?.icon),
                    ),
                  ),
                )
            ),
          ),

      ],
    );

  }

}
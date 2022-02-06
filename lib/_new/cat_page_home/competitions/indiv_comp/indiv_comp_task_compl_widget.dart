import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/loading_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'common/indiv_comp_task_skeleton_widget.dart';
import 'indiv_comp_task_page/review_page/indiv_comp_task_compl_details_widget.dart';
import 'models/indiv_comp.dart';
import 'models/indiv_comp_profile.dart';
import 'models/indiv_comp_task.dart';
import 'models/indiv_comp_task_compl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IndivCompTaskComplWidget extends StatelessWidget{

  final IndivComp comp;
  final IndivCompTaskCompl taskCompl;
  final bool preview;
  final void Function(String removedId) onRemoved;
  final void Function() onTap;
  final dynamic heroTag;

  const IndivCompTaskComplWidget(this.comp, this.taskCompl, {this.preview = false, this.onRemoved, this.onTap, this.heroTag});

  @override
  Widget build(BuildContext context){

    IndivCompTask task = comp.taskMap[taskCompl.taskKey];

    Widget child = IndivCompTaskSkeletonWidget(
      title: Text(task.title, style: IndivCompTaskSkeletonWidget.titleTextStyle(context).copyWith(color: preview?hintEnab_(context):textEnab_(context))),
      description: preview?null:Text(task.description, style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context)),
      trailing: IndivTaskWidgetPointsWidget(task.points, textColor: preview?hintEnab_(context):textEnab_(context)),
      onTap: onTap,
      bottom: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: EdgeInsets.only(right: Dimen.ICON_MARG, bottom: Dimen.ICON_MARG),
            child: Row(
              children: [

                SizedBox(width: Dimen.SIDE_MARG),
                Expanded(
                  child: Text(
                    dateToString(taskCompl.reqTime, withTime: true, shortMonth: true),
                    style: AppTextStyle(color: backgroundIcon_(context), fontWeight: weight.halfBold),
                  ),
                ),


                Text('${taskAcceptStateToName(taskCompl.acceptState)} ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, fontWeight: weight.halfBold, color: taskAcceptStateColor(taskCompl.acceptState))),
                Icon(
                  taskCompl.acceptState == TaskAcceptState.ACCEPTED?MdiIcons.check:MdiIcons.close,//taskAcceptStateIcon(taskCompl.acceptState),
                  color: taskAcceptStateColor(taskCompl.acceptState),
                  size: 16,
                ),
              ],
            ),
          ),

          if(taskCompl.acceptState == TaskAcceptState.PENDING)
            SimpleButton.from(
              textColor: Colors.red,
              icon: MdiIcons.trashCanOutline,
              margin: EdgeInsets.zero,
              text: 'Wycofaj',
              onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć.'),
              onLongPress: () async {

                showLoadingWidget(context, comp.colors.avgColor, 'Wycofywanie...');
                await ApiIndivComp.removeTaskComplReq(
                    taskComplKey: taskCompl.key,
                    onSuccess: onRemoved
                );
                Navigator.pop(context);
              }
            ),

        ],
      ),
    );

    if(heroTag == null)
      return child;

    return Hero(
      tag: heroTag,
      child: child,
    );
  }

}
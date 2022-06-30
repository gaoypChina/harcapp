import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'common/indiv_comp_task_skeleton_widget.dart';
import 'models/indiv_comp_task.dart';
import 'models/indiv_comp_task_compl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IndivCompTaskComplWidget extends StatelessWidget{

  final IndivCompTaskCompl complTask;
  final Map<String, IndivCompTask> taskMap;
  final CommonColorData? colors;
  final bool preview;
  final void Function(String removedId)? onRemoved;
  final void Function()? onTap;
  final dynamic heroTag;

  const IndivCompTaskComplWidget(
      this.complTask,
      this.taskMap,
      this.colors,
      { this.preview = false,
        this.onRemoved,
        this.onTap,
        this.heroTag,
        super.key
      });

  @override
  Widget build(BuildContext context){

    IndivCompTask task = taskMap[complTask.taskKey]!;

    Widget child = IndivCompTaskSkeletonWidget(
      title: Text(task.title, style: IndivCompTaskSkeletonWidget.titleTextStyle(context).copyWith(color: preview?hintEnab_(context):textEnab_(context))),
      description: preview?null:Text(task.description!, style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context)),
      trailing: PointsWidget(points: task.points),
      onTap: onTap,
      bottom: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: const EdgeInsets.only(right: Dimen.ICON_MARG, bottom: Dimen.ICON_MARG),
            child: Row(
              children: [

                const SizedBox(width: IndivCompTaskSkeletonWidget.padding),
                Expanded(
                  child: Text(
                    dateToString(complTask.reqTime!, withTime: true, shortMonth: true),
                    style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.halfBold),
                  ),
                ),

                Text('${taskAcceptStateToName(complTask.acceptState)} ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL, fontWeight: weight.halfBold, color: taskAcceptStateColor(complTask.acceptState))),
                Icon(
                  taskAcceptStateIcon(complTask.acceptState),
                  color: taskAcceptStateColor(complTask.acceptState),
                  size: 16,
                ),
              ],
            ),
          ),

          if(complTask.acceptState == TaskAcceptState.PENDING)
            SimpleButton.from(
              textColor: Colors.red,
              icon: MdiIcons.trashCanOutline,
              margin: EdgeInsets.zero,
              text: 'Wycofaj',
              onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć.'),
              onLongPress: () async {

                showLoadingWidget(context, colors!.avgColor, 'Wycofywanie...');
                await ApiIndivComp.removeTaskComplReq(
                  taskComplKey: complTask.key,
                  onSuccess: onRemoved,
                  onServerMaybeWakingUp: () {
                    showAppToast(context, text: serverWakingUpMessage);
                    return true;
                  },
                  onError: (){
                    showAppToast(context, text: simpleErrorMessage);
                  }
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
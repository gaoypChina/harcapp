import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_task_skeleton_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/loading_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import '../../comp_role.dart';
import '../../indiv_comp_task_compl_widget.dart';
import '../../models/indiv_comp_task_compl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../task_accept_state.dart';

class IndivCompTaskComplDetailsWidget extends StatefulWidget{

  final IndivComp comp;
  final IndivCompTaskCompl taskCompl;
  final EdgeInsets padding;
  final void Function() onAcceptStateChanged;

  const IndivCompTaskComplDetailsWidget(
      this.comp,
      this.taskCompl,
      { this.padding,
        this.onAcceptStateChanged,
        Key key
      }): super(key: key);

  @override
  State<StatefulWidget> createState() => IndivCompTaskComplDetailsWidgetState();

}

class IndivCompTaskComplDetailsWidgetState extends State<IndivCompTaskComplDetailsWidget>{

  IndivComp get comp => widget.comp;
  IndivCompParticip get particip => comp.participMap[taskCompl.participKey];
  IndivCompTaskCompl get taskCompl => widget.taskCompl;

  TextEditingController textController;
  bool sending;

  bool reviewMode;

  @override
  void initState() {
    reviewMode = taskCompl.acceptState == TaskAcceptState.PENDING && (comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR);
    textController = TextEditingController();
    sending = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IndivCompTask task = comp.taskMap[taskCompl.taskKey];

    IndivCompTaskComplWidget(
      comp,
      taskCompl,
    );

    return Padding(
      padding: widget.padding??EdgeInsets.zero,
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(top: particip != null?(AccountThumbnailWidget.defSize*(1 + AccountThumbnailWidget.textSizeRatio - .12))/2:0),
            child: IndivCompTaskSkeletonWidget(
              trailing: PointsWidget(points: task.points),
              title: Text(task.title, style: IndivCompTaskSkeletonWidget.titleTextStyle(context)),
              description: Text(task.description, style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context)),
            ),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),


          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountThumbnailWidget(
                particip.name,
                elevated: false,
                markIcon: MdiIcons.messageArrowRight,
              ),

              const SizedBox(width: Dimen.ICON_MARG),

              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      const SizedBox(height: AccountThumbnailWidget.defSize - 2*Dimen.TEXT_SIZE_BIG),

                      Text(
                          particip.name,
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_BIG,
                              fontWeight: weight.halfBold,
                              color: textEnab_(context)
                          )
                      ),
                      Text(
                        dateToString(taskCompl.reqTime, withTime: true),
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.halfBold,
                            color: hintEnab_(context)
                        ),
                      ),

                      const SizedBox(height: Dimen.TEXT_SIZE_BIG),

                      Text(
                          taskCompl.reqComment == null || taskCompl.reqComment.isEmpty?
                          '[brak wiadomości]':
                          taskCompl.reqComment, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),

                    ],
                  )
              )

            ],
          ),

          if(reviewMode || taskCompl.revTime != null)
            const SizedBox(height: Dimen.SIDE_MARG),

          if(reviewMode || taskCompl.revTime != null)
            Row(
              children: [
                Icon(MdiIcons.messageArrowLeftOutline, color: textEnab_(context)),
                const SizedBox(width: Dimen.ICON_MARG),
                Text('Wiadomość zwrotna', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
              ],
            ),

          if(reviewMode)
            Padding(
                padding: const EdgeInsets.only(left: Dimen.ICON_SIZE + Dimen.ICON_MARG),
                child: AppTextFieldHint(
                  hintTop: '',
                  hint: 'Wiadomość zwrotna:',
                  controller: textController,
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  style: AppTextStyle(),
                )
            )
          else if(taskCompl.revTime != null)
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimen.ICON_MARG,
                  left: Dimen.ICON_SIZE + Dimen.ICON_MARG,
                  bottom: 2*Dimen.ICON_MARG
              ),
              child: Text(taskCompl.revComment == null || taskCompl.revComment.isEmpty?'-':taskCompl.revComment, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
            ),

          if(reviewMode)
            _TickingDate()
          else if(taskCompl.revTime != null)
            Text(
                dateToString(taskCompl.revTime, withTime: true),
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, fontWeight: weight.halfBold, color: hintEnab_(context)),
                textAlign: TextAlign.end
            ),

          const SizedBox(height: Dimen.SIDE_MARG)

        ],
      ),
    );

  }

}

class _TickingDate extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _TickingDateState();

}

class _TickingDateState extends State<_TickingDate>{

  void tick() async {
    while(true){
      await Future.delayed(const Duration(seconds: 1));
      if(!mounted) return;
      setState(() {});
    }
  }

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Text(
      dateToString(DateTime.now(), withTime: true),
      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, fontWeight: weight.halfBold, color: hintEnab_(context)),
      textAlign: TextAlign.end
  );

}
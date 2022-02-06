import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_task_skeleton_widget.dart';
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
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
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
  final IndivCompParticip particip;
  final EdgeInsets padding;
  final void Function() onAcceptStateChanged;

  const IndivCompTaskComplDetailsWidget(this.comp, this.taskCompl, {this.particip, this.padding, this.onAcceptStateChanged});

  @override
  State<StatefulWidget> createState() => IndivCompTaskComplDetailsWidgetState();

}

class IndivCompTaskComplDetailsWidgetState extends State<IndivCompTaskComplDetailsWidget>{

  IndivComp get comp => widget.comp;
  IndivCompParticip get particip => widget.particip;
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

    return Column(
      children: [

        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: widget.padding,
            children: [

              Padding(
                padding: EdgeInsets.only(top: particip != null?(AccountThumbnailWidget.defSize*(1 + AccountThumbnailWidget.textSizeRatio - .12))/2:0),
                child: IndivCompTaskSkeletonWidget(
                  trailing: IndivTaskWidgetPointsWidget(task.points),
                  title: Text(task.title, style: IndivCompTaskSkeletonWidget.titleTextStyle(context)),
                  description: Text(task.description, style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context)),
                ),
              ),

              SizedBox(height: Dimen.SIDE_MARG),

              if(particip != null)
                Row(
                  children: [
                    AccountThumbnailWidget(particip.name, elevated: false),
                    SizedBox(width: Dimen.ICON_MARG),
                    Text(particip.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold))
                  ],
                ),

              SizedBox(height: Dimen.SIDE_MARG),

              GradientWidget(
                radius: AppCard.BIG_RADIUS,
                colorStart: cardEnab_(context),
                colorEnd: background_(context),
                child: Padding(
                  padding: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Row(
                        children: [
                          Icon(MdiIcons.messageArrowRightOutline, color: textEnab_(context)),
                          SizedBox(width: Dimen.ICON_MARG),
                          Text('Wiadomość uczestnika', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.only(
                          top: Dimen.ICON_MARG,
                          left: Dimen.ICON_SIZE + Dimen.ICON_MARG,
                          bottom: 2*Dimen.ICON_MARG
                        ),
                        child: Text(taskCompl.reqComment == null || taskCompl.reqComment.isEmpty?'-':taskCompl.reqComment, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
                      ),

                      Text(
                        dateToString(taskCompl.reqTime, withTime: true),
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, fontWeight: weight.halfBold, color: hintEnab_(context)),
                        textAlign: TextAlign.end
                      ),

                      if(reviewMode || taskCompl.revTime != null) SizedBox(height: Dimen.SIDE_MARG),

                      if(reviewMode || taskCompl.revTime != null)
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: backgroundIcon_(context),
                        ),

                      if(reviewMode || taskCompl.revTime != null)
                        SizedBox(height: Dimen.SIDE_MARG),

                      if(reviewMode || taskCompl.revTime != null)
                        Row(
                          children: [
                            Icon(MdiIcons.messageArrowLeftOutline, color: textEnab_(context)),
                            SizedBox(width: Dimen.ICON_MARG),
                            Text('Wiadomość zwrotna', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
                          ],
                        ),

                      if(reviewMode)
                        Padding(
                          padding: EdgeInsets.only(left: Dimen.ICON_SIZE + Dimen.ICON_MARG),
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
                          padding: EdgeInsets.only(
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
                        )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
            left: Dimen.DEF_MARG,
            right: Dimen.DEF_MARG,
            bottom: Dimen.DEF_MARG
          ),
          child: Material(
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            elevation: AppCard.bigElevation,
            child: Builder(builder: (context){
              if(reviewMode)
                return Row(
                  children: [
                    Expanded(
                      child: SimpleButton.from(
                          textColor: taskAcceptStateColor(TaskAcceptState.REJECTED),
                          icon: taskAcceptStateIcon(TaskAcceptState.REJECTED),
                          text: 'Odrzuć',
                          onTap: () async {

                            if(!await isNetworkAvailable()){
                              showAppToast(context, text: 'Brak połączenia.');
                              return;
                            }

                            await showAlertDialog(
                                context,
                                title: 'Na pewno?',
                                content: 'Odrzucić wniosek?',
                                actionBuilder: (_) => [
                                  AlertDialogButton(text: 'Tak', onTap: () async {
                                    Navigator.pop(context);

                                    setState(() => sending = true);
                                    showLoadingWidget(context, comp.colors.avgColor, 'Ostatnia prosta');

                                    await ApiIndivComp.reviewCompletedTasks(
                                        taskReqKey: taskCompl.key,
                                        acceptState: TaskAcceptState.REJECTED,
                                        revComment: textController.text,
                                        onSuccess: (String complTaskKey){
                                          comp.removeComplTask(context, particip.key, complTaskKey);
                                          showAppToast(context, text: 'Odrzucono');
                                          widget.onAcceptStateChanged?.call();
                                        },
                                        onError: (){
                                          showAppToast(context, text: 'Wystąpił problem');
                                        }
                                    );

                                    Navigator.pop(context);
                                    setState(() => sending = false);

                                  }),
                                  AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),
                                ]
                            );



                          }
                      ),
                    ),

                    Expanded(
                      child: SimpleButton.from(
                          textColor: taskAcceptStateColor(TaskAcceptState.ACCEPTED),
                          icon: taskAcceptStateIcon(TaskAcceptState.ACCEPTED),
                          text: 'Zaakceptuj',
                          onTap: () async {
                            if(!await isNetworkAvailable()){
                              showAppToast(context, text: 'Brak połączenia.');
                              return;
                            }

                            await showAlertDialog(
                                context,
                                title: 'Na pewno?',
                                content: 'Zaakceptować wniosek?',
                                actionBuilder: (_) => [
                                  AlertDialogButton(text: 'Tak', onTap: () async {
                                    Navigator.pop(context);

                                    setState(() => sending = true);
                                    showLoadingWidget(context, comp.colors.avgColor, 'Ostatnia prosta');

                                    await ApiIndivComp.reviewCompletedTasks(
                                        taskReqKey: taskCompl.key,
                                        acceptState: TaskAcceptState.ACCEPTED,
                                        revComment: textController.text,
                                        onSuccess: (String complTaskKey){
                                          comp.removeComplTask(context, particip.key, complTaskKey);
                                          showAppToast(context, text: 'Zaakceptowano');
                                          widget.onAcceptStateChanged?.call();
                                        },
                                        onError: (){
                                          showAppToast(context, text: 'Wystąpił problem');
                                        }
                                    );

                                    Navigator.pop(context);
                                    setState(() => sending = false);

                                  }),
                                  AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),
                                ]
                            );

                          }
                      ),
                    )

                  ],
                );
              else
                return SizedBox(
                  height: Dimen.ICON_FOOTPRINT + 2*SimpleButton.DEF_MARG,
                  child: Center(
                      child: Text(
                        taskAcceptStateToName(taskCompl.acceptState),
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_APPBAR,
                            color: taskAcceptStateColor(taskCompl.acceptState),
                            fontWeight: weight.halfBold
                        ),
                      )
                  ),
                );
            }),
          ),
        )

      ],
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
      await Future.delayed(Duration(seconds: 1));
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
  Widget build(BuildContext context) {

    return Text(
        dateToString(DateTime.now(), withTime: true),
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, fontWeight: weight.halfBold, color: hintEnab_(context)),
        textAlign: TextAlign.end
    );

  }

}
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_task_skeleton_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
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
  final IndivCompTaskCompl complTask;
  final Map<String, IndivCompTask> taskMap;
  final Map<String, IndivCompParticip> participMap;
  final CommonColorData colors;

  final EdgeInsets? padding;
  final void Function()? onAcceptStateChanged;

  const IndivCompTaskComplDetailsWidget(
      this.comp,
      this.complTask,
      this.taskMap,
      this.participMap,
      this.colors,
      { this.padding,
        this.onAcceptStateChanged,
        super.key
      });

  @override
  State<StatefulWidget> createState() => IndivCompTaskComplDetailsWidgetState();

}

class IndivCompTaskComplDetailsWidgetState extends State<IndivCompTaskComplDetailsWidget>{

  IndivComp get comp => widget.comp;
  IndivCompTaskCompl get complTask => widget.complTask;
  Map<String, IndivCompTask> get taskMap => widget.taskMap;
  CommonColorData get colors => widget.colors;

  IndivCompParticip? get particip => widget.participMap[complTask.participKey];

  TextEditingController? textController;
  bool? sending;

  late bool reviewMode;

  @override
  void initState() {
    reviewMode = complTask.acceptState == TaskAcceptState.PENDING;// && (comp.profile.role == CompRole.ADMIN || comp.profile.role == CompRole.MODERATOR);
    textController = TextEditingController();
    sending = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IndivCompTask task = taskMap[complTask.taskKey]!;

    IndivCompTaskComplWidget(
      complTask,
      taskMap,
      colors
    );

    return Padding(
      padding: widget.padding??EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: EdgeInsets.only(top: particip != null?(AccountThumbnailWidget.defSize*(1 + AccountThumbnailWidget.textSizeRatio - .12))/2:0),
            child: IndivCompTaskSkeletonWidget(
              trailing: PointsWidget(points: task.points),
              title: Text(task.title, style: IndivCompTaskSkeletonWidget.titleTextStyle(context)),
              description: Text(task.description!, style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context)),
            ),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountThumbnailWidget(
                name: particip!.name,
                elevated: false,
                markIcon: MdiIcons.messageArrowRight,
              ),

              const SizedBox(width: Dimen.ICON_MARG),

              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      const SizedBox(height: AccountThumbnailWidget.defSize - 2*Dimen.TEXT_SIZE_BIG),

                      _NameWidget(particip!.name),
                      _DateWidget(complTask.reqTime),

                      _MessageWidget(complTask.reqComment),

                    ],
                  )
              )

            ],
          ),

          // Response

          const SizedBox(height: 2*Dimen.SIDE_MARG),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountThumbnailWidget(
                icon: compRoleToIcon[CompRole.ADMIN],
                elevated: false,
                markIcon: MdiIcons.messageArrowLeft,
              ),

              const SizedBox(width: Dimen.ICON_MARG),

              Expanded(
                  child:
                  reviewMode || complTask.revTime != null?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      const SizedBox(height: AccountThumbnailWidget.defSize - 2*Dimen.TEXT_SIZE_BIG),

                      const _NameWidget('Rozpatrujący'),
                      if(reviewMode)_TickingDate()
                      else if(complTask.revTime != null) _DateWidget(complTask.revTime),

                      if(reviewMode)
                        AppTextFieldHint(
                          hintTop: '',
                          hint: 'Wiadomość zwrotna:',
                          controller: textController,
                          maxLines: null,
                          maxLength: IndivCompTaskCompl.MAX_LEN_REV_COMMENT,
                          hintStyle: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG),
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                        )
                      else
                        _MessageWidget(complTask.revComment),

                    ],
                  ):const Padding(
                    padding: EdgeInsets.only(top: AccountThumbnailWidget.defSize - 2*Dimen.TEXT_SIZE_BIG),
                    child: _NameWidget('Zatwierdzono automatycznie'),
                  )

              )

            ],
          ),

          const SizedBox(height: 2*Dimen.SIDE_MARG),

          if(reviewMode)
            ReviewButtons(
              comp,
              particip,
              complTask,
              textController,
              onAcceptStateChanged: (String complTaskKey, TaskAcceptState acceptState){

                comp.removeComplTask(context, particip!.key, complTaskKey);
                if(acceptState==TaskAcceptState.ACCEPTED)
                  showAppToast(context, text: 'Zaakceptowano');
                else if(acceptState==TaskAcceptState.REJECTED)
                  showAppToast(context, text: 'Odrzucono');

                widget.onAcceptStateChanged?.call();
              },
            )
          else
            GradientWidget(
              radius: AppCard.BIG_RADIUS,
              colorStart: taskAcceptStateColorStart(complTask.acceptState)!,
              colorEnd: taskAcceptStateColor(complTask.acceptState)!,
              child: SizedBox(
                height: Dimen.ICON_FOOTPRINT,
                child: Center(
                  child: Text(
                    taskAcceptStateToName(complTask.acceptState)!,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        color: background_(context),
                        fontWeight: weight.bold
                    ),
                  ),
                )
              )
            ),
        ],
      ),
    );

  }

}

class ReviewButtons extends StatefulWidget{

  final IndivComp comp;
  final IndivCompParticip? particip;
  final IndivCompTaskCompl taskCompl;
  final TextEditingController? textController;
  final void Function(String, TaskAcceptState)? onAcceptStateChanged;

  const ReviewButtons(
      this.comp,
      this.particip,
      this.taskCompl,
      this.textController,
      { this.onAcceptStateChanged,
        Key? key
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ReviewButtonsState();

}

class ReviewButtonsState extends State<ReviewButtons>{

  IndivComp get comp => widget.comp;
  IndivCompParticip? get particip => widget.particip;
  IndivCompTaskCompl get taskCompl => widget.taskCompl;
  TextEditingController? get textController => widget.textController;
  void Function(String, TaskAcceptState)? get onAcceptStateChanged => widget.onAcceptStateChanged;

  bool? sending;

  @override
  void initState() {
    sending = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SimpleButton.from(
              textColor: background_(context),
              icon: taskAcceptStateIcon(TaskAcceptState.REJECTED),
              color: taskAcceptStateColorStart(TaskAcceptState.REJECTED),
              colorEnd: taskAcceptStateColor(TaskAcceptState.REJECTED),
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
                            revComment: textController!.text,
                            onSuccess: (String complTaskKey){
                              onAcceptStateChanged?.call(complTaskKey, TaskAcceptState.REJECTED);
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
              textColor: background_(context),
              icon: taskAcceptStateIcon(TaskAcceptState.ACCEPTED),
              color: taskAcceptStateColorStart(TaskAcceptState.ACCEPTED),
              colorEnd: taskAcceptStateColor(TaskAcceptState.ACCEPTED),
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
                            revComment: textController!.text,
                            onSuccess: (String complTaskKey){
                              onAcceptStateChanged?.call(complTaskKey, TaskAcceptState.ACCEPTED);
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
  }

}

class _NameWidget extends StatelessWidget{

  final String name;

  const _NameWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
        name,
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            fontWeight: weight.halfBold,
            color: textEnab_(context)
        )
    );
  }

}

class _MessageWidget extends StatelessWidget{

  final String? message;
  const _MessageWidget(this.message);

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.only(
        top: const TextField().scrollPadding.top,
      ),
      child: Text(
          message == null || message!.isEmpty?
          '[brak wiadomości]':
          message!, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
      )
  );

}

class _DateWidget extends StatelessWidget{
  
  final DateTime? time;
  const _DateWidget(this.time);
  
  @override
  Widget build(BuildContext context) {
    return Text(
      dateToString(time!, withTime: true),
      style: AppTextStyle(
          fontSize: Dimen.TEXT_SIZE_BIG,
          fontWeight: weight.halfBold,
          color: hintEnab_(context)
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
  Widget build(BuildContext context) => _DateWidget(DateTime.now());

}
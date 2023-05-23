import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'model/trop_role.dart';


class TropTaskContentWidget extends StatelessWidget{

  final TropTask task;
  final int index;
  final int? maxLines;

  const TropTaskContentWidget(this.task, {required this.index, this.maxLines, super.key});

  @override
  Widget build(BuildContext context) => BorderMaterial(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Zadanie ${index+1}',
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: hintEnab_(context)
            ),
          ),

          const SizedBox(height: Dimen.ICON_MARG),

          Text(
            task.content,
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
            maxLines: maxLines,
          )
        ],
      ),
    ),
  );

}

class TropTaskWidget extends StatefulWidget{

  final Trop trop;
  final TropTask task;
  final int index;

  const TropTaskWidget(this.trop, this.task, {required this.index, super.key});

  @override
  State<StatefulWidget> createState() => TropTaskWidgetState();

}

class TropTaskWidgetState extends State<TropTaskWidget>{

  Trop get trop => widget.trop;
  TropTask get task => widget.task;
  int get index => widget.index;

  bool get tropTaskEditable{
    if(taskCompletedChanging) return false;
    if(!trop.isShared) return true;
    if(trop.myRole == TropRole.OWNER) return true;
    return task.assignee?.key == AccountData.key;
  }

  late bool taskCompletedChanging;

  @override
  void initState() {
    taskCompletedChanging = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<TropTaskProvider>(
    builder: (context, prov, child) => Column(
      children: [
        Row(
          children: [

            Expanded(child: Container()),

            SimpleButton(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppCard.bigRadius),
                topRight: Radius.circular(AppCard.bigRadius),
              ),
              color: cardEnab_(context),
              onTap: tropTaskEditable?() async {
                if(trop.isShared){
                  setState(() => taskCompletedChanging = true);
                  await ApiTrop.updateTaskCompleted(
                    trop: trop,
                    tropTaskLclId: task.lclId,
                    completed: !task.completed,
                    onSuccess: (completed, _){
                      setState(() => task.completed = completed);
                      trop.saveShared();
                    },
                    onForceLoggedOut: (){
                      if(!mounted) return true;
                      showAppToast(context, text: forceLoggedOutMessage);
                      setState(() {});
                      return true;
                    },
                    onServerMaybeWakingUp: (){
                      if(!mounted) return true;
                      showServerWakingUpToast(context);
                      return true;
                    },
                    onError: (_){
                      if(!mounted) return;
                      showAppToast(context, text: simpleErrorMessage);
                    },
                  );
                  setState(() => taskCompletedChanging = false);
                } else {
                  setState(() => task.completed = !task.completed);
                  prov.notify();
                  TropProvider.notify_(context);
                  TropListProvider.notify_(context);
                  trop.saveOwn();
                }
              }:null,
              child: Padding(
                padding: const EdgeInsets.only(top: Dimen.defMarg/2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    const SizedBox(width: Dimen.ICON_MARG + Dimen.defMarg),

                    Text(
                      'Zaliczone',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          fontWeight: weight.halfBold,
                          color: !tropTaskEditable?
                          iconDisab_(context):
                          task.completed?
                          AppColors.zhpTropColor:
                          iconEnab_(context)
                      ),
                    ),

                    SizedBox(
                      height: Dimen.ICON_SIZE + 2*Dimen.defMarg,
                      child: IgnorePointer(
                        child: Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                          checkColor: cardEnab_(context),
                          activeColor: tropTaskEditable?
                          AppColors.zhpTropColor:
                          iconEnab_(context),
                          onChanged: (value){},
                          value: task.completed,
                        ),
                      )
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(width: AppCard.bigRadius)

          ],
        ),
        Material(
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          color: cardEnab_(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TropTaskContentWidget(task, index: index),

              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutQuart,
                alignment: Alignment.topCenter,
                child: task.completed?
                BorderMaterial(
                    child: SimpleButton(
                      onTap: tropTaskEditable?() async {
                        String? summary = await summarizeTask(context, task: task, index: index);
                        if (summary == null) return;
                        if (trop.isShared) {
                          setState(() => taskCompletedChanging = true);
                          await ApiTrop.updateTaskSummary(
                            trop: trop,
                            tropTaskLclId: task.lclId,
                            summary: summary,
                            onSuccess: (summary, _){
                              setState(() => task.summary = summary);
                              trop.saveShared();
                            },
                            onForceLoggedOut: (){
                              if(!mounted) return true;
                              showAppToast(context, text: forceLoggedOutMessage);
                              setState(() {});
                              return true;
                            },
                            onServerMaybeWakingUp: (){
                              if(!mounted) return true;
                              showServerWakingUpToast(context);
                              return true;
                            },
                            onError: (_){
                              if(!mounted) return;
                              showAppToast(context, text: simpleErrorMessage);
                            },
                          );
                          setState(() => taskCompletedChanging = false);
                        } else {
                          setState(() => task.summary = summary);
                          trop.saveOwn();
                          prov.notify();
                        }
                      }: null,
                      child: Padding(
                        padding: const EdgeInsets.all(Dimen.ICON_MARG),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Podsumowanie',
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  fontWeight: weight.halfBold,
                                  color: hintEnab_(context)
                              ),
                            ),

                            const SizedBox(height: Dimen.ICON_MARG),

                            Text(
                              task.summary??'Brak podusmowania',
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  color: task.summary==null?hintEnab_(context):textEnab_(context),
                                  fontStyle: task.summary==null?FontStyle.italic:FontStyle.normal
                              ),
                            )
                          ],
                        ),
                      )
                    )
                ):
                Container(),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  bottom: Dimen.defMarg,
                  left: Dimen.ICON_MARG,
                ),
                child: Row(
                  children: [

                    if(task.assignee != null)
                      SimpleButton.from(
                        context: context,
                        text: task.assignee!.name,
                        icon: MdiIcons.accountCircleOutline,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(Dimen.defMarg),
                        textSize: Dimen.TEXT_SIZE_BIG,
                        onTap: null
                      )
                    else if(task.assigneeCustomText != null && task.assigneeCustomText!.isNotEmpty)
                      SimpleButton.from(
                        context: context,
                        text: task.assigneeCustomText,
                        icon: MdiIcons.accountCircleOutline,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(Dimen.defMarg),
                        textSize: Dimen.TEXT_SIZE_BIG,
                        onTap: null
                      )
                    else
                      SimpleButton.from(
                        context: context,
                        text: 'Brak ogarniacza',
                        textColor: hintEnab_(context),
                        icon: MdiIcons.accountCircleOutline,
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(Dimen.defMarg),
                        textSize: Dimen.TEXT_SIZE_BIG,
                        onTap: null
                      ),

                    Expanded(child: Container()),

                    SimpleButton.from(
                        context: context,
                        text: 'Do ${dateToString(task.deadline, shortMonth: true, showYear: null)}',
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.all(Dimen.defMarg),
                        textSize: Dimen.TEXT_SIZE_BIG,
                        onTap: null,
                        iconLeading: false
                    ),

                  ],
                ),
              )

            ],
          ),
        )
      ],
    ),
  );

}

class SummaryDialog extends StatefulWidget{

  final TropTask task;
  final int index;
  final void Function(String)? onSummaryChanged;
  final void Function()? onSaved;

  const SummaryDialog(this.task, {required this.index, this.onSummaryChanged, this.onSaved, super.key});

  @override
  State<StatefulWidget> createState() => SummaryDialogState();

}

class SummaryDialogState extends State<SummaryDialog>{

  TropTask get task => widget.task;
  int get index => widget.index;
  void Function(String)? get onSummaryChanged => widget.onSummaryChanged;
  void Function()? get onSaved => widget.onSaved;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: task.summary);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              title: const Text('Podsumowanie'),
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(MdiIcons.check),
                  onPressed: () async {
                    onSaved?.call();
                    await popPage(context);
                  },
                )
              ],
            ),

            SliverList(delegate: SliverChildListDelegate([

              TropTaskContentWidget(task, index: index, maxLines: 5),

              const SizedBox(height: Dimen.SIDE_MARG),

              BorderMaterial(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.ICON_MARG,
                    left: Dimen.ICON_MARG,
                    right: Dimen.ICON_MARG,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Text(
                        'Podsumowanie',
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.halfBold,
                            color: hintEnab_(context)
                        ),
                      ),

                      AppTextFieldHint(
                        hint: 'Przebieg, wnioski, ocena i inne tego typu:',
                        hintTop: '',
                        maxLines: null,
                        autofocus: true,
                        controller: controller,
                        onChanged: (_, value) => onSummaryChanged?.call(value),
                      ),

                    ],
                  ),
                ),
              )

            ]))

          ],
        ),
      ),
    ),
  );

}

Future<String?> summarizeTask(
    BuildContext context,
    { required TropTask task,
      required int index,
    }) async {

  String? summary;
  bool saved = false;

  await openDialog(
    context: context,
    builder: (context) => SummaryDialog(
      task,
      index: index,
      onSummaryChanged: (value) => summary = value,
      onSaved: () => saved = true,
    )
  );

  return saved?summary:null;
}
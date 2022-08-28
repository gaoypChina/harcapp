import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/task_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

abstract class TaskWidget<T_TASK extends TaskData> extends StatefulWidget{

  T_TASK get task;
  Color get color;
  int? get dispIndex;
  String get text;
  String? get description;
  String? get example;

  String? get initNote;

  bool get inProgress;
  bool get completed;
  bool get isReadyToComplete;
  bool get hideIndex;

  bool get editable;

  void Function(T_TASK item, bool completed)? get onCompletedChanged;

  void _onCompletedChanged(bool completed) => onCompletedChanged?.call(task, completed);

  const TaskWidget({super.key});

  @override
  TaskWidgetState<T_TASK> createState() => TaskWidgetState<T_TASK>();

}

class TaskWidgetState<T_TASK extends TaskData> extends State<TaskWidget>{

  T_TASK get task => widget.task as T_TASK;
  int? get dispIndex => widget.dispIndex;
  String get text => widget.text;
  String? get description => widget.description;
  String? get example => widget.example;

  String? get initNote => widget.initNote;

  bool? get inProgress => widget.inProgress;
  bool? get completed => widget.completed;
  bool get isReadyToComplete => widget.isReadyToComplete;
  bool get hideIndex => widget.hideIndex;

  bool get editable => widget.editable;

  //bool isReqComplete(T_UID uid) => task.com;//widget.isCompleted(uid);
  //void setNote(T_UID uid, String note) => widget.setNote(uid, note);
  //void setReqComplete(BuildContext context, T_UID uid, bool completed) => widget.setCompleted(context, uid, completed);

  TextEditingController? textController;

  @override
  void initState() {
    textController = TextEditingController(text: initNote??'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            if(dispIndex != null)
              SizedBox(
                height: Dimen.ICON_SIZE,
                child: Row(
                  children: [
                    Text(
                        hideIndex?'Zadanie':'Zadanie $dispIndex.',
                        style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.halfBold,
                        )
                    ),

                    Expanded(child: Container()),

                    if (dispIndex != null && (inProgress! || completed!))
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              bool newValue = !task.completed;
                              setState(() => task.setCompleted(context, newValue));
                              widget._onCompletedChanged(newValue);
                            },
                            child: Text(
                              'Zaliczone',
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                                  fontWeight: weight.halfBold,
                                  color: widget.completed|| !task.completed?hintEnab_(context):widget.color
                              ),
                            ),
                          ),

                          IgnorePointer(
                            ignoring: completed! || !editable,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                              checkColor: background_(context),
                              activeColor: widget.completed|| !task.completed?hintEnab_(context):widget.color,
                              onChanged: (selected){
                                if(selected == null) return;
                                setState(() => task.setCompleted(context, selected));
                                widget._onCompletedChanged(selected);
                              },
                              value: task.completed,
                            ),
                          ),

                        ],
                      )
                  ],
                )
              ),

            if(dispIndex != null) const SizedBox(height: Dimen.defMarg),

            Text(
              text,
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
              ),
            ),

            if(example != null || description != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if(description != null)
                    SimpleButton.from(
                        context: context,
                        icon: MdiIcons.fileDocumentOutline,
                        text: 'Opis', onTap: () => openDialog(
                        context: context,
                        builder: (context) => Center(
                            child:  _Dialog('Opis', description)
                        )
                    )),

                  if(example != null && description != null)
                    Expanded(child: Container()),

                  if(example != null)
                    SimpleButton.from(
                        context: context,
                        icon: MdiIcons.lightbulbOutline,
                        text: 'Przykład', onTap: () => openDialog(
                        context: context,
                        builder: (context) => Center(
                            child: _Dialog('Przykładowe zadania', example)
                        )
                    )),
                ],
              ),

            AnimatedSize(
              curve: Curves.easeOutQuart,
              duration: const Duration(milliseconds: 500),
              child:
              inProgress! || completed!?
              Padding(
                padding: MediaQuery.of(context).viewInsets.add(const EdgeInsets.only(left: Dimen.ICON_MARG, top: 10, bottom: 10)),
                child: AppTextFieldHint(
                  enabled: !completed! && editable,
                  controller: textController,
                  hintTop: 'Notatki',
                  hint: completed!?'Brak notatek do wymagania.':'Notatki do wymagania',
                  hintStyle: AppTextStyle(
                      color: hintEnab_(context)
                  ),
                  style: AppTextStyle(
                      color: textEnab_(context),
                      fontStyle: FontStyle.italic
                  ),
                  maxLines: null,
                  onAnyChanged: (texts) => task.setNote(context, texts[0]),
                ),
              ):
              Container(),
            )

          ],
        )
    );
  }

}

class _Dialog extends StatelessWidget{

  final String title;
  final String? text;

  const _Dialog(this.title, this.text);

  @override
  Widget build(BuildContext context) {
    return AppCard(
        margin: AppCard.normMargin,
        padding: EdgeInsets.zero,
        radius: AppCard.bigRadius,
        child: IntrinsicHeight(
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                title: Text(title),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: SelectableText(
                    text!,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }

}
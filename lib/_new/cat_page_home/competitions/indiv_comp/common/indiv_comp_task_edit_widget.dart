import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'indiv_comp_task_skeleton_widget.dart';

class IndivCompTaskEditWidget extends StatefulWidget{

  final String initTitle;
  final String initDesc;
  final int initPoints;
  final TaskState state;
  final bool remove;

  final Color accentColor;

  final bool showRemove;
  final bool showFreeze;

  final void Function(String) onTitleChanged;
  final void Function(String) onDescChanged;
  final void Function(int) onPointsChanged;
  final void Function(TaskState) onFreezeTap;
  final void Function(bool) onRemoveTap;
  final void Function() onRestoreTap;


  const IndivCompTaskEditWidget({
    @required this.initTitle,
    @required this.initDesc,
    @required this.initPoints,

    @required this.state,
    @required this.remove,

    @required this.accentColor,

    this.showRemove = true,
    this.showFreeze = true,

    this.onTitleChanged,
    this.onDescChanged,
    this.onPointsChanged,
    this.onFreezeTap,
    this.onRemoveTap,
    this.onRestoreTap,

    Key key
  }): super(key: key);

  @override
  State<StatefulWidget> createState() => IndivCompTaskEditWidgetState();

}

class IndivCompTaskEditWidgetState extends State<IndivCompTaskEditWidget>{

  void Function(String) get onTitleChanged => widget.onTitleChanged;
  void Function(String) get onDescChanged => widget.onDescChanged;
  void Function(int) get onPointsChanged => widget.onPointsChanged;
  void Function(TaskState) get onFreezeTap => widget.onFreezeTap;
  void Function(bool) get onRemoveTap => widget.onRemoveTap;
  void Function() get onRestoreTap => widget.onRestoreTap;

  bool get showRemove => widget.showRemove;
  bool get showFreeze => widget.showFreeze;


  int points;

  TaskState get state => widget.state;
  bool get remove => widget.remove;

  TextEditingController titleController;
  TextEditingController descController;

  @override
  void initState() {
    points = widget.initPoints??1;

    titleController = TextEditingController(text: widget.initTitle);
    titleController.addListener(() => onTitleChanged(titleController.text));

    descController = TextEditingController(text: widget.initDesc);
    descController.addListener(() => onDescChanged(descController.text));


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: !remove && state == TaskState.OPEN?AppCard.bigElevation:0,
      borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
      child: IndivCompTaskSkeletonWidget(
        trailing: SimpleButton(
          radius: AppCard.BIG_RADIUS,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          onTap: () async {

            int currVal = points;
            await openDialog(
                context: context,
                builder: (context) => _PointsPickerDialog(
                  points,
                  widget.accentColor,
                  onChanged: (val) => currVal = val,
                )
            );

            onPointsChanged?.call(currVal);
            setState(() => points = currVal);
          },
          child: PointsWidget(points: points),//, textColor: !remove && state == TaskState.OPEN?textEnab_(context):textDisab_(context)),
        ),

        title: AppTextFieldHint(
          style: IndivCompTaskSkeletonWidget.titleTextStyle(context, enabled: !remove && state == TaskState.OPEN, crossOut: remove),
          hint: 'Nazwa zadania',
          hintStyle: IndivCompTaskSkeletonWidget.titleTextStyle(context, enabled: !remove && state == TaskState.OPEN, crossOut: remove).copyWith(color: hintEnab_(context)),
          enabled: state == TaskState.OPEN,
          controller: titleController,
          inputFormatters: [
            LengthLimitingTextInputFormatter(IndivCompTask.MAX_LEN_TITLE),
          ],
        ),

        description: AppTextFieldHint(
          style: IndivCompTaskSkeletonWidget.descriptionTextStyle(context, enabled: !remove && state == TaskState.OPEN, crossOut: remove),
          hint: 'Opis zadania',
          hintStyle: IndivCompTaskSkeletonWidget.descriptionTextStyle(context, enabled: !remove && state == TaskState.OPEN, crossOut: remove).copyWith(color: hintEnab_(context)),
          enabled: state == TaskState.OPEN,
          controller: descController,
          maxLines: null,
          inputFormatters: [
            LengthLimitingTextInputFormatter(IndivCompTask.MAX_LEN_DESC),
          ],
        ),

        front: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: state == TaskState.CLOSED_RETAINING?1:0,
            child: Icon(
              MdiIcons.snowflake,
              color: backgroundIcon_(context),
              size: 114,
            ),
          ),
        ),

        bottom: AnimatedChildSlider(
            switchInCurve: Curves.easeOutQuad,
            switchOutCurve: Curves.easeOutQuad,
            index: !remove && state == TaskState.OPEN?0:1,
            direction: Axis.horizontal,
            withOpacity: true,
            children: [

              Row(
                  children: [
                    if(showFreeze)
                      Expanded(
                        child: IconButton(
                          icon: const Icon(MdiIcons.snowflake),
                          onPressed: (){

                            showAlertDialog(
                                context,
                                title: 'Informacja',
                                content: 'Czy chcesz zamrozić zadanie?\n\nZadania nie będzie można już dłużej realizować. Dotychczas zdobyte punkty pozostaną bez zmian.\n\nTę operację można cofnąć.',
                                actionBuilder: (context) => [

                                  AlertDialogButton(
                                      text: 'Jednak nie',
                                      onTap: () => Navigator.pop(context)
                                  ),

                                  AlertDialogButton(
                                      text: 'Super!',
                                      onTap: (){
                                        onFreezeTap?.call(TaskState.CLOSED_RETAINING);
                                        Navigator.pop(context);
                                      }
                                  ),
                                ]
                            );

                          }
                        ),
                      ),

                    if(showRemove)
                      Expanded(
                        child: IconButton(
                          icon: const Icon(MdiIcons.trashCanOutline),
                          onPressed: (){

                            showAlertDialog(
                                context,
                                title: 'Informacja',
                                content: 'Czy chcesz usunąć zadanie?\n\nZadanie zostanie usunięte wraz ze zdobytymi punktami.\n\nTej operacji nie można cofnąć.',
                                actionBuilder: (context) => [

                                  AlertDialogButton(
                                      text: 'Jednak nie',
                                      onTap: () => Navigator.pop(context)
                                  ),

                                  AlertDialogButton(
                                      text: 'Usuń',
                                      onTap: (){
                                        onRemoveTap?.call(!remove);
                                        Navigator.pop(context);
                                      }
                                  ),
                                ]
                            );

                          }
                        ),
                      ),
                  ]
              ),

              IconButton(
                icon: const Icon(MdiIcons.arrowLeft),
                onPressed: onRestoreTap,
              ),

            ],
        )


      ),

      color: cardEnab_(context),
    );

  }

}

class _PointsPickerDialog extends StatefulWidget{

  final int initVal;
  final Color accentColor;
  final void Function(int) onChanged;

  const _PointsPickerDialog(this.initVal, this.accentColor, {this.onChanged});

  @override
  State<StatefulWidget> createState() => _PointsPickerDialogState();

}

class _PointsPickerDialogState extends State<_PointsPickerDialog>{

  int val;

  @override
  void initState() {
    val = widget.initVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width - 4*Dimen.SIDE_MARG;

    return Center(
      child: AppCard(
        radius: AppCard.BIG_RADIUS,
        margin: const EdgeInsets.all(2*Dimen.SIDE_MARG),
        padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, bottom: Dimen.SIDE_MARG),
        child: ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: NumberPicker(
            itemCount: 5,
            itemWidth: width/5,
            axis: Axis.horizontal,
            value: val,
            minValue: 0,
            maxValue: 30,
            selectedTextStyle: IndivCompTaskSkeletonWidget.pointsTextStyle(context).copyWith(color: widget.accentColor),
            textStyle: IndivCompTaskSkeletonWidget.pointsTextStyle(context).copyWith(fontSize: Dimen.TEXT_SIZE_APPBAR),
            onChanged: (val){
              setState(() => this.val = val);
              widget.onChanged?.call(val);
            },
          ),
        )
      ),
    );
  }

}
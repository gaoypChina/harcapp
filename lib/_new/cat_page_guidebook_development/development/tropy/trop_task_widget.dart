import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


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

  @override
  Widget build(BuildContext context) => Column(
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
            onTap: () {
              setState(() => task.completed = !task.completed);
              trop.save();
            },
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
                        color: task.completed?Colors.purple[900]:iconEnab_(context)
                    ),
                  ),

                  SizedBox(
                    height: Dimen.ICON_SIZE + 2*Dimen.defMarg,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                      checkColor: cardEnab_(context),
                      activeColor: Colors.purple[900],
                      onChanged: null,
                      value: task.completed,
                    ),
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
                    ),
                    onTap: () async {

                      String? summary = await summarizeTask(context, task: task, index: index);
                      if(summary == null) return;
                      task.summary = summary;
                      trop.save();

                    }
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

                  SimpleButton.from(
                      context: context,
                      text: 'Marian Zarski',
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
  );

}

class SummaryDialog extends StatelessWidget{

  final TropTask task;
  final int index;
  final void Function(String)? onSummaryChanged;

  const SummaryDialog(this.task, {required this.index, this.onSummaryChanged, super.key});

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
              title: Text('Podsumowanie zadania ${index+1}'),
              centerTitle: true,
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
                        hint: 'Przebieg, wnioski, ocena i inne:',
                        hintTop: '',
                        maxLines: null,
                        autofocus: true,
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

  openDialog(
    context: context,
    builder: (context) => SummaryDialog(
      task,
      index: index,
      onSummaryChanged: (value) => summary = value,
    )
  );

  return summary;
}
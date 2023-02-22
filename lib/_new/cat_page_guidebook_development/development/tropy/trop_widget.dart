import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/duration_date_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_task_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';


class TropWidget extends StatelessWidget{

  final Trop trop;

  const TropWidget(this.trop, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [

      TropTile(name: trop.name, category: trop.category),

      const SizedBox(height: Dimen.SIDE_MARG),

      DurationDateWidget(
        startDate: trop.startTime,
        endDate: trop.endTime,
        color: AppColors.zhpTropColor,
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      if(trop.aims.isNotEmpty)
        const TitleShortcutRowWidget(
          title: 'Cele',
          textAlign: TextAlign.left,
        ),

      if(trop.aims.isNotEmpty)
        ListView.separated(
          itemBuilder: (context, index) => TropAimWidget(trop.aims[index], index: index),
          separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
          itemCount: trop.aims.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),

      const SizedBox(height: Dimen.SIDE_MARG),

      const TitleShortcutRowWidget(
        title: 'Zadania',
        textAlign: TextAlign.left,
      ),

      ListView.separated(
        itemBuilder: (context, index) => TropTaskWidget(trop, trop.tasks[index], index: index),
        separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
        itemCount: trop.tasks.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),

      if(trop.hasNotesForLeaders)
        const SizedBox(height: Dimen.SIDE_MARG),

      if(trop.hasNotesForLeaders)
        const TitleShortcutRowWidget(
          title: 'Wskazówki dla drużynowego',
          textAlign: TextAlign.left,
        ),

      if(trop.hasNotesForLeaders)
        BorderMaterial(
          child: Padding(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: Text(
                trop.notesForLeaders!,
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG
                ),
              )
          ),
        ),

    ],
  );

}

class TropAimWidget extends StatelessWidget{

  final String aim;
  final int index;

  const TropAimWidget(this.aim, {required this.index, super.key});

  @override
  Widget build(BuildContext context) => BorderMaterial(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text(
            'Cel ${index+1}',
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: hintEnab_(context)
            ),
          ),

          const SizedBox(height: Dimen.ICON_MARG),

          Text(
            aim,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG
            ),
          )

        ],
      ),
    ),
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';


class TropTaskPredefContentWidget extends StatelessWidget{

  final TropTaskBaseData task;
  final int index;
  final int? maxLines;

  const TropTaskPredefContentWidget(this.task, {required this.index, this.maxLines, super.key});

  @override
  Widget build(BuildContext context) => BorderMaterial(
    borderColor: textEnab_(context),
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

class TropTaskPredefWidget extends StatefulWidget{

  final TropBaseData trop;
  final TropTaskBaseData task;
  final int index;

  const TropTaskPredefWidget(this.trop, this.task, {required this.index, super.key});

  @override
  State<StatefulWidget> createState() => TropTaskPredefWidgetState();

}

class TropTaskPredefWidgetState extends State<TropTaskPredefWidget>{

  TropBaseData get trop => widget.trop;
  TropTaskBaseData get task => widget.task;
  int get index => widget.index;

  @override
  Widget build(BuildContext context) => Consumer<TropTaskProvider>(
    builder: (context, prov, child) => TropTaskPredefContentWidget(task, index: index),
  );

}
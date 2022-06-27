import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';

import 'apel_ewan_category_selector.dart';
import 'apel_ewan_thumbnail_widget.dart';

class ApelEwanTile extends StatefulWidget{

  final ApelEwan apelEwan;
  final String? subgroup;
  final String initNote;
  final String initSubgroupSuff;

  final void Function(String)? onNoteChanged;
  final void Function(String?)? onSubgroupSuffChanged;

  final Widget? noteTrailing;

  final void Function(ApelEwan, String?)? onTap;

  const ApelEwanTile(
      this.apelEwan,
      { this.subgroup,
        this.initNote = '',
        required this.initSubgroupSuff,
        this.onNoteChanged,
        this.onSubgroupSuffChanged,
        this.noteTrailing,
        this.onTap,
        super.key
      });

  @override
  State<StatefulWidget> createState() => ApelEwanTileState();

}

class ApelEwanTileState extends State<ApelEwanTile>{

  ApelEwan get apelEwan => widget.apelEwan;
  String? get subgroup => widget.subgroup;
  String get initNote => widget.initNote;
  String get initSubgroupSuff => widget.initSubgroupSuff;

  void Function(String)? get onNoteChanged => widget.onNoteChanged;
  void Function(String?)? get onSubgroupSuffChanged => widget.onSubgroupSuffChanged;

  Widget? get noteTrailing => widget.noteTrailing;

  void Function(ApelEwan, String?)? get onTap => widget.onTap;

  late TextEditingController controller;
  late String selSubgroupSuff;

  @override
  void initState(){

    controller = TextEditingController(text: initNote);
    selSubgroupSuff = initSubgroupSuff;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SizedBox(
        width: (MediaQuery.of(context).size.shortestSide - 4*Dimen.ICON_MARG)/3,
        height: (MediaQuery.of(context).size.shortestSide - 4*Dimen.ICON_MARG)/3,
        child: ApelEwanThumbnailWidget(apelEwan, subgroup: subgroup??selSubgroupSuff, onTap: onTap),
      ),

      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
                    child: AppTextFieldHint(
                      hint: 'Notatka:',
                      hintTop: 'Notatka',
                      controller: controller,
                      onChanged: (_, text) => onNoteChanged?.call(text),
                    ),
                  ),
                ),

                if(noteTrailing != null) noteTrailing!
              ],
            ),



            if(apelEwan.subgroupTitle.keys.length > 1)
              Padding(
                padding: const EdgeInsets.only(left: Dimen.SIDE_MARG - ApelEwanCategorySelector.leadingPadding),
                child: ApelEwanCategorySelector(
                  allSubgroupSuffs: apelEwan.subgroupTitle.keys.toList(),
                  selSubgroupSuff: selSubgroupSuff,
                  onChanged: (value){
                    setState(() => selSubgroupSuff = value as String);
                    onSubgroupSuffChanged?.call(value);
                  }
                )
              )
            else
              const SizedBox(height: ApelEwanCategorySelector.height)

          ],
        ),
      )

    ],
  );

}
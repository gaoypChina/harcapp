import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../_app_common/common_color_data.dart';
import 'award_tile_skeleton_widget.dart';

class AwardTileEditWidget extends StatelessWidget{

  final int? position;
  final CommonColorData? colors;
  final IndivCompAward award;
  final void Function(String)? onChanged;
  final void Function()? onDuplicate;
  final void Function()? onRemove;

  const AwardTileEditWidget(
      this.position,
      this.colors,
      this.award,
      { this.onChanged,
        this.onDuplicate,
        this.onRemove,
        Key? key
      }): super(key: key);

  @override
  Widget build(BuildContext context) => AwardTileSkeletonWidget(
      position,
      colors,
      award,
      AppTextFieldHint(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
        hint: 'Nagroda:',
        hintTop: 'Nagroda',
        hintStyle: AppTextStyle(color: hintEnab_(context)),
        controller: TextEditingController(text: award.award),
        maxLength: null,
        inputFormatters: [
          LengthLimitingTextInputFormatter(IndivComp.MAX_LEN_AWARD)
        ],
        onChanged: (_, text) => onChanged?.call(text),
      ),
      titleTrailing: Row(
        children: [
          IconButton(
            icon: const Icon(MdiIcons.minus),
            onPressed: onRemove,
          ),

          IconButton(
            icon: const Icon(MdiIcons.plus),
            onPressed: onDuplicate,
          ),
        ],
      )
  );

}

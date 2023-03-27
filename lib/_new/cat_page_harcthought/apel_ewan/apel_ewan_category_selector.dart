import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'data.dart';

class ApelEwanCategorySelector extends StatelessWidget{

  static const double height = Dimen.ICON_FOOTPRINT;
  static const double leadingPadding = 6;
  static const double trailingPadding = 14;

  final List<String> allSubgroupSuffs;
  final String selSubgroupSuff;

  final void Function(String?) onChanged;

  const ApelEwanCategorySelector({
    required this.allSubgroupSuffs,
    required this.selSubgroupSuff,
    required this.onChanged,
    super.key});

  @override
  Widget build(BuildContext context) => DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Text(
            'Zestaw pytań',
            style: AppTextStyle(color: hintEnab_(context))
        ),
        items: allSubgroupSuffs.map((subgroupSuff) =>
            DropdownMenuItem<String>(
              value: subgroupSuff,
              child: Text(
                  suffixNameMap[subgroupSuff]!,
                  style: AppTextStyle(fontWeight: subgroupSuff == selSubgroupSuff?weight.halfBold:weight.normal)
              ),
            ))
            .toList(),
        value: selSubgroupSuff,
        onChanged: onChanged, // (value) => setState(() => selSubgroupSuff = value as String),
        iconStyleData: const IconStyleData(
          icon: Icon(MdiIcons.dotsVertical),
          iconSize: Dimen.ICON_SIZE,
        ),

        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: leadingPadding, right: trailingPadding),
        ),

        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
          ),
        ),
      )
  );

}
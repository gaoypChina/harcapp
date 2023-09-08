import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/hint_dropdown_widget.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RankHarcInputField extends StatelessWidget{

  final RankHarc? rankHarc;
  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;
  final void Function(RankHarc?)? onRankHarcChanged;

  const RankHarcInputField(this.rankHarc, {this.enabled = true, this.dimTextOnDisabled = true, this.controller, this.onRankHarcChanged, super.key});

  @override
  Widget build(BuildContext context) => HintDropdownWidget<RankHarc?>(
    hint: 'Stopień harc.:',
    hintTop: 'Stopień harcerski',
    leading: Icon(MdiIcons.chevronDoubleRight, color: iconDisab_(context)),
    enabled: enabled,
    value: rankHarc,
    onChanged: (value) => onRankHarcChanged?.call(value),
    onCleared: () => onRankHarcChanged?.call(null),
    items: RankHarc.values.map((r) => DropdownMenuItem<RankHarc>(
      value: r,
      child: Text(rankHarcFullName(r, withOrg: true), style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
    )).toList(),
  );

}
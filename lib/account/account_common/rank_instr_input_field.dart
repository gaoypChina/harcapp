import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/hint_dropdown_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../values/rank_instr.dart';
import '../account_start/input_field_controller.dart';

class RankInstrInputField extends StatelessWidget{

  final RankInstr? rankInstr;
  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;
  final void Function(RankInstr?)? onRankInstrChanged;

  const RankInstrInputField(this.rankInstr, {this.enabled = true, this.dimTextOnDisabled = true, this.controller, this.onRankInstrChanged, super.key});

  @override
  Widget build(BuildContext context) => HintDropdownWidget<RankInstr?>(
    hint: 'Stopień instr.:',
    hintTop: 'Stopień instruktorski',
    // MdiIcons.handshakeOutline
    leading: Icon(MdiIcons.lighthouse, color: iconDisab_(context)),
    enabled: enabled,
    value: rankInstr,
    onChanged: (value) => onRankInstrChanged?.call(value),
    onCleared: () => onRankInstrChanged?.call(null),
    items: [
      DropdownMenuItem<RankInstr>(
        value: RankInstr.pwd,
        child: Text('Przewodnik', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<RankInstr>(
        value: RankInstr.phm,
        child: Text('Podharcmistrz', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<RankInstr>(
        value: RankInstr.hm,
        child: Text('Harcmistrz', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
    ],
  );

}
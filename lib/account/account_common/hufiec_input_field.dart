import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../account_start/input_field_controller.dart';

class HufiecInputField extends StatelessWidget{

  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;
  final bool asterisk;

  const HufiecInputField({
    this.enabled = true,
    this.dimTextOnDisabled = true,
    this.controller,
    this.asterisk = false,
    super.key
  });

  @override
  Widget build(BuildContext context) => InputField(
    hint: 'Hufiec:${asterisk?' *':''}',
    hintTop: 'Hufiec',
    controller: controller,
    enabled: enabled,
    textDisabledColor: dimTextOnDisabled?textDisab_(context):textEnab_(context),
    maxLength: ApiUser.HUFIEC_MAX_LENGTH,
    leading: Icon(MdiIcons.hexagonMultipleOutline, color: iconDisab_(context)),
  );

}
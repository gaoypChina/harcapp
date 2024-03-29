import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../account_start/input_field_controller.dart';

class NameInputField extends StatelessWidget{

  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;

  const NameInputField({this.enabled = true, this.dimTextOnDisabled = true, this.controller, super.key});

  @override
  Widget build(BuildContext context) => InputField(
    hint: 'Imię i nazwisko:',
    hintTop: 'Imię i nazwisko',
    controller: controller,
    enabled: enabled,
    textDisabledColor: dimTextOnDisabled?textDisab_(context):textEnab_(context),
    maxLength: ApiUser.DRUZYNA_MAX_LENGTH,
    leading: Icon(MdiIcons.accountOutline, color: iconDisab_(context)),
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/user.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../account_start/input_field_controller.dart';

class ShadowNickInputField extends StatelessWidget{

  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;
  final bool asterisk;

  const ShadowNickInputField({
    this.enabled = true,
    this.dimTextOnDisabled = true,
    this.controller,
    this.asterisk = false,
    super.key
  });

  @override
  Widget build(BuildContext context) => InputField(
    hint: 'Kod publiczny konta widmo:${asterisk?' *':''}',
    hintTop: 'Kod publiczny konta widmo',
    controller: controller,
    enabled: enabled,
    textDisabledColor: dimTextOnDisabled?textDisab_(context):textEnab_(context),
    maxLength: ApiUser.NAME_MAX_LENGTH,
    leading: Icon(MdiIcons.alien, color: iconDisab_(context)),
    trailing: IconButton(
      icon: Icon(MdiIcons.helpCircleOutline),
      onPressed: () => showAlertDialog(
          context,
          title: 'O co chodzi?',
          content: 'Jeżeli ktoś utworzył Ci <b>konto widmo</b> (np. by dodać Cię do współzawodnictwa zanim utworzyłeś swoje konto) dowiedz się jaki jest <b>kod publiczny</b> tegoż konta widmo, by je przejąć.',
          actionBuilder: (context) => [
            AlertDialogButton(text: 'Wszystko jasne', onTap: () => Navigator.pop(context))
        ]
      ),
    ),
  );

}
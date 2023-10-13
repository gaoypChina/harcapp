import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_widgets/hint_dropdown_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../account_start/input_field_controller.dart';

class OrgInputField extends StatelessWidget{

  final Org? org;

  final bool enabled;
  final bool dimTextOnDisabled;
  final InputFieldController? controller;
  final void Function(Org?)? onChanged;
  final bool asterisk;

  const OrgInputField(
      this.org,
      { this.enabled = true,
        this.dimTextOnDisabled = true,
        this.controller,
        this.onChanged,
        this.asterisk = false,
        super.key
      });

  @override
  Widget build(BuildContext context) => HintDropdownWidget<Org?>(
    hint: 'Org. harcerska:${asterisk?' *':''}',
    hintTop: 'Organizacja harcerska',
    // MdiIcons.googleCirclesExtended
    leading: Icon(MdiIcons.homeVariantOutline, color: iconDisab_(context)),
    value: org,
    onChanged: (value) async => onChanged?.call(value),
    onCleared: () async => onChanged?.call(null),
    enabled: enabled,
    items: [
      DropdownMenuItem<Org>(
        value: Org.zhp,
        child: Text('ZHP', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<Org>(
        value: Org.zhr_o,
        child: Text('ZHR', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<Org>(
        value: Org.fse,
        child: Text('FSE', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<Org>(
        value: Org.sh,
        child: Text('SH', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<Org>(
        value: Org.zhp_n_l,
        child: Text('ZHPnL', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
      DropdownMenuItem<Org>(
        value: Org.hrp,
        child: Text('HRP', style: AppTextStyle(color: enabled?textEnab_(context):dimTextOnDisabled?textDisab_(context):textEnab_(context))),
      ),
    ],
  );

}
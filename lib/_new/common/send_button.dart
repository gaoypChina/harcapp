
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SendButton extends StatelessWidget{

  bool enabled;
  void Function() onTap;
  SendButton(this.enabled, {this.onTap});

  @override
  Widget build(BuildContext context) {


    return SimpleButton(
      onTap: onTap,
      //elevation: AppCard.bigElevation,
      radius: AppCard.BIG_RADIUS,
      padding: EdgeInsets.all(Dimen.ICON_MARG),
      child: Row(
        mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Wyślij',
                style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  color: enabled?textEnab_(context):textDisab_(context),
                  fontWeight: weight.halfBold
                )
            ),
            SizedBox(width: 12),
            Icon(MdiIcons.sendCircleOutline, color: enabled?textEnab_(context):textDisab_(context)),
          ]
      ),
    );
  }


}
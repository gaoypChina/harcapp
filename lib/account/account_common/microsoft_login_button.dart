import 'package:flutter/material.dart';
import 'package:harcapp/account/account_start/main_button.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MicrosoftLoginButton extends StatelessWidget{

  static const double height = MainButton.height + 2*SimpleButton.DEF_PADDING;

  final String text;
  final Widget? trailing;
  final void Function()? onTap;

  const MicrosoftLoginButton(this.text, {this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) => SimpleButton(
      margin: EdgeInsets.zero,
      radius: MainButton.innerRadius,
      color: Colors.deepOrange,
      colorEnd: Colors.orange,
      child: Row(
        children: [

          SizedBox(height: MainButton.height),

          SizedBox(width: 2*Dimen.ICON_MARG),
          //SvgPicture.asset('assets/images/logo/microsoft.svg', width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),
          Icon(MdiIcons.microsoft, color: Colors.black),
          SizedBox(width: Dimen.ICON_MARG),

          Expanded(
            child: Text(text, style: AppTextStyle(color: Colors.black, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.center),
          ),

          SizedBox(width: Dimen.ICON_MARG),
          if(trailing != null) trailing!,
          SizedBox(width: 2*Dimen.ICON_MARG - 4.0),

          // SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),

        ],
      ),
      onTap: onTap
  );

}


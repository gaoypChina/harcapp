import 'package:flutter/material.dart';
import 'package:harcapp/account/account_start/main_button.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class MicrosoftLoginButton extends StatelessWidget{

  static const Color textEnabledColor = Colors.black;
  static const Color textDisabledColor = Colors.black45;
  static const double height = MainButton.height + 2*SimpleButton.DEF_PADDING;

  final String text;
  final bool processing;
  final Widget? trailing;
  final void Function()? onTap;

  const MicrosoftLoginButton(this.text, {this.processing = false, this.trailing, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Consumer<ConnectivityProvider>(
      builder: (context, prov, child) => SimpleButton(
          margin: EdgeInsets.zero,
          radius: MainButton.innerRadius,
          color: Colors.deepOrange,
          colorEnd: Colors.orange,
          onTap: !processing && prov.connected?onTap:null,
          child: Row(
            children: [

              const SizedBox(height: MainButton.height),

              const SizedBox(width: 2*Dimen.ICON_MARG),
              //SvgPicture.asset('assets/images/logo/microsoft.svg', width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),
              Icon(MdiIcons.microsoft, color: !processing && prov.connected?textEnabledColor:textDisabledColor),
              const SizedBox(width: Dimen.ICON_MARG),

              Expanded(
                child: Text(
                    text,
                    style: AppTextStyle(
                        color: !processing && prov.connected?textEnabledColor:textDisabledColor,
                        fontWeight: weight.halfBold,
                        fontSize: Dimen.TEXT_SIZE_BIG
                    ), textAlign: TextAlign.center
                ),
              ),

              const SizedBox(width: Dimen.ICON_MARG),
              if(trailing != null) trailing!,
              const SizedBox(width: 2*Dimen.ICON_MARG - 4.0),

              // SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),

            ],
          )
      )
  );

}


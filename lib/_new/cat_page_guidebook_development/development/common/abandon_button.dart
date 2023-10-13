import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AbandonButton extends StatelessWidget{

  //final TickerProviderStateMixin tickerProviderStateMixin;
  //final bool show;
  final void Function()? onTap;

  const AbandonButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {

    return SimpleButton(
        radius: AppCard.bigRadius,
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        margin: EdgeInsets.zero,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(MdiIcons.close, color: Colors.red),
            const SizedBox(width: Dimen.ICON_MARG, height: Dimen.ICON_FOOTPRINT),
            Text(
              'Porzuć',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                  color: Colors.red
              ),
            )
          ],
        )
    );

  }

}
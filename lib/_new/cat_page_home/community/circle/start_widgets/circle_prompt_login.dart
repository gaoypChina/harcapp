import 'package:flutter/material.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle_preview_widget.dart';

class CirclePromptLogin extends StatelessWidget{

  final double width;
  const CirclePromptLogin({required this.width, super.key});

  @override
  Widget build(BuildContext context) => CirclePreviewWidget(
    width: width,
    child: SimpleButton(
      elevation: AppCard.bigElevation,
      margin: const EdgeInsets.all(Dimen.SIDE_MARG),
      radius: AppCard.BIG_RADIUS,
      onTap: () => AccountPage.open(context),
      color: cardEnab_(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Material(
                color: background_(context),
                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Row(
                    children: [
                      const Icon(MdiIcons.accountCircleOutline, size: 60),
                      const SizedBox(width: 20),
                      Text(
                        'Zaloguj się by\nzawiązać środowisko',
                        style: AppTextStyle(
                          fontSize: 20.0,
                          color: iconEnab_(context),
                          height: 1.2
                        ),
                      )
                    ],
                  ),
                )
            ),

            const SizedBox(height: 16.0),

            const Padding(
              padding: EdgeInsets.all(6.0),
              child: AppText(
                  'Dzięki <b>kontu HarcApp</b> możesz dzielić się informacjami w <b>kręgach</b>!',
                  size: Dimen.TEXT_SIZE_BIG,
                  height: 1.2
              ),
            )

          ],
        ),
      ),
    ),
  );

}
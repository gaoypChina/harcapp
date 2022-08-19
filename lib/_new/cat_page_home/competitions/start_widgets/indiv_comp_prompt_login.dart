import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'indiv_comp_preview_grid.dart';

class IndivCompPromptLogin extends StatelessWidget{

  final double width;
  const IndivCompPromptLogin({required this.width, super.key});

  @override
  Widget build(BuildContext context) => IndivCompPreviewGrid(
    width: width,
    child: SimpleButton(
      elevation: AppCard.bigElevation,
      radius: AppCard.bigRadius,
      onTap: () => AccountPage.open(context),
      color: cardEnab_(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Material(
                color: background_(context),
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: Row(
                    children: [
                      const Icon(MdiIcons.accountCircleOutline, size: 60),
                      const SizedBox(width: 20),
                      Text(
                        'Zaloguj się by\nwspółzawodniczyć',
                        style: AppTextStyle(
                            fontSize: 20.0,
                            color: iconEnab_(context)
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
                  'Dzięki <b>kontu HarcApp</b> możesz prowadzić i brać udział we <b>współzawodnictwach</b>!'
                      '\n\nTwoje punkty zawsze w <b>Twojej kieszeni</b>.',
                  size: Dimen.TEXT_SIZE_BIG,
                  height: 1.2
              ),
            )

          ],
        ),
      ),
    )
  );

}
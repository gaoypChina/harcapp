import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'org_card_widget_remplate.dart';

class HRPOrgCardWidget extends StatelessWidget{

  final void Function(BuildContext)? onTap;

  const HRPOrgCardWidget({this.onTap, super.key});

  @override
  Widget build(BuildContext context) => OrgCardWidgetTemplate(
      onTap: onTap,
      background: AppColors.hrpGreen,
      heroTag: Org.zhr_o,
      child: GradientWidget(
        colorStart: AppColors.hrpGreen,
        colorEnd: AppColors.hrpGreen,
        child: Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: Dimen.ICON_MARG),
                Image.asset(
                    'assets/images/scout_org_logos/logo_hrp.webp',
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft
                ),

                const SizedBox(width: Dimen.ICON_MARG),

                Expanded(
                  child: AutoSizeText(
                    'Harcerstwo Rzeczypospolitej Polskiej',
                    style: AppTextStyle(fontSize: 22.0, fontWeight: weight.bold, color: Colors.white),
                    maxLines: 3,
                  ),
                )
              ],
            )
        ),
      )
  );

}
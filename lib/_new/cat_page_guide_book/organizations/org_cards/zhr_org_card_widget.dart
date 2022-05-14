import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp_core/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'org_card_widget_remplate.dart';

class ZHROrgCardWidget extends StatelessWidget{

  final void Function(BuildContext)? onTap;

  const ZHROrgCardWidget({this.onTap});

  @override
  Widget build(BuildContext context) {

    return OrgCardWidgetTemplate(
      onTap: onTap,
      background: AppColors.zhr_red,
      heroTag: Org.zhr_o,
      child: GradientWidget(
        colorStart: AppColors.zhr_red,
        colorEnd: Colors.redAccent,
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: Dimen.ICON_MARG),
                AspectRatio(
                  aspectRatio: 207.2/264.4,
                  child: SvgPicture.asset(
                      'assets/images/scout_org_logos/logo_zhr.svg',
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft
                  ),
                ),

                SizedBox(width: 2*Dimen.ICON_MARG),

                Expanded(
                  child: AutoSizeText(
                    'Związek Harcerstwa Rzeczypospolitej',
                    style: AppTextStyle(fontSize: 32.0, fontWeight: weight.bold, color: Colors.white),
                    maxLines: 3,
                  ),
                )
              ],
            )
        ),
      )
    );

  }

}
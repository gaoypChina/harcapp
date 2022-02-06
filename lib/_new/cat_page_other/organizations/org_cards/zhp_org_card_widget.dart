import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';

import 'org_card_widget_remplate.dart';

class ZHPOrgCardWidget extends StatelessWidget{

  final void Function(BuildContext) onTap;

  const ZHPOrgCardWidget({this.onTap});

  @override
  Widget build(BuildContext context) {

    return OrgCardWidgetTemplate(
        onTap: onTap,
        background: AppColors.zhp_green,
        heroTag: Org.zhp,
        child: GradientWidget(
          colorStart: AppColors.zhp_green,
          colorEnd: Colors.green,
          child: Padding(
              padding: EdgeInsets.all(24.0),
              child: SvgPicture.asset('assets/images/scout_org_logos/logo_zhp_extended.svg', color: Colors.white)
          ),
        )
    );

  }

}
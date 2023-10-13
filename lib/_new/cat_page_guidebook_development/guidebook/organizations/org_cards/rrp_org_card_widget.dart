import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/colors.dart';

import 'org_card_widget_remplate.dart';

class RRPOrgCardWidget extends StatelessWidget{

  final void Function(BuildContext)? onTap;

  const RRPOrgCardWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {

    return OrgCardWidgetTemplate(
      onTap: onTap,
      background: AppColors.rrp_red,
      heroTag: 'rrp',
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SvgPicture.asset(
            'assets/images/scout_org_logos/logo_royal_rangers.svg',
            fit: BoxFit.scaleDown,
            alignment: Alignment.center
        ),
      )
    );

  }

}
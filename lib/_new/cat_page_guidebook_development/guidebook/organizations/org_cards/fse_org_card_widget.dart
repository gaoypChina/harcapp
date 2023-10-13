import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';

import 'org_card_widget_remplate.dart';

class FSEOrgCardWidget extends StatelessWidget{

  final void Function(BuildContext)? onTap;

  const FSEOrgCardWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {

    return OrgCardWidgetTemplate(
      onTap: onTap,
      background: Colors.transparent,
      heroTag: Org.fse,
      child: Stack(
        children: [

          Row(
            children: [
              Expanded(
                child: GradientWidget(
                  colorStart: const Color.fromARGB(255, 60, 32, 32),
                  colorEnd: AppColors.fseBackgroundDark,
                  child: Container(),
                ),
              ),
              Expanded(child: Container(color: Colors.white))
            ],
          ),

          Positioned.fill(
            top: 12.0,
            bottom: 12.0,
            child: SvgPicture.asset(
                'assets/images/scout_org_logos/logo_fse.svg',
                fit: BoxFit.scaleDown,
            ),
          )

        ],
      )
    );

  }

}
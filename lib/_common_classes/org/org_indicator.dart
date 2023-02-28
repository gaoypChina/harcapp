
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'org.dart';
import 'org_switcher.dart';

class OrgIndicator extends StatelessWidget{

  final Org org;
  final double fontSize;
  final Color? fontColor;

  const OrgIndicator(this.org, {this.fontSize = Dimen.TEXT_SIZE_NORMAL, this.fontColor, super.key});

  @override
  Widget build(BuildContext context) => Text(
      orgName[org]!,
      style: AppTextStyle(
          fontWeight: weight.halfBold,
          color: fontColor??orgColor[org],
          fontSize: fontSize
      )
  );

}

class OrgAdvancedIndicator extends StatelessWidget{

  final Org org;
  final Color? fontColor;
  final bool dense;
  final bool topSpace;

  const OrgAdvancedIndicator(this.org, {this.fontColor, this.dense = false, this.topSpace = true, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: OrgSwitcher.width,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        if(topSpace)
          Text('', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL)),
        Text(
            orgName[org]!,
            style: AppTextStyle(
                fontSize: dense?Dimen.TEXT_SIZE_NORMAL:Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.bold,
                color: fontColor??orgColor[org]
            )
        ),
        if(org==Org.zhr_d || org==Org.zhr_c)
          Text(
              org==Org.zhr_d?'H-KI':(
                  org==Org.zhr_c?'H-RZE':''),
              style: AppTextStyle(
                  fontSize: dense?Dimen.TEXT_SIZE_TINY:Dimen.TEXT_SIZE_SMALL,
                  fontWeight: weight.bold,
                  color: fontColor??orgColor[org]
              )
          )
      ],
    ),
  );

}
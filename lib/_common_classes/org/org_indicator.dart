
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'org.dart';

class OrgIndicator extends StatelessWidget{

  final Org org;
  final double fontSize;

  const OrgIndicator(this.org, {this.fontSize = Dimen.TEXT_SIZE_NORMAL, super.key});

  @override
  Widget build(BuildContext context) => Text(
      orgName[org]!,
      style: AppTextStyle(
          fontWeight: weight.halfBold,
          color: orgColor[org],
          fontSize: fontSize
      )
  );

}

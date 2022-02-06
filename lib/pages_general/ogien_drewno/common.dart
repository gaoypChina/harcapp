import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class Header extends StatelessWidget{

  final String text;
  final Color color;

  const Header(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.all(10),
      color: color,
      elevation: AppCard.bigElevation,
      child: Text(
          text,
          style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, shadow: true),
          textAlign: TextAlign.center
      ),

    );
  }

}
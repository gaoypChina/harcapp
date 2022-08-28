import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

const double SEPARATOR_BIG = 48.0;
const double SEPARATOR_SMALL = 28.0;
const double part_margin = 10.0;

class ListCard extends StatelessWidget{

  final ColorPack colorPack;
  final String title;
  final String content;

  const ListCard(this.colorPack, this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: colorPack.defCardEnabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(title, style: AppTextStyle(fontWeight: weight.halfBold, color: colorPack.hintDrawer)),
          const SizedBox(height: Dimen.defMarg/2),
          Text(content, style: AppTextStyle(color: colorPack.textDrawer)),
        ],
      ),
    );
  }
}
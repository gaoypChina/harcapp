import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'competition_preview_grid.dart';

class CompetitionPreviewGridMessage extends StatelessWidget{

  final IconData icon;
  final String text;
  final void Function()? onTap;

  const CompetitionPreviewGridMessage({
    required this.icon,
    required this.text,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.bigRadius,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          EmptyMessageWidget(
            icon: icon,
            text: text,
            color: textEnab_(context),
          ),

          Expanded(child: Container()),

          const CompetitionPreviewGrid()

        ],
      )
  );



}
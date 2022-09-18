import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'communities_preview_widget.dart';

class CommunitiesPreviewMessageWidget extends StatelessWidget{

  final IconData icon;
  final String text;
  final void Function()? onTap;

  const CommunitiesPreviewMessageWidget({required this.icon, required this.text, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
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

        const CommunitiesPreviewWidget(),

      ],
    ),
  );

}
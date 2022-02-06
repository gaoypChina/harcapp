import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class EmptyMessageWidget extends StatelessWidget{

  final String text;
  final IconData icon;
  final Color color;

  const EmptyMessageWidget({@required this.text, @required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [

        Icon(icon, color: color??hintEnab_(context), size: Dimen.ICON_EMPTY_INFO_SIZE),
        SizedBox(height: Dimen.ICON_MARG),
        Text(
          text,
          style: AppTextStyle(
              color: color??hintEnab_(context),
              fontSize: Dimen.TEXT_SIZE_APPBAR,
              fontWeight: weight.bold
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),

      ],
    );
  }

}
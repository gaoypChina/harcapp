import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

class SingleLineWidget extends StatelessWidget{

  final IconData icon;
  final String title;

  const SingleLineWidget(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.all(Dimen.ICON_MARG),
            child: Icon(icon, color: textEnab_(context))
        ),
        Text(title, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR-2, fontWeight: weight.halfBold))
      ],
    );
  }

}
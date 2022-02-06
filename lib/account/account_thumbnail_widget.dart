import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

class AccountThumbnailWidget extends StatelessWidget{

  static const double defSize = 50;
  static const double defTextSize = 50*textSizeRatio;
  static const double textSizeRatio = 1/2.8;

  final String name;

  final bool elevated;
  final double size;
  final bool enabled;
  final void Function() onTap;

  const AccountThumbnailWidget(this.name, {this.elevated=true, this.size, this.enabled = true, this.onTap});

  @override
  Widget build(BuildContext context) {

    double size = this.size??defSize;

    List<String> nameParts = name.split(' ');
    String abbr = '';
    if(nameParts.length == 1) {
      String part = nameParts[0];
      if(part.length==1)
        abbr = part[0].toUpperCase();
      else if(part.length > 1)
        abbr = part[0].toUpperCase() + part[1].toLowerCase();
    }else{
      String part1 = nameParts[0];
      String part2 = nameParts[1];
      if(part1.isNotEmpty)
        abbr += part1[0].toUpperCase();
      if(part2.isNotEmpty)
        abbr += part2[0].toUpperCase();
    }

    return SizedBox(
      width: size,
      height: size,
      child: SimpleButton(
        onTap: onTap??() => showAppToast(context, text: name),
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        elevation: elevated?AppCard.bigElevation:0,
        radius: 2*size,
        color: cardEnab_(context),
        child: Center(
          child: Text(
            abbr,
            style: AppTextStyle(fontSize: size*textSizeRatio, fontWeight: weight.halfBold, color: enabled?textEnab_(context):hintEnab_(context)),
          ),
        ),
      ),
    );

  }


}
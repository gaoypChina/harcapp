import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

const double commonPadding = 20.0;

class Item extends StatelessWidget{

  final String title;
  final Color titleColor;
  final Color textColor;
  final Color cardColor;
  final String content;
  final bool inCard;
  final double titleSize;
  final Widget titleTrailing;
  final Widget titleLeading;

  const Item(
      this.title,
      this.content,
      { this.inCard:false,
        this.titleColor,
        this.textColor,
        this.cardColor,
        this.titleSize:Dimen.TEXT_SIZE_BIG,
        this.titleTrailing,
        this.titleLeading,
      });

  @override
  Widget build(BuildContext context) {

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            if(titleLeading!=null)
              titleLeading,
            Text(title, style: AppTextStyle(
                fontSize: titleSize,
                color: titleColor,
                fontWeight: weight.halfBold)),
            Expanded(child: Container()),
            if(titleTrailing!=null)
              titleTrailing
          ],
        ),
        SizedBox(height: commonPadding),
        AppText(content, color: textColor, height: 1.1, size: Dimen.TEXT_SIZE_BIG),
      ],
    );

    if(inCard)
      return AppCard(
        radius: AppCard.BIG_RADIUS,
        padding: EdgeInsets.all(commonPadding),
        color: cardColor,
        child: child,
      );
    else
      return Padding(
        padding: EdgeInsets.all(commonPadding),
        child: child,
      );

  }
}
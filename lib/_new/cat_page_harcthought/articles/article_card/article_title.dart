import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import '../article.dart';
import 'common.dart';


class TitleWidget extends StatelessWidget{

  final Article? article;
  final bool dense;
  final Color? textColor;
  final bool? shadow;

  const TitleWidget(this.article, {this.dense=false, this.textColor, this.shadow, super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: articleTitleHero(article!),
    child: Material(
      color: Colors.transparent,
      child: Text(
        article?.title??'',
        maxLines: dense?1:2,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle(
            fontWeight: weight.bold,
            fontSize: dense?
            TITLE_SIZE_DENSE:
            TITLE_SIZE_NORM,
            color: textColor,
            shadow: shadow
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );

}


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../article_core.dart';
import 'article_tag_widget.dart';


const double TITLE_SIZE_NORM = 26.0;
const double TITLE_SIZE_DENSE = Dimen.TEXT_SIZE_BIG;

const double CARD_PADDING_NORM = 2*Dimen.ICON_MARG;
const double CARD_PADDING_DENSE = Dimen.ICON_MARG;

const double TEXT_SIZE_NORM = Dimen.TEXT_SIZE_BIG;
const double TEXT_SIZE_DENSE = Dimen.TEXT_SIZE_SMALL;

String articleCoverHero(Article article) => 'COVER&' + article.id;
String articleTitleHero(Article article) => 'TITLE&' + article.id;
String articleAuthorHero(Article article) => 'AUTHOR&' + article.id;
String articleDateHero(Article article) => 'DATE&' + article.id;

String articleTagHero(Article article) => 'TAG&' + article.id;

class TagsWidget extends StatelessWidget{

  final Article? article;
  final bool dense;

  const TagsWidget(this.article, {this.dense: false});

  @override
  Widget build(BuildContext context) {

    List<Widget> tags = [];
    for(int i=0; i<article!.tags!.length; i++){
      tags.add(ArticleTagWidget(article!.tags![i], dense: dense));
      if(i < article!.tags!.length-1) tags.add(SizedBox(width: dense?Dimen.DEF_MARG:Dimen.ICON_MARG));
    }

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(
          left: dense?
          CARD_PADDING_DENSE:
          CARD_PADDING_NORM,

          right: dense?
          CARD_PADDING_DENSE:
          CARD_PADDING_NORM
      ),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(children: tags),
    );

  }

}

class TitleWidget extends StatelessWidget{

  final Article? article;
  final bool dense;
  final Color? textColor;
  final bool? shadow;

  const TitleWidget(this.article, {this.dense=false, this.textColor, this.shadow, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: articleTitleHero(article!),
      child: Material(
        color: Colors.transparent,
        child: AutoSizeText(
          article?.title??'',
          maxLines: dense?2:3,
          minFontSize: 16.0,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle(
              fontWeight: weight.bold,
              fontSize: dense?
              TITLE_SIZE_DENSE:
              TITLE_SIZE_NORM,
              color: textColor,
              shadow: shadow
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }

}

class DateWidget extends StatelessWidget{

  final Article? article;
  final bool dense;

  const DateWidget(this.article, {this.dense: false});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: articleDateHero(article!),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [

            Icon(MdiIcons.calendar, color: Colors.white, size: dense?16.0:Dimen.ICON_SIZE),
            SizedBox(width: dense?8.0:Dimen.ICON_MARG),

            Text(
              article?.dateString??'',
              style: AppTextStyle(
                fontSize:
                dense?
                TEXT_SIZE_DENSE:
                TEXT_SIZE_NORM,
                color: Colors.white,
                fontWeight: weight.bold,
                shadow: true,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),

          ],
        ),
      ),
    );
  }

}

class AuthorWidget extends StatelessWidget{

  final Article? article;
  final bool dense;
  final void Function()? onTap;

  const AuthorWidget(this.article, {this.dense=false, this.onTap});

  @override
  Widget build(BuildContext context) {

    Widget child = Material(
      child: Row(
        children: [

          Icon(MdiIcons.accountEdit, color: Colors.white, size: dense?16.0:Dimen.ICON_SIZE),
          SizedBox(width: dense?8.0:Dimen.ICON_MARG),
          Text(
            article!.author!,
            style: AppTextStyle(
              fontWeight: weight.bold,
              color: Colors.white,
              fontSize: dense?TEXT_SIZE_DENSE:TEXT_SIZE_NORM,
              shadow: true,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
      color: Colors.transparent,
    );

    return Hero(
      tag: articleAuthorHero(article!),
      child:
      onTap==null?
      child:
      SimpleButton(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(Dimen.ICON_MARG),
        radius: AppCard.BIG_RADIUS,
        child: child,
        onTap: onTap,
      ),
    );
  }


}
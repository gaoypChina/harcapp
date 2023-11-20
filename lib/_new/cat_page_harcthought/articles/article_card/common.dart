import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../article.dart';


const double TITLE_SIZE_NORM = 22.0;
const double TITLE_SIZE_DENSE = Dimen.TEXT_SIZE_BIG;

const double CARD_PADDING_NORM = 2*Dimen.ICON_MARG;
const double CARD_PADDING_DENSE = Dimen.ICON_MARG;

const double TEXT_SIZE_NORM = Dimen.TEXT_SIZE_BIG;
const double TEXT_SIZE_DENSE = Dimen.TEXT_SIZE_SMALL;

String articleCoverHero(Article article) => 'COVER&${article.uniqName}';
String articleTitleHero(Article article) => 'TITLE&${article.uniqName}';
String articleAuthorHero(Article article) => 'AUTHOR&${article.uniqName}';
String articleDateHero(Article article) => 'DATE&${article.uniqName}';

String articleTagHero(Article article) => 'TAG&${article.uniqName}';
String articleSeenIconHero(Article article) => 'SEEN_ICON&${article.uniqName}';
String articleLikedIconHero(Article article) => 'LIKED_ICON&${article.uniqName}';

class ArticleSeenIcon extends StatelessWidget{

  final Article article;

  const ArticleSeenIcon(this.article, {super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: articleSeenIconHero(article),
    child: SimpleButton.from(
        context: context,
        icon: MdiIcons.eye,
        iconColor: ColorPackBlack.ICON_DISABLED,
        onTap: () => showAppToast(context, text: 'Artykuł przeczytany')
    ),
  );

}

class ArticleLikedIcon extends StatelessWidget{

  final Article article;

  const ArticleLikedIcon(this.article, {super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: articleLikedIconHero(article),
    child: SimpleButton.from(
        context: context,
        icon: MdiIcons.heart,
        iconColor: ColorPackBlack.ICON_DISABLED,
        onTap: () => showAppToast(context, text: 'Artykuł polubiony')
    ),
  );

}

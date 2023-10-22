import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'article_card/article_card_widget.dart';
import 'article.dart';
import 'article_page.dart';

enum ArticleListMode{
  PageView,
  ListView
}

class ArticleListWidget extends StatelessWidget{

  final List<Article> articles;
  final String? emptyText;
  final IconData? emptyIcon;
  final ArticleListMode mode;
  final EdgeInsets itemPadding;

  const ArticleListWidget(
      this.articles,
      { this.emptyText,
        this.emptyIcon,
        this.mode=ArticleListMode.ListView,
        this.itemPadding=EdgeInsets.zero,
        super.key
      });

  @override
  Widget build(BuildContext context) {

    if(articles.isEmpty)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(emptyIcon, size: Dimen.ICON_EMPTY_INFO_SIZE, color: iconDisab_(context)),
          const SizedBox(height: Dimen.ICON_MARG),
          Text(
            emptyText!,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_APPBAR,
                fontWeight: weight.bold,
                color: iconDisab_(context)
            ),
            textAlign: TextAlign.center,
          )
        ],
      );

    if(mode == ArticleListMode.PageView) {
      PageController controller = PageController(viewportFraction: Dimen.viewportFraction(context));
      ValueNotifier<double?> notifier = ValueNotifier(0);
      controller.addListener(() => notifier.value = controller.page);
      post(() => notifier.value = controller.page);
      return PageView.builder(
        itemBuilder: (context, index) => builder(context, index, notifier),
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: articles.length,
      );
    }else
      return ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        itemCount: articles.length,
        separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
        itemBuilder: (context, index) => builder(context, index, null),
      );

  }

  Widget builder(BuildContext context, int index, ValueNotifier? notifier){

    Widget child = ArticleCardWidget(
      articles[index],
      radius: AppCard.bigRadius,
      onTap: (context, article, background) =>
      background == null?
      showAppToast(context, text: 'Ładowanie...'):
      pushPage(
        context,
        builder: (context) => ArticlePage(
          article,
          cover: background,
        ),
      ),
      key: ValueKey(articles[index]),
    );

    if(notifier == null)
      return child;

    return Padding(
      padding: itemPadding,
      child: AnimatedBuilder(
        animation: notifier,
        child: child,
        builder: (context, child) =>
            Transform.translate(
              offset: Offset(2*Dimen.defMarg*(index-notifier.value), 0),
              child: child,
            ),
      ),
    );
  }

}
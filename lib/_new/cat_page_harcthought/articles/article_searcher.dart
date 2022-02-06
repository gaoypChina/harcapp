
import 'dart:isolate';

import 'package:harcapp/_common_classes/searcher.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/common.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:tuple/tuple.dart';

import 'article_core.dart';

class ArticleSearchOptions extends SearchOptions{
  List<String> checkedTags;
  DateTime fromDate;
  DateTime toDate;

  ArticleSearchOptions({List<String> checkedTags}){
    this.checkedTags = checkedTags??[];
  }

  @override
  bool get isEmpty{
    return checkedTags.isEmpty && fromDate == null && toDate == null;
  }

  @override
  void clear(){
    checkedTags = [];
    fromDate = null;
    toDate = null;
  }

}

class ArticleSearcher extends Searcher<Article, Article, ArticleSearchOptions>{

  ArticleSearcher() : super(_selectArticles);

}

bool _dateMatch(ArticleSearchOptions options, Article article){

  return (options.fromDate == null || options.fromDate.isBefore(article.date)) &&
      (options.toDate == null || options.toDate.isAfter(article.date));
}

bool _tagMatch(ArticleSearchOptions options, Article article){

  final List<String> checkedTags = options.checkedTags;
  if(checkedTags.isEmpty) return true;

  for (String tag in article.tags)
    if(checkedTags.contains(tag))
      return true;

  return false;
}

bool _contentMatch(String phrase, Article article){

  for (ArticleElement element in article.articleElements)
    if(element.hasMatch(phrase))
      return true;

  return false;
}

void _selectArticles(Tuple3<List<Article>, ArticleSearchOptions, SendPort> args) =>
    selectTemplate<Article, Article, ArticleSearchOptions>(
        args, (String phrase, List<Article> allItems, ArticleSearchOptions options, bool Function() stillValid){

      String text = remPolChars(phrase);

      List<Article> resultsByMeta = [];
      List<Article> resultsByText = [];

      for(Article article in allItems) {

        if(!stillValid()) return null;

        if (!_tagMatch(options, article) || !_dateMatch(options, article))
          continue;

        bool titleMatch = remPolChars(article.title??'').contains(text);
        bool authorMatch = remPolChars(article.author??'').contains(text);

        if(titleMatch || authorMatch)
          resultsByMeta.add(article);

        else if(_contentMatch(phrase, article))
          resultsByText.add(article);

      }

      return resultsByMeta + resultsByText;

    });

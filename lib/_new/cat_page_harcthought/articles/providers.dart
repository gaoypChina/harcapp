import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/theme.dart';

import 'article_core.dart';
import 'article_text_style.dart';

class ArticleNotifierProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}

class BookmarkedArticlesProvider extends ChangeNotifier{

  List<Article> _articles;

  List<Article> get articles => _articles;

  init(List<Article> allArticles){
    List<String> articleIds = shaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []);
    _articles = [];
    for(String id in articleIds)
      _articles.add(Article.allMap[id]);
  }

  bool contains(Article article) => _articles.contains(article);

  void add(Article article){
    _articles.add(article);
    article.isBookmarked = true;
    notifyListeners();
  }

  void remove(Article article){
    _articles.remove(article);
    article.isBookmarked = false;
    notifyListeners();
  }

  void clear(){
    if(_articles == null) return;
    _articles.clear();
    notifyListeners();
  }
}

class LikedArticlesProvider extends ChangeNotifier{

  List<Article> _articles;

  List<Article> get articles => _articles;

  init(List<Article> allArticles){
    List<String> articleIds = shaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []);
    _articles = [];
    for(String id in articleIds)
      _articles.add(Article.allMap[id]);
  }

  bool contains(Article article) => _articles.contains(article);

  void add(Article article){
    _articles.add(article);
    article.isLiked = true;
    notifyListeners();
  }

  void remove(Article article){
    _articles.remove(article);
    article.isLiked = false;
    notifyListeners();
  }

  void clear(){
    if(_articles == null) return;
    _articles.clear();
    notifyListeners();
  }

}

class ArticleThemeProvider extends ChangeNotifier{

  //ArticleThemeColorOption _colorOption;
  String _paraFontFamily;

  /*
  ArticleThemeColorOption get colorOption => _colorOption;
  set colorOption(ArticleThemeColorOption value){
    _colorOption = value;
    notifyListeners();
  }
   */

  String get paraFontFamily => _paraFontFamily;
  set paraFontFamily(String value){
    _paraFontFamily = value;
    notifyListeners();
  }

  ArticleThemeProvider(){
    //colorOption = ArticleThemeColorOption.NORMAL;
    paraFontFamily = Parag1TextStyle.FAMILY;
  }

}
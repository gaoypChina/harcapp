import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:provider/provider.dart';

import 'article.dart';
import 'article_text_style.dart';

class ArticleNotifierProvider extends ChangeNotifier{

  static ArticleNotifierProvider of(BuildContext context) => Provider.of<ArticleNotifierProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

}

class BookmarkedArticlesProvider extends ChangeNotifier{

  static BookmarkedArticlesProvider of(BuildContext context) => Provider.of<BookmarkedArticlesProvider>(context, listen: false);

  List<Article?>? _articles;

  List<Article?>? get articles => _articles;

  init(List<Article?>? allArticles){
    List<String> articleIds = ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []);
    _articles = [];
    for(String id in articleIds)
      _articles!.add(Article.allMap![id]);
  }

  bool contains(Article? article) => _articles!.contains(article);

  void add(Article article){
    _articles!.add(article);
    article.setBookmarked(true);
    notifyListeners();
  }

  void remove(Article article){
    _articles!.remove(article);
    article.setBookmarked(false);
    notifyListeners();
  }

  void clear(){
    if(_articles == null) return;
    _articles!.clear();
    notifyListeners();
  }
}

class LikedArticlesProvider extends ChangeNotifier{

  static LikedArticlesProvider of(BuildContext context) => Provider.of<LikedArticlesProvider>(context, listen: false);

  List<Article?>? _articles;

  List<Article?>? get articles => _articles;

  init(List<Article?>? allArticles){
    List<String> articleIds = ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []);
    _articles = [];
    for(String id in articleIds)
      _articles!.add(Article.allMap![id]);
  }

  bool contains(Article article) => _articles!.contains(article);

  void add(Article article){
    _articles!.add(article);
    article.setLiked(true);
    notifyListeners();
  }

  void remove(Article article){
    _articles!.remove(article);
    article.setLiked(false);
    notifyListeners();
  }

  void clear(){
    if(_articles == null) return;
    _articles!.clear();
    notifyListeners();
  }

}

class ArticleThemeProvider extends ChangeNotifier{

  static ArticleThemeProvider of(BuildContext context) => Provider.of<ArticleThemeProvider>(context, listen: false);

  //ArticleThemeColorOption _colorOption;
  String? _paraFontFamily;

  /*
  ArticleThemeColorOption get colorOption => _colorOption;
  set colorOption(ArticleThemeColorOption value){
    _colorOption = value;
    notifyListeners();
  }
   */

  String? get paraFontFamily => _paraFontFamily;
  set paraFontFamily(String? value){
    _paraFontFamily = value;
    notifyListeners();
  }

  ArticleThemeProvider(){
    //colorOption = ArticleThemeColorOption.NORMAL;
    paraFontFamily = Parag1TextStyle.FAMILY;
  }

}
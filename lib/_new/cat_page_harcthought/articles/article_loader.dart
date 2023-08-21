import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed_revised/domain/atom_feed.dart';
import 'package:webfeed_revised/domain/atom_item.dart';

import 'article_core.dart';
import 'common.dart';

ArticleLoader articleLoader = ArticleLoader();

enum ArticleLoadState{
  CHECKING_NET,
  NO_NET,
  LOADING,
  LOADED,
  FAILED,
}

abstract class ArticleLoaderError{}
class NoInternetError extends ArticleLoaderError{}
class ArticleDownloadError extends ArticleLoaderError{}

class ArticleLoaderListener extends SingleComputerListener<ArticleLoaderError>{

  final void Function(ArticleLoadState loadState)? onStateChanged;

  ArticleLoaderListener({
      void Function()? onStart,
      Future<void> Function(ArticleLoaderError?)? onError,
      void Function(ArticleLoaderError? err, bool forceFinished)? onEnd,
      this.onStateChanged,
  }):super(onStart: onStart, onError: onError, onEnd: onEnd);
}

class ArticleLoader extends SingleComputer<ArticleLoaderError, ArticleLoaderListener>{

  @override
  String get computerName => 'ArticleLoader';

  ArticleLoadState _loadState = ArticleLoadState.CHECKING_NET;
  ArticleLoadState get loadState => _loadState;
  set loadState(ArticleLoadState value){
    _loadState = value;
    for(ArticleLoaderListener listener in listeners)
      listener.onStateChanged!(_loadState);
  }

  late bool all;

  static List<Article> _responseToAzymutFeed(Response response){
    AtomFeed atomFeed;
    try {
      atomFeed = AtomFeed.parse(HtmlUnescape().convert(response.data));
    } catch (_){
      return [];
    }

    List<Article> articles = [];
    for(AtomItem item in atomFeed.items!)
      try {
        ArticleAzymut article = ArticleAzymut.from(item);
        articles.add(article);
      } catch (_) {
        debugPrint('${item.id} ${_.toString()}');
      }

    return articles;
  }

  static String _azymutFeedPageUrl(int page) => 'https://azymut.zhr.pl/feed/atom/?paged=$page';

  static Future<List<Article>?> _getAzymutFromPage({int page = 0}) async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 3),
    ));

    try {
      Response response = await dio.get(_azymutFeedPageUrl(page));

      if(response.statusCode == HttpStatus.ok)
        return _responseToAzymutFeed(response);

      return null;
    } on DioException catch(e){
      if(e.response == null)
        return null;
      return _responseToAzymutFeed(e.response!);
    }

  }

  static Future<List<Article>?> downloadAllArticles({String? lastSeenId}) async {

    List<Article> allArticles = [];

    int page = 0;
    while(true) {
      List<Article>? articles = await _getAzymutFromPage(page: page);
      if (articles == null)
        return null;

      debugPrint('Downloaded page $page: ${articles.length} articles.');
      if (articles.isEmpty)
        break;

      bool doBreak = false;
      for (Article article in articles) {
        if(lastSeenId != null && lastSeenId == article.id){
          doBreak = true;
          break;
        }

        allArticles.add(article);
      }
      if(doBreak || page == -1)
        break;

      page++;
    }

    Tuple2<List<String>, List<String>>? result = await ArticleHarcApp.downloadIDsAndBlackList();

    if(result == null) {
      debugPrint('Problem downloading downloadIDsAndBlackList.');
      return null;
    }

    List<String> artHarcAppIDs = result.item1;
    List<String> blacklist = result.item2;

    for(String blackListID in blacklist)
      artHarcAppIDs.removeWhere((id) => id == blackListID);

    for(String id in artHarcAppIDs) {
      Article? article = await ArticleHarcApp.downloadArticle(id);
      if(article == null) continue;
      allArticles.add(article);
    }

    return allArticles;
  }

  static Future<Map<String, Tuple2<String, int>>?> downloadAltCoverUrls() async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 3),
    ));

    try{

      Response response = await dio.get('https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/articles/alt_covers');

      if(response == null)
        return null;

      if(response.statusCode == HttpStatus.ok) {
        String data = response.data;
        List<String> lines = data.split('\n');

        Map<String, Tuple2<String, int>> map = {};
        for(String line in lines) {
          if(line.isEmpty) continue;
          List<String> line_parts = line.split(' ');
          String id = line_parts[0];
          String url = line_parts[1];
          int version;
          try{
            version = int.parse(line_parts[2]);
          }catch (e){
            version = 1;
          }
          map[id] = Tuple2<String, int>(url, version);
        }
        return map;
      }

      return null;

    } on DioException {
      return null;
    }

  }

  static Future<Tuple2<List<Article>, Map<String, Tuple2<String, int>>>?> _run(String? lastSeenId) async {

    Future<List<Article>?> articles = downloadAllArticles(lastSeenId: lastSeenId);

    Future<Map<String, Tuple2<String, int>>?> altCovers = downloadAltCoverUrls();

    List result = await Future.wait([articles, altCovers]);

    if(result[0] == null || result[1] == null) return null;

    return Tuple2.fromList(result);
  }

  @override
  Future<bool> run({bool awaitFinish = false, bool all=false}){
    this.all = all;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async{

    loadState = ArticleLoadState.CHECKING_NET;

    if(!await isNetworkAvailable()) {
      await callError(NoInternetError());
      loadState = ArticleLoadState.NO_NET;
      return;
    }

    loadState = ArticleLoadState.LOADING;

    Tuple2<List<Article>, Map<String, Tuple2<String, int>>>? result = await compute(_run, all?null:Article.lastSeenId);

    if(result == null){
      await callError(ArticleDownloadError());
      loadState = ArticleLoadState.FAILED;
      return;
    }

    for(Article article in result.item1)
      article.save();

    if(result.item1.isNotEmpty)
      Article.lastSeenId = result.item1[0].id;

    List<Article> articles = result.item1;
    Map<String, Tuple2<String, int>> altCoverUrls = result.item2;

    if(articles != null)
      Article.addAllToStart(articles);
    Article.altCoverUrls = altCoverUrls;
    await ArticleLoader.downloadMissingAltCovers(Article.altCoverUrls!);

    loadState = ArticleLoadState.LOADED;
  }

  static Future<void> downloadMissingAltCovers(Map<String, Tuple2<String, int>> allAltCovers) async{
    for(String id in allAltCovers.keys) {

      if(!File(getArticleCoverPath(id)).existsSync())
        continue;

      int version = Article.coverVersion(id)!;
      if(version < allAltCovers[id]!.item2)
        await Article.downloadSaveCover(
            id: id,
            url: allAltCovers[id]!.item1,
            version: allAltCovers[id]!.item2
        );
    }
  }

}

List<Article> get storedArticles{
  
  Directory dir = Directory(getArticleCoresFolderPath);
  dir.createSync(recursive: true);
  List<FileSystemEntity> fileEntities = dir.listSync();
  
  List<Article> articles = [];
  for(FileSystemEntity fileEntity in fileEntities)
    try {
      Article? article = Article.readFromPath(fileEntity.path);
      if(article != null) articles.add(article);
    } on FileNotFoundError{
      continue;
    }

  articles.sort((art1, art2) => art1.date!.isBefore(art2.date!)?1:-1);

  return articles;

}


// AUTHOR


bool authorDownloaded(String authCode) => File(getAuthorsFolderPath + authCode).existsSync();

Author readAuthor(String authCode){
  String artCode = readFileAsString(getAuthorsFolderPath + authCode);
  try{
    return Author.fromJson(authCode, artCode);
  } on Exception catch (_) {
    return Author.PROBLEM(authCode);
  }

}

Future<Author> loadAuthor(String authCode, {Function? onError}) async{

  if(authorDownloaded(authCode))
    return readAuthor(authCode);
  else
    return await downloadAuthor(authCode, onError: onError);

}

Future<Author> downloadAuthor(String authCode, {Function? onError}) async {

  Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 3),
    sendTimeout: const Duration(seconds: 3),
  ));

  try {
    Response response = await dio.get('https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/article_authors/$authCode.hrcpathr');

    if(response.statusCode == 200){

      String code = response.data;

      saveStringAsFileToFolder(getAuthorsFolderLocalPath, authCode);

      return Author.fromJson(authCode, code);
    }
    return Author.PROBLEM(authCode);
  } on DioException {
    onError?.call();
    return Author.PROBLEM(authCode);
  }
}
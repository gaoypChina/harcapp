import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Element;
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/article_get_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:html/dom.dart' as html_dom;
import 'package:html/parser.dart';
import 'package:path/path.dart';
import 'package:semaphore_plus/semaphore_plus.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed_revised/domain/atom_item.dart';
import 'package:http/http.dart' show get;
import 'package:image/image.dart' as img;

import 'common.dart';

enum ArticleSource{
  HarcApp,
  Azymut,
}

abstract class Article with SyncableParamGroupMixin, SyncGetRespNode<ArticleGetResp>{

  static Map<String, Tuple2<String, int>>? altCoverUrls;

  static List<Article>? all;
  static SplayTreeMap<String, Article>? allMap;
  static bool add(Article article){
    all ??= [];
    allMap ??= SplayTreeMap.of({});

    if(allMap![article.uniqName] != null) return false;
    all!.add(article);
    allMap![article.uniqName] = article;
    ArticleSyncData.add(article);
    return true;
  }

  static void clearAll(){
    all!.clear();
    allMap!.clear();
  }

  static addAll(List<Article> articles){
    all ??= [];
    allMap ??= SplayTreeMap.of({});

    all!.addAll(articles);
    ArticleSyncData.addAll(articles);
    for(Article? article in articles)
      allMap![article!.uniqName] = article;
  }

  static addAllToStart(List<Article> articleCores){
    all ??= [];
    allMap ??= SplayTreeMap.of({});

    for(Article article in articleCores.reversed) {
      all!.insert(0, article);
      allMap![article.uniqName] = article;
    }
  }

  static const String uniqNameSep = '@';

  static const String paramTitle = 'title';
  static const String paramTags = 'tags';
  static const String paramAuthor = 'author';
  static const String paramDate = 'date';
  static const String paramLink = 'link';

  static const String paramImage = 'image';
  static const String paramImageSource = 'image_source';
  static const String paramAuthCode = 'auth_code';

  static const String paramArtclItems = 'items';
  static const String paramOtherArtCores = 'other_art_cores';

  static const String paramLiked = 'liked';
  static const String paramBookmarked = 'bookmarked';
  static const String paramSeen = 'seen';

  String get uniqName => _typeCode + uniqNameSep + _localId;
  String get _typeCode;
  final String _localId;

  final String? title;
  final List<String>? tags;
  final DateTime? date;
  final String? author;
  String get dateString => dateToString(date, shortMonth: true, yearAbbr: 'A.D.');
  final String? link;
  final List<ArticleElement?>? articleElements;

  static Future<img.Image> _coverFromUrl(String url) async{

    var response = await get(Uri.parse(url));

    img.Image image = img.decodeImage(response.bodyBytes.buffer.asUint8List())!;

    image = img.copyResize(image, width: 1000);
    return image;
  }

  static Future<File> downloadSaveCover({
    required String id,
    required String url,
    required int version
  }) async {
    img.Image image = await compute(_coverFromUrl, url);

    File file = File(getArticleCoverPath(id));
    await file.create(recursive: true);
    await file.writeAsBytes(Uint8List.fromList(img.encodeJpg(image, quality: 70)));
    ShaPref.setInt(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_(id), version);
    return file;
  }

  static int? coverVersion(String id) => ShaPref.getInt(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_(id), 0);

  Article(
      String localId,
      {required this.title,
        required this.tags,
        required this.author,
        required this.date,
        this.link,
        required this.articleElements,
      }): assert(!localId.contains(uniqNameSep)),
        _localId = localId;

  bool get downloaded => File(getArticleCorePath(uniqName)).existsSync();
  String get imagePath => getArticleCoverPath(uniqName);

  static String? get lastSeenId => ShaPref.getStringOrNull(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID);
  static set lastSeenId(String? value){
    if(value == null)
      ShaPref.remove(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID);
    else
      ShaPref.setString(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID, value);
  }

  static Article? readFromPath(String path){
    String code = readFileAsString(path);
    String id = basename(path);

    Article? article;
    
    if(id.startsWith(ArticleHarcApp.typeCode)) 
      article = ArticleHarcApp.fromJson(id, code);
    else if(id.startsWith(ArticleAzymut.typeCode))
      article = ArticleAzymut.fromJson(id, code);

    return article;
  }

  void save(){

    Map map = {};

    map[Article.paramTitle] = title;
    map[Article.paramTags] = tags;
    map[Article.paramAuthor] = author;
    map[Article.paramDate] = date?.toIso8601String();
    map[Article.paramLink] = link;
    //map[ArticleCore.PARAM_IMAGE] = base64Decode(map[ArticleCore.PARAM_IMAGE]);
    //map[ArticleCore.PARAM_IMAGE_SOURCE] = imageSource;
    map[Article.paramArtclItems] = articleElements!.map((item) => item!.toJsonObject()).toList();
    //map[ArticleCore.PARAM_OTHER_ART_CORES] = otherCores;

    saveStringAsFile(getArticleCorePath(uniqName), jsonEncode(map));
  }

  static List<String> get bookmarkedIds => ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []);

  static List<Article> get allBookmarked{
    List<Article> result = [];
    for(String id in bookmarkedIds) {
      Article? article = Article.allMap![id];
      if (article != null) result.add(article);
    }
    return result;
  }

  bool get isBookmarked => ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []).contains(uniqName);
  void setBookmarked(bool value, {bool localOnly = false, bool synced = false}){
    List<String> ids = ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []);
    if(value) {
      if (ids.contains(uniqName)) return;
      ids.add(uniqName);
    }else{
      ids.remove(uniqName);
    }
    ShaPref.setStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, ids);
    setSingleState(
        paramBookmarked,
        synced?
        SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced
    );
    if(!localOnly) synchronizer.post();
  }

  static List<String> get allSeenIds => ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, []);

  bool get isSeen => ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, []).contains(uniqName);
  void setSeen(bool value, {bool localOnly = false, bool synced = false}){
    List<String> ids = ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, []);
    if(value) {
      if (ids.contains(uniqName)) return;
      ids.add(uniqName);
    }else{
      ids.remove(uniqName);
    }
    ShaPref.setStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, ids);
    setSingleState(
        paramSeen,
        synced?
        SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced
    );
    if(!localOnly) synchronizer.post();
  }

  static List<String> get likedIds => ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []);

  static List<Article> get allLiked{
    List<Article> result = [];
    for(String id in likedIds) {
      Article? article = Article.allMap![id];
      if (article != null) result.add(article);
    }
    return result;
  }

  bool get isLiked => ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []).contains(uniqName);
  void setLiked(bool value, {bool localOnly = false, bool synced = false}){
    List<String> ids = ShaPref.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []);
    if(value) {
      if (ids.contains(uniqName)) return;
      ids.add(uniqName);
    }else{
      ids.remove(uniqName);
    }
    ShaPref.setStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, ids);
    setSingleState(
        paramLiked,
        synced?
        SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced
    );
    if(!localOnly) synchronizer.post();
  }

  @protected
  static Future<String> downloadFile(String url) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    return utf8.decode(bytes);
  }

  static LocalSemaphore semaphore = LocalSemaphore(3);

  Future<ImageProvider?>? _loadCover();

  Future<ImageProvider?> loadCover() async{
    await semaphore.acquire();
    ImageProvider? image = await _loadCover();
    semaphore.release();
    return image;
  }

  static const syncClassId = 'article';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam get parentParam => SyncGetRespNode.articleNode;

  @override
  String get paramId => uniqName;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: paramLiked,
      value: () => isLiked,
    ),

    SyncableParamSingle(
      this,
      paramId: paramBookmarked,
      value: () => isBookmarked,
    ),

    SyncableParamSingle(
      this,
      paramId: paramSeen,
      value: () => isSeen,
    ),

  ];

  @override
  void applySyncGetResp(ArticleGetResp resp) {
    setLiked(resp.liked, localOnly: true, synced: true);
    setBookmarked(resp.bookmarked, localOnly: true, synced: true);
    setSeen(resp.seen, localOnly: true, synced: true);
  }

  @override
  int get hashCode => uniqName.hashCode;

  @override
  bool operator == (Object other) => other is Article && uniqName == other.uniqName;

}

class ArticleSyncData extends Article{

  static bool initialized = false;
  static late List<String> allUniqNames;

  static Future<void> init() async {
    Directory dir = Directory(getArticlesFolderPath);
    if(!await dir.exists()) await dir.create(recursive: true);
    List files = await dir.list().toList();

    List<String> uniqNames = [];
    for(FileSystemEntity file in files)
      uniqNames.add(basename(file.path));

    initialized = true;
    allUniqNames = uniqNames;
  }
  
  static void add(Article article) =>
    allUniqNames.add(article.uniqName);

  static void addAll(List<Article> articles) {
    for(Article article in articles)
      allUniqNames.add(article.uniqName);
  }
  static List<ArticleSyncData> get all{
    List<String> uniqNames = allUniqNames;
    List<ArticleSyncData> result = [];
    for(String uniqName in uniqNames)
      result.add(ArticleSyncData.fromUniqName(uniqName));
    return result;
  }

  @override
  final String _typeCode;
  
  ArticleSyncData(this._typeCode, super.localId):super(
    title: '',
    tags: [],
    author: '',
    date: null,
    articleElements: [],
  );

  static ArticleSyncData fromUniqName(String uniqName){
    List<String> idParts = uniqName.split(Article.uniqNameSep);
    return ArticleSyncData(idParts[0], idParts[1]);
  }

  @override
  Future<ImageProvider<Object>?>? _loadCover() => throw UnimplementedError();

}

class ArticleAzymut extends Article{

  static Future<img.Image?> _coverFromHtmlLink(String? link) async{

    try{
      String htmlFile = await Article.downloadFile(link!);

      String imageLink = htmlFile.split(
          '<meta property="og:image" content="')[1];
      imageLink = imageLink.split('" />')[0];
      imageLink = imageLink.split('"/>')[0];
      var response = await get(Uri.parse(imageLink));

      img.Image image = img.decodeImage(response.bodyBytes.buffer.asUint8List())!;

      image = img.copyResize(image, width: 1000);
      return image;
    }catch(_){
      return null;
    }
  }

  static String typeCode = 'art_azymut';
  @override
  String get _typeCode => typeCode;

  ArticleAzymut(
    String localId,
    {required String? title,
      required List<String> tags,
      required DateTime? date,
      required String? author,
      required String? link,
      required List<ArticleElement?> articleElements
  }):super(
      localId,
      title: title,
      tags: tags,
      date: date,
      author: author,
      link: link,
      articleElements: articleElements
  );

  static List<ArticleElement>? _noteToArticleElement(var node){

    if(node is html_dom.Comment) {
      if(node.data == null || node.data!.replaceAll('\n', '').isEmpty) return null;
      return [ParagraphArticleElement(text: node.data!)];
    }

    else if(node is html_dom.Text) {
      if(node.text.replaceAll('\n', '').isEmpty) return null;
      return [ParagraphArticleElement(text: node.text)];

    } else if(node is html_dom.Element) {
      if (node.localName == 'p') {
        if(node.text.replaceAll('\n', '').isEmpty) return null;
        return [ParagraphArticleElement(text: node.text)];

      }else if (node.localName!.startsWith('h')) {
        if(node.text.isEmpty) return null;
        return [HeaderArticleElement(text: node.text)];

      }else if (node.localName == 'ul') {

        List<ListItemArticleElement> result = [];
        for(var subNode in node.nodes){
          if(subNode is! html_dom.Element) continue;
          if(subNode.localName != 'li') continue;
          if(subNode.text.replaceAll('\n', '').isEmpty) continue;
          result.add(ListItemArticleElement(index: null, text: subNode.text));
        }
        return result;

      }else if (node.localName == 'ol') {

        int index = int.tryParse(node.attributes['start']??'')??1;

        List<ListItemArticleElement> result = [];
        for(var subNode in node.nodes){
          if(subNode is! html_dom.Element) continue;
          if(subNode.localName != 'li') continue;
          if(subNode.text.replaceAll('\n', '').isEmpty) continue;
          result.add(ListItemArticleElement(index: index++, text: subNode.text));
        }
        return result;

      }else if (node.localName == 'div' && node.attributes['class'] == 'wp-block-image') {

        var figureNode = node.nodes.firstWhere((subNode) =>
        subNode is html_dom.Element && subNode.localName == 'figure');

        String? imageLink;
        String? desc;
        for (var subNode in figureNode.nodes) {
          subNode as html_dom.Element;
          if (subNode.localName == 'img') imageLink = subNode.attributes['src'];
          if (subNode.localName == 'figcaption') desc = subNode.text;
        }

        if (imageLink != null)
          return [PictureArticleElement(link: imageLink, desc: desc)];
        else
          return null;

      } else
        return [CustomArticleElement(html: node.outerHtml)];

    } else
      return null;

  }

  static ArticleAzymut fromAtomItem(AtomItem item){

    List<String> tags = item.categories!.map((cat) => '#${cat.term!.toUpperCase()}').toList();

    String text = item.content!.replaceAll('<br>', '\n');

    var nodes = parse(text).nodes[0].nodes[1].nodes;
    nodes.removeWhere((node) => node is html_dom.Text && node.text.replaceAll('\n', '').isEmpty);

    try {
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
      nodes.removeLast();
    }catch(e){}

    List<ArticleElement> artElements = [];
    for(var node in nodes){
      List<ArticleElement>? elements = _noteToArticleElement(node);
      if(elements != null)
        artElements.addAll(elements);
    }

    String localId = item.id!
        .replaceAll('http://', '')
        .replaceAll('https://', '')
        .replaceAll('azymut.zhr.pl/?p=', '');

    ArticleAzymut core = ArticleAzymut(
        localId,
        title: item.title,
        tags: tags,
        author: item.authors![0].name,
        date: DateTime.tryParse(item.published!),
        link: item.links![0].href,
        articleElements: artElements,
    );

    return core;
  }

  static ArticleAzymut fromJson(String id, String code) {

    Map<String, dynamic> map = jsonDecode(code);

    final String? title = map[Article.paramTitle] as String?;
    final List<String> tags = ((map[Article.paramTags]??[]) as List).cast<String>();
    final String? author = map[Article.paramAuthor] as String?;
    final DateTime date = DateTime.parse(map[Article.paramDate] as String);
    final String? link = map[Article.paramLink] as String?;

    final Uint8List? imageBytes = map[Article.paramImage]==null?null:base64Decode(map[Article.paramImage] as String);
    final String? imageSource = map[Article.paramImageSource] as String?;
    final List<dynamic> items = map[Article.paramArtclItems] as List<dynamic>;
    final List<dynamic>? othCores = map[Article.paramOtherArtCores] as List<dynamic>?;

    //List<ArticleCore> othCores = _othCores.map((dynamic item) => ArticleCore.decode(item)).toList();

    List<ArticleElement?> articleElements = items.map((dynamic item) => ArticleElement.decode(item)).toList();

    if(articleElements.isNotEmpty)
      articleElements.removeAt(articleElements.length-1);

    return ArticleAzymut(
      id.split(Article.uniqNameSep)[1],
      title: title,
      tags: tags,
      date: date,
      link: link,
      author: author,
      //loadCover: () async => Image.memory(imageBytes).image,
      articleElements: articleElements,
      /*imageBytes,
        authCode,
        imageSource,
        dateTime,
        intro,
        articleElements,
        othCores*/
    );

  }

  @override
  Future<ImageProvider<Object>?> _loadCover() async {
    File file = File(getArticleCoverPath(uniqName));
    if(file.existsSync())
      return MemoryImage(file.readAsBytesSync());

    img.Image? image;
    if(Article.altCoverUrls != null && Article.altCoverUrls!.containsKey(uniqName)) {
      File imageFile = await Article.downloadSaveCover(
          id: uniqName,
          url: Article.altCoverUrls![uniqName]!.item1,
          version: Article.altCoverUrls![uniqName]!.item2
      );
      return MemoryImage(imageFile.readAsBytesSync());
    }
    else {
      image = await compute(_coverFromHtmlLink, link);
      if(image == null) return null;

      file.createSync(recursive: true);
      file.writeAsBytesSync(Uint8List.fromList(img.encodeJpg(image, quality: 80)));
      debugPrint('Saved article cover to ${basename(file.path)}');
      return MemoryImage(file.readAsBytesSync());
    }
  }

}

class ArticleHarcApp extends Article{

  static String typeCode = 'art_harcapp';
  @override
  String get _typeCode => typeCode;

  ArticleHarcApp(
    String localId,
    {String? title,
    List<String>? tags,
    DateTime? date,
    String? author,
    String? link,
    List<ArticleElement?>? articleElements
  }):super(
      localId,
      title: title,
      tags: tags,
      date: date,
      author: author,
      link: link,
      articleElements: articleElements
  );


  static Future<(List<String>?, List<String>?)> downloadIDsAndBlackList() async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
    ));

    try {
      Response response = await dio.get('https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/articles/.index');

      if(response.statusCode == 200){
        String data = response.data;

        List<String> parts = data.split('!!blacklist');

        List<String> artIDs = [];
        if(parts.isNotEmpty) {
          artIDs = parts[0].split('\n');
          artIDs.removeWhere((String item) => item.isEmpty);
        }

        List<String> blacklist = [];
        if(parts.length>1) {
          blacklist = parts[1].split('\n');
          blacklist.removeWhere((String item) => item.isEmpty);
        }

        return (artIDs, blacklist);
      }
    } catch (e) {}

    return (null, null);

  }

  static ArticleHarcApp fromJson(String id, String code) {

    Map<String, Object> map = jsonDecode(code);

    final String? title = map[Article.paramTitle] as String?;
    final List<String> tags = map[Article.paramTags] as List<String>;
    final String? author = map[Article.paramAuthor] as String?;
    final DateTime date = DateTime.parse(map[Article.paramDate] as String);
    final String? link = map[Article.paramLink] as String?;

    final Uint8List? imageBytes = map[Article.paramImage]==null?null:base64Decode(map[Article.paramImage] as String);
    final String? imageSource = map[Article.paramImageSource] as String?;
    //final String authCode = map[PARAM_AUTH_CODE];
    final List<dynamic> items = map[Article.paramArtclItems] as List<dynamic>;
    final List<dynamic> othCores = map[Article.paramOtherArtCores] as List<dynamic>;

    //List<ArticleCore> othCores = _othCores.map((dynamic item) => ArticleCore.decode(item)).toList();

    List<ArticleElement?> articleElements = items.map((dynamic item) => ArticleElement.decode(item)).toList();

    return ArticleHarcApp(
      id.split(Article.uniqNameSep)[1],
      title: title,
      tags: tags,
      date: date,
      author: author,
      //loadCover: () async => Image.memory(imageBytes).image,
      articleElements: articleElements,
      /*imageBytes,
        authCode,
        imageSource,
        dateTime,
        intro,
        articleElements,
        othCores*/
    );

  }

  static Future<Article?> downloadArticle(String id, {Function? onError}) async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      sendTimeout: const Duration(seconds: 3),
    ));

    try {
      Response response = await dio.get('https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/articles/$id.hrcpartcl');

      if(response.statusCode == 200){
        String articleCode = response.data;
        saveStringAsFileToFolder(getArticlesFolderPath, articleCode);
        return fromJson(id, articleCode);
      }
    }catch(e){}

    return null;
  }

  @override
  Future<ImageProvider<Object>>? _loadCover() => null;

}
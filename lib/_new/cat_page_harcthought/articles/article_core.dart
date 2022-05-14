
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:path/path.dart';
import 'package:semaphore/semaphore.dart';
import 'package:tuple/tuple.dart';
import 'package:webfeed/domain/atom_item.dart';
import 'package:webfeed/domain/rss_item.dart';
import 'package:xml/xml.dart';
import 'package:http/http.dart' show get;
import 'package:image/image.dart' as img;

import 'common.dart';

abstract class Article{

  static Map<String, Tuple2<String, int>>? altCoverUrls;

  static List<Article?>? all;
  static SplayTreeMap<String, Article?>? allMap;
  static bool add(Article article){
    if(all == null) all = [];
    if(allMap == null) allMap = SplayTreeMap.of({});

    if(allMap![article.id] != null) return false;
    all!.add(article);
    allMap![article.id] = article;
    return true;
  }

  static void clearAll(){
    all!.clear();
    allMap!.clear();
  }

  static addAll(List<Article?> articleCores){
    if(all == null) all = [];
    if(allMap == null) allMap = SplayTreeMap.of({});

    all!.addAll(articleCores);
    for(Article? article in articleCores)
      allMap![article!.id] = article;
  }

  static addAllToStart(List<Article> articleCores){
    if(all == null) all = [];
    if(allMap == null) allMap = SplayTreeMap.of({});

    for(Article article in articleCores.reversed) {
      all!.insert(0, article);
      allMap![article.id] = article;
    }
  }

  static const String ID_SEP = '@';

  static const String PARAM_TITLE = 'title';
  static const String PARAM_TAGS = 'tags';
  static const String PARAM_AUTHOR = 'author';
  static const String PARAM_DATE = 'date';
  static const String PARAM_LINK = 'link';

  static const String PARAM_IMAGE = 'image';
  static const String PARAM_IMAGE_SOURCE = 'image_source';
  static const String PARAM_AUTH_CODE = 'auth_code';

  static const String PARAM_ARTCL_ITMES = 'items';
  static const String PARAM_OTHER_ART_CORES = 'other_art_cores';

  String get id => _typeCode + ID_SEP + _localId;
  String get _typeCode;
  final String _localId;

  final String? title;
  final List<String>? tags;
  final DateTime? date;
  final String? author;
  String get dateString => dateToString(date!, shortMonth: true, yearAbbr: 'A.D.');
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
    shaPref!.setInt(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_(id), version);
    return file;
  }

  static int? coverVersion(String id) => shaPref!.getInt(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_(id), 0);

  const Article(
      this._localId,
      {required this.title,
        required this.tags,
        required this.author,
        required this.date,
        this.link,
        required this.articleElements,
      });

  bool get downloaded => File(getArticleCorePath(id)).existsSync();
  String get imagePath => getArticleCoverPath(id);

  static String get lastSeenId => shaPref!.getString(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID, null)!;
  static set lastSeenId(String value) => shaPref!.setString(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID, value);

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

    map[Article.PARAM_TITLE] = title;
    map[Article.PARAM_TAGS] = tags;
    map[Article.PARAM_AUTHOR] = author;
    map[Article.PARAM_DATE] = date!.toIso8601String();
    map[Article.PARAM_LINK] = link;
    //map[ArticleCore.PARAM_IMAGE] = base64Decode(map[ArticleCore.PARAM_IMAGE]);
    //map[ArticleCore.PARAM_IMAGE_SOURCE] = imageSource;
    map[Article.PARAM_ARTCL_ITMES] = articleElements!.map((item) => item!.toJsonObject()).toList();
    //map[ArticleCore.PARAM_OTHER_ART_CORES] = otherCores;

    saveStringAsFile(getArticleCorePath(id), jsonEncode(map));
  }

  static List<String> get bookmarkedIds => shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []);

  static List<Article?> get bookmarked => bookmarkedIds.map<Article?>((id) => Article.allMap![id]).toList();

  bool get isBookmarked => shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []).contains(id);
  set isBookmarked(bool value){
    List<String> ids = shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, []);
    if(value) {
      if (ids.contains(id)) return;
      ids.add(id);
    }else{
      ids.remove(id);
    }
    shaPref!.setStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED, ids);
  }

  static List<String> get seen => shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, []);

  bool get isSeen => shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, []).contains(id);
  set isSeen(bool value){
    List<String> ids = shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, []);
    if(value) {
      if (ids.contains(id)) return;
      ids.add(id);
    }else{
      ids.remove(id);
    }
    shaPref!.setStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN, ids);
  }

  static List<String> get likedIds => shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []);

  static List<Article?> get liked => likedIds.map<Article?>((id) => Article.allMap![id]).toList();

  bool get isLiked => shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []).contains(id);
  set isLiked(bool value){
    List<String> ids = shaPref!.getStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, []);
    if(value) {
      if (ids.contains(id)) return;
      ids.add(id);
    }else{
      ids.remove(id);
    }
    shaPref!.setStringList(ShaPref.SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED, ids);
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
  String get _typeCode => typeCode;

  ArticleAzymut(
    String _localId,
    {required String? title,
      required List<String> tags,
      required DateTime? date,
      required String? author,
      required String? link,
      required List<ArticleElement?> articleElements
  }):super(
      _localId,
      title: title,
      tags: tags,
      date: date,
      author: author,
      link: link,
      articleElements: articleElements
  );

  static String? getAttrValue(XmlElement element, String attrName){
    for (XmlAttribute attr in element.attributes) {
      if (attr.name.local == attrName)
        return attr.value;
    }
    return null;
  }

  static ArticleAzymut from(AtomItem item){

    List<String> tags = item.categories!.map((cat) => '#${cat.term!.toUpperCase()}').toList();

    String text = item.content!.replaceAll('<br>', '\n');
    text = '<wszystko>$text</wszystko>';

    XmlDocument xml = XmlDocument.parse(text);
    XmlElement mainElement = xml.children[0] as XmlElement;

    var nodes = mainElement.children;

    List<ArticleElement> artElements = [];
    for(var element in nodes){

      if(nodes.last == element)
        break;

      if(element is XmlText)
        continue;
      else if(element is XmlElement){

        if(element.name.local == 'p')
          artElements.add(Paragraph(text: element.text));

        else if(element.name.local.length == 2 && element.name.local.substring(0, 1) == 'h')
          artElements.add(Header(text: element.text));

        else if(element.name.local == 'div'){

          var attrs = element.attributes;
          for(XmlAttribute attr in attrs) {
            if (attr.value == 'wp-block-image') {
              String? imageLink;
              String? desc;
              for (XmlElement element in element.findElements('figure').first.children as Iterable<XmlElement>) {
                if (element.name.local == 'img') imageLink = getAttrValue(element, 'src');
                if (element.name.local == 'figcaption') desc = element.children[0].text;
              }
              artElements.add(Picture(link: imageLink, desc: desc));
              break;
            }
          }
        }else if(element.name.local == 'div'){

          var attrs = element.attributes;
          for(XmlAttribute attr in attrs) {
            if (attr.value == 'wp-block-image') {
              String? imageLink;
              String? desc;
              for (XmlElement element in element.findElements('figure').first.children as Iterable<XmlElement>) {
                if (element.name.local == 'img') imageLink = getAttrValue(element, 'src');
                if (element.name.local == 'figcaption') desc = element.children[0].text;
              }
              artElements.add(Picture(link: imageLink, desc: desc));
              break;
            }
          }
        } else{
          Paragraph(text: element.toXmlString());
        }
      }
    }

    String _localId = item.id!
        .replaceAll('http://', '')
        .replaceAll('https://', '')
        .replaceAll('azymut.zhr.pl/?p=', '');

    ArticleAzymut core = ArticleAzymut(
        _localId,
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

    Map<String, Object> map = jsonDecode(code);

    final String? title = map[Article.PARAM_TITLE] as String?;
    final List<String> tags = ((map[Article.PARAM_TAGS]??[]) as List).cast<String>();
    final String? author = map[Article.PARAM_AUTHOR] as String?;
    final DateTime date = DateTime.parse(map[Article.PARAM_DATE] as String);
    final String? link = map[Article.PARAM_LINK] as String?;

    final Uint8List? imageBytes = map[Article.PARAM_IMAGE]==null?null:base64Decode(map[Article.PARAM_IMAGE] as String);
    final String? imageSource = map[Article.PARAM_IMAGE_SOURCE] as String?;
    //final String authCode = map[PARAM_AUTH_CODE];
    final List<dynamic> items = map[Article.PARAM_ARTCL_ITMES] as List<dynamic>???[];
    final List<dynamic> _othCores = map[Article.PARAM_OTHER_ART_CORES] as List<dynamic>???[];

    //List<ArticleCore> othCores = _othCores.map((dynamic item) => ArticleCore.decode(item)).toList();

    List<ArticleElement?> articleElements = items.map((dynamic item) => ArticleElement.decode(item)).toList();

    if(articleElements.isNotEmpty)
      articleElements.removeAt(articleElements.length-1);

    return ArticleAzymut(
      id.split(Article.ID_SEP)[1],
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
    File file = File(getArticleCoverPath(id));
    if(file.existsSync())
      return MemoryImage(file.readAsBytesSync());

    img.Image? image;
    if(Article.altCoverUrls != null && Article.altCoverUrls!.containsKey(id)) {
      File imageFile = await Article.downloadSaveCover(
          id: id,
          url: Article.altCoverUrls![id]!.item1,
          version: Article.altCoverUrls![id]!.item2
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
  String get _typeCode => typeCode;

  ArticleHarcApp(
    String _localId,
    {String? title,
    List<String>? tags,
    DateTime? date,
    String? author,
    String? link,
    List<ArticleElement?>? articleElements
  }):super(
      _localId,
      title: title,
      tags: tags,
      date: date,
      author: author,
      link: link,
      articleElements: articleElements
  );


  static Future<Tuple2<List<String>, List<String>>?> downloadIDsAndBlackList() async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
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

        return Tuple2(artIDs, blacklist);
      }
    } catch (e) {}

    return null;

  }

  static ArticleHarcApp fromJson(String id, String code) {

    Map<String, Object> map = jsonDecode(code);

    final String? title = map[Article.PARAM_TITLE] as String?;
    final List<String> tags = map[Article.PARAM_TAGS] as List<String>???[];
    final String? author = map[Article.PARAM_AUTHOR] as String?;
    final DateTime date = DateTime.parse(map[Article.PARAM_DATE] as String);
    final String? link = map[Article.PARAM_LINK] as String?;

    final Uint8List? imageBytes = map[Article.PARAM_IMAGE]==null?null:base64Decode(map[Article.PARAM_IMAGE] as String);
    final String? imageSource = map[Article.PARAM_IMAGE_SOURCE] as String?;
    //final String authCode = map[PARAM_AUTH_CODE];
    final List<dynamic> items = map[Article.PARAM_ARTCL_ITMES] as List<dynamic>???[];
    final List<dynamic> _othCores = map[Article.PARAM_OTHER_ART_CORES] as List<dynamic>???[];

    //List<ArticleCore> othCores = _othCores.map((dynamic item) => ArticleCore.decode(item)).toList();

    List<ArticleElement?> articleElements = items.map((dynamic item) => ArticleElement.decode(item)).toList();

    return ArticleHarcApp(
      id.split(Article.ID_SEP)[1],
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
      connectTimeout: 5000,
      receiveTimeout: 3000,
      sendTimeout: 3000,
    ));

    try {
      Response response = await dio.get('https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/articles/$id.hrcpartcl');

      if(response.statusCode == 200){
        String articleCode = response.data;
        saveStringAsFileToFolder(getArticleCoresFolderPath, articleCode);
        return fromJson(id, articleCode);
      }
    }catch(e){}

    return null;
  }

  @override
  Future<ImageProvider<Object>>? _loadCover() => null;

}
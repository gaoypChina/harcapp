import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' show get;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:webfeed/domain/rss_item.dart';

import 'article_core.dart';
import 'common.dart';
import 'html_parser.dart';

enum ArticleSource{
  HarcApp,
  Azymut,
}

/*
class ArticleHarcAppCore extends ArticleCore{

  static String PARAM_ID = 'id';

  final String name;

  const ArticleHarcAppCore(this.name);

  @override
  String get id => name;

  @override
  Future<ArticleCore> downloadArticle({Function onError}) async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      sendTimeout: 3000,
    ));

    try {
      Response response = await dio.get('https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/articles/$id.hrcpartcl');

      if(response.statusCode == 200){
        String articleCode = response.data;
        saveStringAsFileToFolder(getArticlesFolderLocalPath, articleCode);
        return Article.fromJson(id, articleCode);
      }
      return Article.PROBLEM(id);
    } on DioError catch (e) {
      if (onError != null)
        onError();

      return Article.PROBLEM(id);
    }

  }

  static ArticleHarcAppCore parse(Map<String, dynamic> map) {
    return ArticleHarcAppCore(map[PARAM_ID]);
  }


}
*/

/*
class ArticleAzymutCore extends ArticleCore{

  RssItem item;

  String get title => item.title;
  String get link => item.link;
  String description;
  List<ArticleElement> articleElements;
  DateTime date;

  DateTime parseDate(String dateCode){

    List<String> elements = dateCode.split(' ');
    int day = int.parse(elements[1]);
    int month;
    switch(elements[2]){
      case 'Jan': month = 1; break;
      case 'Feb': month = 2; break;
      case 'Mar': month = 3; break;
      case 'Apr': month = 4; break;
      case 'May': month = 5; break;
      case 'Jun': month = 6; break;
      case 'Jul': month = 7; break;
      case 'Aug': month = 8; break;
      case 'Sep': month = 9; break;
      case 'Oct': month = 10; break;
      case 'Nov': month = 11; break;
      case 'Dec': month = 12; break;
      default: month = 0; break;
    }
    int year = int.parse(elements[3]);

    return DateTime(year, month=month, day=day);
  }

  ArticleAzymutCore(RssItem item){
    this.item = item;

    description = '';
    List<ArticleElement> tmpEls = HTML.parse(item.description.replaceAll(reference, '')).elements;
    for(ArticleElement element in tmpEls)
      if(element is Paragraph) this.description += element.Lk_9_28b-36$text + '\n\n';
    if(description.isNotEmpty) this.description = this.description.substring(0, this.description.length-2);

    String content = item.content.value.replaceAll(reference, '');
    HTML html = HTML.parse(content);

    html.elements.removeWhere((ArticleElement element) => element is Paragraph && element.Lk_9_28b-36$text==reference);

    this.articleElements = html.elements;

    //date = parseDate(item.pubDate);

    date = item.pubDate;

  }

  String get reference =>
      'Artykuł <a rel="nofollow" href="https://azymut.zhr.pl/${id}">${title}</a> pochodzi z serwisu <a rel="nofollow" href="https://azymut.zhr.pl">Azymut</a>.';

  Future<String> _downloadFile(String url) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    return utf8.decode(bytes);
  }

  @override
  Future<Article> downloadArticle({Function onError}) async {

    String htmlFile = await _downloadFile(link);

    String imageLink = htmlFile.split('<meta property="og:image" content="')[1];
    imageLink = imageLink.split('" />')[0];
    imageLink = imageLink.split('"/>')[0];
    var response = await get(imageLink);

    //<meta property="og:image"

    return Article(
        id,
        response.bodyBytes,
        'authCode',
        'imageSource',
        date,
        title,
        description,
        articleElements,
        [],
        startWithIntro: false,
    );
  }

  @override
  String get id => link.replaceAll('https://azymut.zhr.pl/', '').split('?')[0];


}
*/

/*
class Article{

  static const String PARAM_IMAGE = 'image';
  static const String PARAM_IMAGE_SOURCE = 'image_source';
  static const String PARAM_AUTH_CODE = 'auth_code';
  static const String PARAM_DATE = 'date';

  static const String PARAM_TITLE = 'title';
  static const String PARAM_INTRO = 'intro';

  static const String PARAM_ITEMS = 'items';
  static const String PARAM_OTHER_ART_CORES = 'other_art_cores';

  static Article PROBLEM(String id) => Article(id, null, null, null, null, null, null, null, null);

  int indexIn(List<ArticleCore> coreList){
    for(int i=0; i<coreList.length; i++) {
      ArticleCore core = coreList[i];
      if (id == core.id)
        return i;
    }
    return -1;
  }

  bool get isProblem =>
      //name==null && // CELOWO!
  imageBytes==null &&
      authCode == null &&
      imageSource == null &&
      date == null &&
      title == null &&
      intro == null &&
      items == null &&
      othCores == null;

  static const Map<int, String> month = {
    1:'stycznia',
    2:'lutego',
    3:'marca',
    4:'kwietnia',
    5:'maja',
    6:'czerwca',
    7:'lipca',
    8:'sierpnia',
    9:'września',
    10:'października',
    11:'listopada',
    12:'grudnia'
  };

  final String id;
  final Uint8List imageBytes;
  final String authCode;
  final String imageSource;
  final DateTime date;
  final String title;
  final String intro;
  final List<ArticleElement> items;
  final List<ArticleCore> othCores;
  final bool startWithIntro;

  const Article(
      this.id,
      this.imageBytes,
      this.authCode,
      this.imageSource,
      this.date,
      this.title,
      this.intro,
      this.items,
      this.othCores,
      {
        this.startWithIntro: true
      });

  String get dateString => dateToString(date, yearAbbr: 'A.D.');

  Object toJson() {

    String imageCode = imageBytes==null?
    null: base64Encode(imageBytes.toList());

    Map<String, Object> map = {
      PARAM_IMAGE: imageCode,
      PARAM_IMAGE_SOURCE: imageSource,
      PARAM_AUTH_CODE: authCode,
      PARAM_DATE: date.toIso8601String(),
      PARAM_TITLE: title,
      PARAM_INTRO: intro,
      PARAM_ITEMS: items.map((item) => item.toJson()).toList(),
      PARAM_OTHER_ART_CORES: othCores
    };

    return map;
  }

  static Article fromJson(String id, String code) {

    Map<String, Object> map = jsonDecode(code);

    final Uint8List imageBytes = map[PARAM_IMAGE]==null?null:base64Decode(map[PARAM_IMAGE]);
    final String imageSource = map[PARAM_IMAGE_SOURCE];
    final String authCode = map[PARAM_AUTH_CODE];
    final DateTime dateTime = DateTime.parse(map[PARAM_DATE]);
    final String title = map[PARAM_TITLE];
    final String intro = map[PARAM_INTRO];
    final List<dynamic> items = map[PARAM_ITEMS]??[];
    final List<dynamic> _othCores = map[PARAM_OTHER_ART_CORES]??[];

    List<ArticleCore> othCores = _othCores.map((dynamic item) => ArticleCore.decode(item)).toList();

    List<ArticleElement> articleElements = items.map((dynamic item) => ArticleElement.decode(item)).toList();

    return Article(id, imageBytes, authCode, imageSource, dateTime, title, intro, articleElements, othCores);

  }

}
*/
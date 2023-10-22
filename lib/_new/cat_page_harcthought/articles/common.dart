import 'dart:convert';
import 'dart:typed_data';

import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

const double FONT_SIZE_NORM = Dimen.TEXT_SIZE_BIG;
const double FONT_SIZE_HEIGHT = 1.5;

class Author{

  static Author PROBLEM(String authCode) => Author(authCode, null, null, null);

  bool get isProblem =>
      //authCode==null && // CELOWO!
      imageBytes == null &&
      name == null &&
      desc == null;

  final String authCode;
  final Uint8List? imageBytes;
  final String? name;
  final String? desc;

  const Author(this.authCode, this.imageBytes, this.name, this.desc);

  Object toJsonMap() {

    String? imageCode = imageBytes==null?
    null: base64Encode(imageBytes!.toList());

    Map<String, Object?> map = {
      'image': imageCode,
      'name': name,
      'desc': desc,
    };

    return map;
  }

  static Author fromJson(String authCode, String code) {

    Map<String, Object> map = jsonDecode(code);

    final Uint8List? imageBytes = map['image']==null?null:base64Decode(map['image'] as String);
    final String? name = map['name'] as String?;
    final String? desc = map['desc'] as String?;

    return Author(authCode, imageBytes, name, desc);

  }

}



abstract class ArticleElement{
  static int ID = 0;

  late int _id;

  ArticleElement(){
    _id = ID++;
  }

  dynamic toJsonObject();

  @override
  int get hashCode => _id.hashCode;

  @override
  bool operator == (other) => other is ArticleElement && other._id == _id;

  static ArticleElement? decode(dynamic object){
    try{

      if(object == null)
        return null;

      List<dynamic> parts = (object as List<dynamic>);
      if(parts[0]==ParagraphArticleElement.jsonName)
        return ParagraphArticleElement(text: parts[1]??(throw Exception()));
      else if(parts[0]==HeaderArticleElement.jsonName)
        return HeaderArticleElement(text: parts[1]??(throw Exception()));
      else if(parts[0]==ListItemArticleElement.jsonName)
        return ListItemArticleElement(index: parts[1]??(throw Exception()), text: parts[2]??(throw Exception()));
      else if(parts[0]==QuoteArticleElement.jsonName)
        return QuoteArticleElement(text: parts[1]??(throw Exception()));
      else if(parts[0]==PictureArticleElement.jsonName)
        return PictureArticleElement(link: parts[1]??(throw Exception()), desc: parts[2]);
      else if(parts[0]==YoutubeArticleElement.jsonName)
        return YoutubeArticleElement(link: parts[1]??(throw Exception()), desc: parts[2]);
      else if(parts[0]==CustomArticleElement.jsonName)
        return CustomArticleElement(html: parts[1]??(throw Exception()));
      else
        return null;

    } on Exception{
      return null;
    }
  }

  bool hasMatch(String phrase);

}

class ParagraphArticleElement extends ArticleElement{

  String text;

  ParagraphArticleElement({required this.text}):super();

  static const String jsonName = 'para';

  @override
  Object toJsonObject() => [
    jsonName,
    text
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);

}

class HeaderArticleElement extends ArticleElement{

  String text;

  HeaderArticleElement({required this.text});

  static const String jsonName = 'head';

  @override
  Object toJsonObject() => [
    jsonName,
    text
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);


}

class ListItemArticleElement extends ArticleElement{

  int? index;
  String text;

  ListItemArticleElement({required this.index, required this.text});

  static const String jsonName = 'listItem';

  @override
  Object toJsonObject() => [
    jsonName,
    index,
    text
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);


}

class QuoteArticleElement extends ArticleElement{

  String text;

  QuoteArticleElement({required this.text}):super();

  static const String jsonName = 'quote';

  @override
  Object toJsonObject() => [
    jsonName,
    text
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);

}

class PictureArticleElement extends ArticleElement{

  String link;
  String? desc;

  PictureArticleElement({required this.link, this.desc}):super();

  static const String jsonName = 'image';

  @override
  Object toJsonObject() => [
    jsonName,
    link,
    desc
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(desc??'').contains(phrase);

}

class YoutubeArticleElement extends ArticleElement{

  String link;
  String? desc;

  YoutubeArticleElement({required this.link, this.desc});

  static const String jsonName = 'youtube';

  @override
  Object toJsonObject() => [
    jsonName,
    link,
    desc
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(desc??'').contains(phrase);

}

class CustomArticleElement extends ArticleElement{

  String html;

  CustomArticleElement({required this.html});

  static const String jsonName = 'custom';

  @override
  Object toJsonObject() => [
    jsonName,
    html
  ];

  @override
  bool hasMatch(String phrase) => remPolChars(html).contains(phrase);

}

String? IMAGE_HERO_TAG(String? artName) => artName==null?null:'$artName~IMAGE';
String? TITLE_HERO_TAG(String? artName) => artName==null?null:'$artName~TITLE';
String? DATE_HERO_TAG(String? artName) => artName==null?null:'$artName~DATE';

String? FAB_HERO_TAG(String? artName) => artName==null?null:'$artName~FAB';

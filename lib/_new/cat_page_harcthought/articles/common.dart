import 'dart:convert';
import 'dart:typed_data';

import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';

const double FONT_SIZE_NORM = Dimen.TEXT_SIZE_BIG;

class Author{

  static Author PROBLEM(String authCode) => Author(authCode, null, null, null);

  bool get isProblem =>
      //authCode==null && // CELOWO!
      imageBytes == null &&
      name == null &&
      desc == null;

  final String authCode;
  final Uint8List imageBytes;
  final String name;
  final String desc;

  const Author(this.authCode, this.imageBytes, this.name, this.desc);

  Object toJsonMap() {

    String imageCode = imageBytes==null?
    null: base64Encode(imageBytes.toList());

    Map<String, Object> map = {
      'image': imageCode,
      'name': name,
      'desc': desc,
    };

    return map;
  }

  static Author fromJson(String authCode, String code) {

    Map<String, Object> map = jsonDecode(code);

    final Uint8List imageBytes = map['image']==null?null:base64Decode(map['image']);
    final String name = map['name'];
    final String desc = map['desc'];

    return Author(authCode, imageBytes, name, desc);

  }

}



abstract class ArticleElement{
  static int ID = 0;

  int _id;

  ArticleElement(){
    _id = ID++;
  }

  Object toJsonObject();

  @override
  int get hashCode => _id.hashCode;

  @override
  bool operator == (other) => other is ArticleElement && other._id == _id;

  static ArticleElement decode(Object object){
    List<String> parts = (object as List<dynamic>).cast<String>().toList();
    if(parts[0]==Paragraph.JSON_NAME)
      return Paragraph(text: parts[1]);
    else if(parts[0]==Header.JSON_NAME)
      return Header(text: parts[1]);
    else if(parts[0]==Quote.JSON_NAME)
      return Quote(text: parts[1]);
    else if(parts[0]==Picture.JSON_NAME)
      return Picture(link: parts[1], desc: parts[2]);
    else if(parts[0]==Picture.JSON_NAME)
      return Youtube(link: parts[1], desc: parts[2]);
    else
      return null;
  }

  bool hasMatch(String phrase);

}

class Header extends ArticleElement{

  String text;

  Header({this.text =''}):super();

  static const String JSON_NAME = 'head';

  @override
  Object toJsonObject(){
    return [
      JSON_NAME,
      text
    ];
  }

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);


}

class Paragraph extends ArticleElement{

  String text;

  Paragraph({this.text =''}):super();

  static const String JSON_NAME = 'para';

  @override
  Object toJsonObject(){
    return [
      JSON_NAME,
      text
    ];
  }

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);

}

class Quote extends ArticleElement{

  String text;

  Quote({this.text =''}):super();

  static const String JSON_NAME = 'quote';

  @override
  Object toJsonObject(){
    return [
      JSON_NAME,
      text
    ];
  }

  @override
  bool hasMatch(String phrase) => remPolChars(text).contains(phrase);

}

class Picture extends ArticleElement{

  String link;
  String desc;

  Picture({this.link:'', this.desc: ''}):super();

  static const String JSON_NAME = 'image';

  @override
  Object toJsonObject(){
    return [
      JSON_NAME,
      link,
      desc
    ];
  }

  @override
  bool hasMatch(String phrase) => remPolChars(desc).contains(phrase);

}

class Youtube extends ArticleElement{

  String link;
  String desc;

  Youtube({this.link:'', this.desc: ''}):super();

  static const String JSON_NAME = 'youtube';

  @override
  Object toJsonObject(){
    return [
      JSON_NAME,
      link,
      desc
    ];
  }

  @override
  bool hasMatch(String phrase) => remPolChars(desc).contains(phrase);

}

String IMAGE_HERO_TAG(String artName) => artName==null?null:(artName + '~' + 'IMAGE');
String TITLE_HERO_TAG(String artName) => artName==null?null:(artName + '~' + 'TITLE');
String DATE_HERO_TAG(String artName) => artName==null?null:(artName + '~' + 'DATE');

String FAB_HERO_TAG(String artName) => artName + '~' + 'FAB';

import 'dart:convert';
import 'dart:math';

import 'package:harcapp/_common_classes/common.dart';

import 'common.dart';


abstract class HTMLElement{

}

class HTMLParagraph extends HTMLElement{

  String data;
  HTMLParagraph(this.data);

}

class HTMLHeader extends HTMLElement{

  String data;
  HTMLHeader(this.data);

}

class HTMLQuote extends HTMLElement{

  String data;
  HTMLQuote(this.data);

}

class HTMLImage extends HTMLElement{

  String link;
  HTMLImage(this.link);

}

class HTMLUndefined extends HTMLElement{

  String data;
  HTMLUndefined(this.data);

}

class HTML{

  static RegExp matchBlock(String blockCodeRegEx){
    String endTag = r'<\/'+ blockCodeRegEx + r'>';


    return RegExp(
      r'<' + blockCodeRegEx + r'[^>]*>.*?[\n\s]*?(?=' + endTag + r')' + endTag,
      multiLine: true,
      dotAll: true,
    );

  }

  static List getBlocks(String blockCodeRegEx, String text){
    String endTag = r'<\/'+ blockCodeRegEx +'>';

    RegExp regExp = HTML.matchBlock(blockCodeRegEx);

    Iterable<String> codes = regExp.allMatches(text).map((m){

      text = m.group(0)!
          .replaceAll(RegExp(r'<' + blockCodeRegEx + r'[^>]*>'), '')
          .replaceAll(RegExp(endTag), '');

      int index = m.start;

      String encoded = jsonEncode([index, text]);
      return encoded;
    });

    List list = [];
    for(String code in codes){
      list.add(jsonDecode(code));
    }

    return list;
  }

  static List getImg(String text){
    RegExp pitcureRegEx = RegExp(
      r'((?<!<figure[^>]*>))<img src="[^"]*',
      multiLine: true,
      dotAll: true,
    );

    Iterable<String> codes = pitcureRegEx.allMatches(text).map((m){

      text = m.group(0)!.replaceAll('<img src="', '');
      int index = m.start;
      String encoded = jsonEncode([index, text]);
      return encoded;
    });

    List list = [];
    for(String code in codes){
      list.add(jsonDecode(code));
    }

    return list;
  }

  static List getYoutube(String text){
    RegExp pitcureRegEx = RegExp(
      r'<iframe src="(https://)?www.youtube.com/[^"]*',
      multiLine: true,
      dotAll: true,
    );

    Iterable<String> codes = pitcureRegEx.allMatches(text).map((m){

      text = m.group(0)!.replaceAll('<iframe src="', '');
      int index = m.start;
      String encoded = jsonEncode([index, text]);
      return encoded;
    });

    List list = [];
    for(String code in codes){
      list.add(jsonDecode(code));
    }

    return list;
  }

  static String initTextProc(String text){

    text = text.replaceAll('<br>', '\n');
    text = text.replaceAll('<strong>', '<b>');
    text = text.replaceAll('</strong>', '</b>');
    text = text.replaceAll('<em>', '<i>');
    text = text.replaceAll('</em>', '</i>');
    text = text.replaceAll('<small>', '');
    text = text.replaceAll('</small>', '');
    text = text.replaceAll('&nbsp;', '');


    text = text.replaceAllMapped(
        matchBlock('a'),
            (match){
              return match.group(0)!
                  .replaceAll(RegExp(r'<a[^>]*>'), '')
                  .replaceAll(RegExp(r'<\/a>'), '');
            }
    );

    return text;
  }

  static final RegExp regExpEmpStart = RegExp(r'^[\n\s]*');

  final List<ArticleElement> elements;

  const HTML(this.elements);

  static HTML parse(String text){
    
    List<ArticleElement> elements = [];

    text = initTextProc(text);

    text = text.replaceAllMapped(
        matchBlock('blockquote'),
            (match){
            return match.group(0)!
              .replaceAll(RegExp(r'<p[^>]*>[\s\n]*'), '')
              .replaceAll(RegExp(r'[\s\n]*<\/p>'), '');
        }
    );

    List headers = getBlocks(r'h[12]', text);
    List boldParags = getBlocks(r'h[3456789]', text);
    List paragraphs = getBlocks(r'p', text);
    List quotes = getBlocks(r'blockquote', text);
    List figures = getBlocks(r'figure', text);
    List images = getImg(text);
    List youtube = getYoutube(text);

    int iterH = 0;
    int iterBp = 0;
    int iterP = 0;
    int iterQ = 0;
    int iterFig = 0;
    int iterImg = 0;
    int iterYt = 0;

    while(
        (iterH < headers.length) ||
        (iterBp < boldParags.length) ||
        (iterP < paragraphs.length) ||
        (iterQ < quotes.length) ||
        (iterFig < figures.length) ||
        (iterImg < images.length) ||
        (iterYt < youtube.length)
    ){

      int? idxH = MAX_INT;
      String? valH;
      if(iterH < headers.length) {
        idxH = headers[iterH][0];
        valH = headers[iterH][1];
      }

      int? idxBp = MAX_INT;
      String? valBp;
      if(iterBp < boldParags.length) {
        idxBp = boldParags[iterBp][0];
        valBp = boldParags[iterBp][1];
      }

      int? idxP = MAX_INT;
      String? valP;
      if(iterP < paragraphs.length) {
        idxP = paragraphs[iterP][0];
        valP = paragraphs[iterP][1];
      }

      int? idxQ = MAX_INT;
      String? valQ;
      if(iterQ < quotes.length) {
        idxQ = quotes[iterQ][0];
        valQ = quotes[iterQ][1];
      }

      int? idxFig = MAX_INT;
      String? valFig;
      if(iterFig < figures.length) {
        idxFig = figures[iterFig][0];
        valFig = figures[iterFig][1];
      }

      int? idxImg = MAX_INT;
      String? valImg;
      if(iterImg < images.length) {
        idxImg = images[iterImg][0];
        valImg = images[iterImg][1];
      }

      int? idxYt = MAX_INT;
      String? valYt;
      if(iterYt < youtube.length) {
        idxYt = youtube[iterYt][0];
        valYt = youtube[iterYt][1];
      }

      List<int?> idxs = [idxH, idxBp, idxP, idxQ, idxFig, idxImg, idxYt];
      int? minIdx = idxs.reduce((int? num1, int? num2) => num1==null || num2==null?null:min(num1, num2));

      if(minIdx == idxH) {
        valH = valH!.replaceAll('<i>', '');
        valH = valH.replaceAll('</i>', '');
        elements.add(Header(text: valH));
        iterH++;
      }else if(minIdx == idxBp) {
        valBp = valBp!.replaceAll('<b>', '');
        valBp = valBp.replaceAll('</b>', '');
        elements.add(Paragraph(text: '<b>$valBp</b>'));
        iterBp++;
      }else if(minIdx == idxP) {

        valP = valP!.replaceAll(RegExp(r'<iframe[^>]*>[^<]*</iframe>'), '');
        valP = valP.replaceAll(RegExp(r'<iframe[^>]*>'), '');
        valP = valP.replaceAll(RegExp(r'<img[^>]*>[^<]*</img>'), '');
        valP = valP.replaceAll(RegExp(r'<img[^>]*>'), '');

        elements.add(Paragraph(text: valP));
        iterP++;
      }else if(minIdx == idxQ) {
        valQ = valQ!.replaceAll('<i>', '');
        valQ = valQ.replaceAll('</i>', '');
        elements.add(Quote(text: valQ));
        iterQ++;
      }else if(minIdx == idxFig) {

        RegExp pitcureRegEx = RegExp(
          r'<img src="[^"]*',
          multiLine: true, dotAll: true,
        );

        Iterable<String> pictureLinks = pitcureRegEx.allMatches(valFig!).map((m) =>
          m.group(0)!.replaceAll('<img src="', ''));

        RegExp figCaptionRegExp = HTML.matchBlock('figcaption');
        List<String> descriptions = figCaptionRegExp.allMatches(valFig).map((m) =>
            m.group(0)!.replaceAll('<figcaption>', '').replaceAll('</figcaption>', '')).toList();

        for(int i=0; i<descriptions.length; i++)
          descriptions[i] = descriptions[i].replaceAll('<i>', '').replaceAll('</i>', '');

        if(pictureLinks.isNotEmpty)
          elements.add(Picture(link: pictureLinks.toList()[0], desc: descriptions.isNotEmpty?descriptions[0]:''));

        iterFig++;
      }else if(minIdx == idxImg){
        if(valImg != null)
          elements.add(Picture(link: valImg));
        iterImg++;
      }
      else if(minIdx == idxYt){
        if(valYt != null)
          elements.add(Youtube(link: valYt));
        iterYt++;
      }
    }

    for(ArticleElement element in elements){
      if(element is Paragraph){
        element.text = element.text.replaceAll(RegExp(r'^[\s\n]*'), '');
        element.text = element.text.replaceAll(RegExp(r'^<b>[\s\n]*'), '<b>');
        element.text = element.text.replaceAll(RegExp(r'[\s\n]*$'), '');
        element.text = element.text.replaceAll(RegExp(r'  '), ' ');

        element.text = element.text.replaceAll(RegExp(r' \. '), '. ');

      }
      else if(element is Header){
        element.text = element.text.replaceAll(RegExp(r'^[\s\n]*'), '');
        element.text = element.text.replaceAll(RegExp(r'[\s\n]*$'), '');
        element.text = element.text.replaceAll(RegExp(r'  '), ' ');

        element.text = element.text.replaceAll(RegExp(r'<\/?b>'), '');
      }
    }

    return HTML(elements);

  }
}
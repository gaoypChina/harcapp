import 'dart:convert';
import 'dart:math';

import 'package:harcapp/_common_classes/common.dart';
import 'package:xml/xml.dart';

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

      text = m.group(0)
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

      text = m.group(0).replaceAll('<img src="', '');
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

      text = m.group(0).replaceAll('<iframe src="', '');
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
              return match.group(0)
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
            return match.group(0)
              .replaceAll(RegExp(r'<p[^>]*>[\s\n]*'), '')
              .replaceAll(RegExp(r'[\s\n]*<\/p>'), '');
        }
    );

    List headers = getBlocks(r'h[12]', text);
    List bold_parags = getBlocks(r'h[3456789]', text);
    List paragraphs = getBlocks(r'p', text);
    List quotes = getBlocks(r'blockquote', text);
    List figures = getBlocks(r'figure', text);
    List images = getImg(text);
    List youtube = getYoutube(text);

    int iter_h = 0;
    int iter_bp = 0;
    int iter_p = 0;
    int iter_q = 0;
    int iter_fig = 0;
    int iter_img = 0;
    int iter_yt = 0;

    while(
        (iter_h < headers.length) ||
        (iter_bp < bold_parags.length) ||
        (iter_p < paragraphs.length) ||
        (iter_q < quotes.length) ||
        (iter_fig < figures.length) ||
        (iter_img < images.length) ||
        (iter_yt < youtube.length)
    ){

      int idx_h = MAX_INT;
      String val_h;
      if(iter_h < headers.length) {
        idx_h = headers[iter_h][0];
        val_h = headers[iter_h][1];
      }

      int idx_bp = MAX_INT;
      String val_bp;
      if(iter_bp < bold_parags.length) {
        idx_bp = bold_parags[iter_bp][0];
        val_bp = bold_parags[iter_bp][1];
      }

      int idx_p = MAX_INT;
      String val_p;
      if(iter_p < paragraphs.length) {
        idx_p = paragraphs[iter_p][0];
        val_p = paragraphs[iter_p][1];
      }

      int idx_q = MAX_INT;
      String val_q;
      if(iter_q < quotes.length) {
        idx_q = quotes[iter_q][0];
        val_q = quotes[iter_q][1];
      }

      int idx_fig = MAX_INT;
      String val_fig;
      if(iter_fig < figures.length) {
        idx_fig = figures[iter_fig][0];
        val_fig = figures[iter_fig][1];
      }

      int idx_img = MAX_INT;
      String val_img;
      if(iter_img < images.length) {
        idx_img = images[iter_img][0];
        val_img = images[iter_img][1];
      }

      int idx_yt = MAX_INT;
      String val_yt;
      if(iter_yt < youtube.length) {
        idx_yt = youtube[iter_yt][0];
        val_yt = youtube[iter_yt][1];
      }

      List<int> idxs = [idx_h, idx_bp, idx_p, idx_q, idx_fig, idx_img, idx_yt];
      int min_idx = idxs.reduce(min);

      if(min_idx == idx_h) {
        val_h = val_h.replaceAll('<i>', '');
        val_h = val_h.replaceAll('</i>', '');
        elements.add(Header(text: val_h));
        iter_h++;
      }else if(min_idx == idx_bp) {
        val_bp = val_bp.replaceAll('<b>', '');
        val_bp = val_bp.replaceAll('</b>', '');
        elements.add(Paragraph(text: '<b>$val_bp</b>'));
        iter_bp++;
      }else if(min_idx == idx_p) {

        val_p = val_p.replaceAll(RegExp(r'<iframe[^>]*>[^<]*</iframe>'), '');
        val_p = val_p.replaceAll(RegExp(r'<iframe[^>]*>'), '');
        val_p = val_p.replaceAll(RegExp(r'<img[^>]*>[^<]*</img>'), '');
        val_p = val_p.replaceAll(RegExp(r'<img[^>]*>'), '');

        elements.add(Paragraph(text: val_p));
        iter_p++;
      }else if(min_idx == idx_q) {
        val_q = val_q.replaceAll('<i>', '');
        val_q = val_q.replaceAll('</i>', '');
        elements.add(Quote(text: val_q));
        iter_q++;
      }else if(min_idx == idx_fig) {

        RegExp pitcureRegEx = RegExp(
          r'<img src="[^"]*',
          multiLine: true, dotAll: true,
        );

        Iterable<String> pictureLinks = pitcureRegEx.allMatches(val_fig).map((m) =>
          m.group(0).replaceAll('<img src="', ''));

        RegExp figCaptionRegExp = HTML.matchBlock('figcaption');
        List<String> descriptions = figCaptionRegExp.allMatches(val_fig).map((m) =>
            m.group(0).replaceAll('<figcaption>', '').replaceAll('</figcaption>', '')).toList();

        for(int i=0; i<descriptions.length; i++)
          descriptions[i] = descriptions[i].replaceAll('<i>', '').replaceAll('</i>', '');

        if(pictureLinks.isNotEmpty)
          elements.add(Picture(link: pictureLinks.toList()[0], desc: descriptions.isNotEmpty?descriptions[0]:''));

        iter_fig++;
      }else if(min_idx == idx_img){
        elements.add(Picture(link: val_img));
        iter_img++;
      }
      else if(min_idx == idx_yt){
        elements.add(Youtube(link: val_yt));
        iter_yt++;
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
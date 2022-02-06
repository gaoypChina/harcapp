import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class RText extends StatelessWidget{

  final String text;
  final String fontFamily;
  final bool globalBold;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;
  final double height;
  final double size;
  final Color colorItalic;

  const RText(this.text, this.fontFamily, {this.globalBold: false, this.color, this.textAlign, this.maxLines, this.height: 1, this.size:Dimen.TEXT_SIZE_NORMAL, this.colorItalic});

  @override
  Widget build(BuildContext context) {

    String currentText = '';
    List<TextSpan> spans = [];
    bool italic = false;
    bool bold = false;

    Color _color = color??textEnab_(context);

    Function add = (){
      spans.add(TextSpan(
          text: currentText,
          style: CustTextStyle(
              fontFamily,
              color: italic?(colorItalic??_color):_color,
              fontWeight: (bold || globalBold)?weight.bold:weight.normal,
              fontStyle: italic?FontStyle.italic:FontStyle.normal,
              fontSize: size,
              height: height
          ),
      ));
      currentText = '';
    };

    for(int i=0; i<text.length; i++) {
      if(i+3 <= text.length && text.substring(i, i+3) == '<i>') {
        add();
        italic = true;
        i += 2;
      }else if(i+4 <= text.length && text.substring(i, i+4) == '</i>') {
        add();
        italic = false;
        i += 3;
      }else if(i+3 <= text.length && text.substring(i, i+3) == '<b>') {
        add();
        bold = true;
        i += 2;
      }else if(i+4 <= text.length && text.substring(i, i+4) == '</b>') {
        add();
        bold = false;
        i += 3;
      }else{
        currentText += text.substring(i, i+1);
        if(i == text.length-1)
          add();
      }
    }

    return Text.rich(
      TextSpan(
        children: spans,
      ),
      maxLines: maxLines,
      softWrap: true,
      textAlign: textAlign,
    );
  }

}

class AppText extends RText{

  const AppText(
  String text,
      {bool globalBold: false,
        Color color,
        TextAlign textAlign,
        int maxLines,
        double height: 1,
        double size:Dimen.TEXT_SIZE_NORMAL,
        Color colorItalic,
      }):super(
      text,
      'Ubuntu',
      globalBold: globalBold,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      height: height,
      size: size,
      colorItalic: colorItalic,
    );

}
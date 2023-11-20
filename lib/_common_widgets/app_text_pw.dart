import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.TextSpan getTextSpan(
    String text,
    PdfColor color,
    pw.Font font,
    pw.Font fontItalic,
    pw.Font fontBold,
    { bool italic = false,
      bool bold = false,
      double? size,
      double height = 1.0
    }) => pw.TextSpan(
  text: text,
  style: pw.TextStyle(
      font: font,
      fontItalic: fontItalic,
      fontBold: fontBold,
      color: color,
      fontWeight: (bold)?pw.FontWeight.bold:pw.FontWeight.normal,
      fontStyle: italic?pw.FontStyle.italic:pw.FontStyle.normal,
      fontSize: size,
      height: height
  ),
);

pw.RichText getPwRichText(
    String text,
    pw.Font font,
    pw.Font fontItalic,
    pw.Font fontBold,
    { double? size,
      double height = 1.0,
      Color color = Colors.black,

      int? maxLines,
      pw.TextAlign? textAlign
    }){

  String currentText = '';
  List<pw.TextSpan> spans = [];
  bool italic = false;
  bool bold = false;

  PdfColor pdfColor;

  pdfColor = PdfColorCmyk.fromRgb(color.red.toDouble(), color.green.toDouble(), color.blue.toDouble());

  for(int i=0; i<text.length; i++) {
    if(i+3 <= text.length && text.substring(i, i+3) == '<i>') {
      spans.add(getTextSpan(
          currentText,
          pdfColor,
          font,
          fontItalic,
          fontBold,
          italic: italic,
          bold: bold,
          size: size,
          height: height
      ));
      currentText = '';
      italic = true;
      i += 2;
    }else if(i+4 <= text.length && text.substring(i, i+4) == '</i>') {
      spans.add(getTextSpan(
          currentText,
          pdfColor,
          font,
          fontItalic,
          fontBold,
          italic: italic,
          bold: bold,
          size: size,
          height: height
      ));
      currentText = '';
      italic = false;
      i += 3;
    }else if(i+3 <= text.length && text.substring(i, i+3) == '<b>') {
      spans.add(getTextSpan(
          currentText,
          pdfColor,
          font,
          fontItalic,
          fontBold,
          italic: italic,
          bold: bold,
          size: size,
          height: height
      ));
      currentText = '';
      bold = true;
      i += 2;
    }else if(i+4 <= text.length && text.substring(i, i+4) == '</b>') {
      spans.add(getTextSpan(
          currentText,
          pdfColor,
          font,
          fontItalic,
          fontBold,
          italic: italic,
          bold: bold,
          size: size,
          height: height
      ));
      currentText = '';
      bold = false;
      i += 3;
    }else{
      currentText += text.substring(i, i+1);
      if(i == text.length-1) {
        spans.add(getTextSpan(
            currentText,
            pdfColor,
            font,
            fontItalic,
            fontBold,
            italic: italic,
            bold: bold,
            size: size,
            height: height
        ));
        currentText = '';
      }
    }
  }

  return pw.RichText(
    text: pw.TextSpan(children: spans),
    maxLines: maxLines,
    softWrap: true,
    textAlign: textAlign,
  );

}
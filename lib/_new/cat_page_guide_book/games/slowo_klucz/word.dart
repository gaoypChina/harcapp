import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/slowo_klucz/word_data.dart';

import 'common.dart';

enum CardColor{
  teamGreen,
  teamRed,
  neutral,
  kill
}

const String _greenCode = 'G';
const String _redCode = 'R';
const String _neutralCode = 'N';
const String _killCode = 'K';

const Map<CardColor, String> _colorToCodeMap = {
  CardColor.teamGreen: _greenCode,
  CardColor.teamRed: _redCode,
  CardColor.neutral: _neutralCode,
  CardColor.kill: _killCode,
};

const Map<String, CardColor> _codeToColorMap = {
  _greenCode: CardColor.teamGreen,
  _redCode: CardColor.teamRed,
  _neutralCode: CardColor.neutral,
  _killCode: CardColor.kill,
};

class Word{

  static const String interalCodeSeparator = ':';
  static const String exteralCodeSeparator = ';';
  
  final WordData data;
  final CardColor cardColor;
  bool checked;
  
  Word(this.data, this.cardColor, {this.checked = false});
  
  String toCode(){
    String wordCode = WordData.all.indexOf(data).toString();
    String colorCode = _colorToCodeMap[cardColor];
    return '$wordCode$interalCodeSeparator$colorCode';
  }

  static Word fromCode(String code){

    List<String> elements = code.split(interalCodeSeparator);

    WordData data = WordData.all[int.parse(elements[0])];
    CardColor cardColor = _codeToColorMap[elements[1]];
    return Word(data, cardColor);
  }

  Map<String, dynamic> toInstanceMap(){

    return {
      'wordData': WordData.all.indexOf(data),
      'color': _colorToCodeMap[cardColor],
      'state': checked
    };
    
  }

  static Word fromInstanceMap(Map map){

    WordData data = WordData.all[map['wordData']];
    CardColor cardColor = _codeToColorMap[map['color']];
    bool state = map['state'];
    
    return Word(data, cardColor, checked: state);
    
  }
  
  Color get color{
    switch(cardColor){
      case CardColor.teamGreen:
        return GREEN_COLOR;
      case CardColor.teamRed:
        return RED_COLOR;
      case CardColor.neutral:
        return NEUTRAL_COLOR;
      case CardColor.kill:
        return BLACK_COLOR;
      default:
        return Colors.pink;
    }
  }
  
}
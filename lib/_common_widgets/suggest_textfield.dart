import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_common_widgets/search_field.dart';

class SuggestTextField extends StatelessWidget{

  final Widget textField;
  final Widget childBelow;
  final Widget suggestionElemets;

  final bool showSuggestion;

  const SuggestTextField({@required this.textField, @required this.childBelow, @required this.suggestionElemets, @required this.showSuggestion});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
          child: childBelow,
          padding: EdgeInsets.only(top: SearchField.height)),
      Padding(
        child: Blur(
            child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: showSuggestion?1:0,
                child: showSuggestion?suggestionElemets:Container()
            )
        ),
        padding: EdgeInsets.only(top: SearchField.height),
      ),
      textField,
    ]);
  }

}
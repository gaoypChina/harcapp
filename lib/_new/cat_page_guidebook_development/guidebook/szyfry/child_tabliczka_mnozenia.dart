import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/regex_input_formatter.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

Map<String, String> lettersMap = {
  'A': '1x1',
  'B': '1x2',
  'C': '1x3',
  'D': '1x4',
  'E': '1x5',
  'F': '2x1',
  'G': '2x2',
  'H': '2x3',
  'I': '2x4',
  'J': '2x5',
  'K': '3x1',
  'L': '3x2',
  'M': '3x3',
  'N': '3x4',
  'O': '3x5',
  'P': '4x1',
  'R': '4x2',
  'S': '4x3',
  'T': '4x4',
  'U': '4x5',
  'W': '5x1',
  'Y': '5x2',
  'Z': '5x3',
  ' ':'-'
};
Map<String?, String>? reversedLettersMap;

class ChildTabliczkaMnozenia extends StatefulWidget {

  const ChildTabliczkaMnozenia({super.key});

  @override
  State<StatefulWidget> createState() {
    return ChildTabliczkaMnozeniaState();
  }
}

class ChildTabliczkaMnozeniaState extends State<ChildTabliczkaMnozenia>
    with AutomaticKeepAliveClientMixin<ChildTabliczkaMnozenia> {
  @override
  bool get wantKeepAlive => true;

  static final GlobalKey _keyFindCode = GlobalKey();
  
  late String output;

  late TextInputFormatter dozwoloneZnaki;

  @override
  void initState() {
    output = '';
    reversedLettersMap = {};
    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpQqRrSsŚśTtUuVvWwXxYyZzŹźŻż 0-9]*');

    for(String key in lettersMap.keys){
      reversedLettersMap![lettersMap[key]] = key;
    }

    print(reversedLettersMap);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: AppCard(
              elevation: AppCard.bigElevation,
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  dozwoloneZnaki,
                  RegExInputFormatter.withRegex(r'^(?! ).*'), // no ' ' at beginning
                  RegExInputFormatter.withRegex(r'^((?!  ).)*$'), // no '  '
                ],
                onChanged: (input) => setState((){
                  print(isKomorkowy(input));
                  if(input.isEmpty){
                    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpRrSsŚśTtUuVvWwXxYyZzŹźŻż0-9 ]*');
                    output = '';
                  } else if(isKomorkowy(input)){
                    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[0-9X\- ]*');
                    output = generateLatin(input);
                  }else{
                    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpRrSsŚśTtUuVvWwXxYyZzŹźŻż ]*');
                    output = generateKomorkowy(input);
                  }
                }),
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Wpisz wiadomość',
                    hintStyle: AppTextStyle(
                        color: hintEnab_(context),
                        fontSize: Dimen.TEXT_SIZE_BIG),
                    border: InputBorder.none),
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: AppCard.defPadding,
                child: SelectableText(
                    output.isEmpty ? 'Zmieniona wiadomość' : output,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                    )
                ),
              )
          ),
        ]
    );
  }

  String generateKomorkowy(String input) {
    String output = '';
    input = remPolChars(input).toUpperCase();
    for (int i = 0; i < input.length; i++) {
      String letter = input.substring(i, i + 1);
      String? match = lettersMap[letter];
      output += '${match ?? '?'} ';
    }

    return output;
  }

  String generateLatin(String input) {
    String output = '';
    input = input.toLowerCase();
    RegExp regExp = RegExp(r'[\w-]+');
    final matches = regExp.allMatches(input);
    for (Match match in matches) {
      String? letter = reversedLettersMap![match.group(0)];
      output += letter ?? '?';
    }

    return output;
  }

  bool isKomorkowy(String input){
    RegExp regexp = RegExp(r'(?:(?:[0-9]+X[0-9]+ ?)*(?:-? )?)*');
    final matches = regexp.allMatches(input);
    for(Match match in matches){
      if(match.start == 0 && match.end == input.length) return true;
    }
    return false;
  }
}
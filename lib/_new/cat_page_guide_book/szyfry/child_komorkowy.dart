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
  'A': '2',
  'B': '22',
  'C': '222',
  'D': '3',
  'E': '33',
  'F': '333',
  'G': '4',
  'H': '44',
  'I': '444',
  'J': '5',
  'K': '55',
  'L': '555',
  'M': '6',
  'N': '66',
  'O': '666',
  'P': '7',
  'Q': '77',
  'R': '777',
  'S': '7777',
  'T': '8',
  'U': '88',
  'V': '888',
  'W': '9',
  'X': '99',
  'Y': '999',
  'Z': '9999'
};
Map<String?, String>? reversedLettersMap;

class ChildKomorkowy extends StatefulWidget {

  const ChildKomorkowy();

  @override
  State<StatefulWidget> createState() {
    return ChildKomorkowyState();
  }
}

class ChildKomorkowyState extends State<ChildKomorkowy>
    with AutomaticKeepAliveClientMixin<ChildKomorkowy> {
  @override
  bool get wantKeepAlive => true;
  
  late String output;

  TextInputType? typKlawiatury;
  late TextInputFormatter dozwoloneZnaki;

  @override
  void initState() {
    output = '';
    reversedLettersMap = {};
    typKlawiatury = TextInputType.text;
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
                keyboardType: typKlawiatury,
                inputFormatters: [
                  UpperCaseTextFormatter(),
                  dozwoloneZnaki,
                  RegExInputFormatter.withRegex(r'^(?! ).*'), // no ' ' at beginning
                  RegExInputFormatter.withRegex(r'^((?!  ).)*$'), // no '  '
                ],
                onChanged: (input) => setState((){
                	input = remPolChars(input);
                  if(input.length == 0){
                    typKlawiatury = TextInputType.text;
                    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpQqRrSsŚśTtUuVvWwXxYyZzŹźŻż0-9 ]*');
                    output = '';
                  } else if(isKomorkowy(input)){
                    typKlawiatury = TextInputType.phone;
                    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[0-9 ]*');
                    output = generateLatin(input);
                  }else{
                    typKlawiatury = TextInputType.text;
                    dozwoloneZnaki =  RegExInputFormatter.withRegex(r'[AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpQqRrSsŚśTtUuVvWwXxYyZzŹźŻż]*');
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
                    output.length == 0 ? 'Zmieniona wiadomość' : output,
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
    input = input.toUpperCase();
    for (int i = 0; i < input.length; i++) {
      String letter = input.substring(i, i + 1);
      output += lettersMap[letter]! + ' ';
    }

    return output;
  }

  String generateLatin(String input) {
    String output = '';
    RegExp regExp = RegExp(r'\w+');
    final matches = regExp.allMatches(input);
    for (Match match in matches) {
      String? letter = reversedLettersMap![match.group(0)];
      output += letter!=null ? letter : '?';
    }

    return output;
  }

  bool isKomorkowy(String input){
    RegExp _regexp = RegExp(r'[0-9 ]*');
    final matches = _regexp.allMatches(input);
    for(Match match in matches){
      if(match.start == 0 && match.end == input.length) return true;
    }
    return false;
  }
}
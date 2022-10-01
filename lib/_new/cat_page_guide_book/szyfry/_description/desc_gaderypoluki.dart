import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';

class DescGaderypoluki extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            AppText(
              'Szyfry z grupy <b>GA-DE-RY-PO-LU-KI</b> polegają na użyciu klucza o parzystej liczbie liter do zaszyfrowania wiadomości.'
                  '\n\nKlucz dzielony jest na zbiór par kolejnych liter, następnie każdej literze szyfrowanej wiadomości przypisywana jest odpowiadająca litera z pary. Jeżeli szyfrowana litera nie występuje w kluczu, nie jest zmieniana.'
                  '\n\nPrzykład szyfrowania słowa <b>H A R C E R Z</b>.',
              size: Dimen.TEXT_SIZE_BIG,
            ),
            Row(
              children: <Widget>[
                AppText(
                  '\n<b>H</b> - nie występuje w kluczu'
                      '\n<b>A</b> - w kluczu w parze z G'
                      '\n<b>R</b> - w kluczu w parze z Y,'
                      '\n<b>C</b> - nie występuje w kluczu,'
                      '\n<b>E</b> - w kluczu w parze z D,'
                      '\n<b>R</b> - w kluczu w parze z Y,'
                      '\n<b>Z</b> - nie występuje w kluczu,',
                  size: Dimen.TEXT_SIZE_BIG,
                ),
                SizedBox(width: Dimen.defMarg),
                AppText(
                  '\n-> <b>H</b>,'
                      '\n-> <b>G</b>,'
                      '\n-> <b>Y</b>,'
                      '\n-> <b>C</b>,'
                      '\n-> <b>D</b>,'
                      '\n-> <b>Y</b>,'
                      '\n-> <b>Z</b>',
                  size: Dimen.TEXT_SIZE_BIG,
                )
              ],
            ),
            AppText('\n\nPo zaszyfrowaniu: <b>H G Y C D Y Z</b>.',
              size: Dimen.TEXT_SIZE_BIG,
            )
          ],
        )
      ],
    );
  }

}
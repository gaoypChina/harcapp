import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class HowToPytajki extends StatelessWidget{

  const HowToPytajki();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        AppText('<b>Liczba graczy:</b> od 2, najlepiej członkowie rodziny.'),
        SizedBox(height: 18.0,),
        AppText('<b>Wiek graczy:</b> od 5 lat.'),
        SizedBox(height: 18.0,),
        AppText('<b>Cel gry:</b>'),
        SizedBox(height: 6.0,),
        AppText(
          '    • budowanie wzajemnych relacji w rodzinie,'
              '\n    • integracja najbliższych,'
              '\n    • rozmawianie o emocjach w przyjaznej atmosferze,'
              '\n    • rozwijanie rozumienia i przeżywania emocji w rodzinie.',
        ),

        SizedBox(height: 18.0,),
        AppText('<b>Przebieg gry:</b>'),
        SizedBox(height: 6.0,),
        AppText('Usiądźcie w kole, tak by każdy widział się nawzajem. Gracze po kolei obracają karty, by odczytać na głos pytanie (jeśli gracz nie umie jeszcze czytać, prosi kogoś o przeczytanie). Następnie gracz odpowiada na pytanie (lub wykonuje zaproponowaną w karcie czynność).'
            '\n\nW wyjątkowych sytuacjach – kiedy gracz stwierdzi, że pytanie jest zbyt trudne, można odłożyć ja na bok (przesuwając kartę na lewo). Zaleca się wtedy, by wrócić do tego pytania po zakończeniu gry w mniejszym gronie (np. w rozmowie z siostrą, mamą, mężem, synem itp.).'
          //'\n\nNiektóre karty zawierają polecenie <i>"Wylosuj minkę. Jakie to uczucie?"</i>. Wówczas należy wylosować minkę, nazwać uczucie, a następnie wykonać zadanie.'
        ),

        SizedBox(height: 18.0,),
        AppText('<b>Mechanika gry:</b>'),
        SizedBox(height: 6.0,),
        AppText(
            '    • dotknij kartę, by ją odwrócić,'
                '\n    • przeciągnij kartę w lewo, by odłożyć ją na później,'
                '\n    • przeciągnij kartę w prawo, by przejść do kolejnej.'
        ),
        SizedBox(height: 24.0,),

        AppText('<b>Miłej zabawy!</b>'),

        SizedBox(height: 18.0,),
        Text('Grafika kart i emotikon: freepik.com', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: hintEnab_(context)),),

        SizedBox(height: 6.0,),
        Text('Gra na podstawie gry "Pytaki" Aleksandry Sulej, wydawnictwa DOBRETO', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: hintEnab_(context)),),

      ],
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class HowToPytajki extends StatelessWidget{

  const HowToPytajki();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        const AppText('<b>Liczba graczy:</b> od 2, najlepiej członkowie rodziny.'),
        const SizedBox(height: 18.0,),
        const AppText('<b>Wiek graczy:</b> od 5 lat.'),
        const SizedBox(height: 18.0,),
        const AppText('<b>Cel gry:</b>'),
        const SizedBox(height: 6.0,),
        const AppText(
          '    • budowanie wzajemnych relacji w rodzinie,'
              '\n    • integracja najbliższych,'
              '\n    • rozmawianie o emocjach w przyjaznej atmosferze,'
              '\n    • rozwijanie rozumienia i przeżywania emocji w rodzinie.',
        ),

        const SizedBox(height: 18.0,),
        const AppText('<b>Przebieg gry:</b>'),
        const SizedBox(height: 6.0,),
        const AppText('Usiądźcie w kole, tak by każdy widział się nawzajem. Gracze po kolei obracają karty, by odczytać na głos pytanie (jeśli gracz nie umie jeszcze czytać, prosi kogoś o przeczytanie). Następnie gracz odpowiada na pytanie (lub wykonuje zaproponowaną w karcie czynność).'
            '\n\nW wyjątkowych sytuacjach – kiedy gracz stwierdzi, że pytanie jest zbyt trudne, można odłożyć ja na bok (przesuwając kartę na lewo). Zaleca się wtedy, by wrócić do tego pytania po zakończeniu gry w mniejszym gronie (np. w rozmowie z siostrą, mamą, mężem, synem itp.).'
          //'\n\nNiektóre karty zawierają polecenie <i>"Wylosuj minkę. Jakie to uczucie?"</i>. Wówczas należy wylosować minkę, nazwać uczucie, a następnie wykonać zadanie.'
        ),

        const SizedBox(height: 18.0,),
        const AppText('<b>Mechanika gry:</b>'),
        const SizedBox(height: 6.0,),
        const AppText(
            '    • dotknij kartę, by ją odwrócić,'
                '\n    • przeciągnij kartę w lewo, by odłożyć ją na później,'
                '\n    • przeciągnij kartę w prawo, by przejść do kolejnej.'
        ),
        const SizedBox(height: 24.0,),

        const AppText('<b>Miłej zabawy!</b>'),

        const SizedBox(height: 18.0,),
        Text('Grafika kart i emotikon: freepik.com', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: hintEnab_(context)),),

        const SizedBox(height: 6.0,),
        Text('Gra na podstawie gry "Pytaki" Aleksandry Sulej, wydawnictwa DOBRETO', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: hintEnab_(context)),),

      ],
    );
  }

}
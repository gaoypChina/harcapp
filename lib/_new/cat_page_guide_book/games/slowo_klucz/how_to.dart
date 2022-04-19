import 'package:flutter/cupertino.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class HowToSlowoKlucz extends StatelessWidget{


  const HowToSlowoKlucz();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        AppText('<b>Liczba graczy:</b> od 6, (od biedy można od 4 osób).'),
        SizedBox(height: 18.0,),
        AppText('<b>Wiek graczy:</b> od 12 lat.'),
        SizedBox(height: 18.0,),
        AppText('<b>Cel gry:</b>'),
        SizedBox(height: 6.0,),
        AppText(
          '    • rozwijanie abstrakcyjnego myślenia,'
              '\n    • rozwijanie słownictwa,'
              '\n    • rozwijanie wzajemnego zrozumienia.'
        ),

        SizedBox(height: 18.0,),

        AppText('<b>Rozpoczęcie gry:</b>'),
        SizedBox(height: 6.0,),
        AppText('Podzielcie się na dwie drużyny. W każdej drużynie wybierzcie po jednej osobie - wodza. Wodzowie będą korzystali z jednego telefonu, pozostali gracze z drugiego telefonu.'
            '\n\n<b>Gracze</b> na swoim telefonie wybierają opcję <i>"Plansza graczy"</i>. Na ekranie pojawi się QR-kod, który należy na chwilę pozostawić.'
            '\n'
            '\nRównolegle <b>wodzowie</b> ustalają, która drużyna będzie "zielona", która zaś "czerwona". Następnie na swoim telefonie wybierają opcję <i>"Plansza wodzów"</i>, po czym skanują QR-kod z telefonu graczy.'
            '\n'
            '\nNa tym etapie na obu telefonach plansze sobie odpowiadają.'),

        SizedBox(height: 18.0,),
        AppText('<b>Przebieg gry:</b>'),
        SizedBox(height: 6.0,),
        AppText(
            'Wodzowie widzą przed sobą planszę, na której karty podzielone są na cztery kolory:'
            '\n• zielone (8 lub 9 kart),'
            '\n• czerwone (8 lub 9 kart),'
            '\n• czarne (1 karta),'
            '\n• kremowe (7 kart).'
            '\n'
            '\nGra toczy się w turach. Zaczyna drużyna, która na planszy wodzów ma do odkrycia więcej kart. Każda tura składa się z dwóch etapów:'
            '\n• Etap 1: Podanie hasła przez wodza,'
            '\n• Etap 2: Zaznaczenie kart przez drużynę wodza.'
            '\n'
            '\nEtap 1:'
            '\n'
            '\nZadaniem wodza jest podać hasło składające się z <b>jednego słowa</b> oraz <b>jednej liczby</b>:'
            '\n'
            '\n• <b>Słowo</b> podane w haśle powinno pozwolić drużynie wodza zaznaczyć na planszy graczy część kart, które na planszy wodza oznaczone są kolorem jego drużyny.'
            '\n'
            '\n• <b>Liczba</b> podana w haśle oznacza liczbę kart, które wódz skojarzył z podanym w haśle słowem.'
            '\n'
            '\nEtap 2:'
            '\n'
            '\nDrużyna po naradzie wybiera kolejno karty, które według nich wódz miał na myśli. Wybranie karty odbywa się poprzez jej dotknięcie na planszy graczy - po dotknięciu karta obraca się ukazując swój kolor.'
            '\n'
            '\nJeżeli karta wybrana przez drużynę odpowiada jej kolorowi, drużyna może zaznaczyć kolejną kartę z planszy.'
            '\n'
            '\nJeżeli karta wybrana przez drużynę nie odpowiada jej kolorowi, tura kończy się i przechodzi do drużyny przeciwnej.'
            '\n'
            '\nJeżeli karta wybrana przez drużynę jest czarna, drużyna przegrywa.'
            '\n'
            '\nKażda drużyna może w każdym momencie zakończyć swoją turę. Drużyna, która jako pierwsza zaznaczy wszystkie karty swojego koloru wygrywa.'
            '\n'
            '\nWodzowie nie mogą w żaden sposób komunikować ani sygnalizować niczego poza hasłami do drużyn.'
        ),

        SizedBox(height: 24.0,),

        AppText('<b>Miłej zabawy!</b>'),

        SizedBox(height: 18.0,),
        Text('Grafika: freepik.com (Freepik)', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: hintEnab_(context)),),

      ],
    );
  }

}
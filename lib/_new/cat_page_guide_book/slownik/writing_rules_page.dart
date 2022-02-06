import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class WritingRulesPage extends StatelessWidget{

  static double innerSeparator = 10.0;
  static double outerSeparator = 26.0;
  static double headerSeparatorUp = 36.0;
  static double headerSeparatorDown = 24.0;

  static TextStyle _headerStyle(BuildContext context) => AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold);

  static double textStyleFontSize = Dimen.TEXT_SIZE_BIG;
  static TextStyle _textStyle = AppTextStyle(fontSize: textStyleFontSize);

  static double exampleStyleFontSize = Dimen.TEXT_SIZE_BIG;
  static Color exampleStyleColor(BuildContext context) => Colors.deepOrange;
  static FontStyle exampleFontStyle = FontStyle.italic;
  static TextStyle _egzampleStyle(BuildContext context) => AppTextStyle(fontSize: exampleStyleFontSize, color: exampleStyleColor(context), fontStyle: exampleFontStyle);


  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              title: Text('Zasady harcerskiej pisowni'),
              centerTitle: true,
              backgroundColor: background_(context),
              floating: true,
            ),

            SliverPadding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Header('Pisownia nazw harcerskich jednostek'),

                    Item(
                      'Chorągiew, okręg, hufiec, namiestnictwo, komisja stopni instruktorskich, kapituła stopni wędrowniczych, związek drużyn, szczep – piszemy <b>wielką literą</b>, tylko jeśli mowa o konkretnej jednostce.',
                      [
                        'Wszędzie dobrze, ale w <b>Chorągwi</b> Śląskiej najlepiej,',
                        'Spotkanie namiestnictwa <b>Hufca</b> ZHP Białystok,',
                        'Jestem z <b>Hufca</b> Warszawa-Praga-Południe.'
                      ],
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                      'Jeśli wymieniamy jednostki, słowa „chorągiew”, „hufiec”, „związek drużyn”, „szczep” piszemy <b>małą literą</b>, a nazwy <b>wielką</b>,',
                      [
                        'Udział wzięły <b>chorągwie</b>: <b>Mazowiecka</b>, <b>Warmińsko-Mazurska</b>, <b>Ziemi Lubuskiej</b>.'
                      ],
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                      'Jeśli używamy słowa „chorągiew”, „hufiec”, „drużyna” itp., pisząc w domyśle o konkretnej jednostce, ale nie wymieniając jej nazwy, to piszemy <b>małą literą</b>',
                      [
                        'Nasza <b>chorągiew</b> jest po prostu kozacka.',
                        'W naszym <b>hufcu</b> wybraliśmy wczoraj nowego komendanta.'
                      ],
                    ),

                    Header('Pisownia nazw władz'),

                    Item(
                      'Komisje rewizyjne, sądy harcerskie, komendy – piszemy <b>wielkimi literami</b>, jeśli mowa o konkretnej władzy',
                      [
                        'Centralna Komisja Rewizyjna ZHP.',
                        'Komisja Rewizyjna Chorągwi Krakowskiej ZHP.',
                        'Sąd Harcerski Hufca ZHP Warszawa-Wola.',
                        'Komenda Hufca ZHP Gdańsk-Śródmieście.',
                      ],
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                      'O konkretnej władzy, ale nie wymieniając jej nazwy, piszemy <b>małymi literami</b>',
                      [
                        'Wczoraj <b>komisja rewizyjna</b> stwierdziła uchybienia.',
                        'Powołano <b>sąd harcerski</b>.',
                      ],
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                        'Skrótowce nazw władz piszemy zawsze <b>wielkimi literami</b>',
                        [
                          'KSI',
                          'KH',
                          'KCh (nie KCH)'
                        ]
                    ),

                    Header('Pisownia nazw wydziałów, komisji i innych zespołów'),

                    Item(
                        'Pełne nazwy wydziałów GK ZHP, zespołów, inspektoratów, komisji RN ZHP – piszemy <b>wielkimi literami</b> (z wyjątkiem przyimków i spójników)',
                        [
                          '<b>Wydział Zagraniczny GK ZHP</b>',
                          '<b>Wydział Pracy z Kadrą GK ZHP</b>',
                          '<b>Biuro Głównej Kwatery ZHP</b>',
                          '<b>Centralna Szkoła Instruktorska ZHP</b>',
                          '<b>Zespół Harcmistrzowski</b>',
                          '<b>Komisja ds. Społecznych Rady Naczelnej ZHP</b>',
                          '<b>Harcerska Szkoła Ratownictwa</b>'
                        ]
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                        'Powyższa zasada dotyczy również pełnych nazw jednostek, zespołów, referatów, komisji w chorągwiach i hufcach',
                        [
                          '<b>Namiestnictwo Harcerskie Hufca ZHP Pruszków</b>',
                          '<b>Referat Wędrowniczy Chorągwi Łódzkiej ZHP</b>',
                          '<b>Chorągwiana Szkoła Instruktorska „Iluminacja”</b>'
                        ]
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                        'O konkretnym wydziale, zespole itd., ale nie wymieniając jego nazwy, piszemy <b>małymi literami</b>',
                        [
                          'Trzy dni temu <b>inspektorat</b> przeprowadził szkolenie,',
                          'Powołano właśnie <b>komisję stopni instruktorskich<b>.'
                        ]
                    ),

                    SizedBox(height: outerSeparator),

                    Item(
                        'Skrótowce nazw jednostek piszemy zawsze <b>wielkimi literami</b>, a litery oznaczające przyimek lub spójnik – małą literą',
                        [
                          '<b>WPzK</b>',
                          '<b>CSI</b>',
                          '<b>HSR</b>'
                        ]
                    ),

                    Header('Pisownia nazw funkcji'),

                    Item(
                        'Zasada ogólna: formę męską możemy stosować w odniesieniu do osób niezależnie od ich płci. W przypadku funkcji pełnionych przez kobiety, można stosować formy żeńskie.',
                        [
                          'Marysia jest najlepszym komendantem szczepu od lat!',
                          'W nowej drużynie koedukacyjnej mamy trzydziestu harcerzy. Dokładnie: dwanaście dziewczyn i osiemnastu chłopaków.',
                          'Dziś zostałem mianowany drużynowym w rozkazie komendanta hufca.',
                          'Myślę, że Paulina byłaby dobrą zastępową.',
                          'Michał został drużynowym męskiej drużyny harcerzy.'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Funkcje pełnione przez jedną osobę (bez nazwisk i z nazwiskami) piszemy <b>małymi literami</b>.',
                        [
                          'Dziś w południe <b>prezydent RP</b> wręczy...',
                          'Po raz kolejny <b>przewodniczący ZHP</b> spotkał się z...',
                          'Obecny był także <b>prezydent RP</b> Andrzej Duda;',
                          'Nowowybrany <b>przewodniczący ZHP</b> hm. Dariusz Supeł',
                          'Wczoraj zakończyły się wybory <b>naczelniczka ZHP</b>.'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Inne funkcje piszemy <b>małymi literami<b>.',
                        [
                          '(...) drużynowy',
                          '(...) szczepowy',
                          '(...) namiestnik',
                          '(...) kierownik',
                          '(...) zastępca kierownika',
                          '(...) zastępczyni kierownika',
                          '(...) zastępczyni naczelnika ZHP.'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Jeśli piszemy niepełną nazwę funkcji (bez ZHP), jako wyraz pospolity – też używamy <b>małej litery</b>.',
                        [
                          '(...) <b>przewodniczący</b> spotkał się z...',
                          '(...) <b>naczelniczka</b> wręczyła wyróżnienia',
                          '(...) <b>komendantka hufca</b> przywitała gości.'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Jednoosobowe funkcje władz ZHP (przewodniczący ZHP, naczelnik ZHP, komendant chorągwi, komendant hufca) pisze się <b>wielką literą</b> w aktach prawnych.',
                        [
                          'Zjazd zwykły ZHP wybiera <b>Naczelnika ZHP</b>'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Jednoosobowe funkcje (władz ZHP i nieharcerskie) można zapisać <b>wielkimi literami</b> również w innych tekstach, pod warunkiem że nazwa taka odnosi się do konkretnej osoby i występuje w pełnym brzmieniu',
                        [
                          '<b>Prezydent Rzeczypospolitej Polskiej</b> wręczył...'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        '<b>Wielkimi literami</b> piszemy nazwy funkcji ze względów grzecznościowych (np. w pismach)',
                        [
                          'Szanowny <b>Panie Burmistrzu</b>',
                          '<b>Druhu Komendancie</b>'
                        ]
                    ),

                    Header('Pisownia terminów: Prawo Harcerskie, Prawo Zucha, Obietnica Zucha itp.'),

                    Item(
                        '<b>Wielkimi literami</b> piszemy:',
                        [
                          '(...) <b>Obietnica Zucha</b>',
                          '(...) <b>Prawo Zucha</b>',
                          '(...) <b>Przyrzeczenie Harcerskie</b>',
                          '(...) <b>Prawo Harcerskie</b>',
                          '(...) <b>Zobowiązanie Instruktorskie</b>'
                        ]
                    ),

                    Header('Pisownia nazw stopni'),

                    Item(
                        'Nazwy stopni piszemy <b>małą literą</b>.',
                        [
                          '(...) <b>zuch ochoczy</b>',
                          '(...) <b>ćwik</b>',
                          '(...) <b>samarytanka</b>',
                          '(...) <b>harcerz orli</b>',
                          '(...) <b>harcerka Rzeczypospolitej</b>',
                          '(...) <b>przewodnik</b>',
                          '(...) <b>harcmistrz</b>'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Skróty nazw stopni piszemy, podobnie jak inne skróty, np. tytułów naukowych, zgodnie z zasadami ortografii, czyli jeśli ostatnią literą skrótu nie jest ostatnia litera słowa – stawiamy kropkę.',
                        [
                          'hm.',
                          'phm.',
                          'pwd.',
                          'sam.',
                          'HO',
                          'HR'
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Na tej samej zasadzie piszemy: druhna, druhnie, druha, druhowi – skrót dh., ale druh – skrót dh (bez kropki)',
                        [
                          'Przyznaję stopień ćwika dh Marianowi Nowakowi.',
                          'Mianuję na funkcję zastępowej dh. Olę Kowalską.',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Skróty nazw stopni piszemy (wraz z ew. innymi skrótami) zawsze <b>przed imieniem</b> (inicjałem imienia) i nazwiskiem.',
                        [
                          'ks. <b>hm</b>. Andrzej Wielebny,',
                          'prof. dr hab. <b>hm</b>. Katarzyna Wiedzowska',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'W przypadku instruktorów nie podajemy dodatkowo stopnia harcerskiego (ani przed imieniem, ani po nazwisku).',
                        []
                    ),

                    Header('Pisownia słów: zjazd, zlot, złaz, rajd'),

                    Item(
                        'Jeśli mówimy o konkretnym przedsięwzięciu (jest to nazwa) – wtedy piszemy <b>wielką literą</b>.',
                        [
                          '(...) XL <b>Zjazd ZHP</b>',
                          '(...) II <b>Zlot Kadry</b>',
                          '(...) 50 <b>Rajd Świętokrzyski</b>',
                          '(...) <b>Rajd Odkrywców 2018</b>',
                          '(...) <b>Rajd Arsenał 2016</b>',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'W pozostałych przypadkach – <b>małą literą</b>.',
                        [
                          'na zjeździe przyjęto <b>uchwałę</b>',
                          'podczas <b>zlotu</b> odbyło się uroczyste ognisko.'
                        ]
                    ),

                    Header('Pisownia nazw przedsięwzieć programowych'),

                    Item(
                        '<b>Wielkimi literami</b> (z wyjątkiem przyimków i spójników).',
                        [
                          '(...) <b>Betlejemskie Światło Pokoju</b>',
                          '(...) <b>Dzień Myśli Braterskiej</b>',
                          '(...) <b>Ogólnopolska Harcerska Pielgrzymka na Jasną Górę</b>.',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Programy, propozycje programowe ZHP – „program”, „propozycja programowa” piszemy małą literą, nazwa w cudzysłowie (pierwsze słowo wielką literą, pozostałe małą).',
                        [
                          '(...) propozycja programowa „Światozmieniacze. Cel: dobro”',
                          '(...) propozycja programowa „Connect”',
                          '(...) propozycja programowa „Leśne plemiona”',
                        ]
                    ),

                    Header('Pisownia terminów metodycznych'),

                    Item(
                        'Małymi literami',
                        [
                          'metoda harcerska',
                          'system małych grup',
                          'uczenie w działaniu',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Sprawności – słowo „sprawność” piszemy <b>małą literą</b>, nazwa w cudzysłowie (pierwsze słowo wielką literą, pozostałe małą)',
                        [
                          '(...) <b>sprawność „Sobieradka obozowego”</b>',
                          '(...) <b>„Kuchcik”</b>',
                          '(...) <b>„Strażak”</b>',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Znaki służb – <b>wielkimi literami</b>',
                        [
                          'Wędrownicy z "Knieji" zrealizowali <b>Znak Służby Dziecku</b>',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Zadanie zespołowe – <b>małą literą</b>, zaś jego nazwa od <b>wielkiej litery</b>, w cudzysłowie',
                        [
                          '(...) zadanie zespołowe „Radosne andrzejki”',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Projekt – <b>małą literą</b>, zaś jego nazwa od <b>wielkiej litery</b>, w <b>cudzysłowie</b>',
                        [
                          'projekt „Dom”',
                        ]
                    ),

                    Header('Pisownia nazw odznak, oznaczeń'),

                    DotParagraph(Text('Krzyż Harcerski, Znaczek Zucha', style: _textStyle)),
                    SizedBox(height: innerSeparator),
                    DotParagraph(Text('Brązowa (Srebrna, Złota) Odznaka Kadry Kształcącej, skrót: BOKK, SOKK, ZOKK.', style: _textStyle)),
                    SizedBox(height: innerSeparator),
                    DotParagraph(Text('Brązowa (Srebrna, Złota) Odznaka Kadry Pro-gramowej, skrót: OKP.', style: _textStyle)),
                    SizedBox(height: innerSeparator),
                    DotParagraph(Text('Brązowy (Srebrny, Złoty) Krzyż „Za Zasługi dla ZHP""', style: _textStyle)),
                    SizedBox(height: innerSeparator),
                    DotParagraph(Text('Medal Wdzięczności', style: _textStyle)),
                    SizedBox(height: innerSeparator),
                    DotParagraph(Text('Honorowe Wyróżnienie „Niezawodnemu Przyjacielowi”.', style: _textStyle)),
                    SizedBox(height: innerSeparator),
                    DotParagraph(Text('Srebrna (Złota) Honorowa Odznaka RPH.', style: _textStyle)),

                    Header('Pisownia nazw ośrodków harcerskich'),

                    Item(
                        '<b>Wielką literą</b>, w cudzysłowie: „Perkoz”, „Głodówka”, „Funka”, ale: ośrodek na Głodówce (na polanie Głodówka), HCEE w Funce (nazwa miejscowości), ale: w „Perkozie” (ponieważ nie ma miejscowości Perkoz).',
                        []
                    ),

                    Header('Pisownia tytułów'),

                    Item(
                        'Uchwały i decyzje władz ZHP – słowo „uchwała”, „decyzja” piszemy <b>wielką literą</b> tylko wtedy, gdy jest to pierwsze słowo pełnej nazwy dokumentu.',
                        [
                          'W załączniku treść <b>Uchwały</b> nr 43/XXXVIII Rady Naczelnej ZHP z dnia 2 października 2016 r. w sprawie systemu stopni instruktorskich'
                        ]
                    ),
                    SizedBox(height: innerSeparator),
                    Item(
                        'Tytuły uchwał piszemy od <b>wielkiej litery</b>.',
                        [
                          'Słyszałeś? Wyszedł nowy <b>System stopni instruktorskich<b>',
                          'Bez urazy, ale sądzę, że <b>Ordynacja wyborcza ZHP</b> jest do zmiany.'
                        ]
                    ),
                    SizedBox(height: innerSeparator),
                    Item(
                        'Tytuły czasopism – w cudzysłowie, <b>wielkimi literami<b>.',
                        [
                          'Bez dwóch zdań - <b>„Azymut”</b> jest najlepszy',
                          'Jeśli czytać harcerską prasę, to tylko miesięcznik <b>„Czuwaj”</b>!',
                        ]
                    ),
                    SizedBox(height: outerSeparator),
                    Item(
                        'Tytuły książek, filmów, programów telewizyjnych',
                        [
                          'Antek Cwaniak',
                          'Styl życia',
                          'Dobry wieczór ZHP'
                        ]
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );

  }

}

class Header extends StatelessWidget{

  final String title;

  const Header(this.title);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(height: WritingRulesPage.headerSeparatorUp),

        Text(
          title,
          style: WritingRulesPage._headerStyle(context),
          textAlign: TextAlign.center,
        ),

        SizedBox(height: WritingRulesPage.headerSeparatorDown),
      ],
    );

  }

}

class DotParagraph extends StatelessWidget{

  final Widget child;
  const DotParagraph(this.child);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          width: Dimen.ICON_SIZE,
          child: Center(
              child: Text(
                  '•', style: AppTextStyle(color: textEnab_(context), fontWeight: weight.bold)
              )
          ),
        ),

        Expanded(
          child: child
        )

      ],
    );
  }

}

class Item extends StatelessWidget{

  final String text;
  final List<String> examples;

  const Item(this.text, this.examples);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          width: Dimen.ICON_SIZE,
          child: Center(
              child: Text(
                  '•', style: AppTextStyle(color: textEnab_(context), fontWeight: weight.bold)
              )
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppText(
                text,
                size: WritingRulesPage.textStyleFontSize,
              ),

              SizedBox(height: 2*WritingRulesPage.innerSeparator),

              Text('Przykłady:', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: WritingRulesPage.exampleStyleColor(context))),

              SizedBox(height: WritingRulesPage.innerSeparator),

              Column(
                children: examples.map<Widget>((example)
                => Padding(
                  padding: EdgeInsets.only(top: 3.0, bottom: 3.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('- ', style: AppTextStyle(color: textEnab_(context))),
                      Expanded(child: AppText(
                        '<i>$example</i>',
                          size: WritingRulesPage.exampleStyleFontSize,
                          colorItalic: WritingRulesPage.exampleStyleColor(context),
                      ))
                    ],
                  ),
                )).toList(),
              )
            ],
          ),
        )

      ],
    );
  }



}
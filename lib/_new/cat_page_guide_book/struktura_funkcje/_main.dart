import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../module_statistics_registrator.dart';

class StrukturaFunkcjeFragment extends StatefulWidget {

  const StrukturaFunkcjeFragment({super.key});

  @override
  State<StatefulWidget> createState() => StrukturaFunkcjeFragmentState();

}

class StrukturaFunkcjeFragmentState extends State<StrukturaFunkcjeFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.strukturaFunkcje;

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: background_(context),
            title: const Text('Struktura i funkcje'),
            centerTitle: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG - Dimen.defMarg/2),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                StructCard(
                    'Główna Kwatera ZHP',
                    description: 'Odpowiednik zarządu Związku Harcerstwa Polskiego, kierujący jego działalnością, z siedzibą w Warszawie.',
                    auth: '• Naczelnik ZHP'
                        '\n• Przewodniczący ZHP'
                        '\n• Główna Kwatera ZHP'
                        '\n• Rada Naczelna ZHP'
                        '\n• Centralna Komisja Rewizyjna ZHP'
                        '\n• Naczelny Sąd Harcerski ZHP',
                    funkcje: funkcjeGK
                ),
                Row(
                  children: const <Widget>[
                    Line(),
                    Line(fat: true),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Expanded(child: StructCard('Chorągiew', enabled: false)),
                    Expanded(child: StructCard(
                        'Chorągiew',
                        description: 'Chorągwie są terytorialnymi jednostkami zrzeszającymi hufce, posiadające dodatkowo osobowość prawną. Ich zasięg terytorialny odpowiada najczęściej województwu.',
                        auth: '• Zjazd Chorągwi'
                            '\n• Rada Chorągwi'
                            '\n• Komendant Chorągwi'
                            '\n• Komenda Chorągwi'
                            '\n• Komisja Rewizyjna Chorągwi'
                            '\n• Sąd Harcerski Chorągwi',
                        funkcje: funkcjeCh
                    ))
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    const Line(fat: true),
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(flex: 1, child: Container()),
                  const Expanded(flex: 2, child: LineHor()),
                  Expanded(flex: 1, child: Container()),
                ],),
                Row(
                  children: const <Widget>[
                    Line(fat: true),
                    Line(),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(child: StructCard(
                        'Hufiec',
                        description: 'Hufiec jest terytorialną wspólnotą gromad, drużyn, kręgów i innych podstawowych jednostek organizacyjnych ZHP. Oprócz jednostek podstawowych (lub też zamiast nich), hufiec może skupiać związki drużyn i szczepy. Hufiec obejmuje terytorialnie na ogół obszar powiatu, w dużych miastach – jednej lub kilku dzielnic.',
                        auth: '• Zjazd Hufca'
                            '\n• Komendant Hufca'
                            '\n• Komenda Hufca'
                            '\n• Komisja Rewizyjna Hufca'
                            '\n• Sąd Harcerski Hufca (jeżeli zjazd hufca dokona jego wyboru)',
                        funkcje: funkcjeH
                    )),
                    const Expanded(child: StructCard('Hufiec', enabled: false,))
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Line(fat: true),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(flex: 3, child: Container()),
                  const Expanded(flex: 7, child: LineHor()),
                  Expanded(flex: 2, child: Container()),
                ]),
                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    const Line(fat: true, flex: 1),
                    const Line(fat: true, flex: 2),
                    const Line(fat: true, flex: 2),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    const Line(flex: 1, fat: true, long: true,),
                    Expanded(flex: 2, child: StructCard(
                        'Szczep',
                        description: 'Szczep jest strukturą występującą fakultatywnie. Jest wspólnotą podstawowych jednostek organizacyjnych, działających w jednym środowisku (szkoła, osiedle, dzielnica). Podstawowym celem działania szczepu jest zapewnienie ciągu wychowawczego - tworzą go minimum trzy podstawowe jednostki organizacyjne działające w co najmniej dwóch grupach metodycznych.',
                        auth: '• Komendant Szczepu'
                            '\n• Komenda Szczepu',
                        funkcje: funkcjeSz
                    )),
                    Expanded(flex: 2, child: StructCard(
                        'Zw. drużyn',
                        description: 'Związek drużyn jest strukturą fakultatywną. Jest terytorialną wspólnotą wszystkich jednostek organizacyjnych działających na terenie jednej lub kilku gmin. Tworzą go przynajmniej trzy podstawowe jednostki organizacyjne, przy czym w jego skład mogą wchodzić także szczepy.',
                        auth: '• Komendant Związku Drużyn'
                            '\n• Komenda Związku Drużyn',
                        funkcje: funkcjeZD
                    ))
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(flex: 1, child: Container()),
                    const Line(fat: true, flex: 1),
                    const Line(fat: true, flex: 2),
                    const Line(fat: true, flex: 2),
                  ],
                ),
                Row(children: <Widget>[
                  Expanded(flex: 3, child: Container()),
                  const Expanded(flex: 7, child: LineHor()),
                  Expanded(flex: 2, child: Container()),
                ]),
                Row(
                  children: const <Widget>[
                    Line(fat: true),
                  ],
                ),
                Icon(MdiIcons.circle, color: textDisab_(context)),
                Row(
                  children: const <Widget>[
                    Line(fat: true),
                  ],
                ),

                Row(children: <Widget>[
                  Expanded(flex: 1, child: Container()),
                  const Expanded(flex: 4, child: LineHor()),
                  Expanded(flex: 1, child: Container()),
                ]),
                Row(
                  children: const <Widget>[
                    Line(fat: true),
                    Line(fat: true),
                    Line(fat: true),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: StructCard(
                        'Gromada',
                        description: 'Gromady zuchowe są swoistymi "zuchowymi drużynami" − skupiają członków ZHP w wieku 6-10 lat i są miejscem realizacji programu. Liczebność gromady wynosi minimum 16 członków (w szczególnych wypadkach komenda hufca może obniżyć te liczbę do 12).',
                        auth: '• Drużynowy'
                            '\n• Rada Gromady (Drużynowy + Przyboczni)',
                        funkcje: funkcjeGD
                    )),
                    Expanded(child: StructCard(
                        'Drużyna',
                        description: 'Drużyna to w największym uogólnieniu grupa członków ZHP licząca przynajmniej 12 członków, posiadająca swój numer i nazwę. Dopuszczalne są zarówno drużyny koedukacyjne, jak i dysedukacyjne. Drużyny mogą działać w różnych grupach metodycznych. Wyróżnia się drużyny:'
                            '\n• Harcerskie (10-13 lat)'
                            '\n• Starszoharcerskie (13-16 lat)'
                            '\n• Wędrownicze (16-21 lat)'
                            '\n• Wielopoziomowe (różne grupy metodyczne)',
                        auth: '• Drużynowy'
                            '\n• Rada Drużyny (Drużynowy + Przyboczni + Zastępowi)',
                        funkcje: funkcjeGD
                    )),
                    Expanded(child: StructCard(
                        'Krąg',
                        description: 'Krąg skupiająca członków zwyczajnych ZHP. Rozróżnić można kręgi:'
                            '\n• Instruktorskie'
                            '\n• Akademickie'
                            '\n• Starszyzny'
                            '\n• Seniorów'
                            '\nKrąg jest miejscem realizacji programu.',
                        auth: '•  Komendant (Przewodniczący)',
                        funkcje: funkcjeK
                    ))
                  ],
                ),

                Row(
                  children: <Widget>[
                    const Line(flex: 1, fat: true),
                    const Line(flex: 1, fat: true),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: StructCard(
                        'Szóstka',
                        description: 'Odpowiednikiem zastępu w gromadach zuchowych jest szóstka (ok. 6-os., w gromadach pracujących systemem szóstkowym) lub gromadka (liczniejsza od szóstki, w gromadach pracujących w systemie zastępów zuchowych)',
                        auth: '• Szóstkowy',
                        funkcje: funkcjeSzostka
                    )),
                    Expanded(child: StructCard(
                        'Zastęp',
                        description: 'Zastęp jest podstawową jednostką organizacyjną drużyny harcerskiej - liczy do 8 członków. Niekiedy w drużynach wędrowniczych równolegle do zastępów występują patrole zadaniowe.',
                        auth: '• Zastępowy'
                            '\n• Podzastępowy',
                        funkcje: funkcjeZastep
                    )),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

}

class Line extends StatelessWidget{

  final int flex;
  final bool fat;
  final long;
  const Line({this.flex = 1, this.fat = false, this.long = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(child: Container(color: textDisab_(context), height: long?54:30, width: fat?3:1)));
  }
}

class LineHor extends StatelessWidget{

  const LineHor({super.key});

  @override
  Widget build(BuildContext context) => Container(color: textDisab_(context), height: 3, width: double.infinity);
}

class StructCard extends StatelessWidget{

  final String title;
  final bool enabled;
  final BuildContext? context;
  final String? description;
  final String? auth;
  final List<Funkcja>? funkcje;

  const StructCard(this.title, {this.enabled:true, this.context, this.description, this.auth, this.funkcje});

  @override
  Widget build(BuildContext context) {

    return AppCard(
      radius: AppCard.bigRadius,
      elevation: enabled?AppCard.bigElevation:0,
        onTap: enabled?() => showScrollBottomSheet(
            context: context,
            builder: (context) => BottomSheetDef(
              title: title,
              builder: (context) => ColumnDet(description: description!, auth: auth!, funkcje: funkcje!,),
            )
        ):null,
        margin: const EdgeInsets.only(left: Dimen.defMarg/2, right: Dimen.defMarg/2),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Text(title,
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: enabled?textEnab_(context):hintEnab_(context),
                fontWeight: weight.halfBold
              ),
              textAlign: TextAlign.center),
        )
    );
  }

}

class ColumnDet extends Column{

  static const double div = 24;

  ColumnDet({Key? key, required String description, required String auth, required List<Funkcja> funkcje}):super(key: key,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Opis', style: AppTextStyle(color: AppColors.textHintEnab), textAlign: TextAlign.start,),
      const SizedBox(height: Dimen.defMarg),
      Text(description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),

      const SizedBox(height: div,),

      Text('Władze', style: AppTextStyle(color: AppColors.textHintEnab), textAlign: TextAlign.start,),
      const SizedBox(height: Dimen.defMarg),
      Text(auth, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),

      const SizedBox(height: div,),

      Text('Funkcje', style: AppTextStyle(color: AppColors.textHintEnab), textAlign: TextAlign.start,),
      Column(children: funkcje)

    ],
  );
}

class Funkcja extends StatelessWidget{

  final String name;
  final String description;

  final Color? sznur;
  final Color? sznur_cross;
  final Color? suwak1, suwak1_cross, suwak2, suwak2_cross, suwak3, suwak3_cross;

  const Funkcja({
    required this.name,
    required this.description,
    required this.sznur,
    this.sznur_cross,
    required this.suwak1,
    this.suwak1_cross,
    required this.suwak2,
    this.suwak2_cross,
    required this.suwak3,
    this.suwak3_cross
  });

  @override
  Widget build(BuildContext context) {

    Row icon = Row(
      children: <Widget>[
        sznur_cross == null?
          Container(height: 32, width: 8, color: sznur,) :
          Column(
            children: [
              Container(height: 4, width: 8, color: sznur),
              Container(height: 4, width: 8, color: sznur_cross),
              Container(height: 4, width: 8, color: sznur),
              Container(height: 4, width: 8, color: sznur_cross),
              Container(height: 4, width: 8, color: sznur),
              Container(height: 4, width: 8, color: sznur_cross),
              Container(height: 4, width: 8, color: sznur),
              Container(height: 4, width: 8, color: sznur_cross),
            ]
          ),

        const SizedBox(width: 4,),
        Column(
          children: <Widget>[
            suwak1_cross == null?
            Container(height: 8, width: 8, color: suwak1):
            Column(
              children: [
                Container(height: 4, width: 8, color: suwak1),
                Container(height: 4, width: 8, color: suwak1_cross),
              ],
            ),
            const SizedBox(height: 4,),
            suwak2_cross == null?
            Container(height: 8, width: 8, color: suwak2):
            Column(
              children: [
                Container(height: 4, width: 8, color: suwak2),
                Container(height: 4, width: 8, color: suwak2_cross),
              ],
            ),
            const SizedBox(height: 4,),
            suwak3_cross == null?
            Container(height: 8, width: 8, color: suwak3):
            Column(
              children: [
                Container(height: 4, width: 8, color: suwak3),
                Container(height: 4, width: 8, color: suwak3_cross),
              ],
            ),
          ],
        ),
        const SizedBox(width: 6,),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(top: 3*Dimen.defMarg, bottom: 3*Dimen.defMarg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: [
              icon,
              Expanded(child: Text(name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
            ],
          ),
          const SizedBox(height: Dimen.defMarg),
          Text(description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),)
        ],
      ),
    );
  }

}

List<Funkcja> funkcjeGK = [
  const Funkcja(
    name: 'Przewodniczący ZHP',
    description: 'Sznur skórzany z trzema skórzanymi suwakami, noszony z szyi',
    sznur: AppColors.sznur_skorzany,
    suwak1: AppColors.sznur_skorzany,
    suwak2: AppColors.sznur_skorzany,
    suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący ZHP',
      description: 'Sznur skórzany z dwoma skórzanymi suwakami, noszony z szyi',
      sznur: AppColors.sznur_skorzany,
      suwak1: null,
      suwak2: AppColors.sznur_skorzany,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Członek Rady Naczelnej ZHP',
      description: 'Sznur funkcji podstawowej z dwoma skórzanymi suwakami',
      sznur: null,
      suwak1: null,
      suwak2: AppColors.sznur_skorzany,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Naczelnik ZHP',
      description: 'Sznur skórzany, poczwórnie pleciony, noszony z ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Zastępca naczelnika',
      description: 'Sznur skórzany z dwoma skórzanymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: null,
      suwak2: AppColors.sznur_skorzany,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Skarbnik ZHP',
      description: 'Sznur skórzany z dwoma skórzanymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: null,
      suwak2: AppColors.sznur_skorzany,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Członek Głównej Kwatery ZHP',
      description: 'Sznur skórzany z dwoma skórzanymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: null,
      suwak2: AppColors.sznur_skorzany,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Przewodniczący Centralnej Komisji Rewizyjnej',
      description: 'Sznur skórzany z trzema białymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: AppColors.sznur_bialy,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_bialy
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący Centralnej Komisji Rewizyjnej',
      description: 'Sznur pełnionej funkcji podstawowej z jednym skórzanym i dwoma białymi suwakami lub sznur skórzany z dwoma białymi suwakami, noszony spod ramienia',
      sznur: null,
      suwak1: AppColors.sznur_bialy,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Członek Centralnej Komisji Rewizyjnej',
      description: 'Sznur pełnionej funkcji podstawowej z jednym skórzanym i jednym białym suwakiem',
      sznur: null,
      suwak1: null,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Przewodniczący Naczelnego Sądu Harcerskiego',
      description: 'Sznur skórzany z trzema fioletowymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: AppColors.sznur_fioletowy,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_fioletowy
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący Naczelnego Sądu Harcerskiego',
      description: 'Sznur pełnionej funkcji podstawowej z jednym skórzanym i dwoma fioletowymi suwakami lub sznur skórzany z dwoma fioletowymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_skorzany,
      suwak1: AppColors.sznur_fioletowy,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Członek Naczelnego Sądu Harcerskiego',
      description: 'Sznur pełnionej funkcji podstawowej z jednym skórzanym i jednym fioletowym suwakiem',
      sznur: null,
      suwak1: null,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_skorzany
  ),
  const Funkcja(
      name: 'Członek centralnego zespołu instruktorskiego',
      description: 'Sznur pełnionej funkcji podstawowej z jednym skórzanym suwakiem lub sznur skórzany z jednym skórzanym suwakiem, noszony spod ramienia',
      sznur: null,
      suwak1: null,
      suwak2: null,
      suwak3: AppColors.sznur_skorzany
  )
];

List<Funkcja> funkcjeCh = [
  const Funkcja(
      name: 'Komendant chorągwi',
      description: 'Sznur złoty, poczwórnie pleciony, noszony z ramienia',
      sznur: AppColors.sznur_zloty,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Zastępca komendanta chorągwi',
      description: 'Sznur złoty z dwoma węzłami lub złotymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_zloty,
      suwak1: null,
      suwak2: AppColors.sznur_zloty,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Skarbnik chorągwi',
      description: 'Sznur złoty z dwoma węzłami lub złotymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_zloty,
      suwak1: null,
      suwak2: AppColors.sznur_zloty,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Członek komendy chorągwi',
      description: 'Sznur złoty z dwoma węzłami lub złotymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_zloty,
      suwak1: null,
      suwak2: AppColors.sznur_zloty,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Przewodniczący rady chorągwi',
      description: 'Sznur złoty z trzema węzłami lub złotymi suwakami, noszony z szyi',
      sznur: AppColors.sznur_zloty,
      suwak1: AppColors.sznur_zloty,
      suwak2: AppColors.sznur_zloty,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Zastępca przewodniczącego rady chorągwi',
      description: 'Sznur złoty z dwoma węzłami lub złotymi suwakami, noszony z szyi',
      sznur: AppColors.sznur_zloty,
      suwak1: null,
      suwak2: AppColors.sznur_zloty,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Członek rady chorągwi',
      description: 'Sznur pełnionej funkcji podstawowej z dwoma złotymi suwakami',
      sznur: null,
      suwak1: null,
      suwak2: AppColors.sznur_zloty,
      suwak3: AppColors.sznur_zloty,
  ),
  const Funkcja(
      name: 'Przewodniczący komisji rewizyjnej chorągwi',
      description: 'Sznur złoty z trzema białymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_zloty,
      suwak1: AppColors.sznur_bialy,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_bialy
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący komisji rewizyjnej chorągwi',
      description: 'Sznur pełnionej funkcji podstawowej z jednym złotym i dwoma białymi suwakami lub sznur złoty z dwoma białymi suwakami, noszony spod ramienia',
      sznur: null,
      suwak1: AppColors.sznur_bialy,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Członek komisji rewizyjnej chorągwi',
      description: 'Sznur pełnionej funkcji podstawowej z jednym złotym i jednym białym suwakiem',
      sznur: null,
      suwak1: null,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_zloty,
  ),
  const Funkcja(
      name: 'Przewodniczący sądu harcerskiego chorągwi',
      description: 'Sznur złoty z trzema fioletowymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_zloty,
      suwak1: AppColors.sznur_fioletowy,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_fioletowy
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący sądu harcerskiego chorągwi',
      description: 'Sznur pełnionej funkcji podstawowej z jednym złotym i dwoma fioletowymi suwakami lub sznur złoty z dwoma fioletowymi suwakami, noszony spod ramienia',
      sznur: null,
      suwak1: AppColors.sznur_fioletowy,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Członek sądu harcerskiego chorągwi',
      description: 'Sznur pełnionej funkcji podstawowej z jednym złotym i jednym fioletowym suwakiem',
      sznur: null,
      suwak1: null,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_zloty
  ),
  const Funkcja(
      name: 'Członek chorągwianego zespołu instruktorskiego',
      description: 'Sznur pełnionej funkcji podstawowej z jednym złotym suwakiem lub sznur złoty, noszony spod ramienia',
      sznur: null,
      suwak1: null,
      suwak2: null,
      suwak3: AppColors.sznur_zloty
  ),
];

List<Funkcja> funkcjeH = [
  const Funkcja(
      name: 'Komendant hufca',
      description: 'Sznur srebrny, poczwórnie pleciony, noszony z ramienia',
      sznur: AppColors.sznur_srebrny,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Zastępca komendanta hufca',
      description: 'Sznur srebrny z dwoma węzłami lub srebrnymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_srebrny,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_srebrny,
      suwak3: null
  ),
  const Funkcja(
      name: 'Skarbnik hufca',
      description: 'Sznur srebrny z dwoma węzłami lub srebrnymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_srebrny,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_srebrny,
      suwak3: null
  ),
  const Funkcja(
      name: 'Członek komendy hufca',
      description: 'Sznur srebrny z dwoma węzłami lub srebrnymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_srebrny,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_srebrny,
      suwak3: null
  ),
  const Funkcja(
      name: 'Przewodniczący komisji rewizyjnej hufca',
      description: 'Sznur srebrny z trzema białymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_srebrny,
      suwak1: AppColors.sznur_bialy,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_bialy
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący komisji rewizyjnej hufca',
      description: 'Sznur pełnionej funkcji podstawowej z jednym srebrnym i dwoma białymi suwakami lub sznur srebrny z dwoma białymi suwakami, noszony spod ramienia',
      sznur: null,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_bialy,
      suwak3: AppColors.sznur_bialy
  ),
  const Funkcja(
      name: 'Członek komisji rewizyjnej hufca',
      description: 'Sznur pełnionej funkcji podstawowej z jednym srebrnym i jednym białym suwakiem',
      sznur: null,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_bialy,
      suwak3: null
  ),
  const Funkcja(
      name: 'Przewodniczący sądu harcerskiego hufca',
      description: 'Sznur srebrny z trzema fioletowymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_srebrny,
      suwak1: AppColors.sznur_fioletowy,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_fioletowy
  ),
  const Funkcja(
      name: 'Wiceprzewodniczący sądu harcerskiego hufca',
      description: 'Sznur pełnionej funkcji podstawowej z jednym srebrnym i dwoma fioletowymi suwakami lub sznur srebrny z dwoma fioletowymi suwakami, noszony spod ramienia',
      sznur: null,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: AppColors.sznur_fioletowy
  ),
  const Funkcja(
      name: 'Członek sądu harcerskiego hufca',
      description: 'Sznur pełnionej funkcji podstawowej z jednym srebrnym i jednym fioletowym suwakiem',
      sznur: null,
      suwak1: AppColors.sznur_srebrny,
      suwak2: AppColors.sznur_fioletowy,
      suwak3: null
  ),
  const Funkcja(
      name: 'Członek hufcowego zespołu instruktorskiego',
      description: 'Sznur pełnionej funkcji podstawowej z jednym srebrnym suwakiem lub sznur srebrny, noszony spod ramienia',
      sznur: null,
      suwak1: AppColors.sznur_srebrny,
      suwak2: null,
      suwak3: null
  )
];

List<Funkcja> funkcjeSz = [
  const Funkcja(
      name: 'Komendant szczepu',
      description: 'Sznur granatowy, poczwórnie pleciony, noszony z ramienia',
      sznur: AppColors.sznur_granatowy,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Zastępca komendanta szczepu',
      description: 'Sznur granatowy z dwoma węzłami lub granatowymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_granatowy,
      suwak1: AppColors.sznur_granatowy,
      suwak2: AppColors.sznur_granatowy,
      suwak3: null
  ),
  const Funkcja(
      name: 'Funkcyjny szczepu',
      description: 'Sznur pełnionej funkcji podstawowej z jednym granatowym suwakiem',
      sznur: null,
      suwak1: AppColors.sznur_granatowy,
      suwak2: null,
      suwak3: null
  ),
];

List<Funkcja> funkcjeZD = [
  const Funkcja(
      name: 'Komendant związku drużyn',
      description: 'Sznur granatowo-srebrny, poczwórnie pleciony, noszony z ramienia',
      sznur: AppColors.sznur_zwiazek_druzyn_1,
      sznur_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Zastępca komendanta związku drużyn',
      description: 'Sznur granatowo-srebrny z dwoma węzłami lub granatowo-srebrnymi suwakami, noszony z ramienia',
      sznur: AppColors.sznur_zwiazek_druzyn_1,
      sznur_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak1: AppColors.sznur_zwiazek_druzyn_1,
      suwak1_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak2: AppColors.sznur_zwiazek_druzyn_1,
      suwak2_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak3: null
  ),
  const Funkcja(
      name: 'Członek komendy związku drużyn',
      description: 'Sznur granatowo-srebrny z dwoma węzłami lub granatowo-srebrnymi suwakami, noszony spod ramienia',
      sznur: AppColors.sznur_zwiazek_druzyn_1,
      sznur_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak1: AppColors.sznur_zwiazek_druzyn_1,
      suwak1_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak2: AppColors.sznur_zwiazek_druzyn_1,
      suwak2_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak3: null
  ),
  const Funkcja(
      name: 'Funkcyjny związku drużyn',
      description: 'Sznur pełnionej funkcji podstawowej z jednym granatowosrebrnym suwakiem lub sznur granatowosrebrny, noszony spod ramienia',
      sznur: AppColors.sznur_zwiazek_druzyn_1,
      sznur_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak1: AppColors.sznur_zwiazek_druzyn_1,
      suwak1_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak2: null,
      suwak3: null
  ),
];

List<Funkcja> funkcjeGD = [
  const Funkcja(
      name: 'Drużynowy',
      description: 'Sznur granatowy, noszony spod ramienia',
      sznur: AppColors.sznur_granatowy,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Przyboczny',
      description: 'Sznur zielony, noszony spod ramienia',
      sznur: AppColors.sznur_zielony,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Funkcyjny drużyny',
      description: 'Sznur szary z zielonym suwakiem, noszony spod ramienia',
      sznur: AppColors.sznur_szary,
      suwak1: AppColors.sznur_zielony,
      suwak2: null,
      suwak3: null
  ),
];

List<Funkcja> funkcjeK = [
  const Funkcja(
      name: 'Przewodniczący kręgu',
      description: 'Sznur biało-granatowy, noszony spod ramienia',
      sznur: AppColors.sznur_zwiazek_druzyn_1,
      sznur_cross: AppColors.sznur_zwiazek_druzyn_2,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Szef klubu specjalnościowego',
      description: 'Sznur czerwony, noszony spod ramienia',
      sznur: AppColors.sznur_czerwony,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
];

List<Funkcja> funkcjeSzostka = [
  const Funkcja(
      name: 'Szóstkowy',
      description: 'Krokiewka',
      sznur: null,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
];

List<Funkcja> funkcjeZastep = [
  const Funkcja(
      name: 'Zastępowy',
      description: 'Sznur brązowy, noszony spod ramienia',
      sznur: AppColors.sznur_brazowy,
      suwak1: null,
      suwak2: null,
      suwak3: null
  ),
  const Funkcja(
      name: 'Funkcyjny zastępu',
      description: 'Sznur szary z brązowym suwakiem, noszony spod ramienia',
      sznur: AppColors.sznur_szary,
      suwak1: AppColors.sznur_brazowy,
      suwak2: null,
      suwak3: null
  ),
];
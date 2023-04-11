import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/values/hufce.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_widgets/sliding_card.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';

class PartContributors extends StatelessWidget{

  const PartContributors({super.key});

  static const List<GraphicalResource> _graphicalResources = [
    GraphicalResource('games/bg_pytajki.webp', 'freepik.com (freepik)'),
    GraphicalResource('games/bg_slowo_klucz.webp', 'freepik.com (freepik)'),
    GraphicalResource('article_not_found.webp', 'freepik.com (vectorpouch)'),

    GraphicalResource('start/start_layout_pol_walcz_bg.webp', 'freepik.com (freepik)'),
    GraphicalResource('start/start_layout_adwent.webp', 'freepik.com (macrovector)'),
    GraphicalResource('start/merry_joseph_jesus.webp', 'freepik.com (freepik)'),
    GraphicalResource('start/start_good_friday.webp', 'freepik.com (starline)'),
  ];

  static const List<Person> osWspierSpiewnik = [
    EWA_BYSTRZYNSKA,
    MARTA_SZYMANDERSKA,
    BARBARA_THOMAS,
    ALEKSANDRA_CHRUSTEK,
    DOMINIKA_GORZYNSKA,
    JOANNA_MICHALOWSKA,
    JADWIGA_BILINSKA,
    JULIA_PILCH,
    HELENA_LATOSINSKA,
    AGNIESZKA_TYLKO,
    HANNA_RYBACKA,
    ALEKSANDRA_KOSTRZEWA,
    ZUZANNA_WARCHOL,
    KATARZYNA_STUDNICKA,
    MARLENA_BANIA,
    ZOFIA_ZAWADZKA,
    KLARA_MAZEK,
    JULIA_SIUDMAK,
    LAURA_FRASZEWSKA,
    NADIA_WYSZOGRODZKA,
    ZUZANNA_MIERZEJEWSKA,
    OLIWIA_STANCZYK,
    ZUZANNA_KOWALCZYK,
    WANDA_MARCHEL,
    DOMINIKA_HOCHMANSKA,
    MALGORZATA_KLOC,
    MARYSIA_SLUGAJ,
    ANTONINA_SZTYGLIC,
    ZUZANNA_KOLIS,

    PIOTR_ZIEMBIKIEWICZ,
    KRZYSZTOF_KRAWCZYK,
    WOJCIECH_ZIELINSKI,
    KACPER_KORDEK,
    ROBERT_MAZUR,
    SEWERYN_WOLINSKI,
    DAWID_WYSZYNSKI,
    LUKASZ_SZEPIELAK,
    LUKASZ_KRYWULT,
    ROBERT_ROBOTYCKI,
    FILIP_SWIDEREK,
    MACIEJ_BATKO,
    PIOTR_SOSNOWSKI,
    WOJCIECH_GRUSZCZYNSKI,
    MATEUSZ_KOBYLAREK,
    WINCENTY_DIETRYCH,
    MARCIN_JANKOWIAK,
    STANISLAW_WRONSKI,
    SZYMON_PODGORNY,
    MIKOLAJ_GORECKI,
    GRZEGORZ_ZAWADZKI,
    SZYMON_DROPEK,
    JAKUB_KLUCZKOWSKI,
    SEBASTIAN_KOPROWSKI,
    SZYMON_ZDZIEBKO,
    KAROL_GOLABEK,
    RAFAL_KOWALSKI,
    ARTUR_RUSA,
    FRANCISZEK_TOMASZCZYK,
    KACPER_WIDZ,
    STEFAN_KRYCZKA,
    GRZEGORZ_BOROWIEC,
    KAJETAN_WYGNANSKI,
    FILIP_BERGIER,
    WOJCIECH_WOLNIK,
    KRZSZTOF_MALIKIEWICZ,
    PAWEL_MARUD,
    KACPER_TOMCZYK,
    JAN_KUCZA,
    KACPER_KOZLUK,
  ];

  static const List<Person> osWspierTest = [
    ALEKSANDRA_KOZUBAL,
    PATRYCJA_SZCZESNA,
    SARA_WALCZYNSKA_GORA,
    ZOFIA_FABROWSKA,
    AGNIESZKA_DURSKA,

    KRZYSZTOF_KRAWCZYK,
    FILIP_KWIATKOWSKI,
    KACPER_SWITKIEWICZ,
    MAREK_MUSIALIK,
    ZBYSZEK_CHODAKOWSKI,
    KACPER_SZCZENSY,
    BARTOSZ_DABROWSKI,
    WOJCIECH_TURSKI,
    KACPER_BACZKOWSKI,
    JAKUB_STEFANSKI,
    JAKUB_EJDUK,
    OSKAR_PARDYAK,
    KAMIL_ZAK,
    MATEUSZ_GAWRYSIAK,
    KAROL_MALUS,
    JAKUB_ZDANOWICZ_ZASIDKO,
    MATEUSZ_CIAGLO,
    RAFAL_LALIK,
    LUKASZ_RYBINSKI,
    JAKUB_SKUCHA,
    DORIAN_JAREK,
    DANIEL_KORZEB,
    FILIP_SOCHAJ,
    BARTOSZ_IGNASIAK,
    SZYMON_JAWOREK,
    ARTUR_KOSTRZEWA,
  ];

  static const List<Person> osWspierSlownik = [
    PAULINA_BURDZIK,
    PATRYCJA_SZCZESNA,
    MAXIMILIAN_STEINHOFF,
    ZUZANNA_JAWORSKA,
    Person(name: 'Josef Balvín', hufiec: 'Junák - český skaut',),
    Person(name: 'Wiktoria Hernik', hufiec: 'Hufiec ZHP Kraków - Nowa Huta', stopI: 'phm.', org: Org.zhp),
    FRANCISZEK_LINKE,
    Person(name: 'Kacper Porębski', stopH: StopHarc.zhpHOc),
  ];

  static const List<Person> osWspierKuch = [
    RADOSLAW_RELIDZYNSKI,
  ];

  static const List<Person> osWspierTresci = [
    Person(name: 'Dariusz Krysa'), // Sprawności Sim2022 Harc Zuch
    Person(name: 'Michał Muszyński'), // Sprawności Sim2022 Harc
    Person(name: 'Anna Susicka'), // Sprawności Sim2022 Harc Zuch
    Person(name: 'Emilia Witkowska'), // Sprawności Sim2022 Harc
    Person(name: 'Marcin Przystawski MSF'), // Sprawności Sim2022 Zuch
    Person(name: 'Wojciech Wałach'), // Sprawności Sim2022 Zuch
    Person(name: 'Michał Baniak'), // Sprawności Sim2022 Harc
    Person(name: 'Jakub Noga'), // Sprawności Sim2022 Harc
    Person(name: 'Emil Krawczyk'), // Sprawności Sim2022 Harc
  ];

  static const List<Person> osWspierKod = [
    MICHAL_KARWOWSKI
  ];

  static const List<Person> osWspierUI = [
    KAROLINA_MARCINKOWSKA,
    SZYMON_CHORAZY
  ];

  @override
  Widget build(BuildContext context) {

    //for(GraphicalResource res in _graphicalResources)
    //  precacheImage(Image.asset('assets/images/${res.path}').image, context);

    return PageView(
      physics: const BouncingScrollPhysics(),
      controller: PageController(viewportFraction: Dimen.viewportFraction(context)),
      children: const [
        ContribListCard(
          'Maestrowie hitów śpiewnika',
          MdiIcons.bookMusicOutline,
          osWspierSpiewnik
        ),

        ContribListCard(
            'Bohaterscy łowcy błędów',
            MdiIcons.alertCircleOutline,
            osWspierTest
        ),

        ContribListCard(
            'Poligloci harc-słownika',
            MdiIcons.translate,
            osWspierSlownik
        ),

        ContribListCard(
            'Łasuchy, kuchmistrzowie i znawcy przepisów',
            MdiIcons.noodles,
            osWspierKuch
        ),

        ContribListCard(
            'Redaktorzy treści',
            MdiIcons.textBoxCheckOutline,
            osWspierTresci
        ),

        ContribListCard(
            'Stare wygi technologii i programowania',
            MdiIcons.laptop,
            osWspierKod
        ),

        ContribListCard(
            'Krytycy interfejsu użytkownika',
            MdiIcons.paletteOutline,
            osWspierUI
        ),

        GraphicalResourceCard(_graphicalResources),

      ],
    );

  }
}

class GraphicalResource{

  final String? path;
  final String? author;

  const GraphicalResource(this.path, this.author);

}

class GraphicalResourceCard extends StatelessWidget{

  final List<GraphicalResource> _graphicalResources;

  const GraphicalResourceCard(this._graphicalResources, {super.key});

  @override
  Widget build(BuildContext context) => AppCard(
    radius: AppCard.bigRadius,
    margin: const EdgeInsets.only(
      left: Dimen.defMarg,
      right: Dimen.defMarg,
      top: Dimen.SIDE_MARG,
      bottom: Dimen.SIDE_MARG,
    ),
    padding: EdgeInsets.zero,
    color: background_(context),
    child: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Źródła graficzne'),
          centerTitle: true,
          floating: true,
        ),

        SliverList(delegate: SliverChildListDelegate([

          const SizedBox(height: Dimen.ICON_MARG),
          ListTile(
            leading: const Icon(MdiIcons.circleSmall),
            title: Text('Icomoon', style: AppTextStyle()),
          ),
          ListTile(
            leading: const Icon(MdiIcons.circleSmall),
            title: Text('Smashicons (grafiki żywności)', style: AppTextStyle()),
          ),
          ListTile(
            leading: const Icon(MdiIcons.circleSmall),
            title: Text('Nikita Golubev grafiki żywności - masło, kapusta pekińska, paluszki)', style: AppTextStyle()),
          ),
          ListTile(
            leading: const Icon(MdiIcons.circleSmall),
            title: Text('Adib Sulthon (grafiki żywności - papryka, parówka, chleb)', style: AppTextStyle()),
          ),
          ListTile(
            leading: const Icon(MdiIcons.circleSmall),
            title: Text('prettycons (grafiki żywności - bób)', style: AppTextStyle()),
          ),
          ListTile(
            leading: const Icon(MdiIcons.circleSmall),
            title: Text('Kuba Tesner, Magda Garczyńska (lilijka harcerska)', style: AppTextStyle()),
          ),

          const SizedBox(height: SEPARATOR_BIG,),

          SizedBox(
            height: 200,
            child: SlidingPageView(
              extents: 3,
              itemCount: _graphicalResources.length,
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  SizedBox(
                    height: 200 - 6.0 - Dimen.TEXT_SIZE_SMALL,
                    width: double.infinity,
                    child: SlidingCard(
                      onTap: () => openDialog(context: context, builder: (context)
                      => Center(
                          child: AppCard(
                              padding: EdgeInsets.zero,
                              child: Image.asset('assets/images/${_graphicalResources[index].path}', fit: BoxFit.contain))
                      )),
                      color: cardEnab_(context),
                      child: Image.asset('assets/images/${_graphicalResources[index].path}', fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(height: 6.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                    Text('Autor: ', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_SMALL)),
                    Text(_graphicalResources[index].author!, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL)),
                  ],)
                ],
              ),
              grow: true,
              controller: PageController(viewportFraction: 0.9),
              physics: const BouncingScrollPhysics(),
              notifier: ValueNotifier(0.0),
            ),
          ),


        ]))

      ],
    ),
  );

}

class ContribListCard extends StatelessWidget{

  final String title;
  final IconData icon;
  final List<Person> personList;

  const ContribListCard(this.title, this.icon, this.personList, {super.key});

  @override
  Widget build(BuildContext context) => AppCard(
      radius: AppCard.bigRadius,
      margin: const EdgeInsets.only(
        left: Dimen.defMarg,
        right: Dimen.defMarg,
        top: Dimen.SIDE_MARG,
        bottom: Dimen.SIDE_MARG,
      ),
      padding: EdgeInsets.zero,
      color: background_(context),
      child: Stack(
        children: [

          Positioned(
            right: 24,
            bottom: 0,
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(-15 / 360),
              child: Icon(
                icon,
                color: backgroundIcon_(context),
                size: .5*MediaQuery.of(context).size.width,
              ),
            ),
          ),

          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                title: Text(title),
                centerTitle: true,
                floating: true,
              ),

              SliverPadding(
                padding: const EdgeInsets.only(
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG,
                  bottom: Dimen.SIDE_MARG,
                ),
                sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                        (context, index) => PersonCard(personList[index]),
                    count: personList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 32.0)
                )),
              )

            ],
          ),

        ],
      )
  );

}
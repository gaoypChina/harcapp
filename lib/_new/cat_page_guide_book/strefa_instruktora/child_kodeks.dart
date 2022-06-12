import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChildKodeks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        AppCard(
          radius: AppCard.BIG_RADIUS,
            elevation: AppCard.bigElevation,
            padding: const EdgeInsets.all(Dimen.CARD_BIG_PADD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                const TitleShortcutRowWidget(
                  title: 'Zobowiązanie instruktorskie',
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.DEF_MARG),
                  child: SelectableText(
                    'Przyjmuję obowiązki instruktora Związku Harcerstwa Polskiego. Jestem świadomy odpowiedzialności harcerskiego wychowawcy i opiekuna. Będę dbać o dobre imię harcerstwa, przestrzegać Statutu ZHP, pracować nad sobą, pogłębiać swoją wiedzę i umiejętności. Wychowam swojego następcę. Powierzonej przez Związek Harcerstwa Polskiego służby nie opuszczę samowolnie.',
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
                  ),
                )
              ],
            )
        ),


        const SizedBox(height: Dimen.SIDE_MARG),

        TitleShortcutRowWidget(
          title: 'Kodeks instruktorski',
          titleColor: hintEnab_(context),
          textAlign: TextAlign.start,
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        TitleShortcutRowWidget(
          icon: MdiIcons.accountCircleOutline,
          iconColor: hintEnab_(context),
          title: 'Instruktor wobec siebie',
          textAlign: TextAlign.start,
          onOpen: () => showScrollBottomSheet(
              context: context,
              builder: (context) => BottomSheetDef(
                title: 'Instruktor wobec siebie',
                builder: (context) => SelectableText('Jestem instruktorem ZHP. W pracy instruktorskiej staram się skutecznie dążyć do osiągnięcia harcerskich ideałów. Zastanawiam się nad moją działalnością instruktorską. Potrafię w mądry sposób łączyć ją z innymi rolami społecznymi.'
                    '\n\n1. W życiu postępuję odpowiedzialnie. Podejmując działania, przewiduję ich skutki. Planuję drogę do osiągnięcia celu, mając świadomość swoich możliwości i ograniczeń. Potrafię rzetelnie oceniać swoje działania, wyciągać krytyczne wnioski. Odnajduję satysfakcję w tym, co robię.'
                    '\n\n2. Potrafię określić priorytety w swoim życiu i konsekwentnie przestrzegam ich realizacji. Wyznaczając priorytety, kieruję się tak swoim dobrem, jak i dobrem innych ludzi.'
                    '\n\n3. Wierzę w harcerskie ideały, dostrzegam ich uniwersalność. Wcielam je w życie. W każdym swoim działaniu kieruję się zasadami braterstwa i służby.'
                    '\n\n4. Dbam o swój rozwój we wszystkich dziedzinach życia.'
                    '\n\n5. Staram się być osobą wrażliwą. Potrafię przekazywać swoje oczekiwania, potrafię słuchać i rozumieć potrzeby innych. Panuję nad emocjami.'
                    '\n\n6. Jestem otwarty na świat, ludzi i ich poglądy.'
                    '\n\n7. Jestem aktywny. W swoim życiu wyróżniam się twórczą i odważną postawą.'
                    '\n\n8. Jestem ambitny. Podejmuję wyzwania.',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                ),
              )
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        TitleShortcutRowWidget(
          icon: MdiIcons.accountMultiplePlusOutline,
          iconColor: hintEnab_(context),
          title: 'Instruktor wobec wychowanków',
          textAlign: TextAlign.start,
          onOpen: () => showScrollBottomSheet(
              context: context,
              builder: (context) => BottomSheetDef(
                  title: 'Instruktor wobec wychowanków',
                  builder: (context) => Column(children: <Widget>[
                    SelectableText(
                      'Jestem instruktorem ZHP - harcerskim wychowawcą. W moich działaniach kieruję się Misją ZHP. Znam Podstawy wychowawcze ZHP. Wiem, kto jest adresatem moich działań, znam swoją rolę w wychowaniu metodą harcerską. Wiem, na czym polega przykład osobisty w wychowaniu.',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.justify,
                    ),
                    SelectableText('\n1. Jestem cierpliwy i wyrozumiały wobec moich wychowanków, poznaję ich problemy, pomagam je rozwiązywać.'
                        '\n\n2. Dbam o godność wychowanków. Szanuję ich i uczę szacunku do innych. Liczę się z ich zdaniem. Jestem wobec nich lojalny.'
                        '\n\n3. Jestem uczciwy wobec wychowanków. Uzasadniam swoje decyzje, tak by rozumieli cele podejmowanych działań.'
                        '\n\n4. Moim wychowankom stwarzam warunki do indywidualnego rozwoju. Stawiam przed nimi wyzwania na ich miarę.'
                        '\n\n5. Mam świadomość, że w każdej sytuacji jestem dla moich wychowanków wzorem.'
                        '\n\n6. Sprawiedliwie oceniam wychowanków, nagradzam ich za osiągnięcia, zwracam uwagę na popełniane błędy.',
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                    ),
                  ],)
              )
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        TitleShortcutRowWidget(
          icon: MdiIcons.homeVariantOutline,
          iconColor: hintEnab_(context),
          title: 'Instruktor wobec organizacji',
          textAlign: TextAlign.start,
          onOpen: () => showScrollBottomSheet(
              context: context,
              builder: (context) => BottomSheetDef(
                  title: 'Instruktor wobec organizacji',
                  builder: (context) => Column(children: <Widget>[
                    SelectableText(
                      'Jestem instruktorem Związku Harcerstwa Polskiego - członkiem harcerskiej organizacji, ale także uczestnikiem światowego ruchu skautowego. W ZHP – mojej organizacji. Dzięki niej przeżyłem wiele przygód, zdobyłem różne umiejętności. Miała ona wpływ na mój charakter. Dziś chcę, żeby była lepsza - staram się ją udoskonalić. Jestem gotowy, by ją współkształtować.',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                    ),
                    SelectableText('\n1. Znam swoje prawa w organizacji i uczciwie z nich korzystam.'
                        '\n\n2. Utożsamiam się z ZHP, dbam o jego wizerunek.'
                        '\n\n3. Znam swoje obowiązki wobec ZHP. Jestem lojalny wobec organizacji, dlatego staram się z nich wywiązywać.'
                        '\n\n4. Znam swoje możliwości. Odpowiedzialnie podejmuję się zadań. Ambitnie, ale realistycznie poszukuję nowych wyzwań. Powierzone funkcje pełnię rzetelnie.'
                        '\n\n5. Wiem, że dla rozwoju organizacji konieczne są zmiany na funkcjach. Dbam o przygotowanie moich następców. Dzielę się swoim doświadczeniem i umiejętnościami.'
                        '\n\n6. Orientuję się w sytuacji ZHP, świadomie uczestniczę w rozwiązywaniu problemów Związku.'
                        '\n\n7. Przestrzegam zasad obowiązujących w ZHP.',
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                    ),
                  ],)
              )
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        TitleShortcutRowWidget(
          icon: MdiIcons.earthArrowRight,
          iconColor: hintEnab_(context),
          title: 'Instruktor na zewnątrz organizacji',
          textAlign: TextAlign.start,
          onOpen: () => showScrollBottomSheet(
              context: context,
              builder: (context) => BottomSheetDef(
                  title: 'Instruktor na zewnątrz organizacji',
                  builder: (context) => Column(
                      children: [
                        SelectableText(
                          'Jestem instruktorem ZHP - wizytówką organizacji. Mam świadomość, że swoim postępowaniem buduję wizerunek instruktora harcerskiego i harcerstwa. Dbam o dobre relacje ZHP z otoczeniem. Jestem rzecznikiem spraw ZHP i naszych wychowanków na zewnątrz organizacji.',
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                        ),
                        SelectableText('\n1. Utrzymuję stały kontakt z rodzicami moich wychowanków oraz ich nauczycielami.'
                            '\n\n2. W kontaktach zewnętrznych, szczególnie wśród rodziców oraz instytucji publicznych, zawsze dbam o wizerunek harcerstwa, działam rzetelnie i profesjonalnie.'
                            '\n\n3. We współpracy z innymi organizacjami pozarządowymi dbam o wizerunek i wzmocnienie pozycji ZHP w trzecim sektorze.'
                            '\n\n4. Swoim działaniem, zachowaniem i wyglądem, staram się budować prestiż instruktora ZHP.'
                            '\n\n5. Przestrzegam przepisów prawa.',
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                        ),
                      ]
                  )
              )
          ),
        ),

      ],);
  }
}
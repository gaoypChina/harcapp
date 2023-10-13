import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChildMisja extends StatelessWidget{
  const ChildMisja({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: [

        AppCard(
          radius: AppCard.bigRadius,
            elevation: AppCard.bigElevation,
            padding: const EdgeInsets.all(Dimen.CARD_BIG_PADD),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                TitleShortcutRowWidget(
                  title: 'Misja',
                  onOpen: () => showScrollBottomSheet(
                    context: context,
                    builder: (context) => BottomMisja(),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(Dimen.defMarg),
                  child: SelectableText(
                    'Misją Związku Harcerstwa Polskiego jest wychowywanie młodego człowieka, czyli wspieranie go we wszechstronnym rozwoju i kształtowaniu charakteru przez stawianie wyzwań.',
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
                  ),
                )
              ],
            )
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            TitleShortcutRowWidget(
              icon: MdiIcons.toolboxOutline,
              title: 'Cechy metody harcerskiej',
              textAlign: TextAlign.start,
              onOpen: () => showScrollBottomSheet(
                context: context,
                builder: (context) => BottomMetodaCechy(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Column(
                children: [
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Dobrowolność', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Pozytywność', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Pośredniość', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Wzajemność oddziaływań', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Świadomość celów', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Indywidualność', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Naturalność', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                ],
              ),
            )
          ],
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            TitleShortcutRowWidget(
              icon: MdiIcons.dotsGrid,
              title: 'Elementy metody harcerskiej',
              textAlign: TextAlign.start,
              onOpen: () => showScrollBottomSheet(
                context: context,
                builder: (context) => BottomMetodaElementy(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Column(
                children: [
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Prawo i Przyrzeczenie', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Uczenie przez działanie', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('Stale doskonalony i stymulujący program', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                  Row(children: [
                    Icon(MdiIcons.circleSmall),
                    const SizedBox(width: Dimen.ICON_MARG),
                    Text('System małych grup', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG))
                  ]),
                ],
              ),
            )
          ],
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            TitleShortcutRowWidget(
              icon: MdiIcons.accountStarOutline,
              title: 'Rola drużynowego',
              textAlign: TextAlign.start,
              onOpen: () => showScrollBottomSheet(
                context: context,
                builder: (context) => BottomRolaDruzynowego(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
              child: SelectableText(
                'Drużyna jest podstawową jednostką w strukturze organizacyjnej ZHP, zaś rola drużynowego różni się w zależności od grupy metodycznej.',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
              ),
            )
          ],
        ),

      ],
    );
  }
}

class BottomMisja extends BottomSheetDef{

  BottomMisja({super.key}):super(
    title: 'Misja ZHP',
    builder: (context) => SelectableText.rich(
      TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context)),
        children: <TextSpan>[
          TextSpan(text: 'Naszą misją jest wychowywanie młodego człowieka, czyli wspieranie go...\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Aby w owym wspieraniu być skutecznym, stale rozwijamy się i uczymy, skutecznie wspierać może jedynie organizacja do tego rzetelnie przygotowana, taka, która stale pokonuje własne niedoskonałości i ograniczenia. Organizacja wyrazista, z kompetentną i ideową kadrą. Kadrą, która chce i może stać się dla młodego człowieka autorytetem, przewodnikiem, przyjacielem. Wspieramy drugiego człowieka, czyli pomagamy mu, wskazujemy, umożliwiamy – jednakże wybór drogi i stylu życia należą do tego, kogo prowadzimy harcerską ścieżką. W ten sposób uczymy samodzielności i zachęcamy młodego człowieka do brania odpowiedzialności za własne decyzje, działania, własny rozwój. Naszymi działaniami nie konkurujemy z rodzicami i rodziną. Rodziców traktujemy jako pierwszych, najważniejszych wychowawców, dlatego naszą pracę wychowawczą prowadzimy w stałej współpracy z nimi. ZHP istnieje nie po to, by doskonalić strukturę, przepływ informacji oraz proponować coraz ciekawsze i atrakcyjniejsze rozwiązania metodyczne dla nich samych. Wszystko to ma sens tylko wtedy, gdy służy wspieraniu młodego człowieka. Przy wątpliwościach, czym ZHP rzeczywiście powinno się zajmować, należy postawić sobie pytanie, na ile owe działania służą wspieraniu młodego człowieka w rozwoju;\n\n'),
          TextSpan(text: '...we wszechstronnym rozwoju...\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Tak budujemy organizację, układamy pracę, tworzymy program czy dzielimy zadania, aby umożliwiać wszechstronny - duchowy, emocjonalny, intelektualny, społeczny i fizyczny - rozwój. Patrzymy na człowieka jako na pewną całość – i wspieramy go w rozwoju każdego z owych aspektów. Dopiero takie holistyczne podejście do kwestii wychowania umożliwia kształtowanie postaw, naukę oraz doskonalenie umiejętności. Nie to wyróżnia nas spośród innych organizacji pozarządowych, że zajmujemy się rozwojem duchowym, emocjonalnym, intelektualnym, społecznym czy fizycznym. Wyróżnia nas i jest dla nas cenne to, że te wszystkie sfery rozwoju są dla nas obiektem troski jednocześnie, stale i równoważnie;\n\n'),
          TextSpan(text: '...i kształtowaniu charakteru przez stawianie wyzwań.\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Kształtowanie charakteru wymaga aktywnej postawy wobec siebie samego i otaczającej rzeczywistości. Jesteśmy elementami większej całości – funkcjonujemy wśród innych ludzi, w określonych warunkach, spotykamy się z różnorodnymi postawami wobec życia. Chcemy przygotować młodego człowieka do samodzielnego stawiania sobie coraz wyżej poprzeczki. Do wymagania od siebie i niezgody na bylejakość. Ważne dla nas są umiejętności, wiedza, przeżycia. Ale mają one być narzędziem do kształtowania charakteru, a nie to kształtowanie zastąpić;'),

        ],
      ),
      textAlign: TextAlign.justify,
    ),
  );
}

class BottomMetodaCechy extends BottomSheetDef{

  BottomMetodaCechy({super.key}):super(
    title: 'Cechy metody',
    builder: (context) => SelectableText.rich(
      TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context)),
        children: <TextSpan>[
          TextSpan(text: 'Dobrowolność\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Harcerskie działanie opiera się na dobrej woli młodego człowieka. Każdy ma prawo do podejmowania decyzji związanych z własnym rozwojem i aktywnym uczestnictwem w życiu naszej organizacji. Dobrowolne dokonywanie wyborów sprawia, że jesteśmy bardziej dojrzalsi i umiemy więcej. Ważnym momentem wyrażenia własnej woli jest moment składania Obietnicy Zucha, Przyrzeczenia Harcerskiego i Zobowiązania Instruktorskiego.\n\n'),
          TextSpan(text: 'Pozytywność\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'W harcerstwie podejmujemy zadania o wymiarze pozytywnym, które mają bezpośredni wpływ na kształtowanie postawy i charakteru młodego człowieka. W każdym rozbudzamy poczucie piękna i dobra, pomagamy rozwijać zdolności oraz pielęgnować wartości. Istotna jest wiara we własne siły i możliwości, która pozwala rozwijać się i piąć wzwyż.\n\n'),
          TextSpan(text: 'Pośredniość\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Wychowanie w harcerstwie następuje nie wprost, ale przez podejmowanie działań, zdobywanie coraz wyższych stopni i nowych sprawności, uczestnictwo w atrakcyjnym programie. Celem jest podejmowanie przez każdego wysiłku a nie proponowanie gotowych rozwiązań. Postępując zgodnie z Prawem i Przyrzeczeniem, działając i współpracując z innymi uczymy się życia.\n\n'),
          TextSpan(text: 'Wzajemność oddziaływań\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'W harcerstwie jedni uczą się od drugich przez wzorowe postępowanie, przykład osobisty i baczną obserwację innych. Istotną rolę odgrywa współzawodnictwo, którego celem jest zawsze wszechstronny rozwój. W grupie rówieśników każdy nie tylko może pokazać, co wie, co umie, czego może nauczyć innych, ale też może uczyć się od innych.\n\n'),
          TextSpan(text: 'Świadomość celów\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Uświadomienie sobie potrzeby własnego rozwoju lub też wykonania jakiegoś zadania, ułatwia realizację zamierzenia. W naszej organizacji jesteśmy świadomi naszych potrzeb i naszych możliwości. Wiemy też, po co w harcerstwie jesteśmy, że staramy się o swój wszechstronny rozwój. Wszystko, co dzieje się w ZHP, ma swój cel.\n\n',),
          TextSpan(text: 'Indywidualność\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'W harcerstwie najważniejszy jest człowiek i jego wszechstronny rozwój. Stwarzamy takie warunki, aby każdy indywidualnie niezależnie od wieku, płci, doświadczenia, zainteresowań mógł znaleźć swoje miejsce w ZHP. Dbamy o wszechstronny rozwój jednostki.\n\n'),
          TextSpan(text: 'Naturalność\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'W harcerstwie wszystko jest zwyczajne i dostosowane do warunków, w których żyjemy. Wszystko ma "swój czas", dlatego zuchy bawią się, harcerze uczestniczą w grze, harcerze starsi poszukują a wędrownicy podejmują służbę. Robimy tak po to, by każdy miał możliwość rozwoju zgodnie ze swoimi możliwościami i potrzebami. Przestrzeganie norm zawartych w Prawie i Przyrzeczeniu ma źródła w harcerskiej naturze.'),
        ],
      ),
      textAlign: TextAlign.justify,
    ),
  );
}

class BottomMetodaElementy extends BottomSheetDef{

  BottomMetodaElementy({super.key}):super(
    title: 'Elementy metody',
    builder: (context) => SelectableText.rich(
      TextSpan(
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context)),
        children: <TextSpan>[
          TextSpan(text: 'Prawo i Przyrzeczenie\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Prawo i Przyrzeczenie to tradycyjny, prawie stuletni zapis naszego kodeksu postępowania. To dzięki nim każdy, kto zetknie się z harcerstwem, nawet na krótko, ma okazję do pracy nad własnym charakterem, nad własną osobowością. Praca z Prawem to nieustanne obserwowanie siebie samego i praca nad sobą, która w konsekwencji prowadzi do świadomego przyjęcia określonego stylu życia. Prawo i Przyrzeczenie są wskazówką dla każdego w odpowiedzi na pytania: Jak postępować? Jak żyć?\n\n'),
          TextSpan(text: 'Uczenie przez działanie\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Doświadczając, próbując, przeżywając, aktywnie uczestnicząc – młody człowiek przygotowuje się do dorosłości. Istotne jest stwarzanie takich sytuacji w działalności gromady/drużyny, aby każdy miał możliwość działania indywidualnie, a także w grupie. Działanie to powinno mieć bezpośredni związek z życiem społeczeństwa i w społeczeństwie. Zuchy, harcerze, harcerze starsi i wędrownicy działają – podczas zdobywania gwiazdek, stopni, sprawności, realizacji zadań, ćwiczeniu technik harcerskich, podczas zbiórki, obozu czy kolonii, rajdu, ale także w codziennym życiu – podczas wypełniania swoich obowiązków wobec domu rodzinnego czy szkoły. Daje im to szansę na przeżycie przygody. W każdej grupie wiekowej działanie odbywa się w inny sposób: zuch – przez zabawę w coś lub kogoś, harcerz – przez grę, harcerz starszy – przez poszukiwanie, wędrownik – służbę i wyczyn.\n\n'),
          TextSpan(text: 'Stale doskonalony i stymulujący program\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: '\nProgram powinien być wszechstronny tak, jak wszechstronny powinien być rozwój. Tak, aby każdy mógł w nim znaleźć coś dla siebie. Celem jest rozbudzanie zainteresowań, zaciekawienie, zachęcenie do zdobywania nowej wiedzy i umiejętności, poszukiwania dróg indywidualnego rozwoju. To wszystko musi się złożyć na program: zastępu, drużyny, hufca, chorągwi, ZHP. Dzięki dobremu zaplanowaniu i podjęciu działań indywidualnych i zbiorowych (zbiórka, obóz harcerski, kolonia zuchowa, rajd, festiwal…) program będzie stymulował rozwój każdej jednostki, a tym samym całej naszej organizacji. Ważne jest wykorzystywanie w harcerskiej pracy instrumentów metodycznych (stopnie, gwiazdki, sprawności, znaki służb…), formy pracy, propozycje i inspiracje zucha, harcerza, harcerza starszego, wędrownika i instruktora, ale także pomysłów różnych zespołów i grup oraz pobudzanie do samodoskonalenia się i aktywnego udziału w życiu harcerskim. Program musi być pożyteczny i potrzebny każdemu, kto w nim uczestniczy, trzeba go wciąż aktualizować i tworzyć w perspektywie otaczającej nas rzeczywistości. Realizacja programu powinna być silnym, gorącym, intensywnym, pełnym napięcia, ale zawsze pozytywnym przeżyciem, na które czeka się z przyspieszonym biciem serca i które zawsze wzbudza chęć dalszego działania.\n\n'),
          TextSpan(text: 'System małych grup\n\n', style: AppTextStyle(fontWeight: weight.halfBold)),
          const TextSpan(text: 'Zastęp to grupa przyjaciół, która pozwala na znalezienie swojego miejsca i sprawdzenie się w samodzielnym działaniu. Praca w małych grupach przynosi wymierne efekty wychowawcze, ponieważ łatwiej jest dotrzeć do każdego, dostrzec jego wartość, pomóc mu pokonać słabości, porozmawiać z nim, poznać go. W harcerstwie takie grupy stanowią szóstki, zastępy, patrole, zespoły zadaniowe. Na ich czele stoją zwykle rówieśnicy mający trochę większe doświadczenie czy też wyrobienie harcerskie, cieszący się zaufaniem. We współzawodnictwie konkurowanie ze sobą zespołów wzmaga emocje, zwiększa motywację do działania.'),
        ],
      ),
      textAlign: TextAlign.justify,
    ),
  );
}

class BottomRolaDruzynowego extends BottomSheetDef{

  BottomRolaDruzynowego({super.key}):super(
      title: 'Rola drużynowego',
      builder: (context) => SelectableText(
        'Główny cel ZHP – wspieranie młodego człowieka w rozwoju i kształtowanie charakteru realizowany jest głównie w codziennej pracy każdej gromady i drużyny. Najważniejszym harcerskim wychowawcą jest drużynowy. Dla realizacji celu naszej organizacji buduje on w drużynie program wychowawczy, indywidualnie odpowiadający na potrzeby członków drużyny, ale oparty na takich samych dla całej organizacji podstawach wychowawczych. Przez program rozumiemy całokształt działań celowo podejmowanych przez instruktora i gromadę/drużynę oraz stawianie wyzwań dla wspierania rozwoju młodego człowieka, kształtowania jego charakteru. Składają się na niego zadania stopni, gwiazdek zuchowych i sprawności, zadania zespołowe, znaki służb, projekty, obóz, kolonia zuchowa itd.. Program jest realizowany na szczeblu gromady i drużyny, a oparty na tych samych dla całej organizacji wartościach. Dla wspierania działań wychowawczych drużynowego harcerskie komendy w swoim programie pracy zawierają działania wzmacniające realizację programu gromad i drużyn.\n\nOsobisty przykład, stosowanie metody harcerskiej, wierność harcerskim ideałom w codziennym życiu czyni drużynowego świadomym swej roli wychowawcą. Zadaniem poszczególnych szczebli organizacji i poszczególnych zespołów instruktorskich jest wspomaganie pracy drużynowego, umacnianie jego roli i pozycji w środowisku harcerskim i lokalnym. Jakość pracy drużynowego powinna być troską całej wspólnoty instruktorskiej.',
        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
        textAlign: TextAlign.justify,
      )
  );
}
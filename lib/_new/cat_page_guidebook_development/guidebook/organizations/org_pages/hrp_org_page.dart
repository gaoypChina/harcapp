
import 'package:flutter/material.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import '../org_cards/hrp_org_card_widget.dart';
import 'common.dart';

class HRPOrgPage extends StatefulWidget{

  const HRPOrgPage({super.key});

  @override
  State<StatefulWidget> createState() => HRPOrgPageState();

}

class HRPOrgPageState extends State<HRPOrgPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.orgZHR;

  Color grayColor = const Color.fromARGB(255, 75, 75, 75);
  Color hrpGreenLight = const Color.fromARGB(255, 164, 164, 0);

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      const HRPOrgCardWidget(),

      const SizedBox(height: commonPadding),

      const Padding(
        padding: EdgeInsets.all(commonPadding),
        child: AppText(
          '<b>Harcerstwo Rzeczypospolitej Polskiej</b> to jedna z organizacji harcerskich w Polsce, zrzeszająca młodych ludzi chcących rozwijać swoje <b>pasje związane ze skautingiem i wojskiem</b>. W oparciu o <b>wzorce przedwojonnego harcerstwie II RP</b> i fasonie wojskowym, HRP wychowuje człowieka chcącego nieść dobro i dającego <b>przykład patrioty</b>.',
          textAlign: TextAlign.justify,
          height: 1.2,
          size: Dimen.TEXT_SIZE_BIG,
          color: AppColors.hrpGreen,
          colorItalic: AppColors.hrpGreen,
        ),
      ),

      const SizedBox(height: commonPadding),

      AppCard(
        radius: AppCard.bigRadius,
        padding: EdgeInsets.zero,
        color: grayColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Item(
              'Miejsce działania',
              'Komenda Główna wraz z siedzibą znajduje się w Krakowie w którym stacjonuje 1. Krakowska Drużyna Harcerska HRP. Drużyny HRP stacjonują także w Wielkopolsce we Wrześni oraz w Świętokrzyskim w Busku Zdroju.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.mapMarker, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Struktura',
              'HRP ma podstawową konstrukcję organizacji harcerskiej.'
                  '\n\n- Komenda Główna'
                  '\n- Chorągiew'
                  '\n- Hufiec'
                  '\n- Drużyna'
                  '\n- Zastępy',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.transitConnection, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'System stopni',
              'HRP posługuje się stopniami wojskowymi począwszy od szeregowego aż do majora i stosuje hierarchię korpusów.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.chevronDoubleRight, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Kadra instruktorska',
              'Kadrę HRP stanowią pełnoletni, doświadczeni harcerze, którzy ukończyli kurs przewodnikowski wewnątrz organizacji.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.accountStar, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Działalność śródroczna',
              'HRP w ciągu roku udziela się organizując w drużynach zbiórki, biorąc udział w akcjach zabezpieczeniowych podczas różnych świąt np. Boże Ciało. Reprezentacja HRP wraz z pocztem sztandarowym bierze udział w obchodach Święta Niepodległości, 3 Maja oraz innych wydarzeniach.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.calendar, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Obozy harcerskie',
              'W wakacje organizowany jest obóz letni, trwający 2 tygodnie. W trakcie ferii zimowych odbywa się zimowisko trwające tydzień.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.tent, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Prawo harcerskie',
              '<b>1.</b> Harcerz jest wierny Bogu i Polsce'
              '\n\n<b>2.</b> Harcerz jest godny zaufania'
              '\n\n<b>3.</b> Harcerz jest pożyteczny, chętnie niesie pomoc bliźnim'
              '\n\n<b>4.</b> Harcerz za brata uważa każdego innego harcerza'
              '\n\n<b>5.</b> Harcerz jest rycerski w słowie i działaniu'
              '\n\n<b>6.</b> Harcerz jest przyjacielem przyrody'
              '\n\n<b>7.</b> Harcerz jest posłuszny rodzicom, słucha poleceń przełożonych'
              '\n\n<b>8.</b> Harcerz jest radosny i śmiało stawia czoła trudnościom'
              '\n\n<b>9.</b> Harcerz jest ofiarny i oszczędny'
              '\n\n<b>10.</b> Harcerz jest czysty w myśli, mowie i działaniu.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.fleurDeLis, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Przyrzeczenie harcerskie',
              'Przyrzekam na swój harcerski honor uczynić wszystko, co leży w mojej mocy, by dobrze spełnić powierzone mi zadania. Będę wierny Bogu i Polsce, chętnie będę nieść pomoc bliźnim w każdej potrzebie i będę posłuszny Prawu Harcerskiemu.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.starOutline, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Przysięga harcerzy - żołnierzy',
              'Przysięgam Panu Bogu Wszechmogącemu, w Trójcy Świętej Jedynemu być wiernym Ojczyźnie mej, Rzeczpospolitej Polskiej, jednej i niepodzielnej oraz bronić jej honoru we współczesnym świecie. Przysięgam, iż gotów jestem życie oddać za świętą sprawę jej obrony i wyzwolenia fizycznego i duchowego, nieść chętnie pomoc bliźnim, bronić sztandaru mej chorągwi harcerskiej do ostatniej kropli krwi, dochować karności i posłuszeństwa mojej zwierzchności harcerskiej i wojskowej oraz prawu harcerskiemu, a w całym postępowaniu moim strzec honoru żołnierza i harcerza polskiego. Rozkazy dowódców i przełożonych wiernie wykonywać. Tajemnic wojskowych i harcerskich strzec. Za sprawę Ojczyzny mej walczyć do ostatniego tchu w piersiach. I w ogóle tak postępować, aby mógł żyć i umierać jak prawy harcerz i żołnierz polski oraz prawdziwy Polak. Tak mi dopomóż Bóg i Święta Syna Jego Męka. Amen.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.star, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Kodeks rycerski',
              '<b>1.</b> Bądź zawsze oddany Bogu i Ojczyźnie.'
              '\n\n<b>2.</b> Nigdy nie bądź tchórzliwy.'
              '\n\n<b>3.</b> Bądź ambitny i podążaj do celu.'
              '\n\n<b>4.</b> Przegrane bitwy znoś z honorem.'
              '\n\n<b>5.</b> Bądź wzorem dla innych.'
              '\n\n<b>6.</b> Szanuj ludzi wokół siebie.'
              '\n\n<b>7.</b> Dobro i prawość przed niesprawiedliwością broń.'
              '\n\n<b>8.</b> Bądź hojny dla ludzi w potrzebie.'
              '\n\n<b>9.</b> Bądź wierny swym zasadom i ideałom.'
              '\n\n<b>10.</b> Nie krzywdź słabszych.'
              '\n\n<b>11.</b> Mów prawdę zawsze, choćbyś miał zginąć.',
              titleColor: hrpGreenLight,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.shield, color: hrpGreenLight), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

          ],
        ),
      ),
    ],
  );

}
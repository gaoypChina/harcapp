import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/organizations/org_cards/zhr_org_card_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../module_statistics_registrator.dart';
import 'common.dart';

class ZHROrgPage extends StatefulWidget{

  const ZHROrgPage({super.key});

  @override
  State<StatefulWidget> createState() => ZHROrgPageState();

}

class ZHROrgPageState extends State<ZHROrgPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.orgZHR;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      const ZHROrgCardWidget(),

      const SizedBox(height: commonPadding),

      AppCard(
        radius: AppCard.bigRadius,
        color: AppColors.zhr_red,
        child: Column(
          children: const [

            Padding(
              padding: EdgeInsets.all(commonPadding),
              child: AppText(
                '<b>Związek Harcerstwa Rzeczypospolitej</b> to wspólnota <b>przyjaciół</b> – dzieci, młodzieży i dorosłych, która w oparciu o <b>wartości chrześcijańskie</b>, poprzez <b>przykład własny</b> instruktorek i instruktorów harcerskich, pracę nad sobą, służbę, przygodę oraz inne elementy metody harcerskiej wychowuje człowieka pełnego radości życia, <b>odpowiedzialnego</b> za <b>Polskę</b> i gotowego podjąć <b>wyzwania</b> współczesności.',
                /*
              '<i>ZHR kształtuje swych członków i uczestników przede wszystkim poprzez działanie i atmosferę życia – na drodze wychowania pośredniego.'
                  '\n'
                  '\nChce ich wychowywać na ludzi uczciwych i dzielnych, samodzielnych w myśleniu i podejmowaniu decyzji, otwartych na świat wartości i świat wokół nich.</i>'
                  '\n\nhm. RP <b>T. Strzembosz</b>, List do instruktorów nr 1, 1989',*/
                textAlign: TextAlign.justify,
                height: 1.2,
                size: Dimen.TEXT_SIZE_BIG,
                color: Colors.white,
                colorItalic: Colors.white,
              ),
            ),

          ],
        ),
      ),

      const SizedBox(height: commonPadding),

      Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              onPressed: () => launchURL('https://www.facebook.com/harcerstwo/'),
              icon: const Icon(MdiIcons.facebook, color: AppColors.zhr_red),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () => launchURL('https://twitter.com/harcerstwo'),
              icon: const Icon(MdiIcons.twitter, color: AppColors.zhr_red),
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () => launchURL('https://www.instagram.com/zhrharcerstwo/'),
              icon: const Icon(MdiIcons.instagram, color: AppColors.zhr_red),
            ),
          ),
        ],
      ),

      const SizedBox(height: commonPadding),

      Column(
        children: <Widget>[

          Item(
            'Przedwojenne wartości',
            'ZHR jest wspólnotą, której członkowie w zmieniającym się społeczeństwie są wierni tradycyjnemu Przyrzeczeniu i Prawu Harcerskiemu.',
            titleColor: AppColors.zhr_red,
            titleLeading: Row(children: const [Icon(MdiIcons.compass, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
            inCard: false,
          ),

          const SizedBox(height: commonPadding),

          Item(
            'Organizacja Harcerek i Harcerzy',
            'Praca wychowawcza prowadzona jest w oparciu o metodę harcerską w odrębnych organizacjach harcerek i harcerzy.',
            titleColor: AppColors.zhr_red,
            titleLeading: Row(children: const [Icon(MdiIcons.humanMaleFemale, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
            inCard: false,
          ),

          const SizedBox(height: commonPadding),

          Item(
            'Odpowiedzialna, doświadczona kadra',
            'Kadrę Związku stanowią instruktorki i instruktorzy – pełnoletni, kompetentni i będący chrześcijanami.',
            titleColor: AppColors.zhr_red,
            titleLeading: Row(children: const [Icon(MdiIcons.accountCowboyHat, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
            inCard: false,
          ),

          const SizedBox(height: commonPadding),

          Item(
            'Aktualny program',
            'Związek modyfikuje swój program i sposoby działania, aby odpowiadać na wyzwania zmieniającej się rzeczywistości.',
            titleColor: AppColors.zhr_red,
            titleLeading: Row(children: const [Icon(MdiIcons.formatListChecks, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
            inCard: false,
          ),

          const SizedBox(height: commonPadding),

          Item(
            'Zasięg',
            'Organizacja inicjuje i wspiera środowiska działające we wszystkich miejscowościach, niezależnie od ich wielkości.',
            titleColor: AppColors.zhr_red,
            titleLeading: Row(children: const [Icon(MdiIcons.signalCellular3, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
            inCard: false,
          ),

          const SizedBox(height: commonPadding),

          Item(
            'Członkowie',
            'Członkowie ZHR są aktywni w życiu społecznym, mają wpływ na kształtowanie stylu życia młodych ludzi, podejmują służbę na rzecz innych i środowiska naturalnego.',
            titleColor: AppColors.zhr_red,
            titleLeading: Row(children: const [Icon(MdiIcons.accountGroup, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
            inCard: false,
          ),
        ],
      ),

      const SizedBox(height: commonPadding),
    ],
  );

}
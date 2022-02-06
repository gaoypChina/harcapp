import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_cards/zhr_org_card_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';

class ZHROrgPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Związek Harcerstwa Rzeczypospolitej'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                ZHROrgCardWidget(),

                const SizedBox(height: commonPadding),

                AppCard(
                  radius: AppCard.BIG_RADIUS,
                  color: AppColors.zhr_red,
                  child: Column(
                    children: [

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

                SizedBox(height: commonPadding),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: IconButton(
                        onPressed: () => launchURL('https://www.facebook.com/harcerstwo/'),
                        icon: Icon(MdiIcons.facebook, color: AppColors.zhr_red),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () => launchURL('https://twitter.com/harcerstwo'),
                        icon: Icon(MdiIcons.twitter, color: AppColors.zhr_red),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () => launchURL('https://www.instagram.com/zhrharcerstwo/'),
                        icon: Icon(MdiIcons.instagram, color: AppColors.zhr_red),
                      ),
                    ),
                  ],
                ),


                /*
        SizedBox(height: commonPadding),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  AutoSizeText('17 500', style: AppTextStyle(fontWeight: weight.bold), group: group1, textAlign: TextAlign.center),
                  SizedBox(height: Dimen.DEF_MARG),
                  AutoSizeText(
                      'Harcerzy i harcerek',
                      minFontSize: 6,
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                      group: group2,
                      maxLines: 1,
                      textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  AutoSizeText('1 800', style: AppTextStyle(fontWeight: weight.bold), group: group1, textAlign: TextAlign.center),
                  SizedBox(height: Dimen.DEF_MARG),
                  AutoSizeText(
                      'Instruktorek i instruktorów',
                      minFontSize: 6,
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                      group: group2,
                      maxLines: 1,
                      textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  AutoSizeText('1 014', style: AppTextStyle(fontWeight: weight.bold), group: group1, textAlign: TextAlign.center),
                  SizedBox(height: Dimen.DEF_MARG),
                  AutoSizeText(
                      'Drużyn w ZHR',
                      minFontSize: 6,
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                      group: group2,
                      maxLines: 1,
                      textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
          ],
        ),
        */

                SizedBox(height: commonPadding),

                Column(
                  children: <Widget>[

                    Item(
                      'Przedwojenne wartości',
                      'ZHR jest wspólnotą, której członkowie w zmieniającym się społeczeństwie są wierni tradycyjnemu Przyrzeczeniu i Prawu Harcerskiemu.',
                      titleColor: AppColors.zhr_red,
                      titleLeading: Row(children: [Icon(MdiIcons.compass, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
                      inCard: false,
                    ),

                    SizedBox(height: commonPadding),

                    Item(
                      'Organizacja Harcerek i Harcerzy',
                      'Praca wychowawcza prowadzona jest w oparciu o metodę harcerską w odrębnych organizacjach harcerek i harcerzy.',
                      titleColor: AppColors.zhr_red,
                      titleLeading: Row(children: [Icon(MdiIcons.humanMaleFemale, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
                      inCard: false,
                    ),

                    SizedBox(height: commonPadding),

                    Item(
                      'Odpowiedzialna, doświadczona kadra',
                      'Kadrę Związku stanowią instruktorki i instruktorzy – pełnoletni, kompetentni i będący chrześcijanami.',
                      titleColor: AppColors.zhr_red,
                      titleLeading: Row(children: [Icon(MdiIcons.accountCowboyHat, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
                      inCard: false,
                    ),

                    SizedBox(height: commonPadding),

                    Item(
                      'Aktualny program',
                      'Związek modyfikuje swój program i sposoby działania, aby odpowiadać na wyzwania zmieniającej się rzeczywistości.',
                      titleColor: AppColors.zhr_red,
                      titleLeading: Row(children: [Icon(MdiIcons.formatListChecks, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
                      inCard: false,
                    ),

                    SizedBox(height: commonPadding),

                    Item(
                      'Zasięg',
                      'Organizacja inicjuje i wspiera środowiska działające we wszystkich miejscowościach, niezależnie od ich wielkości.',
                      titleColor: AppColors.zhr_red,
                      titleLeading: Row(children: [Icon(MdiIcons.signalCellular3, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
                      inCard: false,
                    ),

                    SizedBox(height: commonPadding),

                    Item(
                      'Członkowie',
                      'Członkowie ZHR są aktywni w życiu społecznym, mają wpływ na kształtowanie stylu życia młodych ludzi, podejmują służbę na rzecz innych i środowiska naturalnego.',
                      titleColor: AppColors.zhr_red,
                      titleLeading: Row(children: [Icon(MdiIcons.accountGroup, color: AppColors.zhr_red), SizedBox(width: Dimen.ICON_MARG)]),
                      inCard: false,
                    ),
                  ],
                ),

                SizedBox(height: commonPadding),

              ]),
            ),
          )

        ],
      ),
    );
  }

}
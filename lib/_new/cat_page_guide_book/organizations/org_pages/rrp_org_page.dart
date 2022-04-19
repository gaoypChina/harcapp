import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/organizations/org_cards/rrp_org_card_widget.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../module_statistics_registrator.dart';
import 'common.dart';

class RRPOrgPage extends StatefulWidget{

  const RRPOrgPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RRPOrgPageState();


}

class RRPOrgPageState extends State<RRPOrgPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.orgRRP;

  final Color _yellow = Colors.amberAccent;
  final Color _graphite = const Color.fromARGB(255, 55, 55, 65);

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      const RRPOrgCardWidget(),

      const Padding(
        padding: EdgeInsets.all(commonPadding),
        child: AppText(
          '"Royal Rangers Polska" jest częścią międzynarodowej, chrześcijańskiej organizacji skautowej Royal Rangers, która działa od 1962 roku w ponad 80 krajach na całym świecie.'
              '\n'
              '\nCelem działalności wychowawczej RRP jest <b>fizyczny</b>, <b>psychiczny</b>, <b>społeczny</b> i <b>duchowy</b> rozwój dzieci i młodzieży w duchu wartości <b>chrześcijańskich</b>, <b>patriotycznych</b> i <b>obywatelskich</b>.',
          /*
              '<i>ZHR kształtuje swych członków i uczestników przede wszystkim poprzez działanie i atmosferę życia – na drodze wychowania pośredniego.'
                  '\n'
                  '\nChce ich wychowywać na ludzi uczciwych i dzielnych, samodzielnych w myśleniu i podejmowaniu decyzji, otwartych na świat wartości i świat wokół nich.</i>'
                  '\n\nhm. RP <b>T. Strzembosz</b>, List do instruktorów nr 1, 1989',*/
          textAlign: TextAlign.justify,
          size: Dimen.TEXT_SIZE_BIG,
        ),
      ),

      Item(
        'Złota zasada',
        '"<b>A więc wszystko, co byście chcieli, aby wam ludzie czynili, to i wy im czyńcie</b>."\n\n- Ewangelia Mateusza 7,12',
        cardColor: _graphite,
        textColor: _yellow,
        titleColor: _yellow,
        titleLeading: Row(children: [Icon(MdiIcons.star, color: _yellow), const SizedBox(width: Dimen.ICON_MARG)]),
        inCard: true,
      ),

      const SizedBox(height: commonPadding),

      Item(
        'Przyrzeczenie',
        'Z Bożą pomocą uczynię wszystko, aby służyć Bogu, jego kościołowi i bliźnim, przestrzegając prawa Royal Rangers i wprowadzając w życie złotą zasadę.',
        cardColor: _graphite,
        textColor: _yellow,
        titleColor: _yellow,
        titleLeading: Row(children: [Icon(MdiIcons.textShort, color: _yellow), const SizedBox(width: Dimen.ICON_MARG)]),
        inCard: true,
      ),

      const SizedBox(height: commonPadding),

      Item(
        'Prawo Royal Rangers',
        '1. <b>Gotowy</b>'
            '\nPsychicznie, fizycznie, duchowo.'
            '\n'
            '\n2. <b>Czysty</b>'
            '\nNa ciele, w myślach i w mowie.'
            '\n'
            '\n3. <b>Uczciwy</b>'
            '\nNie kłamie, nie oszukuje, nie kradnie.'
            '\n'
            '\n4. <b>Dzielny</b>'
            '\nOdważny w obliczu niebezpieczeństwa, krytyki i groźby.'
            '\n'
            '\n5. <b>Wierny</b>'
            '\nBogu, Kościołowi, rodzinie, przyjaciołom.'
            '\n'
            '\n6. <b>Uprzejmy</b>'
            '\nMiły, grzeczny, troskliwy.'
            '\n'
            '\n7. <b>Posłuszny</b>'
            '\nRodzicom, liderom, przełożonym.'
            '\n'
            '\n8. <b>Duchowy</b>'
            '\nModli się, czyta Biblię, głosi Ewangelię.',
        cardColor: _graphite,
        textColor: _yellow,
        titleColor: _yellow,
        titleLeading: Row(children: [Icon(MdiIcons.textBoxCheckOutline, color: _yellow), const SizedBox(width: Dimen.ICON_MARG)]),
        inCard: true,
      ),
    ],
  );

}
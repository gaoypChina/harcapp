import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_cards/zhp_org_card_widget.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'common.dart';

class ZHPOrgPage extends StatefulWidget {

  const ZHPOrgPage({super.key});

  @override
  State<StatefulWidget> createState() => ZHPOrgPageState();

}

class ZHPOrgPageState extends State<ZHPOrgPage> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.orgZHP;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      const ZHPOrgCardWidget(),

      Row(
        children: <Widget>[
          Expanded(
            child: SimpleButton(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              onTap: () => launchURL('https://www.facebook.com/ZwiazekHarcerstwaPolskiego/'),
              child: Icon(MdiIcons.facebook, color: AppColors.zhpGreen),
            ),
          ),
          Expanded(
            child: SimpleButton(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              onTap: () => launchURL('https://twitter.com/zhp_pl'),
              child: Icon(MdiIcons.twitter, color: AppColors.zhpGreen),
            ),
          ),
          Expanded(
            child: SimpleButton(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              onTap: () => launchURL('https://www.instagram.com/zhp_pl'),
              child: Icon(MdiIcons.instagram, color: AppColors.zhpGreen),
            ),
          ),
        ],
      ),

      const Item(
        'Jak działamy?',
        'W pracy harcerskiej instruktorzy harcerscy stosują sprawdzoną metodę polegającą na realizacji zadań w małych grupach rówieśniczych, uczeniu w działaniu, wykorzystywaniu stymulującego programu oraz odwoływaniu się do idei wyrażonych w Prawie i Przyrzeczeniu Harcerskim.'
            '\n'
            '\nW harcerstwie wychowujemy przez stawianie wyzwań. Zachęcamy dzieci i młodzież do ciągłego doskonalenia się, zdobywania wiedzy i umiejętności. Metoda harcerska opiera się na nauce poprzez działanie, rozbudzaniu zainteresowań i pasji młodych ludzi. Wspieramy rozwój intelektualny, fizyczny, emocjonalny i duchowy.'
            '\n'
            '\nDrużyny harcerskie to grupy społeczne, dzięki którym młodzi ludzie mogą razem przeżywać przygody, organizować wyprawy, realizować projekty. Liderów w naszej organizacji uczymy koordynacji działań wielu zespołów i optymalnego wykorzystania kompetencji tworzących je osób.',
        inCard: false,
      ),
      const Item(
        'Po co jesteśmy?',
        'Harcerskie wychowanie przygotowuje do uczestnictwa w dynamicznie zmieniającym się otoczeniu. Gotowość do działań, umiejętność szybkiego podejmowania decyzji, wykazanie się inicjatywą, otwartością i spontanicznością pomagają w adaptacji w nowym miejscu nauki czy pracy. Łatwo zauważyć, że harcerze wykazują się większą niż inni młodzi ludzie odpornością na stres i odważniej podejmują wyzwania.',
        inCard: false,
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          const SizedBox(height: commonPadding),
          Text('Celem jest wychowanie', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context), shadow: true), textAlign: TextAlign.center,),
          const SizedBox(height: commonPadding),

          const Item(
            'Harcerstwo w ruchu',
            'Wszelka aktywność na świeżym powietrzu – na łonie przyrody, z szacunkiem do natury. Propagowanie zdrowych zachowań, wędrówki, biwakowanie i obozowanie, wspólne przygotowywanie i spożywanie pełnowartościowych posiłków.',
            titleColor: AppColors.zhpGreen,
          ),
          const Item(
              'Aktywność społeczna',
              'Zespołowe podejmowanie działań na rzecz społeczności lokalnej w oparciu o rozpoznanie potrzeb najbliższego środowiska działania gromad i drużyn. Tworzenie projektów mających na celu poprawę jakości funkcjonowania wspólnoty lokalnej.',
              titleColor: AppColors.zhpGreen),
          const Item(
              'Ciekawość świata',
              'Ciekawość Polski, Europy, świata; ludzi i kultur; przyrody - jej piękna i praw działania. Ciekawość po to, by poznać. Poznać po to, by działać.',
              titleColor: AppColors.zhpGreen),
          const Item(
              'Sprawności na całe życie',
              'Rozbudzanie zainteresowań, praktyczna nauka umiejętności przydatnych w życiu, techniki harcerskie wypełniane aktualnymi treściami, specjalnościami, a także samoorganizacja, pilność i rzetelność w realizowaniu zadań.',
              titleColor: AppColors.zhpGreen),
          const Item(
              'Braterstwo',
              'Przyjaźń, nauka dialogu i szacunku mimo różnic, nawiązywanie i utrzymywanie kontaktów z ludźmi, sprzeciwianie się przemocy.',
              titleColor: AppColors.zhpGreen),
          const Item(
              'Radosny patriotyzm',
              'Promowanie Polski w świecie, optymizm i wiara we własne możliwości, postawa obywatelska, radosne przeżywanie świąt państwowych, orientowanie się w osiągnięciach Polaków.',
              titleColor: AppColors.zhpGreen),
        ],
      ),
    ],
  );

}
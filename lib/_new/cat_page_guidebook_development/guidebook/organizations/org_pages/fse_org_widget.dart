import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_cards/fse_org_card_widget.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';

class FSEOrgWidget extends StatefulWidget{

  const FSEOrgWidget({super.key});

  @override
  State<StatefulWidget> createState() => FSEOrgWidgetState();

}

class FSEOrgWidgetState extends State<FSEOrgWidget> with ModuleStatsMixin{

  Color grayColor = const Color.fromARGB(255, 75, 75, 75);
  Color grayColorDark = const Color.fromARGB(255, 55, 55, 55);

  @override
  String get moduleId => ModuleStatsMixin.orgFSE;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      const FSEOrgCardWidget(),

      const SizedBox(height: commonPadding),

      Row(
        children: <Widget>[
          Expanded(
              child: IconButton(
                icon: Icon(MdiIcons.facebook),
                onPressed: () => launchURL('facebook.com/skauci.europy'),
              )
          ),
          Expanded(
              child: IconButton(
                icon: Icon(MdiIcons.instagram),
                onPressed: () => launchURL('https://www.instagram.com/skaucieuropy_pl/'),
              )
          ),
        ],
      ),

      Padding(
          padding: const EdgeInsets.all(commonPadding),
          child: AppText(
            '<b>Skauci Europy</b> to ruch wychowawczy dla dzieci i <b>młodzieży</b> w wieku od 8 do 18 lat, prowadzony przez kadrę wychowawczą, którą stanowią młodzi w wieku 18-26 lat i więcej wraz z udziałem dorosłych oraz rodziców, którzy pomagają młodym stworzyć wielki świat młodzieńczej <b>przygody</b>.',
            color: textEnab_(context),
            height: 1.2,
            textAlign: TextAlign.justify,
            size: Dimen.TEXT_SIZE_BIG,
          )
      ),

      AppCard(
        radius: AppCard.bigRadius,
        padding: EdgeInsets.zero,
        color: grayColorDark,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Item(
              'Troska o zdrowie i rozwój fizyczny.',
              'Życie na łonie przyrody pozwala odnaleźć równowagę życia i jego harmonię. Dbanie o ciało to także panowanie nad nim, co w przypadku starszych harcerek i harcerzy objawia się szczególnie w odrzuceniu palenia, narkotyków, a także przedwczesnych doświadczeń seksualnych.',
              titleColor: Colors.amber,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.heart, color: Colors.amber), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Kształtowanie zmysłu praktycznego.',
              'Skauting, będąc komplementarnym wobec szkoły – która przede wszystkim dostarcza wiedzy intelektualnej – chce rozwijać kreatywność, wyobraźnię, zaradność i zdolności manuale dziecka. Będąc mocno związanym z przyrodą, która narzuca praktyczne postępowanie, skauting wyciąga dziewczynę i chłopca z wirtualnego świata, w którym coraz częściej żyją.',
              titleColor: Colors.amber,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.hammerScrewdriver, color: Colors.amber), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Formacja charakteru.',
              'Odwaga, wytrwałość, silna wola, pokonywanie siebie, pokonywanie lęku przed wysiłkiem… Harcerstwo chce pomóc każdemu dziecku by nabrało zaufania do samego siebie i by nie lękało się życia ale podchodziło do niego z ufnością i radością. Dzięki funkcji, którą każdy pełni w swoim zastępie, rozwijane jest poczucie odpowiedzialności. Rady zastępu i rady drużyny są zaś miejscem kształtowania ducha krytycznego i umiejętności osądu.',
              titleColor: Colors.amber,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.account, color: Colors.amber), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Wychowanie do służby.',
              'Skauting chce wydobyć harcerkę i harcerza z egoizmu, który podsycany przez otaczający świat często zagraża im samym. Jak wszystko w harcerstwie, duch służby jest kształtowany poprzez bardzo konkretne środki. Najważniejszym z nich jest codzienny dobry uczynek, do którego każda harcerka i harcerz, zobowiązują się w czasie przyrzeczenia.',
              titleColor: Colors.amber,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.handshake, color: Colors.amber), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

            Item(
              'Odkrywanie Boga.',
              'Skauting chce pomóc każdemu w odnalezieniu sensu swojego życia. Jest to możliwe wówczas, gdy spogląda się na nie ze świadomością bycia kochanym przez Stwórcę. Osobista modlitwa, spotkanie z duszpasterzem, odkrywanie kultury chrześcijańskiej, korzystanie z sakramentów, są środkami, które mają w tym pomóc.',
              titleColor: Colors.amber,
              textColor: Colors.white,
              cardColor: grayColor,
              titleLeading: Row(children: [Icon(MdiIcons.cross, color: Colors.amber), const SizedBox(width: Dimen.ICON_MARG)]),
              inCard: false,
            ),

          ],
        ),
      ),

    ],
  );

}
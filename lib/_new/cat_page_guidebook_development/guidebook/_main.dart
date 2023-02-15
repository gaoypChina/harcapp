import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/patronite_support_widget.dart';
import 'package:harcapp/main.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/prawo_i_przyrzeczenie/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/slownik/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/strefa_instruktora/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/struktura_funkcje/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/symbolika/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/szyfry/_main.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/znaki_patrolowe/_main.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'biografie/_main.dart';
import 'chwyty/_main.dart';
import 'dokumenty/_main.dart';
import 'historia/_main.dart';
import 'kuchnia_harcerska/_main.dart';
import 'las/_main.dart';
import 'musztra/_main.dart';
import 'okrzyki/_main.dart';
import 'organizations/_main.dart';

class GuidebookSubpage extends StatefulWidget{

  const GuidebookSubpage({super.key});

  @override
  State createState() => GuidebookSubpageState();

}

class GuidebookSubpageState extends State<GuidebookSubpage>{

  static const double catSeparator = 28;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      _ItemWidget(
          data: ItemData(
              MdiIcons.translate,
              'Słownik harcerski',
              pageBuilder: (context) => const SlownikFragment()
          )
      ),

      const SizedBox(height: catSeparator),

      _ItemWidget(
          data: ItemData(
              MdiIcons.guitarPickOutline,
              'Chwyty',
              pageBuilder: (context) => const ChwytyFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.microphoneOutline,
              'Okrzyki',
              pageBuilder: (context) => const OkrzykiFragment()
          )
      ),

      const SizedBox(height: catSeparator),

      _ItemWidget(
          data: ItemData(
              MdiIcons.flagOutline,
              'Strefa instruktora',
              pageBuilder: (context) => const StrefaInstruktoraFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.textBoxCheckOutline,
              'Dokumenty',
              pageBuilder: (context) => const DokumentyFragment()
          )
      ),

      const SizedBox(height: catSeparator),

      _ItemWidget(
          data: ItemData(
              MdiIcons.compassOutline,
              'Prawo i Przyrzeczenie',
              pageBuilder: (context) => const PrawoPrzyrzeczenieFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.transitConnection,
              'Struktura i funkcje',
              pageBuilder: (context) => const StrukturaFunkcjeFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.starOutline,
              'Symbolika',
              pageBuilder: (context) => const SymbolikaFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.flagTriangle,
              'Musztra',
              pageBuilder: (context) => const MusztraFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.lockOutline,
              'Szyfry',
              pageBuilder: (context) => const SzyfryFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.mapMarkerPath,
              'Znaki patrolowe',
              pageBuilder: (context) => const ZnakiPatroloweFragment()
          )
      ),

      const SizedBox(height: catSeparator),

      _ItemWidget(
          data: ItemData(
              MdiIcons.timerSand,
              'Historia',
              pageBuilder: (context) => const HistoriaFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              MdiIcons.accountBoxOutline,
              'Biografie',
              pageBuilder: (context) => const BiografieFragment()
          )
      ),

      const SizedBox(height: catSeparator),

      _ItemWidget(
          data: ItemData(
              MdiIcons.treeOutline,
              'Las',
              pageBuilder: (context) => const LasFragment()
          )
      ),

      _ItemWidget(
          data: ItemData(
              Icons.restaurant_menu,
              'Kuchnia harcerska',
              pageBuilder: (context) => const KuchniaHarcerskaFragment()
          )
      ),

      const SizedBox(height: catSeparator),

      _ItemWidget(
          data: ItemData(
              MdiIcons.googleCirclesExtended,
              'Organizacje harc. i skaut.',
              pageBuilder: (context) => const OrganizationsPage()
          )
      ),

      if(App.showPatroniteSeasonally)
        const SizedBox(height: Dimen.SIDE_MARG),

      if(App.showPatroniteSeasonally)
        const PatroniteSupportWidget(
          stateTag: PatroniteSupportWidget.tagGuideBook,
          title: 'Hej tam! Tak Ty!',
          description: 'HarcAppka powstaje <b>po godzinach</b>, a mimo to (jak zauważyli wnikliwi obserwatorzy) pozostaje <b>darmowa</b> i <b>bez reklam</b>.'
              '\n'
              '\nJej rozwój możliwy jest dzięki <b>wsparciu</b> harcerzy, instruktorów, rodziców - <b>jak Ty</b>!'
              '\n'
              '\nJeśli możesz - wesprzyj.'
              '\nWiele od Ciebie zależy! <b>c:</b>',
          expandable: false,
          colorStart: Colors.blue,
          colorEnd: Colors.deepPurple,
        )

    ],
  );

}

class ItemData{

  final IconData icon;
  final String title;
  final Widget Function(BuildContext context) pageBuilder;

  const ItemData(this.icon, this.title, {required this.pageBuilder});

}

class _ItemWidget extends StatelessWidget{

  final ItemData data;

  const _ItemWidget({required this.data});

  @override
  Widget build(BuildContext context) => ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
    leading: Icon(data.icon, color: accent_(context)),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: data.pageBuilder)),
    title: Text(
      data.title,
      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: textEnab_(context)),
    ),
  );

}

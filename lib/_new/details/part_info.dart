import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp/_new/details/patron_list_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:harcapp_core/dimen.dart';

import 'changelog_widget.dart';

class PartInfo extends StatefulWidget{

  const PartInfo({super.key});

  @override
  State<StatefulWidget> createState() => PartInfoState();

}

class PartInfoState extends State<PartInfo>{

  String? version;

  @override
  void initState() {
    version = '0.0.0';
    (() async => PackageInfo.fromPlatform().then((platform) =>  setState(
                () => version = platform.version)))();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        ListTile(
          leading: const SizedBox(width: 0),
          title: Text('Wersja $version', style: AppTextStyle()),
        ),

        ListTile(
          isThreeLine: true,
            leading: const Icon(MdiIcons.emailOutline),
            title: Text('Kontakt', style: AppTextStyle()),
            subtitle: Text('harcapp@gmail.com\nWDHS "Uroczysko", Warszawa-Praga-Północ', style: AppTextStyle()),
        ),

        ListTile(
            leading: const SizedBox(),
            title: Text('Autor', style: AppTextStyle()),
            subtitle: Text('phm. Daniel Iwanicki HO', style: AppTextStyle()),
        ),

        ListTile(
          leading: const Icon(MdiIcons.newspaperVariantOutline),
          title: Text('Co nowego?', style: AppTextStyle()),
          trailing: const Icon(MdiIcons.arrowRight),
          onTap: () => openDialog(
              context: context,
              builder: (context) => const AppCard(
                radius: AppCard.bigRadius,
                margin: EdgeInsets.all(Dimen.SIDE_MARG),
                padding: EdgeInsets.zero,
                child: PartChangelog(),
              )
          ),
        ),

        const ListTile(),

        ListTile(
          isThreeLine: true,
          leading: SizedBox(
            height: Dimen.ICON_SIZE + 2,
            width: Dimen.ICON_SIZE + 2,
            child: Image.asset('assets/images/patronite_logo_full.png'),
          ),
          title: Text('Zostań patronem', style: AppTextStyle(color: Colors.deepOrange, fontWeight: weight.halfBold)),
          subtitle: Text('HarcAppka powstaje w wolnym czasie. Możesz pomóc zostając jej patronem!', style: AppTextStyle()),
          trailing: const Icon(MdiIcons.arrowRight),
          onTap: () => launchURL('https://patronite.pl/harcapp'),
        ),

        ListTile(
          leading: const SizedBox(),
          title: Text('Lista patronów', style: AppTextStyle()),
          trailing: const Icon(MdiIcons.arrowRight),
          onTap: () => openDialog(
              context: context,
              builder: (context) => AppCard(
                radius: AppCard.bigRadius,
                padding: EdgeInsets.zero,
                margin: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: PatronListWidget(),
              )
          ),
        ),

        ListTile(
          leading: const Icon(MdiIcons.medalOutline),
          title: Text('Osoby zasłużone', style: AppTextStyle()),
          trailing: const Icon(MdiIcons.arrowRight),
          onTap: () => openDialog(
              context: context,
              builder: (context) => const PartContributors()
          )
        ),

        const ListTile(),

        ListTile(
            leading: const Icon(MdiIcons.flagCheckered),
            title: Text('Oto jak się zaczęło!', style: AppTextStyle()),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.LIST_TILE_LEADING_MARGIN_VAL),
          child: Text(
            'Pierwszą wersję HarcAppki stworzyłem jako zadanie na próbę Harcerza Orlego, w drugiej klasie krakowskiego liceum.'
                '\n\nZaczynając realizację pomysłu nie miałem praktyki w tworzeniu aplikacji mobilnych, a projekt powstawał na styku doświadczeń prowadzenia drużyny harcerskiej, chęci stworzenia czegoś nowego i zainteresowania informatyką. Przed sobą masz efekt wielu godzin nauki, szukania, dyskusji, testowania i konsultacji. HarcAppka jest stale rozwijana i sukcesywnie (choć nieregularnie!) zyskuje nowe możliwości.'
                '\n\nW pracy nad aplikacją nieoceniona była pomoc wielu harcerzy z różnych organizacji - jednak projekt jest całkowicie oddolną i jednoosobową inicjatywą. Powstał po to, żeby pomóc Ci odkryć harcerstwo, ułatwić Twoją pracę instruktorską, zainspirować do nowych pomysłów i rozwoju.'
                '\n\nKorzystaj mądrze! :)',
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
          ),
        ),

        SizedBox(
            height: 96.0,
            child: Center(
              child: Text(
                'Czuwaj!',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.bold),
              ),
            )
        )

      ],
    ),
  );
}
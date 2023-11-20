import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp/_new/details/patron_list_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/utils/check_unofficial_apk_update.dart';
import 'package:harcapp/values/app_values.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:harcapp_core/dimen.dart';

import '../../account/account_start/account_reason_page.dart';
import 'changelog_widget.dart';

class PartInfo extends StatefulWidget{

  const PartInfo({super.key});

  @override
  State<StatefulWidget> createState() => PartInfoState();

}

class PartInfoState extends State<PartInfo>{

  static const testerURL = 'https://play.google.com/apps/testing/zhp.harc.app';

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
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        BorderMaterial(child: Column(children: [

          ListTile(
            title: Text('Wersja $version${unofficialApk?' (apk)':''}', style: AppTextStyle()),
            subtitle: Text('Kliknij, by zobaczyć co nowego!', style: AppTextStyle()),
            trailing: unofficialApk?
            IconButton(
              icon: Icon(MdiIcons.refresh),
              onPressed: () async {
                bool updateAvailable = await checkUnofficialApkUpdate(context);
                if(!updateAvailable) showAppToast(context, text: 'Brak dostępnych aktualizacji');
              },
            ):null,
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

          if(Platform.isAndroid)
            ListTile(
                title: const AppText(
                    account?
                    'Testujesz apkę z <b>kontami HarcApp</b>!':'Przetestuj <b>konta HarcApp</b>!',
                ),
                subtitle: Text(account?'Kliknij, by to zmienić':'Kliknij by dołączyć', style: AppTextStyle()),
                trailing: Icon(MdiIcons.accountCircleOutline),
                onTap: (){

                  if(account) launchURL(testerURL);
                  else showAlertDialog(
                      context,
                      title: 'Konta HarcApp!',
                      content: 'Aby zacząć używać konta HarcApp, wykonaj trzy kroki:'
                          '\n\n1. Dołącz do programu testowania (przechodząc dalej),'
                          '\n2. Zaktualizuj aplikację,'
                          '\n3. Otwórz znowu aplikację.'
                          '\n\nMiej na uwadze, że konta HarcApp nie są jeszcze gotowe i mogą czasami nie działać.'
                          '\n\nJeśli coś nie będzie Ci odpowiadało, możesz zawsze opuścić program testowania.',
                      actionBuilder: (context) => [
                        AlertDialogButton(text: 'To nie dla mnie', onTap: () => Navigator.pop(context)),
                        AlertDialogButton(text: 'Jedziemy dalej!', onTap: () => launchURL(testerURL)),
                      ]
                  );

                }
            ),

          if(Platform.isAndroid && !account)
            ListTile(
                title: Text('Po co mi jakieś konto HarcApp?', style: AppTextStyle(color: textEnab_(context))),
                trailing: Icon(MdiIcons.arrowRight),
                onTap: () => pushPage(context, builder: (context) => const AccountReasonPage())
            ),

        ])),

        const SizedBox(height: Dimen.SIDE_MARG),

        BorderMaterial(child: Column(children: [

          ListTile(
            title: Text('Kontakt', style: AppTextStyle()),
            subtitle: Text('harcapp@gmail.com', style: AppTextStyle()),
            trailing: Icon(MdiIcons.emailOutline),
          ),

          ListTile(
            isThreeLine: true,
            title: Text('Autor', style: AppTextStyle()),
            subtitle: Text('\nphm. Daniel Iwanicki HO\n72. WDHS "Uroczysko",\nHufiec ZHP Warszawa-Praga-Północ\n', style: AppTextStyle()),
          ),

        ])),

        const SizedBox(height: Dimen.SIDE_MARG),

        BorderMaterial(child: Column(children: [

          ListTile(
            isThreeLine: true,
            title: Text('Zostań patronem', style: AppTextStyle(color: Colors.deepOrange, fontWeight: weight.halfBold)),
            subtitle: Text('HarcAppka powstaje w wolnym czasie. Możesz pomóc zostając jej patronem!', style: AppTextStyle()),
            trailing: SizedBox(
              height: 52,
              width: 52,
              child: Image.asset('assets/images/patronite_logo_full.png'),
            ),
            onTap: () => launchURL('https://patronite.pl/harcapp'),
          ),

          ListTile(
            title: Text('Lista patronów', style: AppTextStyle()),
            trailing: Icon(MdiIcons.arrowRight),
            onTap: () => openDialog(
                context: context,
                builder: (context) => const AppCard(
                  radius: AppCard.bigRadius,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.all(Dimen.SIDE_MARG),
                  child: PatronListWidget(),
                )
            ),
          ),

          ListTile(
              title: Text('Osoby zasłużone', style: AppTextStyle()),
              trailing: Icon(MdiIcons.arrowRight),
              onTap: () => openDialog(
                  context: context,
                  builder: (context) => const PartContributors()
              )
          ),

        ])),

        const SizedBox(height: Dimen.SIDE_MARG),

        ListTile(
          title: Text('Oto jak się zaczęło!', style: AppTextStyle()),
          trailing: Icon(MdiIcons.flagCheckered),
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
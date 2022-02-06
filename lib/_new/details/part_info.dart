import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_new/details/part_contributors.dart';
import 'package:harcapp/_new/details/patron_list_widget.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:harcapp_core/dimen.dart';

import 'changelog_widget.dart';
import 'common.dart';

class PartInfo extends StatefulWidget{

  const PartInfo();

  @override
  State<StatefulWidget> createState() => PartInfoState();

}

class PartInfoState extends State<PartInfo>{

  String version;

  @override
  void initState() {
    version = '0.0.0';
    (() async => PackageInfo.fromPlatform().then(
            (platform) =>  setState(
                () => version = platform.version)))();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: part_margin, left: part_margin, right: part_margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            /*
            SizedBox(height: SEPARATOR_BIG),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(version, style: AppTextStyle(color: Colors.transparent)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(width: Dimen.ICON_MARG),
                        HarcApp(size: MediaQuery.of(context).size.shortestSide/6.4, color: textEnab_(context)),
                        Text(version, style: AppTextStyle(color: textEnab_(context)))
                      ],
                    ),

                    SizedBox(height: Dimen.DEF_MARG),

                    Row(
                      children: [
                        SimpleButton.from(
                            context: context,
                            icon: MdiIcons.codeTags,
                            text: 'Co nowego?',
                            onTap: () => openDialog(
                                context: context,
                                builder: (context) => AppCard(
                                  radius: AppCard.BIG_RADIUS,
                                  margin: AppCard.normMargin,
                                  padding: EdgeInsets.zero,
                                  child: PartChangelog(),
                                )
                            )
                        )
                      ],
                    ),

                  ],
                ),

                SizedBox(width: Dimen.ICON_MARG),

              ],
            ),
            SizedBox(height: SEPARATOR_BIG),
             */

            TitleShortcutRowWidget(
              title: 'Wersja $version',
              leading: SizedBox(width: Dimen.ICON_MARG),
              //icon: MdiIcons.accountReactivateOutline,
              textAlign: TextAlign.start,
              trailing: SizedBox(
                width: Dimen.ICON_FOOTPRINT,
                child: Icon(MdiIcons.chartLineVariant, color: hintEnab_(context)),
              ),
              iconColor: iconDisab_(context),
            ),

            SimpleButton(
              radius: AppCard.BIG_RADIUS,
              onTap: () => openDialog(
                  context: context,
                  builder: (context) => AppCard(
                    radius: AppCard.BIG_RADIUS,
                    margin: AppCard.normMargin,
                    padding: EdgeInsets.zero,
                    child: PartChangelog(),
                  )
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.all(Dimen.DEF_MARG),
              color: cardEnab_(context),
              colorEnd: background_(context),
              child: TitleShortcutRowWidget(
                title: 'Co nowego?',
              ),
            ),

            SizedBox(height: SEPARATOR_BIG),

            TitleShortcutRowWidget(title: 'Zostań patronem!', textAlign: TextAlign.start),
            PatroniteButton(),

            SimpleButton(
              radius: AppCard.BIG_RADIUS,
              onTap: () => openDialog(
                  context: context,
                  builder: (context) => PartContributors()
              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.all(Dimen.DEF_MARG),
              color: cardEnab_(context),
              colorEnd: background_(context),
              child: TitleShortcutRowWidget(
                title: 'Osoby zasłużone',
              ),
            ),

            SizedBox(height: SEPARATOR_BIG),

            /*
            SimpleButton(
              onTap: () => launchURL('https://facebook.com/harcappka'),
              child: Row(children: <Widget>[
                Icon(MdiIcons.facebook, color: iconEnab_(context)),
                SizedBox(width: Dimen.DEF_MARG),
                Text('Fanpage aplikacji - bądź na bieżąco!', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
              ],),
            ),
*/
            /*
                SimpleButton(
                  onTap: () => launchURL('https://github.com/n3o2k7i8ch5/harcapp_flutter'),
                  child: Row(children: <Widget>[
                    Icon(MdiIcons.git, color: widget.colorPack.iconEnabledColor),
                    SizedBox(width: Dimen.margin_default),
                    Text('Kod źródłowy', style: AppTextStyle(color: widget.colorPack.textEnabled)),
                  ],),
                ),
                */

            //SizedBox(height: SEPARATOR_BIG),


            TitleShortcutRowWidget(
              title: 'Autor',
              leading: SizedBox(width: Dimen.ICON_MARG),
              //icon: MdiIcons.accountReactivateOutline,
              textAlign: TextAlign.start,
              trailing: SizedBox(
                width: Dimen.ICON_FOOTPRINT,
                child: Icon(MdiIcons.accountReactivateOutline, color: hintEnab_(context)),
              ),
              iconColor: iconDisab_(context),
            ),
            SizedBox(height: Dimen.ICON_MARG),
            Padding(
              padding: EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('phm. Daniel Iwanicki HO', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
                  SizedBox(height: 2*Dimen.DEF_MARG),
                  Text('WDHS "Uroczysko",\nWarszawa-Praga-Północ',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: hintEnab_(context))
                  ),
                ],
              )
            ),

            SizedBox(height: SEPARATOR_BIG),

            TitleShortcutRowWidget(
              title: 'Kontakt',
              leading: SizedBox(width: Dimen.ICON_MARG),
              textAlign: TextAlign.start,
              trailing: SizedBox(
                width: Dimen.ICON_FOOTPRINT,
                child: Icon(MdiIcons.emailOutline, color: hintEnab_(context)),
              ),
              iconColor: iconDisab_(context),
            ),
            SizedBox(height: Dimen.ICON_MARG),
            Padding(
              padding: EdgeInsets.only(left: Dimen.ICON_MARG),
              child: Text('harcapp@gmail.com',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: hintEnab_(context))),
            ),

            SizedBox(height: SEPARATOR_BIG),

            TitleShortcutRowWidget(
              title: 'Oto jak się zaczęło!',
              leading: SizedBox(width: Dimen.ICON_MARG),
              textAlign: TextAlign.start,
              trailing: SizedBox(
                width: Dimen.ICON_FOOTPRINT,
                child: Icon(MdiIcons.flagCheckered, color: hintEnab_(context)),
              ),
              iconColor: iconDisab_(context),
            ),

            Padding(
              padding: EdgeInsets.all(Dimen.ICON_MARG),
              child: Text(
                'Pierwszą wersję HarcAppki stworzyłem jako zadanie na próbę Harcerza Orlego, w drugiej klasie krakowskiego liceum.'
                    '\n\nZaczynając realizację pomysłu nie miałem praktyki w tworzeniu aplikacji mobilnych, a projekt powstawał na styku doświadczeń prowadzenia drużyny harcerskiej, chęci stworzenia czegoś nowego i zainteresowania informatyką. Przed sobą masz efekt wielu godzin nauki, szukania, dyskusji, testowania i konsultacji. HarcAppka jest stale rozwijana i sukcesywnie (choć nieregularnie!) zyskuje nowe możliwości.'
                    '\n\nW pracy nad aplikacją nieoceniona była pomoc wielu harcerzy z różnych organizacji - jednak projekt jest całkowicie oddolną i jednoosobową inicjatywą. Powstał po to, żeby pomóc Ci odkryć harcerstwo, ułatwić Twoją pracę instruktorską, zainspirować do nowych pomysłów i rozwoju.'
                    '\n\nKorzystaj mądrze! :)',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
              ),
            ),

            SizedBox(height: SEPARATOR_BIG),

            Center(
              child: SizedBox(
                height: 64.0,
                child: DefaultTextStyle(
                  style: AppTextStyle(
                      fontWeight: weight.bold,
                      fontSize: 64.0,
                      color: textEnab_(context),
                      shadow: true
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      FlickerAnimatedText('Czuwaj!'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              )
            ),

            SizedBox(height: SEPARATOR_BIG),

          ],
        ),
      ),
    );
  }
}

class PatroniteButton extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => PatroniteButtonState();

}

class PatroniteButtonState extends State<PatroniteButton>{

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            bottom: Dimen.DEF_MARG,
            left: Dimen.DEF_MARG,
            right: Dimen.DEF_MARG
        ),
        child: GradientWidget(
          elevation: AppCard.bigElevation,
          radius: AppCard.BIG_RADIUS,
            colorStart: Colors.amber,
            colorEnd: Colors.deepOrange,
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/patronite_logo_full.png'),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Padding(
                                padding: EdgeInsets.only(left: TitleShortcutRowWidget.textStartPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    Column(
                                      children: PatronListWidget.PLN50Patrons.map((p) => Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4.0),
                                        child: PersonCardSimple(p, textColor: DefColorPack.ICON_ENABLED),
                                      )).toList(),
                                    ),
                                    Column(
                                      children: PatronListWidget.PLN20Patrons.map((p) => Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4.0),
                                        child: PersonCardSimple(p, textColor: DefColorPack.ICON_ENABLED),
                                      )).toList(),
                                    ),

                                    Text(
                                        '...',
                                        style: AppTextStyle(
                                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                                          fontWeight: weight.bold,
                                          color: DefColorPack.ICON_ENABLED,
                                        )
                                    ),

                                    SizedBox(height: 10.0),

                                  ],
                                )
                            ),

                            SimpleButton.from(
                                color: backgroundIcon_(context),
                                iconLeading: false,
                                text: 'Pełna lista',
                                textColor: DefColorPack.ICON_ENABLED,
                                onTap: () => openDialog(
                                    context: context,
                                    builder: (context) => AppCard(
                                      radius: AppCard.BIG_RADIUS,
                                      padding: EdgeInsets.zero,
                                      margin: EdgeInsets.all(Dimen.SIDE_MARG),
                                      child: PatronListWidget(),
                                    )
                                ),
                                icon: MdiIcons.accountMultipleOutline,
                                colorSplash: Colors.white24,
                            ),

                            SizedBox(height: 10.0),
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 10.0),

                  Text(
                    'HarcAppka powstaje w wolnym czasie. Możesz pomóc zostając jej patronem!',
                    style: AppTextStyle(
                      color: DefColorPack.ICON_ENABLED,
                      fontSize: Dimen.TEXT_SIZE_BIG,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 10.0),

                  SimpleButton.from(
                      color: backgroundIcon_(context),
                      iconLeading: false,
                      text: 'Dołącz do grona patronów!',
                      textColor: DefColorPack.ICON_ENABLED,
                      fontWeight: weight.bold,
                      onTap: () => launchURL('https://patronite.pl/harcapp'),
                      icon: MdiIcons.handHeartOutline
                  )

                ],
              ),
            )
        )
    );
  }

}
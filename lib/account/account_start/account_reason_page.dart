import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../values/colors.dart';

class AccountReasonPage extends StatelessWidget{

  const AccountReasonPage({super.key});

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Po co konto HarcApp'),
          centerTitle: true,
          floating: true,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            TitleShortcutRowWidget(
                title: 'Środowiska',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: GradientIcon(
                  Community.icon,
                  colorStart: Colors.red,
                  colorEnd: Colors.deepPurple[700]!,
                  size: 28.0,
                )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Stwórz lub dołącz do kręgu - zamkniętej grupy, lub do forum - publicznej strony zastępu, drużyny i szczepu!'
                '\n\nWszystkie ważne informacje i ogłoszenia są w jednym miejscu.',
                style: AppTextStyle(),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Współzawodnictwa',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: GradientIcon(
                  MdiIcons.gold,
                  colorStart: Colors.yellow,
                  colorEnd: Colors.deepOrange,
                  size: 28.0,
                )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Wszystkie współzawodnictwa, które prowadzisz i w których uczestniczysz są dostępne w Twojej kieszeni. Wszystkie przyznane punkty są natychmiast dostępne uczestnikom.',
                style: AppTextStyle(),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            ListTile(
              leading: Icon(MdiIcons.run),
              title: Text('Uczestnictwo we współzawod.', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.accountMultipleOutline),
              title: Text('Tworzenie współzawodnictw', style: AppTextStyle()),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Synchronizacja',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: GradientIcon(
                  MdiIcons.cloudUpload,
                  colorStart: Colors.lightBlueAccent,
                  colorEnd: Colors.indigo,
                  size: 28.0,
                )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Nie musisz już przejmować się utratą, ani zmianą telefonu. Cała Twoja HarcAppka wraz z ustawieniami jest bezpieczna w chmurze.',
                style: AppTextStyle(),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            ListTile(
              leading: Icon(MdiIcons.cog),
              title: Text('Ustawienia aplikacji', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.musicNotePlus),
              title: Text('Piosenki własne', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.musicNoteSixteenthDotted),
              title: Text('Oceny piosenek', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.draw),
              title: Text('Wspomnienia do piosenek', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.unfoldMoreVertical),
              title: Text('Tonacja piosenek', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.bookmarkMusicOutline),
              title: Text('Albumy', style: AppTextStyle()),
            ),


            ListTile(
              leading: Icon(MdiIcons.chevronDoubleUp),
              title: Text('Stopnie', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.toolboxOutline),
              title: Text('Sprawności', style: AppTextStyle()),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Tropy',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: GradientIcon(
                  Trop.icon,
                  colorStart: AppColors.zhpTropColor,
                  colorEnd: AppColors.zhpTropDarkColor,
                  size: 28.0,
                )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Rozpisuj i realizuj tropy razem z innymi osobami. Każdy ma na bieżąco dostęp do czynionych postępów!',
                style: AppTextStyle(),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Stopnie',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: GradientIcon(
                  MdiIcons.star,
                  colorStart: Colors.lightGreen,
                  colorEnd: Colors.green[800]!,
                  size: 28.0,
                )
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Każdy realizowany lub zdobyty stopień możesz ze szczegółami udostępnić innym osobom, by pomagały Ci w dobrej realizacji próby.',
                style: AppTextStyle(),
              ),
            ),

            ListTile(
              leading: Icon(MdiIcons.chevronDoubleRight),
              title: Text('Udostępnianie innym stopni', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.chevronDoubleLeft),
              title: Text('Dostęp do udostępnionych stopni', style: AppTextStyle()),
            ),

          ])),
        )

      ],
    ),
  );

}
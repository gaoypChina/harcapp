import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/account/account_start/page_template.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountReasonPage extends StatelessWidget{

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
                title: 'Syncrhonizacja',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: const GradientIcon(
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
              leading: const Icon(MdiIcons.cog),
              title: Text('Ustawienia aplikacji', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.musicNotePlus),
              title: Text('Piosenki własne', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.musicNoteSixteenthDotted),
              title: Text('Oceny piosenek', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.draw),
              title: Text('Wspomnienia do piosenek', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.unfoldMoreVertical),
              title: Text('Tonacja piosenek', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.bookmarkMusicOutline),
              title: Text('Albumy', style: AppTextStyle()),
            ),


            ListTile(
              leading: const Icon(MdiIcons.chevronDoubleUp),
              title: Text('Stopnie', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.toolboxOutline),
              title: Text('Sprawności', style: AppTextStyle()),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Współzawodnictwa',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: const GradientIcon(
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
              leading: const Icon(MdiIcons.run),
              title: Text('Uczestnictwo we współzawod.', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.accountMultipleOutline),
              title: Text('Tworzenie współzawodnictw', style: AppTextStyle()),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Stopnie',
                textAlign: TextAlign.start,
                titleColor: hintEnab_(context),
                trailing: GradientIcon(
                  MdiIcons.star,
                  colorStart: Colors.lightGreen,
                  colorEnd: Colors.green[800],
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
              leading: const Icon(MdiIcons.chevronDoubleRight),
              title: Text('Udostępnianie stopni', style: AppTextStyle()),
            ),

            ListTile(
              leading: const Icon(MdiIcons.chevronDoubleLeft),
              title: Text('Dostęp do udostępnionych stopni', style: AppTextStyle()),
            ),

          ])),
        )

      ],
    ),
  );

}
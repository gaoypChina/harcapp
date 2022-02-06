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
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text('Po co konto HarcApp'),
          centerTitle: true,
        ),

        SliverPadding(
          padding: EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            TitleShortcutRowWidget(
                title: 'Syncrhonizacja',
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
              padding: EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Nie musisz już przejmować się utratą, ani zmianą telefonu. Cała Twoja HarcAppka wraz z ustawieniami jest bezpieczna w chmurze.',
                style: AppTextStyle(),
              ),
            ),

            SizedBox(height: Dimen.SIDE_MARG),

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

            SizedBox(height: Dimen.SIDE_MARG),

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
              padding: EdgeInsets.symmetric(horizontal: TitleShortcutRowWidget.textStartPadding),
              child: Text(
                'Wszystkie współzawodnictwa, które prowadzisz i w których uczestniczysz są dostępne w Twojej kieszeni. Wszystkie przyznane punkty są natychmiast dostępne uczestnikom.',
                style: AppTextStyle(),
              ),
            ),

            SizedBox(height: Dimen.SIDE_MARG),

            ListTile(
              leading: Icon(MdiIcons.run),
              title: Text('Uczestnictwo we współzawodnictw', style: AppTextStyle()),
            ),

            ListTile(
              leading: Icon(MdiIcons.accountMultipleOutline),
              title: Text('Tworzenie współzawodnictw', style: AppTextStyle()),
            ),

          ])),
        )

      ],
    ),
  );

}
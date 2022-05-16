import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/tab_item.dart';
import 'package:harcapp/_new/cat_page_guide_book/prawo_i_przyrzeczenie/strings.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

class PrawoItem extends StatelessWidget{

  static const double iconSize = 30;
  static const double padding = 12;

  final int number;
  final IconData icon;
  final String content;
  final String? comment;

  const PrawoItem(this.number, this.icon, this.content, {this.comment, super.key});

  @override
  Widget build(BuildContext context) {

    return SimpleButton(
      onTap: comment==null?null:
          () => showScrollBottomSheet(
          context: context,
          builder: (context) => BottomSheetDef(
            title: 'Komentarz',
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('$number. ' + content, style: AppTextStyle(fontStyle: FontStyle.italic, fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), textAlign: TextAlign.center,),
                const SizedBox(height: 12),
                Text(comment!, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2)),
                const SizedBox(height: Dimen.DEF_MARG),
                Text('- hm. Stefan Mirowski', style: AppTextStyle(fontStyle: FontStyle.italic, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.end,),
              ],
            ),
          )
      ),
      child: ListTile(
        leading: Text(
          number.toString(),
          style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_APPBAR,
              fontWeight: weight.halfBold,
              color: orgColor[OrgProvider.of(context).current]
          ),
        ),
        title: Text(content, style: AppTextStyle(color: textEnab_(context), fontWeight: weight.halfBold, height: 1.2)),
        trailing: Icon(icon),
      ),
    );
  }
}


class PrzyrzeczenieItem extends StatelessWidget{

  final String title, content;
  const PrzyrzeczenieItem(this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) => AppCard(
    radius: AppCard.BIG_RADIUS,
    elevation: AppCard.bigElevation,
    padding: const EdgeInsets.all(Dimen.CARD_BIG_PADD),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        TitleShortcutRowWidget(
          title: title,
        ),

        Padding(
          padding: const EdgeInsets.all(Dimen.DEF_MARG),
          child: SelectableText(
            content,
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.2),
          ),
        )
      ],
    ),
  );

}

class WedroTab extends TabItem{

  WedroTab():super(
      text: 'WĘDRO',
      child: const WedroTabChild()
  );

}

class WedroTabChild extends StatelessWidget{

  const WedroTabChild({super.key});

  @override
  Widget build(BuildContext context) => Consumer<OrgProvider>(
    builder: (context, prov, child) => ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(Dimen.SIDE_MARG),
          child: PrzyrzeczenieItem(wedro_dewiza_title, wedro_dewiza_content),
        ),
        Padding(
          padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const TitleShortcutRowWidget(title: wedro_kodeks_title),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.0, child: Text(
                      '1.',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: orgColor[prov.current]
                      ))
                  ),
                  Expanded(child: Text(wedro_kodeks_content_1, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.0, child: Text(
                      '2.',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: orgColor[prov.current]
                      ))
                  ),
                  Expanded(child: Text(wedro_kodeks_content_2, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.0, child: Text(
                      '3.',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: orgColor[prov.current]
                      ))
                  ),
                  Expanded(child: Text(wedro_kodeks_content_3, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.0, child: Text(
                      '4.',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: orgColor[prov.current]
                      ))
                  ),
                  Expanded(child: Text(wedro_kodeks_content_4, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.0, child: Text(
                      '5.',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: orgColor[prov.current]
                      ))
                  ),
                  Expanded(child: Text(wedro_kodeks_content_5, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: 20.0, child: Text(
                      '6.',
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: orgColor[prov.current]
                      ))
                  ),
                  Expanded(child: Text(wedro_kodeks_content_6, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

            ],
          ),
        )
      ],
    )
  );

}
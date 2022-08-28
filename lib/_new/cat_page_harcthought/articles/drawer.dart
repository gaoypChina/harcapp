
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/theme.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'article_text_style.dart';

class ArticleDrawer extends StatelessWidget{

  const ArticleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [

        FontCard(Parag1TextStyle.FAMILY),
        FontCard(Parag2TextStyle.FAMILY),
        FontCard(Parag3TextStyle.FAMILY),

      ],
    );
  }

}


class FontCard extends StatelessWidget{

  final String fontFamily;

  const FontCard(this.fontFamily, {super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ArticleThemeProvider>(
      builder: (context, prov, child){
        bool isMe = prov.paraFontFamily == fontFamily;

        return AppCard(
          radius: AppCard.bigRadius,
            elevation: isMe?AppCard.bigElevation:0,
            margin: const EdgeInsets.only(
              top: AppCard.normMargVal,
              left: AppCard.normMargVal,
              right: AppCard.normMargVal,
              bottom: AppCard.bigElevation + AppCard.normMargVal
            ),
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Text(
                  'Stoi na stacji lokomotywa, ciężka, ogromna i pot z niej sływa',
                  style: TextStyle(
                    fontFamily: fontFamily,
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    //color: prov.colorOption.text.withOpacity(isMe?1:0.5),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: Dimen.ICON_MARG),

                Text(
                  fontFamily,
                  style: AppTextStyle(
                      fontWeight: weight.halfBold,
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      //color: prov.colorOption.hint.withOpacity(isMe?1:0.5)
                  ),
                  textAlign: TextAlign.end,
                ),

              ],
            ),
            onTap: (){
              prov.paraFontFamily = fontFamily;
            }
        );
      },
    );



  }

}



class ColorCard extends StatelessWidget{

  final ArticleThemeColorOption colorOption;

  const ColorCard(this.colorOption, {super.key});

  @override
  Widget build(BuildContext context) => Consumer<ArticleThemeProvider>(
    builder: (context, prov, child) => AppCard(
      radius: AppCard.bigRadius,
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      color: colorOption.background,
      child: Text(
        'A a',
        style: TextStyle(
            fontFamily: prov.paraFontFamily,
            fontSize: Dimen.TEXT_SIZE_APPBAR,
            color: colorOption.text
        ),
      ),
      onTap: (){
        //prov.colorOption = colorOption;
      },
    )
  );

}
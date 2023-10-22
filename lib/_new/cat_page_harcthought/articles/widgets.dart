import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'article_text_style.dart';
import 'common.dart';

class ParagraphArticleElementWidget extends StatelessWidget{

  final ParagraphArticleElement paragraph;

  const ParagraphArticleElementWidget(this.paragraph, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Consumer<ArticleThemeProvider>(
        builder: (context, prov, child) => RText(
          paragraph.text,
          prov.paraFontFamily,
          textAlign: TextAlign.justify,
          size: FONT_SIZE_NORM,
          height: FONT_SIZE_HEIGHT,
        ),
      )
  );

}

class HeaderArticleElementWidget extends StatelessWidget{

  final HeaderArticleElement header;

  const HeaderArticleElementWidget(this.header, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Consumer<ArticleThemeProvider>(
        builder: (context, prov, child) => Text(
          header.text,
          textAlign: TextAlign.start,
          style: AppTextStyle(//HeaderTextStyle(
            fontSize: 24.0,
            fontWeight: weight.bold,
            //color: prov.colorOption.Lk_9_28b-36$text,
          ),
        ),
      )
  );
}

class ListItemArticleElementWidget extends StatelessWidget{

  final ListItemArticleElement item;

  const ListItemArticleElementWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Consumer<ArticleThemeProvider>(
        builder: (context, prov, child) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
              child: SizedBox(
                // Added to compensate the textStyle height.
                height: Dimen.ICON_SIZE + FONT_SIZE_NORM*(FONT_SIZE_HEIGHT-1),
                width: Dimen.ICON_SIZE,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: item.index == null?
                  Icon(MdiIcons.circleMedium):
                  Center(
                    child: Text(
                      item.index.toString(),
                      style: TextStyle(
                        fontFamily: prov.paraFontFamily,
                        fontSize: FONT_SIZE_NORM,
                        fontWeight: FontWeight.w900,
                        height: FONT_SIZE_HEIGHT,
                      ),
                    ),
                  )
                )
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: (Dimen.ICON_SIZE - FONT_SIZE_NORM)/2
                ),
                child: RText(
                  item.text,
                  prov.paraFontFamily,
                  textAlign: TextAlign.justify,
                  size: FONT_SIZE_NORM,
                  height: FONT_SIZE_HEIGHT,
                )
              ),
            )

          ],
        ),
      )
  );
}

class QuoteArticleElementWidget extends StatelessWidget{

  final QuoteArticleElement quote;

  const QuoteArticleElementWidget(this.quote, {super.key});

  TextStyle style(ArticleThemeProvider prov) => HeaderTextStyle(
    //paraFontFamily,
      fontSize: 20.0,
      fontWeight: weight.halfBold,
      //color: prov.colorOption.hint,
      fontStyle: FontStyle.italic
  );

  @override
  Widget build(BuildContext context) => Consumer<ArticleThemeProvider>(
    builder: (context, prov, child){
      var wordWrapText = TextPainter(text: TextSpan(style: style(prov), text: '„${quote.text}”'),
        textDirection: TextDirection.ltr,
      );
      wordWrapText.layout(maxWidth: MediaQuery.of(context).size.width - 2*32.0 - 3 - Dimen.ICON_MARG);

      return Row(
        children: [

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                  '„${quote.text}”',
                  textAlign: TextAlign.end,
                  style: style(prov)
              ),
            ),
          ),

          //Container(color: prov.colorOption.hint, width: 3, height: barHeight,),

          const SizedBox(width: Dimen.ICON_MARG)

        ],
      );
    },
  );
}

class PictureArticleElementWidget extends StatelessWidget{

  final PictureArticleElement picture;

  const PictureArticleElementWidget(this.picture, {super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<ArticleThemeProvider>(
      builder: (context, prov, child) => AppCard(
          //color: prov.colorOption.background,
          elevation: AppCard.bigElevation,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: NetworkImage(picture.link),
                loadingBuilder: (context, _, __) => AspectRatio(
                  aspectRatio: 1,
                  child: Center(
                    child: SpinKitChasingDots(
                      size: Dimen.ICON_SIZE,
                      color: iconEnab_(context),
                    ),
                  ),
                ),
                errorBuilder: (context, _, __) => AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(MdiIcons.close),
                        const SizedBox(height: Dimen.ICON_MARG),
                        Text(picture.link),

                      ],
                    ),
                  )
                ),
                fit: BoxFit.cover,
              ),
              if(picture.desc != null && picture.desc!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(Dimen.defMarg),
                  child: Text(
                    picture.desc!,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_TINY,
                        //color: prov.colorOption.hint,
                        fontWeight: weight.halfBold
                    ),
                    textAlign: TextAlign.end
                  ),
                ),
            ],
          )
      ),
    );
  }
}

class YoutubeArticleElementWidget extends StatelessWidget{

  final YoutubeArticleElement item;

  const YoutubeArticleElementWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(item.link)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Consumer<ArticleThemeProvider>(
      builder: (context, prov, child) => AppCard(
        elevation: AppCard.bigElevation,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
          progressColors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
      ),
    );
  }
}

class CustomArticleElementWidget extends StatelessWidget{

  final CustomArticleElement item;

  const CustomArticleElementWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Consumer<ArticleThemeProvider>(
          builder: (context, prov, child) => AppCard(
            elevation: AppCard.bigElevation,
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: HtmlWidget(
              item.html,
              textStyle: TextStyle(
                fontFamily: prov.paraFontFamily,
                fontSize: FONT_SIZE_NORM,
                height: FONT_SIZE_HEIGHT,
              ),
            ),
          )
      ),
    );
  }
}
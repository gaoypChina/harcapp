
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'article_core.dart';
import 'article_text_style.dart';
import 'common.dart';

class ParagraphWidget extends StatelessWidget{

  final Paragraph paragraph;

  const ParagraphWidget(this.paragraph, {super.key});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Consumer<ArticleThemeProvider>(
        builder: (context, prov, child) => RText(
          paragraph.text,
          prov.paraFontFamily,
          textAlign: TextAlign.justify,
          size: FONT_SIZE_NORM,
          height: 1.5,
          //color: prov.colorOption.Lk_9_28b-36$text,
        ),
      )
  );

}

class HeaderWidget extends StatelessWidget{

  final Header header;

  const HeaderWidget(this.header, {super.key});

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

class QuoteWidget extends StatelessWidget{

  final Quote quote;

  const QuoteWidget(this.quote, {super.key});

  TextStyle style(ArticleThemeProvider prov) => HeaderTextStyle(
    //paraFontFamily,
      fontSize: 20.0,
      fontWeight: weight.halfBold,
      //color: prov.colorOption.hint,
      fontStyle: FontStyle.italic
  );

  @override
  Widget build(BuildContext context) {

    return Consumer<ArticleThemeProvider>(
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
}

class PictureWidget extends StatelessWidget{

  final Picture picture;

  const PictureWidget(this.picture, {super.key});

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

class YoutubeWidget extends StatelessWidget{

  final Youtube item;

  const YoutubeWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(item.link)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );

    return Consumer<ArticleThemeProvider>(
      builder: (context, prov, child) => AppCard(
        //color: prov.colorOption.background,
        elevation: AppCard.bigElevation,
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: YoutubePlayer(
          controller: _controller,
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

class ArticleWidgetSmall extends StatelessWidget{

  final Article article;
  final PageController controller;

  const ArticleWidgetSmall(this.article, this.controller, {super.key});

  @override
  Widget build(BuildContext context) => AppCard(
    onTap: () {
      int index = Article.all!.indexOf(article);
      controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOutSine);
    },
    radius: 20,
    elevation: AppCard.bigElevation,
    padding: EdgeInsets.zero,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
            aspectRatio: 1,
            child: FutureBuilder<ImageProvider?>(
              future: article.loadCover(), // async work
              builder: (BuildContext context, AsyncSnapshot<ImageProvider?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting: return const Text('Loading....');
                  default:
                    if (snapshot.hasError) return Text('Error: ${snapshot.error}');
                    else return Image(image: snapshot.data!, fit: BoxFit.cover);
                }
              },
            )
        ),

        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: AutoSizeText(
                    article.title??'',
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    style: HeaderTextStyle(
                        fontSize: 20.0,
                        fontWeight: weight.bold
                    )
                ),
              )
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 3.0),
          child: AutoSizeText(
              article.dateString,
              textAlign: TextAlign.end,
              maxLines: 1,
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_SMALL
              )
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: AutoSizeText(
              'Autor tekstu',
              textAlign: TextAlign.end,
              maxLines: 1,
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_SMALL,
                  fontWeight: weight.halfBold
              )
          ),
        ),

      ],
    ),
  );
}

/*
class AuthorWidget extends StatelessWidget{

  final Author author;
  const AuthorWidget(this.author, {Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          elevation: 0,
          padding: EdgeInsets.zero,
          child: author.imageBytes==null?
          SizedBox(height: 100, width: 100):
          Image(image: MemoryImage(author.imageBytes), width: 100, height: 100,),
        ),
        //SizedBox(width: Dimen.margin_default),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: Dimen.defMarg),
              Text(author.name??'', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
              SizedBox(height: Dimen.defMarg),
              Text(
                author.desc??'',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL,
                fontStyle: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),

            ],
          ),
        ),
        SizedBox(width: Dimen.defMarg),
      ],
    );

  }

}
 */
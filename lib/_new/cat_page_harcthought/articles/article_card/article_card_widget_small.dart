import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import '../article.dart';
import 'article_title.dart';
import 'author_widget.dart';
import 'date_widget.dart';
import 'tag_widget.dart';
import 'common.dart';

class ArticleCardWidgetSmall extends StatefulWidget{

  static const aspectRatio = 1.4;

  final Article article;
  final void Function(BuildContext context, Article article, ImageProvider? background)? onTap;
  final ImageProvider? background;
  final bool dense;
  final EdgeInsets margin;
  final double elevation;
  final Widget? bottom;

  const ArticleCardWidgetSmall(
      this.article,
      {
        this.onTap,
        this.background,
        this.dense=false,
        this.margin=EdgeInsets.zero,
        this.elevation=AppCard.bigElevation,
        this.bottom,
        Key? key
      }):super(key: key);

  @override
  State<StatefulWidget> createState() => ArticleCardWidgetState();

}

class ArticleCardWidgetState extends State<ArticleCardWidgetSmall>{

  Article get article => widget.article;
  void Function(BuildContext context, Article article, ImageProvider? backgroundv)? get onTap => widget.onTap;
  ImageProvider? get background => widget.background??_background;
  double get elevation => widget.elevation;

  ImageProvider? _background;

  @override
  void initState() {
    ()async{
      _background = await article.loadCover();
      if(mounted) setState((){});
    }();
    super.initState();
  }

  bool get loaded => background != null;

  double get padding => CARD_PADDING_DENSE;

  @override
  Widget build(BuildContext context) {

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        SizedBox(height: padding),

        TagsWidget(article, dense: true),

        Expanded(child: Container()),

        Padding(
          padding: EdgeInsets.only(left: padding, right: padding, bottom: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DateWidget(article, dense: true),

              const SizedBox(height: Dimen.ICON_MARG),

              TitleWidget(article, dense: true, textColor: Colors.white),

              SizedBox(height: padding),

              if(article.author != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: AuthorWidget(article, dense: true),
                )

            ],
          ),
        ),
      ],
    );

    Widget widget = AppCard(
        padding: EdgeInsets.zero,
        margin: AppCard.normMargin,
        onTap: onTap==null?null:() => onTap!(context, article, background),
        elevation: elevation,
        child:
        background == null?

        FutureBuilder<ImageProvider?>(
          future: article.loadCover(), // async work
          builder: (BuildContext context, AsyncSnapshot<ImageProvider?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.active:
              case ConnectionState.none:
                return Center(
                  child: SpinKitFoldingCube(
                    size: Dimen.ICON_SIZE,
                    color: iconEnab_(context),
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasError) return Container();
                else return Stack(
                  children: [

                    Positioned.fill(child: Image(image: snapshot.data!, fit: BoxFit.cover)),

                    Positioned.fill(child: child)

                  ],
                );
            }
          },
        ):

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: background!, fit: BoxFit.cover),
          ),
          child: child,
        )
    );

    return Column(
      children: [
        AspectRatio(
            aspectRatio: ArticleCardWidgetSmall.aspectRatio,
            child: widget
        ),

      ],
    );
  }

}

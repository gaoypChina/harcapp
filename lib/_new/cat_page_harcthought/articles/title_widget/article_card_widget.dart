import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../details/app_settings.dart';
import '../article_widget.dart';
import 'article_bookmark_icon.dart';
import '../article_core.dart';
import 'common.dart';

class ArticleCardWidget extends StatefulWidget{

  static const double height = 242;

  final Article article;
  final void Function(
      BuildContext context,
      Article article,
      ImageProvider? background,
      ArticleNotifierProvider articleSeenProv)? onTap;
  final double radius;
  final double aspectRatio;
  final EdgeInsets margin;
  final bool disableHeroTag;
  final double elevation;

  const ArticleCardWidget(
      this.article,
      {
        this.onTap,
        this.radius=0,
        this.aspectRatio=1.5,
        this.margin=EdgeInsets.zero,
        this.disableHeroTag=false,
        this.elevation=0,//AppCard.bigElevation,
        Key? key
      }):super(key: key);

  @override
  State<StatefulWidget> createState() => ArticleCardWidgetState();

}

class ArticleCardWidgetState extends State<ArticleCardWidget>{

  Article get article => widget.article;
  void Function(BuildContext context, Article article, ImageProvider? background, ArticleNotifierProvider articleSeenProv)? get onTap => widget.onTap;
  bool get disableHeroTag => widget.disableHeroTag;
  double get elevation => widget.elevation;

  ImageProvider? _background;

  late ArticleNotifierProvider provider;

  bool get loaded => _background != null;

  double get padding => CARD_PADDING_NORM;

  Widget childWidget(ImageProvider image) => Stack(
    children: [

      Positioned.fill(child: Hero(
        tag: articleCoverHero(article),
        child: Material(
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          color: Colors.transparent,
          clipBehavior: Clip.hardEdge,
          child: Image(image: image, fit: BoxFit.cover),
        ),
      )),

      Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Padding(
                  padding: EdgeInsets.only(top: padding, bottom: padding),
                  child: TagsWidget(article),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: padding - Dimen.ICON_MARG),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Consumer<ArticleNotifierProvider>(
                          builder: (context, prov, child) =>
                          article.isLiked?
                          IconButton(
                              icon: const Icon(MdiIcons.heartOutline, color: ColorPackBlack.ICON_DISABLED),
                              onPressed: () => showAppToast(context, text: 'Artykuł polubiony')
                          ): Container(),
                        ),
                        Consumer<ArticleNotifierProvider>(
                          builder: (context, prov, child) =>
                          article.isSeen?
                          IconButton(
                              icon: const Icon(MdiIcons.eyeOutline, color: ColorPackBlack.ICON_DISABLED),
                              onPressed: () => showAppToast(context, text: 'Artykuł przeczytany')
                          ): Container(),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: padding,
                    right: padding,
                    bottom: padding,
                  ),
                  child: TitleWidget(article, textColor: Colors.white, shadow: true),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Padding(
                            padding: EdgeInsets.only(
                              left: padding,
                            ),
                            child: DateWidget(article),
                          ),

                          if(article.author != null)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: padding - Dimen.ICON_MARG,
                                    bottom: padding - Dimen.ICON_MARG,
                                  ),
                                  child: AuthorWidget(article, onTap: (){}),
                                ),

                                Expanded(child: Container())
                              ],
                            )

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        right: padding - Dimen.ICON_MARG,
                        bottom: padding - Dimen.ICON_MARG,
                      ),
                      child: ArticleBookmarkWidget(
                          article,
                          color: Colors.white,
                          heroTag: ArticleWidget.bookMarkHeroTag(articleTagHero(article))
                      ),
                    ),

                  ],
                )
              ],
            ),
          )
      )

    ],
  );

  @override
  Widget build(BuildContext context) {

    double cardWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
        create: (context){
          provider = ArticleNotifierProvider();
          return provider;
        },
        builder: (context, child) => AspectRatio(
          aspectRatio: cardWidth/ArticleCardWidget.height,
          child: AppCard(
              padding: EdgeInsets.zero,
              onTap: onTap==null?null:() => onTap!(context, article, _background, provider),
              radius: AppCard.BIG_RADIUS,
              elevation: elevation,
              margin: widget.margin,
              child:
              _background != null?
              childWidget(_background!):
              FutureBuilder<ImageProvider?>(
                future: article.loadCover(), // async work
                builder: (BuildContext context, AsyncSnapshot<ImageProvider?> snapshot) {

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Stack(
                        children: [
                          if(AppSettings.devMode)
                            Positioned(
                              bottom: Dimen.ICON_MARG,
                              right: Dimen.ICON_MARG,
                              child: Text(article.id),
                            ),
                          
                          Center(
                            child: SpinKitCubeGrid(
                              size: 64.0,
                              color: iconDisab_(context),
                            ),
                          )
                          
                        ],
                      );
                    default:
                      if (snapshot.hasError) return const CoverProblemWidget();
                      else{
                        _background = snapshot.data;
                        if(_background == null) return const CoverProblemWidget();
                        return childWidget(snapshot.data!);
                      }
                  }

                },
              )
          ),
        ),
    );
  }

}

class CoverProblemWidget extends StatelessWidget{

  const CoverProblemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Problem z pobieraniem\nokładki artykułu...', style: AppTextStyle(), textAlign: TextAlign.center));
  }

}
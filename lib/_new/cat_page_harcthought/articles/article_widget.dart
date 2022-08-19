import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/title_widget/common.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/drawer.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/widgets.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../details/app_settings.dart';
import 'title_widget/article_bookmark_icon.dart';
import 'article_core.dart';
import 'common.dart';

class ArticleWidget extends StatefulWidget{

  static String bookMarkHeroTag(articleHeroTag) => 'BOOKMARK $articleHeroTag';

  final Article article;
  final ImageProvider? cover;
  final ArticleNotifierProvider articleNotifProv;

  const ArticleWidget(
      this.article,
      {this.cover,
        required this.articleNotifProv,
      Key? key})
      :super(key: key);

  @override
  State<StatefulWidget> createState() => ArticleWidgetState();

}

class ArticleWidgetState extends State<ArticleWidget> {

  double ART_MARG = 18.0;

  Article get article => widget.article;

  Author? author;
  Color? dominantColor;
  Color? antiDominantColor;

  late bool problem;

/*  List<ArticleCore> otherArts;

  Future<void> fetchAuthor(ArticleCore article, {bool resetState: true}) async {

    Author _author = await loadAuthor(article.authCode);
    this.author = _author;
    if(resetState && mounted) setState(() {});

  }
 */

/*
  Future<void> fetchOtherArticles({bool resetState: true}) async {

    List<ArticleCore> _otherArts = [];

    for(ArticleCore othCore in article.othCores){
      ArticleCore article = await othCore.loadArticle();
      _otherArts.add(article);
    }
    this.otherArts = _otherArts;

    if(resetState) setState((){});
  }
*/
  /*
  Future<void> establishColors({bool resetState: true}) async {
    if(article?.imageBytes == null)
      dominantColor = accent_(context);
    else {
      PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
        MemoryImage(article?.imageBytes),
      );

      dominantColor = paletteGenerator.dominantColor.color;
      if(dominantColor.red + dominantColor.green + dominantColor.blue < 255*1.5)
        antiDominantColor = Colors.white;
      else
        antiDominantColor = Colors.black;
    }

    if(resetState) setState(() {});
  }
   */

  late ValueNotifier<double> headerNotifier;
  late ValueNotifier<double> appBarNotifier;
  late ValueNotifier<double> articleNotifier;
  //ValueNotifier<double> notifier;
  ScrollController? controller;
  late bool showRateButton;

  GlobalKey? appBarKey;
  GlobalKey? articleKey;
  late GlobalKey gridViewKey;
  late GlobalKey authorKey;

  @override
  void initState() {

    //establishColors();
    //fetchAuthor(article);
    //fetchOtherArticles();

    showRateButton = false;

    headerNotifier = ValueNotifier(0.0);
    appBarNotifier = ValueNotifier(0.0);
    articleNotifier = ValueNotifier(0.0);

    controller = ScrollController();

    controller!.addListener((){
      double headerScroll = controller!.offset / MediaQuery.of(context).size.width;

      if(headerScroll > 1) headerScroll = 1;
      else if (headerScroll < 0) headerScroll = 0;
      //else headerScroll = 0;
      if(headerNotifier.value != headerScroll)
        headerNotifier.value = headerScroll;

      double topPadding = MediaQuery.of(context).padding.top;
      double screenHeight = MediaQuery.of(context).size.height;

      final appBarBox = appBarKey!.currentContext!.findRenderObject() as RenderBox;
      double appBarPos = appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
      if(appBarPos == 0) appBarPos = 1;
      else appBarPos = 0;
      if(appBarNotifier.value != appBarPos)
        appBarNotifier.value = appBarPos;

      double gridViewHeight = gridViewKey.currentContext==null?0:gridViewKey.currentContext!.size!.height;
      double authorHeight = authorKey.currentContext==null?0:authorKey.currentContext!.size!.height;

      final articleBox = articleKey!.currentContext!.findRenderObject() as RenderBox;
      double articlePos = articleBox.localToGlobal(Offset(0, -kToolbarHeight-topPadding)).dy;
      double articleHeight = articleBox.size.height;

      //print(articlePos);
      //print(articleHeight - screenHeight);

      articleNotifier.value = min(1, max(0, -(articlePos-screenHeight)/articleHeight));
      if(articleNotifier.value >= 1 && !showRateButton) {
        setState(() => showRateButton = true);
        article.isSeen = true;
        widget.articleNotifProv.notify();
      }else if(articleNotifier.value < 1 && showRateButton) {
        setState(() => showRateButton = false);
      }
      //print(articleNotifier.value);

      /*
      notifier.value = controller.offset / (controller.position.maxScrollExtent - gridViewHeight - Dimen.ICON_FOOTPRINT - authorHeight);

      if(notifier.value >= 1 && !showRateButton) {
        setState(() => showRateButton = true);
        article.isSeen = true;
        widget.articleNotifProv.notify();
      }else if(notifier.value < 1 && showRateButton) {
        setState(() => showRateButton = false);
      }

       */
    });

    problem = false;

    appBarKey = GlobalKey();
    articleKey = GlobalKey();
    gridViewKey = GlobalKey();
    authorKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(problem)
      return Container(
        color: Colors.transparent,
        child: const Center(child: Text('Ajajaj...')),
      );

    return Consumer<ArticleThemeProvider>(
      builder: (context, prov, child) => BottomNavScaffold(
        body: CustomScrollView(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverList(
                delegate: SliverChildListDelegate([
                  AnimatedBuilder(
                      animation: headerNotifier,
                      builder: (context, child) =>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [

                              ClipRect(
                                child: AspectRatio(
                                  aspectRatio: 1.2,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                          child:
                                          Hero(
                                            tag: articleCoverHero(article),
                                            child: AnimatedBuilder(
                                                animation: headerNotifier,
                                                child: Image(image: widget.cover!, fit: BoxFit.cover),
                                                builder: (BuildContext context, Widget? child) => Transform.translate(
                                                    offset: Offset(
                                                      0,
                                                      headerNotifier.value*MediaQuery.of(context).size.width*0.5,
                                                    ),
                                                    child: child
                                                )
                                            ),
                                          )
                                      ),

                                      Positioned.fill(
                                          child: Material(
                                              color: Colors.transparent,
                                              child: Padding(
                                                  padding: const EdgeInsets.all(CARD_PADDING_NORM - Dimen.ICON_MARG,),
                                                  child: Column(
                                                    children: [

                                                      Row(
                                                        children: [

                                                          IconButton(
                                                            icon: const Icon(MdiIcons.arrowLeft, color: Colors.white),
                                                            onPressed: () => Navigator.pop(context),
                                                          ),

                                                          Text(
                                                            'Powrót',
                                                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: Colors.white),
                                                          ),

                                                          Expanded(child: Container()),

                                                          if(article.isSeen)
                                                            IconButton(
                                                                icon: const Icon(MdiIcons.eyeOutline, color: ColorPackBlack.ICON_DISABLED),
                                                                onPressed: () => showAppToast(context, text: 'Artykuł przeczytany')
                                                            ),
                                                        ],
                                                      ),

                                                      Expanded(child: Container()),

                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [

                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [

                                                              Padding(
                                                                padding: const EdgeInsets.only(
                                                                  left: CARD_PADDING_NORM - Dimen.ICON_MARG,
                                                                  bottom: CARD_PADDING_NORM - Dimen.ICON_MARG,
                                                                ),
                                                                child: DateWidget(article),
                                                              ),

                                                              AuthorWidget(article, onTap: (){}),

                                                            ],
                                                          ),

                                                          Expanded(child: Container()),

                                                          ArticleBookmarkWidget(
                                                              article,
                                                              color: Colors.white,
                                                              heroTag: ArticleWidget.bookMarkHeroTag(articleTagHero(article))
                                                          ),
                                                        ],
                                                      ),

                                                    ],
                                                  )
                                              )
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: CARD_PADDING_NORM),

                              TagsWidget(article),

                              const SizedBox(height: CARD_PADDING_NORM),

                              Padding(
                                padding: const EdgeInsets.only(
                                    left: CARD_PADDING_NORM,
                                    right: CARD_PADDING_NORM
                                ),
                                child: TitleWidget(article),
                              ),
                            ],
                          )
                  ),
                ])
            ),

            SliverAppBar(
              automaticallyImplyLeading: false,
              //iconTheme: IconThemeData(color: prov.colorOption.icon),
              leading: AnimatedBuilder(
                key: appBarKey,
                animation: appBarNotifier,
                builder: (context, child) => AnimatedOpacity(
                  opacity: appBarNotifier.value==1?1:0,
                  duration: const Duration(milliseconds: 300),
                  child: IconButton(
                    icon: const Icon(MdiIcons.arrowLeft),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              title: AnimatedBuilder(
                animation: appBarNotifier,
                builder: (context, child) => AnimatedOpacity(
                  opacity: appBarNotifier.value==1?1:0,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    article.title!,
                    style: AppTextStyle(
                      //color: prov.colorOption.text
                    ),
                  ),
                ),
              ),
              //backgroundColor: prov.colorOption.background,
              pinned: true,

              actions: [

                AnimatedBuilder(
                  animation: appBarNotifier,
                  builder: (context, child) => AnimatedOpacity(
                    opacity: appBarNotifier.value==1?1:0,
                    duration: const Duration(milliseconds: 300),
                    child: IconButton(
                        icon: const Icon(
                          MdiIcons.formatLetterCaseUpper,
                          //color: prov.colorOption.icon,
                        ),
                        onPressed: () => showScrollBottomSheet(
                            context: context,
                            builder: (context) => Consumer<ArticleThemeProvider>(
                              builder: (context, prov, child) => BottomSheetDef(
                                //color: prov.colorOption.background,
                                builder: (context) => const ArticleDrawer(),
                              ),
                            )
                        )
                    ),
                  ),
                ),

              ],

              bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 3),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: AnimatedBuilder(
                        animation: appBarNotifier,
                        builder: (context, child) => AnimatedOpacity(
                          opacity: appBarNotifier.value==1?1:0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedBuilder(
                            animation: articleNotifier,
                            builder: (context, _) => Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width * articleNotifier.value,
                              color: accent_(context),
                              //color: prov.colorOption.background==Colors.black?Colors.white:dominantColor,
                            ),
                          ),
                        ),
                      )
                  )
              ),
            ),

            SliverList(
              delegate: SliverChildListDelegate([

                Padding(
                  padding: EdgeInsets.only(left: ART_MARG, right: ART_MARG),
                  child: Column(
                    key: articleKey,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: (article.articleElements??[]).map((item){
                      if (item is Header)
                        return HeaderWidget(item);
                      else if(item is Paragraph)
                        return ParagraphWidget(item);
                      else if (item is Quote)
                        return QuoteWidget(item);
                      else if(item is Picture)
                        return PictureWidget(item);
                      else if(item is Youtube)
                        return YoutubeWidget(item);
                      else
                        return Container();
                    }).toList(),
                  ),
                ),

                const SizedBox(height: Dimen.ICON_FOOTPRINT),

                Padding(
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    child: Icon(MdiIcons.circleMedium, color: textEnab_(context))
                ),

                if(AppSettings.devMode)
                  Padding(
                    padding: const EdgeInsets.all(Dimen.defMarg),
                    child: AppText(
                      'Kod artykułu: <b>${article.id}</b>',
                      size: Dimen.TEXT_SIZE_SMALL,
                      //color: prov.colorOption.hint,
                    ),
                  ),

                if(AppSettings.devMode && article.id == Article.lastSeenId)
                  const Padding(
                    padding: EdgeInsets.all(Dimen.defMarg),
                    child: AppText(
                      'Artykuł zapisany jako ostatnio pobrany.',
                      size: Dimen.TEXT_SIZE_SMALL,
                      //color: prov.colorOption.hint,
                    ),
                  )

              ]),
            ),

          ],
        ),
        floatingActionButton: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: showRateButton?1:0,
          child: Consumer<LikedArticlesProvider>(
            builder: (context, prov, child){
              bool liked = prov.contains(article);
              return FloatingActionButton(
                backgroundColor: dominantColor,
                onPressed: showRateButton?() {
                  if(liked){
                    showAppToast(context, text: 'Usunięto z polubionych');
                    prov.remove(article);
                  }
                  else{
                    showAppToast(context, text: 'Dodano do polubionych');
                    prov.add(article);
                  }
                }:null,
                child: Icon(
                    liked?
                    MdiIcons.heart:
                    MdiIcons.heartOutline,
                    color: antiDominantColor
                ),
              );
            },
          ),
        ),
      ),
    );
    

  }
}

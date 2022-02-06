
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/all_articles_page.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/bookmarked_articles_page.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/title_widget/article_card_widget.dart';
import 'package:harcapp/_new/cat_page_harcthought/harc_forms/harc_form_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/search_page.dart';
import 'package:harcapp/_new/cat_page_harcthought/gawedy/data.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../app_drawer.dart';
import '../cat_page.dart';
import 'articles/article_core.dart';
import 'articles/article_list_widget.dart';
import 'articles/article_loader.dart';
import 'articles/article_text_style.dart';
import 'articles/liked_articles_page.dart';
import 'common/short_reads_page.dart';
import 'common/short_read_thumbnail_widget.dart';
import 'harc_forms/data.dart';
import 'harc_forms/harc_form.dart';
import 'harc_forms/harc_forms_page.dart';

class CatPageHarcThought extends StatefulWidget{

  @override
  State createState() => CatPageHarcThoughtState();

}

class CatPageHarcThoughtState extends CatPageState<CatPageHarcThought> with TickerProviderStateMixin{

  @override
  ColorPack get colorPack => ColorPackHarcthought();

  ScrollController controller;
  TabController tabController;
  ValueNotifier tabNotifier;

  String paraFontFamily;
  bool loading;


  int selectedIndex;

  @override
  void initState() {

    tabController = TabController(vsync: this, length: 2);
    tabNotifier = ValueNotifier<double>(0);
    tabController.animation.addListener(() => tabNotifier.value = tabController.animation.value);
    paraFontFamily = Parag2TextStyle.FAMILY;

    controller = ScrollController();

    selectedIndex = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: AccountHeaderIcon(),
            title: Text('Myśl i inspiracje'),
            centerTitle: true,
            floating: true,
          ),

          SliverList(
            delegate: SliverChildListDelegate([

              _ArticleScrollView(),

              SizedBox(height: Dimen.SIDE_MARG),

              Padding(
                padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                child: TitleShortcutRowWidget(
                  icon: MdiIcons.campfire,
                  iconColor: textEnab_(context),
                  title: 'Gawędy',
                  textAlign: TextAlign.start,
                  onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ShortReadsPage('Gawędy', allGawedy))),
                ),
              ),

              _ShortReadScrollView(allGawedy),

              SizedBox(height: Dimen.SIDE_MARG),

              Padding(
                padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                child: TitleShortcutRowWidget(
                  icon: MdiIcons.scriptTextOutline,
                  iconColor: textEnab_(context),
                  title: 'Wiersze',
                  textAlign: TextAlign.start,
                  onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ShortReadsPage('Wiersze', allWiersze))),
                ),
              ),

              _ShortReadScrollView(allWiersze),

              SizedBox(height: Dimen.SIDE_MARG),

              Padding(
                padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
                child: TitleShortcutRowWidget(
                  icon: MdiIcons.packageVariantClosed,
                  iconColor: textEnab_(context),
                  title: 'Formy',
                  textAlign: TextAlign.start,
                  onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => HarcFormsPage(allForms))),
                ),
              ),

              FormsScrollView(allForms),

              SizedBox(height: Dimen.SIDE_MARG),

            ]),
          )

        ],
      ),
      bottomNavigationBar: AppBottomNavigator(),
    );

  }

  @override
  Widget drawerBuilder(/*BuildContext context*/) => Column(
    children: [

      ListTile(
        leading: Icon(MdiIcons.grid),
        title: Text('Podgląd', style: AppTextStyle(fontWeight: weight.halfBold)),
      ),

      SizedBox(height: Dimen.ICON_MARG),

      ListTile(
        leading: SizedBox(width: 0),
        title: Text('Artykuły', style: AppTextStyle(fontWeight: weight.bold, color: hintEnab_(context))),
      ),

      ListTile(
        leading: Icon(MdiIcons.textBoxCheckOutline),
        title: Text('Wszystkie', style: AppTextStyle(fontWeight: weight.halfBold)),
        trailing: Text('${Article.all?.length??'...'}', style: AppTextStyle(fontWeight: weight.bold)),
      ),

      ListTile(
        leading: Icon(MdiIcons.bookmarkOutline),
        title: Text('Zapisane', style: AppTextStyle(fontWeight: weight.halfBold)),
        trailing: Text('${Article.bookmarkedIds?.length??'...'}', style: AppTextStyle(fontWeight: weight.bold)),
      ),

      ListTile(
        leading: Icon(MdiIcons.heartOutline),
        title: Text('Polubione', style: AppTextStyle(fontWeight: weight.halfBold)),
        trailing: Text('${Article.likedIds?.length??'...'}', style: AppTextStyle(fontWeight: weight.bold)),
      ),

      SizedBox(height: Dimen.ICON_MARG),

      ListTile(
        leading: SizedBox(width: 0),
        title: Text('Gawędy', style: AppTextStyle(fontWeight: weight.bold, color: hintEnab_(context))),
      ),

      ListTile(
        leading: Icon(MdiIcons.campfire),
        title: Text('Wszystkie', style: AppTextStyle(fontWeight: weight.halfBold)),
      ),

    ],
  );

  @override
  bool showDrawer() => false;

  @override
  Widget buildFloatingButton(/*BuildContext context*/) => AnimatedBuilder(
      animation: tabNotifier,
      child: FloatingActionButton(
        onPressed: ()async{

          if(tabController.index != 0)
            await tabController.animateTo(0);
          if(tabController.index != 0)
            await Future.delayed(Duration(milliseconds: 200));

          await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ArticleSearchPage(
                    Article.all,
                  )
              )
          );
        },
        child: Icon(MdiIcons.magnify),
      ),
      builder: (context, child) => Transform.translate(
        offset: Offset(cos(pi/2*(tabNotifier.value))*(50 + 2*Dimen.FLOATING_BUTTON_MARG), 0),
        child: child,
      )
  );

  @override
  bool showFloatingButton() => true;

  void notify() => setState((){});

}

class _ArticleScrollView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ArticleScrollViewState();

}

class _ArticleScrollViewState extends State<_ArticleScrollView>{

  SingleComputerListener loaderListener;

  @override
  void initState() {

    if(Article.all == null) {
      Article.addAll(storedArticles);
      Provider.of<BookmarkedArticlesProvider>(context, listen: false).init(Article.all);
      Provider.of<LikedArticlesProvider>(context, listen: false).init(Article.all);
    }

    loaderListener = ArticleLoaderListener(
        onEnd: (ArticleLoaderError err, bool forceFinished) async {

          if(forceFinished) return;

          if(Article.all != null) {
            Provider.of<BookmarkedArticlesProvider>(context, listen: false).init(Article.all);
            Provider.of<LikedArticlesProvider>(context, listen: false).init(Article.all);
          }
        },
        onStateChanged: (ArticleLoadState state){
          if(state == ArticleLoadState.NO_NET){
            if(!mounted) return;
            showAppToast(context, text: 'Brak internetu');
          } else if(state == ArticleLoadState.FAILED){
            if(!mounted) return;
            showAppToast(context, text: 'Błąd ładowania artykułów');
          } else if(state == ArticleLoadState.LOADED){
            if(!mounted) return;
            showAppToast(context, text: 'Pobrano artykuły');
            setState((){});
          }

        }
    );
    articleLoader.addListener(loaderListener);

    if (articleLoader.loadState == null || articleLoader.loadState == ArticleLoadState.NO_NET){
      articleLoader.run();
    }

    super.initState();
  }

  @override
  void dispose() {
    articleLoader.removeListener(loaderListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(left: Dimen.SIDE_MARG),
          child: TitleShortcutRowWidget(
            icon: MdiIcons.textBoxCheckOutline,
            iconColor: textEnab_(context),
            title: 'Artykuły',
            textAlign: TextAlign.start,

            trailing:
            articleLoader.loadState == ArticleLoadState.CHECKING_NET || articleLoader.loadState == ArticleLoadState.LOADING?
            IconButton(
              icon: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: accent_(context)),
                onPressed: () => showAppToast(context, text: 'Ładowanie nowych artykułów...')
            ):
            (articleLoader.loadState == ArticleLoadState.NO_NET || articleLoader.loadState == ArticleLoadState.FAILED?
                IconButton(
                    icon: Icon(MdiIcons.refresh),
                    onPressed: () => articleLoader.run()
                ):
                IconButton(icon: Icon(MdiIcons.progressDownload), onPressed: (){

                  showAlertDialog(
                    context,
                    title: 'Ostrożnie',
                    content: 'HarcAppka pobiera automatycznie jedynie nowe artykuły.'
                        '\n'
                        '\nCzy chcesz pobrać ponownie wszystkie dostępne artykuły?',
                    actionBuilder: (context) => [

                      AlertDialogButton(
                        text: 'Tak',
                        onTap: () async{
                          showAppToast(context, text: 'Pobieranie wszystkich artykułów...');
                          Article.clearAll();
                          articleLoader.run(all: true);
                          Navigator.pop(context);
                        },
                      ),

                      AlertDialogButton(
                          text: 'Nie',
                          onTap: () => Navigator.pop(context)
                      ),

                    ]
                  );
                  
                })
            ),

            onOpen:
            articleLoader.loadState == ArticleLoadState.LOADED ?
                (context) => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllArticlesPage()
                )
            ):null,
          ),
        ),

        Stack(
          children: [

            SizedBox(
              height: ArticleCardWidget.height,
              child: ArticleListWidget(
                  Article.all,
                  //tabNotifier, 0,
                  emptyText:
                  articleLoader.loadState == ArticleLoadState.LOADED?
                  'Pusto...':
                  (articleLoader.loadState == ArticleLoadState.LOADING?
                  'Ładowanie...':
                  (articleLoader.loadState == ArticleLoadState.NO_NET?
                  'Brak internetu':
                  'Upsis...')),

                  emptyIcon:
                  articleLoader.loadState == ArticleLoadState.LOADING?
                  MdiIcons.bookArrowDownOutline:
                  (articleLoader.loadState == ArticleLoadState.NO_NET?
                  MdiIcons.bookRefreshOutline:
                  MdiIcons.bookOutline),

                  mode: ArticleListMode.PageView,
                  itemPadding: EdgeInsets.only(bottom: 12.0)
              ),
            ),

          ],
        ),

        Padding(
          padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          child: Row(
            children: [

              Consumer<BookmarkedArticlesProvider>(
                builder: (context, prov, child) => SimpleButton.from(
                    context: context,
                    icon: MdiIcons.bookmarkOutline,
                    text: 'Zapisane (${Article.bookmarkedIds.length})',
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookmarkedArticlesPage())
                    )
                )
              ),

              Consumer<LikedArticlesProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      context: context,
                      icon: MdiIcons.heartOutline,
                      text: 'Polubione (${Article.likedIds.length})',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LikedArticlesPage())
                      )
                  ),
              ),

            ],
          ),
        )

      ],
    );
  }
}

class _ShortReadScrollView extends StatelessWidget{

  final List<ShortRead> allShortReads;

  const _ShortReadScrollView(this.allShortReads);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: allShortReads.length,
        itemBuilder: (context, index) => SizedBox(
          child: ShortReadThumbnailWidget(allShortReads[index]),
          width: 140,
        ),
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: Dimen.ICON_MARG),
      ),
    );
  }

}

class FormsScrollView extends StatelessWidget{

  static const double height = 140;

  final List<HarcForm> forms;

  const FormsScrollView(this.forms);

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    child: ListView.separated(
      padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: forms.length,
      itemBuilder: (context, index) => FormThumbnailWidget(forms[index]),
      separatorBuilder: (BuildContext context, int index) => SizedBox(width: Dimen.ICON_MARG),
    ),
  );

}

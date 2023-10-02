import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/_main_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/data.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/games/game_widget.dart';
import 'package:harcapp/_new/cat_page_harcthought/konspekty/data.dart';
import 'package:harcapp/_new/cat_page_harcthought/konspekty/konspekts_page.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/all_articles_page.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/bookmarked_articles_page.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/title_widget/article_card_widget.dart';
import 'package:harcapp/_new/cat_page_harcthought/harc_forms/harc_form_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read.dart';
import 'package:harcapp/_new/cat_page_harcthought/wiersze/data.dart';
import 'package:harcapp/_new/cat_page_harcthought/wiersze/wiersz.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/search_page.dart';
import 'package:harcapp/_new/cat_page_harcthought/gawedy/data.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../_common_classes/app_navigator.dart';
import '../app_drawer.dart';
import 'apel_ewan/apel_ewan_page.dart';
import 'apel_ewan/apel_ewan_thumbnail_widget.dart';
import 'apel_ewan/apel_ewans_page.dart';
import 'apel_ewan/data.dart';
import 'articles/article_core.dart';
import 'articles/article_list_widget.dart';
import 'articles/article_loader.dart';
import 'articles/article_text_style.dart';
import 'articles/liked_articles_page.dart';
import 'common/short_read_widget.dart';
import 'common/short_reads_page.dart';
import 'common/short_read_thumbnail_widget.dart';
import 'gawedy/gaweda.dart';
import 'harc_forms/data.dart';
import 'harc_forms/harc_form.dart';
import 'harc_forms/harc_forms_page.dart';
import 'konspekty/konspekt.dart';
import 'konspekty/konspekt_thumbnail_widget.dart';

class CatPageHarcThought extends StatefulWidget{

  const CatPageHarcThought({super.key});

  @override
  State createState() => CatPageHarcThoughtState();

}

class CatPageHarcThoughtState extends State<CatPageHarcThought> with TickerProviderStateMixin, AfterLayoutMixin{

  @override
  void afterFirstLayout(BuildContext context){
    if(!mounted) return;
    Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackHarcthought();
  }

  ScrollController? controller;
  late TabController tabController;
  late ValueNotifier tabNotifier;

  String? paraFontFamily;
  bool? loading;

  int? selectedIndex;

  @override
  void initState() {

    tabController = TabController(vsync: this, length: 2);
    tabNotifier = ValueNotifier<double>(0);
    tabController.animation!.addListener(() => tabNotifier.value = tabController.animation!.value);
    paraFontFamily = Parag2TextStyle.FAMILY;

    controller = ScrollController();

    selectedIndex = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => AppScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          automaticallyImplyLeading: false,
          leading: AccountHeaderIcon(),
          title: Text('Myśl i inspiracje'),
          centerTitle: true,
          floating: true,
        ),

        SliverList(
          delegate: SliverChildListDelegate([

            _ArticleScrollView(),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: TitleShortcutRowWidget(
                //icon: MdiIcons.campfire,
                iconColor: textEnab_(context),
                title: 'Gawędy',
                textAlign: TextAlign.start,
                onOpen: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ShortReadsPage<Gaweda>(
                    ModuleStatsMixin.myslHarcGawedy,
                    'Gawędy',
                    allGawedy
                ))),
              ),
            ),

            _ShortReadScrollView<Gaweda>(ModuleStatsMixin.myslHarcGawedy, allGawedy, titleColor: background_(context)),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: TitleShortcutRowWidget(
                //icon: MdiIcons.cross,
                iconColor: textEnab_(context),
                title: 'Apele ewangeliczne',
                textAlign: TextAlign.start,
                trailing: IconButton(
                  icon: Icon(MdiIcons.informationOutline),
                  onPressed: () => showScrollBottomSheet(
                    context: context,
                    builder: (context) => BottomSheetDef(
                      title: 'O co kaman?',
                      builder: (context) => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Text(
                            'Harcerze w zastępach otrzymują fragment Pisma Świętego.'
                            '\n\nPrzez ok. 15 minut każdy ma indywidualny czas, by go przeczytać, przemyśleć i spróbować odpowiedzieć na pytania na dole.'
                            '\n\nNastępnie zastęp schodzi się razem. Każdy według uznania może podzielić się swoimi przemyśleniami odnośnie każdego z pytań.'
                            '\n\nCzęść wspólną prowadzi zastępowy (lub inna chętna osoba).',
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                          ),

                          const SizedBox(height: 2*Dimen.BOTTOM_SHEET_MARG),

                          Text(
                              'Dla kogo?',
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)
                          ),

                          const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                          Text(
                              'Forma ta jest dostosowana do osób w wieku 12 lat i więcej.',
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                          ),

                          const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                          Text(
                              'Uwagi',
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)
                          ),

                          const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                          const AppText(
                              'Pytania do fragmentów Pisma mogą, a nawet <b>powinny być modyfikowane</b>! Każda drużyna jest inna, ma inną wrażliwość i inną charakterystykę. '
                                  'Dlatego, drogi drużynowy, nie wahaj się używać dostępnych Apeli Ewangelicznych jako poglądowych.',
                              size: Dimen.TEXT_SIZE_BIG
                          ),

                          const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                          Text(
                              'A forma opracowana została przez Skautów Europy!',
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)
                          ),

                          const SizedBox(height: 3*Dimen.BOTTOM_SHEET_MARG),

                          Center(
                            child: Text(
                                'Czuwaj! Z Bogiem :)',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    color: Colors.amber[900],
                                    fontWeight: weight.bold
                                )
                            ),
                          ),

                          const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

                        ],
                      ),
                    )
                  ),
                ),
                onOpen: () => pushPage(context, builder: (context) => ApelEwansPage(allApelEwans)),
              ),
            ),

            _ApelEwanScrollView(allApelEwans),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: TitleShortcutRowWidget(
                //icon: MdiIcons.scriptTextOutline,
                iconColor: textEnab_(context),
                title: 'Wiersze',
                textAlign: TextAlign.start,
                onOpen: () => pushPage(context, builder: (context) => ShortReadsPage<Wiersz>(
                  ModuleStatsMixin.myslHarcWiersze,
                  'Wiersze',
                  allWiersze,
                )),
              ),
            ),

            _ShortReadScrollView<Wiersz>(ModuleStatsMixin.myslHarcWiersze, allWiersze),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: TitleShortcutRowWidget(
                iconColor: textEnab_(context),
                title: 'Formy',
                textAlign: TextAlign.start,
                onOpen: () => pushPage(context, builder: (context) => HarcFormsPage(allForms)),
              ),
            ),

            FormsScrollView(allForms),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: TitleShortcutRowWidget(
                iconColor: textEnab_(context),
                title: 'Inspiracje na konspekty',
                textAlign: TextAlign.start,
                onOpen: () => pushPage(context, builder: (context) => KonspektsPage(allKonspekts)),
              ),
            ),

            KonspektsScrollView(allKonspekts),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
              child: TitleShortcutRowWidget(
                iconColor: textEnab_(context),
                title: 'Gierki',
                textAlign: TextAlign.start,
                onOpen: () => pushPage(context, builder: (context) => const GamesPage()),
              ),
            ),

            const GamesPageView(),

            const SizedBox(height: Dimen.SIDE_MARG),

          ]),
        )

      ],
    ),
    bottomNavigationBar: const AppBottomNavigator(),
  );

  Widget drawerBuilder(/*BuildContext context*/) => Column(
    children: [

      ListTile(
        leading: Icon(MdiIcons.grid),
        title: Text('Podgląd', style: AppTextStyle(fontWeight: weight.halfBold)),
      ),

      const SizedBox(height: Dimen.ICON_MARG),

      ListTile(
        leading: const SizedBox(width: 0),
        title: Text('Artykuły', style: AppTextStyle(fontWeight: weight.bold, color: hintEnab_(context))),
      ),

      ListTile(
        leading: Icon(MdiIcons.textBoxCheckOutline),
        title: Text('Wszystkie', style: AppTextStyle(fontWeight: weight.halfBold)),
        trailing: Text('${Article.all?.length}', style: AppTextStyle(fontWeight: weight.bold)),
      ),

      ListTile(
        leading: Icon(MdiIcons.bookmarkOutline),
        title: Text('Zapisane', style: AppTextStyle(fontWeight: weight.halfBold)),
        trailing: Text('${Article.bookmarkedIds.length}', style: AppTextStyle(fontWeight: weight.bold)),
      ),

      ListTile(
        leading: Icon(MdiIcons.heartOutline),
        title: Text('Polubione', style: AppTextStyle(fontWeight: weight.halfBold)),
        trailing: Text('${Article.likedIds.length}', style: AppTextStyle(fontWeight: weight.bold)),
      ),

      const SizedBox(height: Dimen.ICON_MARG),

      ListTile(
        leading: const SizedBox(width: 0),
        title: Text('Gawędy', style: AppTextStyle(fontWeight: weight.bold, color: hintEnab_(context))),
      ),

      ListTile(
        leading: Icon(MdiIcons.campfire),
        title: Text('Wszystkie', style: AppTextStyle(fontWeight: weight.halfBold)),
      ),

    ],
  );

  Widget buildFloatingButton(/*BuildContext context*/) => AnimatedBuilder(
      animation: tabNotifier,
      child: FloatingActionButton(
        onPressed: ()async{

          if(tabController.index != 0)
            tabController.animateTo(0);
          if(tabController.index != 0)
            await Future.delayed(const Duration(milliseconds: 200));

          await pushPage(context, builder: (context) => ArticleSearchPage(
            Article.all??[],
          ));
        },
        child: Icon(MdiIcons.magnify),
      ),
      builder: (context, child) => Transform.translate(
        offset: Offset(cos(pi/2*(tabNotifier.value))*(50 + 2*Dimen.FLOATING_BUTTON_MARG), 0),
        child: child,
      )
  );

  void notify() => setState((){});

}

class _ArticleScrollView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ArticleScrollViewState();

}

class _ArticleScrollViewState extends State<_ArticleScrollView>{

  late ArticleLoaderListener loaderListener;

  @override
  void initState() {

    BookmarkedArticlesProvider bookmarkedArticlesProv = Provider.of<BookmarkedArticlesProvider>(context, listen: false);
    LikedArticlesProvider likedArticlesProv = Provider.of<LikedArticlesProvider>(context, listen: false);

    loaderListener = ArticleLoaderListener(
        onEnd: (ArticleLoaderError? err, bool unknownError, bool forceFinished) async {

          if(forceFinished) return;

          if(Article.all != null) {
            bookmarkedArticlesProv.init(Article.all);
            likedArticlesProv.init(Article.all);
          }
        },
        onStateChanged: (ArticleLoadState state){
          if(state == ArticleLoadState.NO_NET) {
            if(!mounted) return;
            showAppToast(context, text: 'Brak internetu');
          } else if(state == ArticleLoadState.FAILED) {
            if(!mounted) return;
            showAppToast(context, text: 'Błąd ładowania artykułów');
          } else if(state == ArticleLoadState.LOADED) {
            if(!mounted) return;
            showAppToast(context, text: 'Pobrano artykuły');
          }

          setState((){});

        }
    );

    articleLoader.addListener(loaderListener);

    if(Article.all == null) {
      Article.addAll(storedArticles);
      bookmarkedArticlesProv.init(Article.all);
      likedArticlesProv.init(Article.all);
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
  Widget build(BuildContext context) => Column(
    children: [

      Padding(
        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
        child: TitleShortcutRowWidget(
          //icon: MdiIcons.textBoxCheckOutline,
          iconColor: textEnab_(context),
          title: 'Artykuły',
          textAlign: TextAlign.start,

          trailing:
          articleLoader.loadState == ArticleLoadState.CHECKING_NET || articleLoader.loadState == ArticleLoadState.LOADING?
          IconButton(
            icon: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: accent_(context)),
            onPressed: () => showAppToast(context, text: 'Ładowanie nowych artykułów...')
          ):
          articleLoader.loadState == ArticleLoadState.NO_NET || articleLoader.loadState == ArticleLoadState.FAILED?
          IconButton(
            icon: Icon(MdiIcons.refresh),
            onPressed: () => articleLoader.run()
          ):
          IconButton(icon: Icon(MdiIcons.progressDownload), onPressed: () => showAlertDialog(
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
          )),

          onOpen:
          articleLoader.loadState == ArticleLoadState.LOADED ?
          () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllArticlesPage())
          ):null,
        ),
      ),

      SizedBox(
        height: ArticleCardWidget.height,
        child: ArticleListWidget(
            Article.all??[],
            emptyText:
            articleLoader.loadState == ArticleLoadState.LOADED?
            'Pusto...':
            articleLoader.loadState == ArticleLoadState.LOADING ||
            articleLoader.loadState == ArticleLoadState.CHECKING_NET?
            'Ładowanie...':
            articleLoader.loadState == ArticleLoadState.NO_NET?
            'Brak internetu':
            'Upsis...',

            emptyIcon:
            articleLoader.loadState == ArticleLoadState.LOADING?
            MdiIcons.bookArrowDownOutline:
            (articleLoader.loadState == ArticleLoadState.NO_NET?
            MdiIcons.bookRefreshOutline:
            MdiIcons.bookOutline),

            mode: ArticleListMode.PageView,
            itemPadding: const EdgeInsets.only(bottom: 12.0)
        ),
      ),

      Padding(
        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
        child: Row(
          children: [

            Expanded(
              child: Consumer<BookmarkedArticlesProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                    context: context,
                    margin: EdgeInsets.zero,
                    color: cardEnab_(context),
                    icon: MdiIcons.bookmarkOutline,
                    text: 'Zapisane (${Article.bookmarkedIds.length})',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BookmarkedArticlesPage())
                    )
                  )
              ),
            ),

            const SizedBox(width: Dimen.ICON_MARG),

            Expanded(
              child: Consumer<LikedArticlesProvider>(
                builder: (context, prov, child) => SimpleButton.from(
                  context: context,
                  margin: EdgeInsets.zero,
                  color: cardEnab_(context),
                  icon: MdiIcons.heartOutline,
                  text: 'Polubione (${Article.likedIds.length})',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LikedArticlesPage())
                  )
                ),
              ),
            ),

          ],
        ),
      )

    ],
  );

}

class _ShortReadScrollView<T extends ShortRead> extends StatelessWidget{

  final String moduleId;
  final List<T> allShortReads;
  final Color? titleColor;

  const _ShortReadScrollView(this.moduleId, this.allShortReads, {this.titleColor});

  @override
  Widget build(BuildContext context){

    List<T> shuffShortReads = List.of(allShortReads);
    shuffShortReads.shuffle(Random(DateTime.now().day));

    return SizedBox(
      height: ShortReadThumbnailWidget.height,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: shuffShortReads.length,
        itemBuilder: (context, index) => SizedBox(
          width: ShortReadThumbnailWidget.height,
          child: ShortReadThumbnailWidget(
            shuffShortReads[index],
            titleColor: titleColor,
            onTap: () => pushPage(context, builder: (context) => ShortReadWidget<T>(moduleId, shuffShortReads[index])),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimen.ICON_MARG),
      ),
    );
  }

}

class _ApelEwanScrollView extends StatelessWidget{

  static const double height = ShortReadThumbnailWidget.height;

  final List<ApelEwan> apelEwanList;

  const _ApelEwanScrollView(this.apelEwanList, {super.key});

  @override
  Widget build(BuildContext context){

    List<ApelEwan> shuffApelEwanList = List.of(apelEwanList);
    shuffApelEwanList.shuffle(Random(DateTime.now().day));

    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: shuffApelEwanList.length,
        itemBuilder: (context, index) => ApelEwanThumbnailWidget(
          shuffApelEwanList[index],
          onTap: (apelEwan, subgroup) => pushPage(context, builder: (context) => ApelEwanPage(
              apelEwan,
              initSubgroup: subgroup
          )),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: Dimen.ICON_MARG),
      ),
    );
  }

}

class FormsScrollView extends StatelessWidget{

  static const double height = 140;

  final List<HarcForm> forms;

  const FormsScrollView(this.forms, {super.key});

  @override
  Widget build(BuildContext context) {

    List<HarcForm> shuffForms = List.of(forms);
    shuffForms.shuffle(Random(DateTime.now().day));

    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: shuffForms.length,
        itemBuilder: (context, index) => FormThumbnailWidget(shuffForms[index]),
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(width: Dimen.ICON_MARG),
      ),
    );
  }

}

class KonspektsScrollView extends StatelessWidget{

  static const double height = 140;

  final List<Konspekt> konspkets;

  const KonspektsScrollView(this.konspkets, {super.key});

  @override
  Widget build(BuildContext context) {

    List<Konspekt> shuffKonspekts = List.of(konspkets);
    konspkets.shuffle(Random(DateTime.now().day));

    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: shuffKonspekts.length,
        itemBuilder: (context, index) => KonspektThumbnailWidget(shuffKonspekts[index]),
        separatorBuilder: (BuildContext context, int index) =>
        const SizedBox(width: Dimen.ICON_MARG),
      ),
    );
  }

}

class GamesPageView extends StatefulWidget{

  static const double height = 140;

  const GamesPageView({super.key});

  @override
  State<StatefulWidget> createState() => GamesPageViewState();

}

class GamesPageViewState extends State<GamesPageView>{

  PageController? controller;

  @override
  void initState() {
    post(() => setState(() => controller = PageController(
        viewportFraction: Dimen.viewportFraction(context, margin: .8*Dimen.SIDE_MARG)
    )));
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<GameData> shuffGames = List.of(gameList);
    shuffGames.shuffle(Random(DateTime.now().day));

    return SizedBox(
      height: GamesPageView.height,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: .2*Dimen.SIDE_MARG),
          child: GameWidget(shuffGames[index], height: GamesPageView.height, showHelpButtons: false),
        ),
        itemCount: shuffGames.length,
      ),
    );
  }

}
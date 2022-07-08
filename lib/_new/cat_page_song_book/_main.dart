import 'dart:math';

import 'package:after_layout/after_layout.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_base_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/song_loader.dart';
import 'package:harcapp/_new/cat_page_song_book/songs_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/settings_page.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';
import 'package:harcapp/_new/cat_page_song_book/song_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_page.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_widgets/chord_draw_bar.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core_song_widget/song_widget_template.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wakelock/wakelock.dart';

import '../../main.dart';
import '../app_drawer.dart';
import '../module_statistics_registrator.dart';
import 'album/album_drawer.dart';
import 'album/album_page.dart';
import 'album/new_album/new_album_page.dart';
import 'loading_widget.dart';
import 'own_song_page/add_song_bottom_sheet.dart';
import 'own_song_page/own_song_page.dart';

SongsStatisticsRegistrator songsStatisticsRegistrator = SongsStatisticsRegistrator();

class CatPageSongBook extends StatefulWidget{

  static const pageViewExtents = 1;

  const CatPageSongBook({super.key});

  @override
  State createState() => CatPageSongBookState();

}

class CatPageSongBookState extends State<CatPageSongBook> with AfterLayoutMixin, ModuleStatsMixin{

  @override
  String get moduleId => 'songbook';

  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackSongBook();
  }

  static void delLastPageForAlbum(Album album) => ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG_(album));
  static int? getLastPageForAlbum(Album album) => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG_(album), 0);
  static void setLastPageForAlbum(Album album, int value) => ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG_(album), value);

  static int get lastPage => getLastPageForAlbum(Album.current)!;
  static set lastPage(int value) => setLastPageForAlbum(Album.current, value);

  void jumpToPage(int page){
    pageController.jumpToPage(page);
    lastPage = page;
    notifier.value = page.toDouble();
  }

  static late bool tabOfContOpenOnBack;
  late PageController pageController;
  late ValueNotifier<double> notifier;
  SingleComputerListener<String>? loaderListener;
  late SongSearchOptions searchOptions;
  late bool floatingButtonExpanded;

  late bool isAutoScrolling;

  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) {
    if(!ModalRoute.of(context)!.isCurrent)
      return false;

    if(tabOfContOpenOnBack) {
      openTabOfCont();
      return true;
    }

    return false;
  }

  void onNavigatorRouteChanged(){

    if(!ModalRoute.of(context)!.isCurrent)
      songsStatisticsRegistrator.pause = true;
    else
      songsStatisticsRegistrator.pause = false;

  }

  late GlobalKey<NestedScrollViewState> nestedScrollViewKey;
  ScrollController get innerController => nestedScrollViewKey.currentState!.innerController;
  ScrollController get outerController => nestedScrollViewKey.currentState!.outerController;
  void notifyInnerController() => innerController.animateTo(innerController.offset, duration: const Duration(microseconds: 1), curve: Curves.ease);

  late SynchronizerListener syncListener;

  void onOrientationChanged() => notifyInnerController();

  @override
  void initState() {

    App.addOrientationChangeListener(onOrientationChanged);

    syncListener = SynchronizerListener(
        onEnd: (oper){
          if(oper == SyncOper.get)
            setState((){});
        }
    );
    synchronizer.addListener(syncListener);

    tabOfContOpenOnBack = false;

    if(!Album.initialized) {
      loaderListener = SingleComputerListener<String>(
          onError: (fileName) async => showAppToast(context, text: 'Błąd wczytywania piosenki $fileName'),
          onEnd: (String? err, bool forceFinished) {
            if(!mounted) return;

            if(SongBookSettings.showTabOfContOnStart && Album.current.songs.isNotEmpty)
              openTabOfCont();

            if(Album.current.songs.length <= lastPage)
              lastPage = 0;

            pageController = PageController(initialPage: lastPage);
            pageController.addListener(() => notifier.value = pageController.page??0);
            notifier = ValueNotifier<double>(pageController.initialPage.toDouble());
            notifier.addListener(handleSwap);

            if(Album.current.songs.isNotEmpty) {
              songsStatisticsRegistrator.openSong(Album.current.songs[lastPage], SongOpenType.init);
              post(() => notifyInnerController()); // in order to register visible lines on open.
            }

            setState(() {});
          }
      );
      songLoader.addListener(loaderListener!);
      songLoader.run();
    } else {

      if(Album.current.songs.length <= lastPage)
        lastPage = 0;

      pageController = PageController(initialPage: lastPage);
      pageController.addListener(() => notifier.value = pageController.page??0);
      notifier = ValueNotifier<double>(pageController.initialPage.toDouble());
      notifier.addListener(handleSwap);

      if(SongBookSettings.showTabOfContOnStart && Album.current.songs.isNotEmpty)
        post(() => openTabOfCont());

      if(Album.current.songs.isNotEmpty) {
        songsStatisticsRegistrator.openSong(Album.current.songs[lastPage], SongOpenType.init);
        post(() => notifyInnerController()); // in order to register visible lines on open.
      }
    }

    searchOptions = SongSearchOptions();

    floatingButtonExpanded = true;
    isAutoScrolling = false;

    BackButtonInterceptor.add(onBackPressed);

    appNavigatorObserver.addChangedListener(onNavigatorRouteChanged);

    post(() => setSettings());
    nestedScrollViewKey = GlobalKey<NestedScrollViewState>();

    super.initState();
  }

  @override
  void dispose() {

    App.removeOrientationChangeListener(onOrientationChanged);

    Wakelock.disable();
    notifier.dispose();
    if(loaderListener != null)
      songLoader.removeListener(loaderListener!);

    BackButtonInterceptor.remove(onBackPressed);

    appNavigatorObserver.removeChangedListener(onNavigatorRouteChanged);
    songsStatisticsRegistrator.commit();

    synchronizer.removeListener(syncListener);

    super.dispose();
  }

  void setSettings(){
    if(SongBookSettings.alwaysOnScreen) {
      Wakelock.enable();
      showAppToast(context, text: 'Zawieszono wygaszanie ekranu');
    }
  }

  void handleSwap(){
    if(notifier.value.floor() == notifier.value) {
      floatingButtonExpanded = true;
      Provider.of<FloatingButtonProvider>(context, listen: false).notify();
    }
  }

  SliverAppBar appBarBuilder(BuildContext context, {bool pinned=false}) => SliverAppBar(
    backgroundColor: background_(context),
    title: const Text('Śpiewnik'),
    automaticallyImplyLeading: Album.initialized,
    centerTitle: true,
    floating: true,
    pinned: pinned,
    actions: [
      AnimatedOpacity(
        opacity: Album.initialized?1:0,
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: [

            IconButton(
              icon: const Icon(MdiIcons.musicNotePlus),
              onPressed: !Album.initialized?null:(){

                showScrollBottomSheet(
                    context: context,
                    builder: (context) => AddSongBottomSheet(
                        onSaved: (Song song, EditType editType) async {

                          setState(() {});
                          int index = Album.current.songs.indexOf(song);
                          jumpToPage(index);

                          await openDialog(
                              context: this.context,
                              builder: (context) => Center(
                                child: AppCard(
                                  radius: AppCard.ALERT_DIALOG_RADIUS,
                                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                                  margin: const EdgeInsets.all(Dimen.SIDE_MARG),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[

                                      const TitleShortcutRowWidget(title: 'Udostępnij dodane piosenki!'),

                                      const SizedBox(height: Dimen.SIDE_MARG),
                                      Text('Możesz to uczynić na dwa sposoby:', style: AppTextStyle(color: textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG)),
                                      const SizedBox(height: 14.0),
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(SongWidgetTemplate.ICON_SHARE_SONG, size: Dimen.TEXT_SIZE_BIG+2, color: textEnab_(context)),
                                            const SizedBox(width: Dimen.ICON_MARG),
                                            const Expanded(
                                                child: AppText('lokalnie za pomocą <b>kodu QR</b>,', size: Dimen.TEXT_SIZE_BIG)),
                                          ]
                                      ),
                                      const SizedBox(height: 14.0),
                                      Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(SongWidgetTemplate.ICON_SEND_SONG, size: Dimen.TEXT_SIZE_BIG+2, color: textEnab_(context)),
                                            const SizedBox(width: Dimen.ICON_MARG),
                                            const Expanded(
                                              child: AppText('znane piosenki, możesz zaproponować do <b>oficjalnego śpiewnika</b>.', size: Dimen.TEXT_SIZE_BIG),
                                            ),
                                          ]
                                      ),
                                      const SizedBox(height: 18.0),

                                      Row(
                                        children: [
                                          Expanded(child: SimpleButton.from(
                                              context: context,
                                              icon: SongWidgetTemplate.ICON_SHARE_SONG,
                                              text: 'Udostępnij',
                                              onTap: (){
                                                Navigator.pop(context);
                                                SongWidget.shareSong(context, song);
                                              }
                                          )),
                                          Expanded(child: SimpleButton.from(
                                              context: context,
                                              icon: SongWidgetTemplate.ICON_SEND_SONG,
                                              text: 'Wyślij',
                                              onTap: (){
                                                Navigator.pop(context);
                                                SongWidget.sendSong(song);
                                              }
                                          )),
                                        ],
                                      ),

                                      const SizedBox(height: 18.0),

                                      Row(
                                        children: <Widget>[
                                          Expanded(child: Container()),
                                          InkWell(
                                            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                                            onTap: () => Navigator.pop(context),
                                            child: Padding(
                                              padding: const EdgeInsets.all(Dimen.DEF_MARG*2),
                                              child: Text('Wdechowo!', style: AppTextStyle(color: Album.current.avgColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.end,),
                                            ),
                                          )
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              )
                          );
                        },
                      ),
                );
              },
            ),

            IconButton(
                icon: const Icon(MdiIcons.cogOutline),
                onPressed: !Album.initialized?null:() => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsPage(
                            onScreenAlwaysOnChanged: (bool screenAlwaysOn) => setSettings()
                        )
                    )
                )
            )

          ],
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) => AppScaffold(
    extendBody: true,
    body: Consumer<AlbumProvider>(
        builder: (context, albProv, child) {

          if(!Album.initialized)
            return LoadingWidget();
          else if (albProv.current.songs.isNotEmpty)
            return SongAutoScrollController(
                SongBookBaseSetting(),
                onAutoscrollStart: (context){
                  isAutoScrolling = true;
                  Provider.of<FloatingButtonProvider>(context, listen: false).notify();
                },

                onAutoscrollEnd: (context){
                  isAutoScrolling = false;
                  Provider.of<FloatingButtonProvider>(context, listen: false).notify();
                },
                builder: (context) => Stack(
                  children: [

                    NestedScrollView(
                      key: nestedScrollViewKey,
                      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
                      [appBarBuilder(context)],
                      floatHeaderSlivers: true,
                      physics: const BouncingScrollPhysics(),
                      body: PageView.builder(
                        key: ValueKey(albProv.current),
                        controller: pageController,
                        itemCount: albProv.current.songs.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, position) => SongWidget(
                          this,
                          albProv.current.songs[position],
                          position,
                          onScroll: (scrollInfo, textHeight, textTopPadding) async {

                            FloatingButtonProvider floatingButtonProv = Provider.of<FloatingButtonProvider>(context, listen: false);

                            int page = pageController.page!.round();
                            if(page != position) return;
                            if(textHeight == null || textTopPadding == null) return;

                            if(scrollInfo is ScrollEndNotification){

                              Song song = albProv.current.songs[position];

                              double lineHeight = textHeight/song.lineNumList.length;

                              double topPadding = App.statusBarHeight;

                              double appBarHeight = kToolbarHeight - outerController.offset;

                              double chordBarHeight = 0;
                              if(SongBookSettings.isDrawChordsBarVisible)
                                chordBarHeight = ChordWidget.height(SongBookSettings.drawChordsType==InstrumentType.GUITAR?6:4);

                              // distance between the screen top and the screen bottom available for the song book module.
                              double songBookAvailHeight = MediaQuery.of(context).size.height - kBottomNavigationBarHeight - topPadding;

                              // distance between the screen top and the top of the song text area.
                              double textTopY = textTopPadding - scrollInfo.metrics.pixels - topPadding;

                              double textHiddenHeight = min(textHeight, max(0, -textTopY + appBarHeight + chordBarHeight));

                              double textBottomVisY = min(songBookAvailHeight - textTopY, textHeight);

                              int bottomVisibleIdx = max(0, (textBottomVisY/lineHeight).floor() - 1);
                              int topVisibleIdx = min(bottomVisibleIdx, (textHiddenHeight/lineHeight).ceil());

                              int topVisibleLine = song.lineNumList[topVisibleIdx];
                              int bottomVisibleLine = song.lineNumList[bottomVisibleIdx];

                              await songsStatisticsRegistrator.registerScroll(topVisibleLine, bottomVisibleLine, MediaQuery.of(context).orientation);

                              /*
                              openDialog(context: context, builder: (context) => Stack(children: [

                                Positioned(
                                    bottom: kBottomNavigationBarHeight,
                                    left: 0,
                                    right: 0,
                                    child: Opacity(
                                      opacity: .5,
                                      child: Container(
                                        width: double.infinity,
                                        height: songBookAvailHeight,
                                        color: Colors.red,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Container(
                                            width: double.infinity,
                                            height: songBookAvailHeight,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    )
                                ),

                                Positioned(
                                    top: textTopY,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: double.infinity,
                                      height: 3,
                                      color: Colors.amber,
                                    )
                                ),

                                Positioned(
                                    top: textBottomVisY + textTopPadding - topPadding - scrollInfo.metrics.pixels - 1,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.amber,
                                    )
                                ),

                                Positioned(
                                    top: textTopY,
                                    left: 0,
                                    right: 0,
                                    child: Opacity(
                                      opacity: .5,
                                      child: Builder(
                                        builder: (context){

                                          List<Widget> children = [];

                                          for(int i=0; i<song.lineNumList.length; i++)
                                            children.add(Container(
                                              width: double.infinity,
                                              height: lineHeight,
                                              color: Colors.blue,
                                              child: Padding(
                                                padding: const EdgeInsets.all(1),
                                                child: Container(
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  color: Colors.pink,
                                                ),
                                              ),
                                            ));

                                          return Column(children: children);

                                        },
                                      ),
                                    )
                                ),

                              ]));
                               */
                            }

                            bool scrollable = scrollInfo.metrics.maxScrollExtent > 0;

                            if(scrollable && scrollInfo.metrics.pixels <= 0){
                              if(!floatingButtonExpanded){
                                floatingButtonExpanded = true;
                                floatingButtonProv.notify();
                              }
                            }

                            else{
                              if(floatingButtonExpanded){
                                floatingButtonExpanded = false;
                                floatingButtonProv.notify();
                              }
                            }
                          },
                          onTextSizeChanged: () => post(() => notifyInnerController()),
                          controller: innerController,
                        ),

                        onPageChanged: (index) async {

                          lastPage = index;
                          await songsStatisticsRegistrator.commit();
                          await songsStatisticsRegistrator.openSong(albProv.current.songs[index], SongOpenType.swipe);
                          notifyInnerController();
                        },
                      )
                    ),

                    Positioned(
                      bottom: Dimen.ICON_MARG,
                      left: Dimen.ICON_MARG,
                      right: Dimen.ICON_MARG,
                      child: AutoScrollSpeedWidget(
                          accentColor: Album.current.avgColor,
                          accentIconColor: Album.current.iconColor,
                          scrollController: () => innerController
                      ),
                    ),

                    if(SongBookSettings.showAlbumIcon)
                      IgnorePointer(child: AnimatedBuilder(
                        animation: notifier,
                        child: Center(
                          child: Icon(
                            CommonIconData.ALL[Album.current.iconKey],
                            color: iconEnab_(context),
                            size: 0.8*min(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
                          ),
                        ),
                        builder: (BuildContext context, child) => Opacity(
                          opacity: 0.15*sin(pi* notifier.value).abs(),
                          child: child,
                        )
                      )),

                  ],
                )
            );
          else
            return CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                appBarBuilder(context),

                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        EmptyMessageWidget(
                          text: 'W $tym_albumie_ pusto...',
                          icon: MdiIcons.notebookOutline,
                        ),

                        const SizedBox(height: 64),

                        SimpleButton.from(
                          context: context,
                          elevation: AppCard.bigElevation,
                          color: cardEnab_(context),
                          icon: MdiIcons.reload,
                          text: Zmien_album_,
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AlbumPage(onAlbumSelected: (Album album) async {
                                if(album != Album.current) {
                                  if(pageController.hasClients) {
                                    jumpToPage(0);
                                    if(album.songs.isEmpty) return;
                                    await songsStatisticsRegistrator.commit();
                                    await songsStatisticsRegistrator.openSong(
                                        album.songs.first,
                                        SongOpenType.init,
                                    );
                                    notifyInnerController();
                                  }
                                }
                              }))
                          ),
                        ),

                        if(!albProv.current.isOmega)
                          SimpleButton.from(
                              context: context,
                              elevation: AppCard.bigElevation,
                              color: cardEnab_(context),
                              icon: MdiIcons.plus,
                              text: 'Dodaj piosenki',
                              onTap: () => openDialog(
                                  context: context,
                                  builder: (context) => NewAlbumPage(
                                    initAlbum: albProv.current,
                                    onSaved: (album){
                                      Provider.of<FloatingButtonProvider>(context, listen: false).notify();
                                      setState((){});
                                    },
                                  )
                              )
                          ),
                      ]),
                )

              ],
            );

        }
    ),
    bottomNavigationBar: const AppBottomNavigator(),

    drawer:
    !Album.initialized ? null:
    AppDrawer(
        body: AlbumDrawer(
            onSelected: (Album album) async {
              if(pageController.hasClients){
                jumpToPage(0);
                if(album.songs.isEmpty) return;
                await songsStatisticsRegistrator.commit();
                await songsStatisticsRegistrator.openSong(
                    album.songs.first,
                    SongOpenType.init,
                );
                notifyInnerController();
              }
              notify();
            },
            onNewCreated: (Album album) async {
              if(pageController.hasClients){
                jumpToPage(0);
                if(album.songs.isEmpty) return;
                await songsStatisticsRegistrator.commit();
                await songsStatisticsRegistrator.openSong(
                    album.songs.first,
                    SongOpenType.init,
                );
                notifyInnerController();
              }
              notify();
            }
        )
    ),

    floatingActionButton:
    !Album.initialized || Album.current.songs.isEmpty ? null:
    Consumer2<FloatingButtonProvider, AlbumProvider>(
        builder: (context, floatingButtonProv, albumProv, child){
          if(isAutoScrolling)
            return Container();

          CommonColorData colors = CommonColorData.ALL[Album.current.colorsKey]!;
          return ExtendedFloatingButton(
              MdiIcons.magnify,
              'Spis treści',
              textColor: colors.iconColor,
              background: colors.colorStart,
              backgroundEnd: colors.colorEnd,
              floatingButtonExpanded: floatingButtonExpanded,
              onTap: openTabOfCont
          );
        }
    ),
  );

  Future<void> openTabOfCont({String? initPhrase, bool forgetScrollPosition=false}) => pushPage(
    context,
    builder: (context) => TabOfContPage(
      initPhrase: initPhrase,
      forgetScrollPosition: forgetScrollPosition,
      onSongSelected: (Song song, int indexInAlbum, SongOpenType songOpenType) async {
        jumpToPage(indexInAlbum);

        if(songOpenType != SongOpenType.history)
          Album.current.registerSongSearchToHistory(song);
        // songsStatisticsRegistrator stuff is handled by pageChange.
      },
      onConfAlbumEnabled: (){
        jumpToPage(0);
        notify();
        showAppToast(context, text: 'Barbaro! Oto zostajesz songowym hakerem.\n<b>Miłego śpiewańska c:</b>', duration: const Duration(seconds: 7));
      },
      onNewSongAdded: (song) async{

        synchronizer.post();

        int index = Album.current.songs.indexOf(song);
        jumpToPage(index);

        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Center(
            child: AppCard(
                radius: AppCard.ALERT_DIALOG_RADIUS,
                padding: const EdgeInsets.all(AppCard.ALERT_DIALOG_PADDING),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(Dimen.ICON_MARG),
                          child: Icon(MdiIcons.informationOutline),
                        ),
                        Text('Ostatni krok!', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_APPBAR)),
                      ],
                    ),

                    const SizedBox(height: Dimen.ICON_MARG),

                    Text(
                      'Pozostało wysłanie piosenki mailem.\n\nPo zamknięciu tej wiadomości otworzy się Twoja poczta.',
                      style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                    ),

                    const SizedBox(height: 2*Dimen.ICON_MARG),

                    Row(
                      children: [
                        Expanded(child: Container()),
                        SimpleButton(
                            radius: AppCard.BIG_RADIUS,
                            padding: const EdgeInsets.all(Dimen.ICON_MARG),
                            child: Row(
                              children: [
                                Text(
                                  'Jedziemy',
                                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: iconEnab_(context)),
                                ),
                                const SizedBox(width: Dimen.ICON_MARG),
                                const Icon(SongWidgetTemplate.ICON_SEND_SONG)
                              ],
                            ),
                            onTap: () => Navigator.pop(context)
                        )
                      ],
                    )
                  ],
                )
            ),
          ),
        );

        await SongWidget.sendSong(song);
      },
    )
  );

  void notify(){
    notifier.value = CatPageSongBookState.lastPage.toDouble();
    setState(() {});
  }

}
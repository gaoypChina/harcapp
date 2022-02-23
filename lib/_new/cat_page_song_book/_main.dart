import 'dart:math';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_song_book/song_loader.dart';
import 'package:harcapp/_new/cat_page_song_book/songs_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/preload_page_view.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/settings_page.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';
import 'package:harcapp/_new/cat_page_song_book/song_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_page.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
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
import '../cat_page.dart';
import 'album/album_drawer.dart';
import 'album/album_page.dart';
import 'album/new_album/new_album_page.dart';
import 'loading_widget.dart';
import 'own_song_page/init_widget.dart';
import 'own_song_page/own_song_page.dart';

SongsStatisticsRegistrator songsStatisticsRegistrator = SongsStatisticsRegistrator();

class CatPageSongBook extends StatefulWidget{

  static const PAGE_VIEW_EXTENTS = 1;

  const CatPageSongBook({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CatPageSongBookState();

}

class CatPageSongBookState extends CatPageState<CatPageSongBook>{

  @override
  ColorPack get colorPack => ColorPackSongBook();

  int get lastPage => shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG, 0);
  set lastPage(int value) => shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG, value);

  void jumpToPage(int page){
    controller.jumpToPage(page);
    lastPage = page;
    notifier.value = page.toDouble();
  }

  static bool tabOfContOpenOnBack;
  PageController controller;
  ValueNotifier<double> notifier;
  SingleComputerListener loaderListener;
  SongSearchOptions searchOptions;
  bool floatingButtonExpanded;

  bool isAutoScrolling;
  
  Future<void> loadData({bool showTabOfCont=true}) async {
    SingleComputerListener listener;
    listener = SingleComputerListener<String>(
      onEnd: (_, __){
        if(!mounted) return;
        if(!SongBookSettings.showTabOfContOnStart) return;
        if(!showTabOfCont) return;

        if(Album.current.songs.isNotEmpty) openTabOfCont();
        songLoader.removeListener(listener);
      }
    );

    songLoader.addListener(listener);
    await songLoader.run();
  }

  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) {
    if(!ModalRoute.of(context).isCurrent)
      return false;

    if(tabOfContOpenOnBack) {
      openTabOfCont();
      return true;
    }

    return false;
  }

  void onNavigatorRouteChanged(){

    if(!ModalRoute.of(context).isCurrent)
      songsStatisticsRegistrator.pause = true;
    else
      songsStatisticsRegistrator.pause = false;

  }

  GlobalKey<NestedScrollViewState> nestedScrollViewKey;

  SynchronizerListener syncListener;

  @override
  void initState() {

    syncListener = SynchronizerListener(
      onEnd: (oper){
        if(oper == SyncOper.GET)
          setState((){});
      }
    );
    synchronizer.addListener(syncListener);

    tabOfContOpenOnBack = false;
    controller = PageController(initialPage: lastPage);
    controller.addListener(() => notifier.value = controller.page);

    notifier = ValueNotifier<double>(controller.initialPage.toDouble());
    notifier.addListener(handleSwap);

    if(OffSong.allOfficial == null) {
      loaderListener = SingleComputerListener<String>(
          onError: (fileName) async => showAppToast(context, text: 'Błąd wczytywania piosenki $fileName'),
          onEnd: (String err, bool forceFinished) {
            if(mounted) notify();
          }
      );

      songLoader.addListener(loaderListener);

      loadData();
    }

    searchOptions = SongSearchOptions();

    floatingButtonExpanded = true;
    isAutoScrolling = false;
    
    BackButtonInterceptor.add(onBackPressed);

    appNavigatorObserver.addChangedListener(onNavigatorRouteChanged);

    post(() => setSettings());
    nestedScrollViewKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    Wakelock.disable();
    notifier.dispose();
    songLoader.removeListener(loaderListener);

    BackButtonInterceptor.remove(onBackPressed);
    appNavigatorObserver.removeChangedListener(onNavigatorRouteChanged);

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
    automaticallyImplyLeading: Album.current!=null,
    centerTitle: true,
    floating: true,
    pinned: pinned,
    actions: [
      AnimatedOpacity(
        opacity: Album.current==null?0:1,
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: [

            IconButton(
              icon: const Icon(MdiIcons.musicNotePlus),
              onPressed: Album.current==null?null:(){

                showScrollBottomSheet(
                    context: context,
                    builder: (context) => BottomSheetDef(
                      title: 'Dodaj piosenkę',
                      builder: (context) => InitWidget(
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
                                              child: Text('Wdechowo!', style: AppTextStyle(color: Album.current.avgColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.end,),
                                              padding: const EdgeInsets.all(Dimen.DEF_MARG*2),
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
                    )
                );
              },
            ),

            IconButton(
                icon: const Icon(MdiIcons.cogOutline),
                onPressed: Album.current==null?null:() => Navigator.push(
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
  Widget build(BuildContext context) {

    return AppScaffold(
      body: Consumer<AlbumProvider>(
          builder: (context, albProv, child) {

            if(albProv.current == null)
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
                        [
                          appBarBuilder(context),
                        ],
                        floatHeaderSlivers: true,
                        physics: const BouncingScrollPhysics(),
                        body: PreloadPageView.builder(
                          key: ValueKey(albProv.current),
                          //extents: CatPageSongBook.PAGE_VIEW_EXTENTS,
                          controller: controller,
                          itemCount: albProv.current.songs.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, position) =>
                              SongWidget(
                                this,
                                albProv.current.songs[position],
                                position,
                                onScroll: (scrollInfo){
                                  int page = controller.page.round();
                                  if(page != position) return;

                                  if(scrollInfo is ScrollEndNotification){
                                    double scrollFraction = nestedScrollViewKey.currentState.innerController.offset/nestedScrollViewKey.currentState.innerController.position.maxScrollExtent;
                                    songsStatisticsRegistrator.registerScroll(scrollFraction);
                                  }

                                  bool scrollable = scrollInfo.metrics.maxScrollExtent > 0;

                                  if(scrollable && scrollInfo.metrics.pixels <= 0){
                                    if(!floatingButtonExpanded){
                                      floatingButtonExpanded = true;
                                      Provider.of<FloatingButtonProvider>(context, listen: false).notify();
                                    }
                                  }

                                  else{
                                    if(floatingButtonExpanded){
                                      floatingButtonExpanded = false;
                                      Provider.of<FloatingButtonProvider>(context, listen: false).notify();
                                    }
                                  }
                                },
                                controller: nestedScrollViewKey.currentState.innerController,
                              ),

                          onPageChanged: (index){
                            lastPage = index;
                            songsStatisticsRegistrator.openSong(albProv.current.songs[index].fileName);
                          },
                        ),
                      ),

                      Positioned(
                        bottom: Dimen.ICON_MARG,
                        left: Dimen.ICON_MARG,
                        right: Dimen.ICON_MARG,
                        child: AutoScrollSpeedWidget(
                            accentColor: Album.current.avgColor,
                            accentIconColor: Album.current.iconColor,
                            scrollController: () => nestedScrollViewKey.currentState.innerController
                        ),
                      ),

                      if(albProv.current.iconKey!=null && SongBookSettings.showAlbumIcon)
                        IgnorePointer(child: AnimatedBuilder(
                          animation: notifier,
                          child: Center(
                            child: Icon(
                              CommonIconData.ALL[Album.current.iconKey],
                              color: iconEnab_(context),
                              size: 0.8*min(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width),
                            ),
                          ),
                          builder: (BuildContext context, child){
                            return Opacity(
                              child: child,
                              opacity: 0.15*sin(pi* notifier.value).abs(),
                            );
                          },
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
                                MaterialPageRoute(builder: (context) => AlbumPage(onAlbumSelected: (Album album) {
                                  if(album != Album.current) {
                                    if(controller.hasClients) {
                                      jumpToPage(0);
                                      songsStatisticsRegistrator.openSong(
                                          album.songs.isEmpty?null:
                                          album.songs.first.fileName
                                      );
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
      Album.current == null?
      null:
      AppDrawer(
        body: AlbumDrawer(
            onSelected: (Album album){
              if(controller.hasClients){
                jumpToPage(0);
                songsStatisticsRegistrator.openSong(
                    album.songs.isEmpty?null:
                    album.songs.first.fileName
                );
              }
              notify();
            },
            onNewCreated: (Album album){
              if(controller.hasClients){
                jumpToPage(0);
                songsStatisticsRegistrator.openSong(
                    album.songs.isEmpty?null:
                    album.songs.first.fileName
                );
              }
              notify();
            }
        )
      ),

      floatingActionButton:
      Album.current == null || Album.current.songs.isEmpty ? null:
      buildFloatingButton(),
    );

  }

  Widget buildFloatingButton() {

    return Consumer2<FloatingButtonProvider, AlbumProvider>(
      builder: (context, floatingButtonProv, albumProv, child){
        if(isAutoScrolling)
          return Container();

        CommonColorData colors = CommonColorData.ALL[Album.current.colorsKey];
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
    );

  }

  Future<void> openTabOfCont({String initPhrase='', bool forgetScrollPosition=false}) => Navigator.of(context).push(
      PageTransition(
          type: PageTransitionType.rippleRightUp,
          child: TabOfContPage(
            initPhrase: initPhrase,
            forgetScrollPosition: forgetScrollPosition,
            onSongSelected: (Song song, int indexInAlbum){
              jumpToPage(indexInAlbum);
              songsStatisticsRegistrator.openSong(song.fileName);
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
      )
  );

  void notify() => setState((){});

}
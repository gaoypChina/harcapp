import 'dart:async';
import 'dart:math';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/patronite_support_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp/_new/cat_page_song_book/song_contributors_page.dart';
import 'package:harcapp/_new/cat_page_song_book/songs_statistics_registrator.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_background_icon.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_controller.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_search_history_page.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_song_book/_main.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';
import 'package:harcapp/_new/cat_page_song_book/songs_confid_pass_key.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import 'album/album_name.dart';
import 'providers.dart';
import 'song_management/song.dart';

class TabOfContPage extends StatefulWidget{

  static String lastSearchPhrase = '';
  static SongSearchOptions searchOptions = SongSearchOptions();

  final void Function(Song, int, SongOpenType) onSongSelected;
  final void Function() onConfAlbumEnabled;
  final TabOfContController controller;
  final void Function(Song song)? onNewSongAdded;
  final bool forgetScrollPosition;

  const TabOfContPage({
    required this.onSongSelected,
    required this.onConfAlbumEnabled,
    required this.controller,
    this.onNewSongAdded,
    this.forgetScrollPosition = false,
    super.key
  });

  @override
  State createState() => TabOfContPageState();

}

class TabOfContPageState extends State<TabOfContPage> with TickerProviderStateMixin{

  void Function(Song, int, SongOpenType) get onSongSelected => widget.onSongSelected;
  void Function() get onConfAlbumEnabled => widget.onConfAlbumEnabled;

  late TabController tabController;
  TabOfContController get controller => widget.controller;

  _NoSongsFoundProvider? noSongProv;

  @override
  void initState() {
    BackButtonInterceptor.add(onBackPressed);

    tabController = TabController(length: 2, vsync: this);

    super.initState();

  }

  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) {
    CatPageSongBookState.tabOfContOpenOnBack = false;
    return false;
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context){
        noSongProv = _NoSongsFoundProvider(false);
        return noSongProv;
      },
      builder: (context, child) => BottomNavScaffold(
        body: Stack(
          children: [

            Consumer<_NoSongsFoundProvider>(
              builder: (context, prov, child) =>
              BaseAlbum.current is! OmegaAlbum && prov.songsFound?
              const Positioned.fill(
                child: TabOfContBackgroundIcon()
              ):Container(),
            ),

            _AllSongsPart(
              this,
              controller: controller,
              onConfAlbumEnabled: onConfAlbumEnabled,
              onSongSelected: onSongSelected,
            )
          ],
        ),
        bottomNavigationBar:
        App.showPatroniteSeasonally?
        PatroniteSupportWidget(
          margin: const EdgeInsets.only(left: Dimen.defMarg, right: Dimen.defMarg, bottom: Dimen.defMarg),
          stateTag: PatroniteSupportWidget.tagTableOfCont,
          title: 'Skąd tu tyle piosenek?!',
          description: 'Same się z pewnością nie dodają! A czy wiesz, że możesz pomóc w utrzymaniu rozwoju śpiewnika? <b>c:</b>',
          colorStart: BaseAlbum.current.colorStart??backgroundIcon_(context),
          colorEnd: BaseAlbum.current.colorEnd??backgroundIcon_(context),
        ):
        null,
      )
  );

  void selectSong(Song song, SongOpenType songOpen){

    int indexInAlbum;
    if(BaseAlbum.current.songs.contains(song))
      indexInAlbum = BaseAlbum.current.songs.indexOf(song);
    else{
      showAppToast(context, text: 'Zmieniono $album_ na "${OmegaAlbum().title}".');
      BaseAlbum.current = OmegaAlbum();
      indexInAlbum = BaseAlbum.current.songs.indexOf(song);
    }
    onSongSelected(song, indexInAlbum, songOpen);

  }

  void notify() => setState((){});

}

class _AllSongsPart extends StatefulWidget{

  final TabOfContPageState page;
  final TabOfContController controller;
  final void Function()? onConfAlbumEnabled;
  final void Function(Song, int, SongOpenType)? onSongSelected;

  const _AllSongsPart(this.page, {required this.controller, this.onConfAlbumEnabled, this.onSongSelected});

  @override
  State<StatefulWidget> createState() => _AllSongsPartState();

}

class _AllSongsPartState extends State<_AllSongsPart> with AutomaticKeepAliveClientMixin<_AllSongsPart>{

  @override
  bool get wantKeepAlive => true;

  static double _scrollOffset = 0;

  TabOfContPageState get page => widget.page;
  TabOfContController get controller => widget.controller;
  void Function()? get onConfAlbumEnabled => widget.onConfAlbumEnabled;
  void Function(Song, int, SongOpenType)? get onSongSelected => widget.onSongSelected;

  late ScrollController scrollController;
  double? paddingBottom;

  @override
  void initState() {

    if(widget.page.widget.forgetScrollPosition) _scrollOffset = 0;
    scrollController = ScrollController(initialScrollOffset: _scrollOffset);
    scrollController.addListener(() => _scrollOffset = scrollController.offset);

    if (BaseAlbum.current is! OmegaAlbum)
      post(() => showAppToast(context, text: '$Album_: <b>${BaseAlbum.current.title}</b>'));

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TabOfCont(
    background: Colors.transparent,
    controller: controller,

    appBarActions: [

      IconButton(
        icon: const Icon(MdiIcons.history),
        onPressed: () => pushPage(context, builder: (context) => SearchHistoryPage(
          onSongSelected: (Song song, int index, SongOpenType type){
            onSongSelected?.call(song, index, type);
            Navigator.pop(context);
            Navigator.pop(context);
          },
        )),
      ),

      IconButton(
        icon: const Icon(MdiIcons.trendingUp),
        onPressed: () => pushPage(context, builder: (context) => SongContributorsPage(
          onSongTap: (song){
            Navigator.pop(context); // Close song contrib page
            Navigator.pop(context); // Close tab of content page
            if(!BaseAlbum.current.songs.contains(song)) {
              BaseAlbum.current = OmegaAlbum();
              showAppToast(context, text: 'Otwarto $album_ "Wszystkie"');
            }
            onSongSelected?.call(song, BaseAlbum.current.songs.indexOf(song), SongOpenType.search);
          },
        )),
      )

    ],

    floatingButton: Consumer<_NoSongsFoundProvider>(
        builder: (context, prov, child){

          if(!prov.songsFound)
            return Container();

          CommonColorData colors = CommonColorData.get(BaseAlbum.current.colorsKey);

          return ExtendedFloatingButton(
            MdiIcons.shuffle,
            'Losuj',
            textColor: colors.iconColor,
            background: colors.colorStart,
            backgroundEnd: colors.colorEnd,
            onTap: prov.songsFound?(){

              if(controller.currSongs.isEmpty){
                showAppToast(context, text: 'Brak piosenek do losowania.');
                return;
              }

              RandomButtonProvider.registerTap_(context);
              int index = Random().nextInt(controller.currSongs.length);
              Song randomSong = controller.currSongs[index];
              int indexInAlbum = BaseAlbum.current.songs.indexOf(randomSong);
              page.onSongSelected(randomSong, indexInAlbum, SongOpenType.random);
              Navigator.pop(context);
            }:null,
          );
        }
    ),

    itemTrailingBuilder: itemButtonsBuilder,
    onItemTap: (song, position) async {
      page.selectSong(song, SongOpenType.search);
      CatPageSongBookState.tabOfContOpenOnBack = true;
      Navigator.pop(context);
    },

    scrollController: scrollController,
    paddingBottom: paddingBottom,

    onChanged: (text){

      TabOfContPage.lastSearchPhrase = text;

      if(remPolChars(text) == SONG_CONFID_PASS_KEY){
        if(!ConfidAlbum.unlocked) {
          ConfidAlbum.unlocked = true;
          hideKeyboard(context);
          BaseAlbum.current = ConfidAlbum();
          controller.phrase = '';
          onConfAlbumEnabled?.call();
          Navigator.pop(context);
        }
      }else if(text == '2137' || text == '21:37'){
        Song? song = Song.allMap['o!_barka'];
        if(song == null) return;
        page.selectSong(song, SongOpenType.search);
        Navigator.pop(context);
      }

    },
    onSearchComplete: (songs, _){

      if(!mounted) return;
      _NoSongsFoundProvider prov = Provider.of<_NoSongsFoundProvider>(context, listen: false);

      prov.songsFound = songs.isNotEmpty;

      if(scrollController.hasClients) {
        _scrollOffset = 0;
        scrollController.jumpTo(_scrollOffset);
      }
    },
    onNewSongAdded: page.widget.onNewSongAdded,
  );

  Widget itemButtonsBuilder(Song song){

    GlobalKey globalKey = GlobalKey();
    return IconButton(
        key: globalKey,
        icon: RateIcon.build(context, song.rate),

        onPressed: () async {

          final RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);

          double statusBarHeight = App.statusBarHeight;

          double screenHeight = MediaQuery.of(context).size.height - statusBarHeight;

          double cardTop = position.dy - statusBarHeight + renderBox.size.height;
          double cardBottom = cardTop + RateCard.HEIGHT;

          double diff = cardBottom - screenHeight;

          double scrollVal = 0;
          if(diff > 0){
            scrollVal = diff;
            setState(() => paddingBottom = scrollVal);
            await scrollBy(scrollVal);
          }

          if(!mounted) return;
          await openDialog(
              context: context,
              builder: (context) => Stack(
                  children: <Widget>[

                    Positioned.fill(
                      top: cardTop - scrollVal,
                      child: RateCard(
                          song,
                          onTap: (int rate, bool selected) async {
                            song.setRate(selected?SongRate.RATE_NULL:rate);
                            setState((){});
                            Navigator.pop(context);
                          }
                      ),
                    ),

                  ],
                )
          );

          if(diff > 0)
            scrollBy(-scrollVal);
          setState(() => paddingBottom = 0);

          //await parentState.resetItemCreator(withProgressbar: false);
        }
    );

  }

  Future<void> scrollBy(double value) async => await scrollController.animateTo(
      scrollController.offset + value,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease
  );

}

class _NoSongsFoundProvider extends ChangeNotifier{

  bool _songsFound;

  _NoSongsFoundProvider(this._songsFound);

  bool get songsFound => _songsFound;
  set songsFound(bool value){
    if(_songsFound != value){
      _songsFound = value;
      notifyListeners();
    }
  }

}
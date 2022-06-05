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
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_search_history_page.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
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
import '../main_page_new.dart';
import 'song_management/song.dart';

class TabOfContPage extends StatefulWidget{

  static SongSearchOptions searchOptions = SongSearchOptions();

  final void Function(Song, int, SongOpenType) onSongSelected;
  final void Function() onConfAlbumEnabled;
  final String initPhrase;
  final void Function(Song song)? onNewSongAdded;
  final bool forgetScrollPosition;

  const TabOfContPage({
    required this.onSongSelected,
    required this.onConfAlbumEnabled,
    this.initPhrase = '',
    this.onNewSongAdded,
    this.forgetScrollPosition = false,
    super.key});

  @override
  State createState() => TabOfContPageState();

}

class TabOfContPageState extends State<TabOfContPage> with TickerProviderStateMixin{

  void Function(Song, int, SongOpenType) get onSongSelected => widget.onSongSelected;
  void Function() get onConfAlbumEnabled => widget.onConfAlbumEnabled;

  late TabController tabController;
  late TabOfContController controller;

  _NoSongsFoundProvider? noSongProv;

  @override
  void initState() {
    BackButtonInterceptor.add(onBackPressed);

    tabController = TabController(length: 2, vsync: this);
    controller = TabOfContController();
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
              prov.songsFound?
              const Positioned.fill(
                child: TabOfContBackgroundIcon(),
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
        const PatroniteSupportWidget(
          margin: EdgeInsets.only(left: Dimen.DEF_MARG, right: Dimen.DEF_MARG, bottom: Dimen.DEF_MARG),
          stateTag: PatroniteSupportWidget.tagTableOfCont,
          title: 'Skąd tu tyle piosenek?!',
          description: 'Jeśli również Twojemu sercu bliskie jest śpiewanie, możesz pomóc w utrzymaniu dalszego rozwoju śpiewnika! <b>c:</b>',
        ):
        null,
      )
  );

  void selectSong(Song song, SongOpenType songOpen){

    int indexInAlbum;
    if(Album.current.songs.contains(song))
      indexInAlbum = Album.current.songs.indexOf(song);
    else{
      showAppToast(context, text: 'Zmieniono $album_ na "${Album.omegaTitle}".');
      Album.current = Album.omega;
      indexInAlbum = Album.current.songs.indexOf(song);
    }
    onSongSelected(song, indexInAlbum, songOpen);

  }

  void notify() => setState((){});

}

class _AllSongsPart extends StatefulWidget{

  final TabOfContPageState page;
  final TabOfContController? controller;
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
  TabOfContController? get controller => widget.controller;
  void Function()? get onConfAlbumEnabled => widget.onConfAlbumEnabled;
  void Function(Song, int, SongOpenType)? get onSongSelected => widget.onSongSelected;

  SongSearchOptions get searchOptions => TabOfContPage.searchOptions;

  ScrollController? scrollController;
  double? paddingBottom;

  @override
  void initState() {

    if(widget.page.widget.forgetScrollPosition) _scrollOffset = 0;
    scrollController = ScrollController(initialScrollOffset: _scrollOffset);
    scrollController!.addListener(() => _scrollOffset = scrollController!.offset);

    if (!Album.current.isOmega)
      post(() => showAppToast(context, text: '$Album_: <b>${Album.current.title}</b>'));

    super.initState();
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TabOfCont(
    Album.current.songs,
    background: Colors.transparent,
    controller: controller,
    initPhrase: page.widget.initPhrase,
    searchOptions: searchOptions,

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
        onPressed: () => pushPage(context, builder: (context) => const SongContributorsPage()),
      )

    ],

    floatingButton: Consumer<_NoSongsFoundProvider>(
        builder: (context, prov, child){

          if(!prov.songsFound)
            return Container();

          CommonColorData colors = CommonColorData.ALL[Album.current.colorsKey]!;

          return ExtendedFloatingButton(
            MdiIcons.shuffle,
            'Losuj',
            textColor: colors.iconColor,
            background: colors.colorStart,
            backgroundEnd: colors.colorEnd,
            onTap: prov.songsFound?(){

              if(Album.current.songs.isEmpty){
                showAppToast(context, text: 'Brak piosenek do losowania.');
                return;
              }

              int index = Random().nextInt(controller!.currSongs!.length);
              Song randomSong = controller!.currSongs![index];
              int indexInAlbum = Album.current.songs.indexOf(randomSong);
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

      if(remPolChars(text) == SONG_CONFID_PASS_KEY){
        if(!Album.isConfidUnlocked) {
          Album.isConfidUnlocked = true;
          hideKeyboard(context);
          Album.current = Album.confid;
          controller!.phrase = '';
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
    onSearchComplete: (songs, __, ___){

      if(!mounted) return;
      _NoSongsFoundProvider prov = Provider.of(context, listen: false);

      prov.songsFound = songs.isNotEmpty;

      if(scrollController!.hasClients) {
        _scrollOffset = 0;
        scrollController!.jumpTo(_scrollOffset);
      }
    },
    onNewSongAdded: page.widget.onNewSongAdded,
  );

  Widget itemButtonsBuilder(Song song, GlobalKey globalKey){

    return IconButton(
        icon: RateIcon.build(context, song.rate),

        onPressed: () async {

          final RenderBox renderBox = globalKey.currentContext!.findRenderObject() as RenderBox;
          final position = renderBox.localToGlobal(Offset.zero);

          double statusBarHeight = Provider.of<MainProvider>(context, listen: false).statusBarHeight;

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

          await openDialog(
              context: context,
              builder: (context){

                return Stack(
                  children: <Widget>[

                    Positioned(
                      top: cardTop - scrollVal,
                      bottom: 0,
                      left: 0,
                      right: 0,
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
                );
              }
          );

          if(diff > 0)
            scrollBy(-scrollVal);
          setState(() => paddingBottom = 0);

          //await parentState.resetItemCreator(withProgressbar: false);
        }
    );

  }

  Future<void> scrollBy(double value) async => await scrollController!.animateTo(
      scrollController!.offset + value,
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
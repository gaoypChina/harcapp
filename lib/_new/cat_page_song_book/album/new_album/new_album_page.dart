
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_app_common/color_selector_widget.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/cat_page_song_book/album/new_album/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'album_song_selector.dart';

class NewAlbumPage extends StatefulWidget{

  final Album? initAlbum;
  final Function(Album)? onSaved;

  const NewAlbumPage({this.initAlbum, this.onSaved, super.key});

  @override
  State createState() => NewAlbumPageState();

}

class NewAlbumPageState extends State<NewAlbumPage> with TickerProviderStateMixin{

  Album? get initAlbum => widget.initAlbum;

  Function(bool)? onChanged;

  late TextEditingController textEditingController;
  late TabController tabController;
  late FocusNode focusNode;

  late String iconKey;

  late List<OffSong> offSongs;
  late List<OwnSong> ownSongs;

  late _AppBarProvider appBarProv;

  List<Song> get songs{
    List<Song> songs = [];
    songs.addAll(offSongs);
    songs.addAll(ownSongs);
    return songs;
  }

  void onTabBarSwipe() => appBarProv.elevation = tabController.animation!.value<.9?0:Dimen.APPBAR_ELEVATION*tabController.animation!.value;

  @override
  void initState() {

    tabController = TabController(length: 2, vsync: this);
    tabController.animation!.addListener(onTabBarSwipe);

    if(initAlbum==null) {
      textEditingController = TextEditingController();
      offSongs = [];
      ownSongs = [];
    }else {
      textEditingController = TextEditingController(text: initAlbum!.title);
      offSongs = List.of(initAlbum!.offSongs);
      ownSongs = List.of(initAlbum!.ownSongs);
    }

    iconKey = initAlbum?.iconKey??
    CommonIconData.ALL.keys.toList()[Random().nextInt(CommonIconData.ALL.length)];

    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    tabController.dispose();
    //appBarProv.dispose(); THIS IS DISPOSED WHEN WIDGET IS AUTOMATICALLY DISPOSED
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccentColorProvider(
            initAlbum?.colorsKey??
                CommonColorData.ALL.keys.toList()[Random().nextInt(CommonColorData.ALL.length)]
        )),
        ChangeNotifierProvider(create: (context) => IconProvider(
            initAlbum?.iconKey??
                CommonIconData.ALL.keys.toList()[Random().nextInt(CommonIconData.ALL.length)]
        )),
        ChangeNotifierProvider(create: (context){
          appBarProv = _AppBarProvider();
          return appBarProv;
        }),
      ],
      builder: (context, child) => BottomNavScaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            double.infinity,
            AppBar().preferredSize.height + const TabBar(tabs: []).preferredSize.height
          ),
          child: Consumer<_AppBarProvider>(
            builder: (context, prov, child) => AppBar(
              backgroundColor: background_(context),
              elevation: prov.elevation,
              //floating: true,
              //pinned: true,
              title: TextField(
                decoration: InputDecoration(
                    hintText: 'Nazwa $albumu_...',
                    hintStyle: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_APPBAR),
                    border: InputBorder.none,
                ),
                focusNode: focusNode,
                controller: textEditingController,
                textCapitalization: TextCapitalization.sentences,
                style: AppTextStyle(color: textEnab_(context), fontSize: Dimen.TEXT_SIZE_APPBAR),
                inputFormatters:[
                  LengthLimitingTextInputFormatter(Album.maxLenTitle),
                ],
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(MdiIcons.check),
                  onPressed: (){
                    if(textEditingController.text.isEmpty){
                      showAppToast(context, text: 'Podaj nazwę $albumu_');
                      focusNode.requestFocus();
                      return;
                    }

                    if(initAlbum == null) {
                      Album album = Album.create(
                        textEditingController.text,
                        offSongs,
                        ownSongs,
                        Provider.of<AccentColorProvider>(context, listen: false).colorsKey,
                        iconKey,
                      );
                      Album.addToAll(album);
                      widget.onSaved?.call(album);
                    }else{
                      initAlbum!.update(
                          title: textEditingController.text,
                          offSongs: offSongs,
                          ownSongs: ownSongs,
                          colorsKey: Provider.of<AccentColorProvider>(context, listen: false).colorsKey,
                          iconKey: iconKey
                      );
                      widget.onSaved?.call(initAlbum!);
                    }

                    Navigator.pop(context);
                  },
                ),
              ],
              bottom: PreferredSize(
                  preferredSize: const TabBar(tabs: []).preferredSize,
                  child: Consumer<AccentColorProvider>(
                    builder: (context, prov, child) => TabBar(
                      controller: tabController,
                      indicatorColor: prov.avgColor,
                      physics: const BouncingScrollPhysics(),
                      tabs: const [
                        Tab(icon: Icon(MdiIcons.musicBoxMultipleOutline)),
                        Tab(icon: Icon(MdiIcons.paletteOutline)),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: const BouncingScrollPhysics(),
          children: [

            AlbumSongSelector(
              initAlbum?.songs??[],
              onChanged: (List<Song> checkedSongs){
                offSongs.clear();
                ownSongs.clear();
                for (Song song in checkedSongs)
                  if (song is OffSong)
                    offSongs.add(song);
                  else if (song is OwnSong)
                    ownSongs.add(song);
              },
            ),

            _TabPageColorPicker(initAlbum)
          ],
        ),
      ),
    );

  }

}


class _TabPageColorPicker extends StatefulWidget{

  final Album? initAlbum;

  const _TabPageColorPicker(this.initAlbum);

  @override
  State<StatefulWidget> createState() => _TabPageColorPickerState();

}
class _TabPageColorPickerState extends State<_TabPageColorPicker> with AutomaticKeepAliveClientMixin{

  Album? get initAlbum => widget.initAlbum;

  @override
  Widget build(BuildContext context){
    super.build(context);

    return ListView(
        physics: const BouncingScrollPhysics(),
        children: [

          const TitleShortcutRowWidget(title: 'Kolor', textAlign: TextAlign.start),

          ColorSelectorWidget(
            initColorKey: initAlbum?.colorsKey??Provider.of<AccentColorProvider>(context, listen: false).colorsKey,
            onSelected: (colorsKey) => Provider.of<AccentColorProvider>(context, listen: false).colorsKey = colorsKey,
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          const TitleShortcutRowWidget(title: 'Ikona', textAlign: TextAlign.start),

          IconSelectorWidget(
            initIconKey: initAlbum?.iconKey??CommonIconData.randomKey,
            onSelected: (iconKey) => Provider.of<IconProvider>(context, listen: false).iconKey = iconKey,
          )
        ]
    );

  }

  @override
  bool get wantKeepAlive => true;

}

class _AppBarProvider extends ChangeNotifier{

  double? _elevation;

  double? get elevation => _elevation;
  set elevation(double? value){
    _elevation = value;
    notifyListeners();
  }

  _AppBarProvider(){
    _elevation = 0;
  }

  void notify() => notifyListeners();

}
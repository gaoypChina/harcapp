import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_song_book/own_song_page/save_song_button.dart';
import 'package:harcapp/_new/cat_page_song_book/own_song_page/song_part_editor.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_own_song/page_widgets/add_buttons_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/refren_template.dart';
import 'package:harcapp_core_own_song/page_widgets/song_parts_list_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/top_cards.dart';
import 'package:harcapp_core_own_song/page_widgets/add_pers_list_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/tags_widget.dart';
import 'package:harcapp_core_own_song/providers.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
import 'package:harcapp_core_song_widget/song_widget_template.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../song_widget.dart';
import 'album_picker.dart';

enum EditType{
  newOwn,
  editOwn,
  editOfficial,
}

class OwnSongPage extends StatefulWidget {

  final SongRaw? initSong;
  final EditType editType;
  final Function(Song song, EditType editType)? onSaved;

  const OwnSongPage(this.initSong, this.editType, this.onSaved, {super.key});

  static from({SongRaw? song, Function(Song song, EditType editType)? onSaved}){

    EditType editType;

    if(song == null)
      editType = EditType.newOwn;
    else if(song.isOwn)
      editType = EditType.editOwn;
    else
      editType = EditType.editOfficial;

    return OwnSongPage(
        song,
        editType,
        onSaved
    );
  }

  @override
  State createState() => OwnSongPageState();

}

class OwnSongPageState extends State<OwnSongPage> {

  static const double sep = 10.0;

  void notify() => setState((){});

  SongRaw? get song => widget.initSong;
  EditType get editType => widget.editType;

  ScrollController? scrollController;

  List<OwnAlbum>? albums;

  late CurrentItemProvider currItemProv;

  GlobalKey? addButtonsKey;

  @override
  void initState() {

    scrollController = ScrollController();

    albums = [];

    if(song != null)
      for(OwnAlbum album in OwnAlbum.all) {
        if (album is! OmegaAlbum &&
            album.songs.map((song) => song.lclId).contains(song!.lclId))
          albums!.add(album);
      }

    addButtonsKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Theme(
      data: Theme.of(context).copyWith(
        // This is the accent color
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: BaseAlbum.current.avgColor),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: BaseAlbum.current.avgColor,
          selectionHandleColor: BaseAlbum.current.avgColor,
        ),
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context){

            if(editType == EditType.editOwn)
              currItemProv = CurrentItemProvider(song: song!);

            if(editType == EditType.newOwn) {

              String? initAddPersName;
              String? initAddPersEmail;
              String? initAddPersUserKey;
              if(AccountData.loggedIn) {
                initAddPersEmail = AccountData.email;
                initAddPersUserKey = AccountData.key;
              }
              currItemProv = CurrentItemProvider(
                song: SongRaw.empty(),
                initAddPersName: initAddPersName,
                initAddPersEmail: initAddPersEmail,
                initAddPersUserKey: initAddPersUserKey,
              );
            }
            else if(editType == EditType.editOfficial)
              currItemProv = CurrentItemProvider(song: song!.copy());

            return currItemProv;

          }),
          ChangeNotifierProvider(create: (context) => RefrenEnabProvider(song==null?true:song!.hasRefren)),
          ChangeNotifierProvider(create: (context) => RefrenPartProvider()),
          ChangeNotifierProvider(create: (context) => TagsProvider(Tag.ALL_TAG_NAMES, song==null?[]:song!.tags)),
        ],

        builder: (context, child) => BottomNavScaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            slivers: [

              appBar(),

              SliverList(delegate: SliverChildListDelegate([
                SongPartsListWidget(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  onPartTap: (index) => openDialog(context: context, builder: (_) => SongPartEditor(
                    initText: currItemProv.song.songParts[index].getText(),
                    initChords: currItemProv.song.songParts[index].chords,
                    initShifted: currItemProv.song.songParts[index].shift,
                    isRefren: currItemProv.song.songParts[index].isRefren(context),
                    onTextChanged: (text, errCount){
                      currItemProv.song.songParts[index].setText(text);
                      currItemProv.song.songParts[index].isError = errCount != 0;
                      currItemProv.notify();
                    },
                    onChordsChanged: (text, errCount){
                      currItemProv.song.songParts[index].chords = text;
                      currItemProv.song.songParts[index].isError = errCount != 0;
                      currItemProv.notify();
                    },
                    onShiftedChanged: (shifted){
                      currItemProv.song.songParts[index].shift = shifted;
                      currItemProv.notify();
                    },
                  )),
                  header: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      const SongWebEditorInfo(),

                      const Padding(
                        padding: EdgeInsets.only(left: Dimen.ICON_MARG),
                        child: TitleShortcutRowWidget(title: 'Informacje ogólne', /*icon: MdiIcons.textBoxOutline*/ textAlign: TextAlign.start),
                      ),
                      TopCards(
                        accentColor: BaseAlbum.current.avgColorDarkSensitive(context),
                        onChangedTitle: (text) => currItemProv.setTitle(text, notify: false),
                        onChangedHiddenTitles: (texts) => currItemProv.setHidTitles(texts, notify: false),
                        onChangedAuthor: (texts) => currItemProv.setAuthors(texts, notify: false),
                        onChangedPerformer: (texts) => currItemProv.setPerformers(texts, notify: false),
                        onChangedComposer: (texts) => currItemProv.setComposers(texts, notify: false),
                        onChangedYT: (text) => currItemProv.setYoutubeLink(text, notify: false),
                      ),

                      const SizedBox(height: sep),

                      const AddPersListWidget(),

                      const SizedBox(height: sep),

                      TagsWidget(
                        onChanged: (List<String> tags) => currItemProv.setTags(tags, notify: false),
                      ),

                      const SizedBox(height: sep),

                      if(OwnAlbum.all.isNotEmpty)
                        AlbumPart(this),

                      if(OwnAlbum.all.isNotEmpty)
                        const SizedBox(height: sep),

                      RefrenTemplate(
                          accentColor: BaseAlbum.current.avgColorDarkSensitive(context),
                          onPartTap: () => openDialog(context: context, builder: (_) =>
                              SongPartEditor(
                                initText: currItemProv.song.refrenPart.getText(),
                                initChords: currItemProv.song.refrenPart.chords,
                                initShifted: currItemProv.song.refrenPart.shift,
                                isRefren: currItemProv.song.refrenPart.isRefren(context),
                                onTextChanged: (text, errCount){
                                  currItemProv.song.refrenPart.setText(text);
                                  currItemProv.song.refrenPart.isError = errCount != 0;
                                  currItemProv.notify();
                                  Provider.of<RefrenPartProvider>(context, listen: false).notify();
                                },
                                onChordsChanged: (text, errCount){
                                  currItemProv.song.refrenPart.chords = text;
                                  currItemProv.song.refrenPart.isError = errCount != 0;
                                  currItemProv.notify();
                                  Provider.of<RefrenPartProvider>(context, listen: false).notify();
                                },
                                onShiftedChanged: (shifted){
                                  currItemProv.song.refrenPart.shift = shifted;
                                  currItemProv.notify();
                                  Provider.of<RefrenPartProvider>(context, listen: false).notify();
                                },
                              ),
                          )
                      ),

                      const SizedBox(height: sep),

                      const Padding(
                        padding: EdgeInsets.only(left: Dimen.ICON_MARG),
                        child: TitleShortcutRowWidget(title: 'Struktura piosenki', /*icon: MdiIcons.playlistMusic*/ textAlign: TextAlign.start),
                      ),

                    ],
                  ),
                  footer: AddButtonsWidget(
                      key: addButtonsKey,
                      accentColor: BaseAlbum.current.avgColorDarkSensitive(context),
                      onPressed: ()async{
                        await Future.delayed(const Duration(milliseconds: 240));
                        Scrollable.ensureVisible(
                            addButtonsKey!.currentContext!,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutQuad
                        );
                      }// => scrollToBottom(scrollController),
                  ),
                )
              ]))

            ],
          ),

        ),
      )
  );

  SliverAppBar appBar() => SliverAppBar(
    backgroundColor: background_(context),
    centerTitle: true,
    floating: true,
    title: Text(widget.initSong==null?'Nowa piosenka':'Edytuj piosenkę'),
    actions: <Widget>[

      IconButton(
          icon: Icon(MdiIcons.eyeOutline),
          onPressed: () async {

            SongRaw songRaw = currItemProv.song;
            Song song = await OffSong.fromRespMap('', jsonDecode(songRaw.toCode(withLclId: false)));

            if(!mounted) return;
            await pushPage(context, builder: (context) => AppScaffold(
                body: NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverAppBar(
                      title: const Text('Podgląd piosenki'),
                      centerTitle: true,
                      floating: true,
                      forceElevated: innerBoxIsScrolled,
                    )
                  ],
                  body: SongWidget(
                    null,
                    SongController(),
                    song,
                    0,
                    scrollController: ScrollController(),
                  ),
                ),
              )
            );

          }
      ),

      SaveSongButton(
          editType,
          albums: albums,
          onSaved: widget.onSaved
      )
    ],
  );

}

class SongWebEditorInfo extends StatelessWidget{

  const SongWebEditorInfo({super.key});

  @override
  Widget build(BuildContext context) => AppCard(
      elevation: AppCard.bigElevation,
      margin: const EdgeInsets.all(Dimen.SIDE_MARG),
      padding: EdgeInsets.zero,
      radius: AppCard.bigRadius,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Chcesz skorzystać z edytora piosenek\nw przeglądarce na komputerze?',
                  style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: Dimen.ICON_MARG),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text(
                        'Wejdź na: ',
                        style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),
                        textAlign: TextAlign.center,
                      ),

                      Text(
                        'harcapp.web.app',
                        style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG),
                        textAlign: TextAlign.center,
                      )
                    ]
                ),

              ],
            ),
          ),

          Positioned(
              child: Row(
                children: [
                  const SizedBox(width: Dimen.ICON_MARG),
                  Icon(MdiIcons.music, size: 84.0, color: backgroundIcon_(context)),
                  Expanded(child: Container()),
                  Icon(MdiIcons.laptop, size: 84.0, color: backgroundIcon_(context)),
                  const SizedBox(width: Dimen.ICON_MARG),
                ],
              )
          ),

        ],
      )
  );

}
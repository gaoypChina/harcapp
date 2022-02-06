
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_song_book/own_song_page/save_song_button.dart';
import 'package:harcapp/_new/cat_page_song_book/own_song_page/song_part_editor.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_own_song/common.dart';
import 'package:harcapp_core_own_song/page_widgets/add_buttons_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/refren_template.dart';
import 'package:harcapp_core_own_song/page_widgets/scroll_to_bottom.dart';
import 'package:harcapp_core_own_song/page_widgets/song_parts_list_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/tags_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/top_cards.dart';
import 'package:harcapp_core_own_song/providers.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../song_widget.dart';
import 'album_picker.dart';
import 'song_part_editor.dart';

enum EditType{
  NEW,
  EDIT_OWN,
  EDIT_OFFICIAL,
}

class OwnSongPage extends StatefulWidget {

  final SongRaw song;
  final EditType editType;
  final Function(Song song, EditType editType) onSaved;

  const OwnSongPage(this.song, this.editType, this.onSaved);

  static from({SongRaw song, Function(Song song, EditType editType) onSaved}){

    EditType editType;

    if(song == null)
      editType = EditType.NEW;
    else if(song.isOwn)
      editType = EditType.EDIT_OWN;
    else
      editType = EditType.EDIT_OFFICIAL;

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

  static const double SEP = 10.0;

  void notify() => setState((){});

  SongRaw get song => widget.song;
  EditType get editType => widget.editType;

  ScrollController scrollController;

  List<Album> albums;

  CurrentItemProvider currItemProv;
  HidTitlesProvider hidTitleProv;

  @override
  void initState() {

    scrollController = ScrollController();

    albums = [];

    if(song != null)
      for(Album album in Album.allOwn) {
        if (album != Album.omega &&
            album.songs.map((song) => song.fileName).contains(song.fileName))
          albums.add(album);
      }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
        data: Theme.of(context).copyWith(
          accentColor: Album.current.avgColor,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Album.current.avgColor,
            selectionHandleColor: Album.current.avgColor,
          ),
        ),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context){

              if(editType == EditType.EDIT_OWN)
                currItemProv = CurrentItemProvider(song: song);

              if(editType == EditType.NEW) {
                currItemProv = CurrentItemProvider(song: SongRaw.empty(fileName: '${OwnSong.lastFileName + 1}'));
                currItemProv.addPersController.texts = shaPref.getStringList(ShaPref.SHA_PREF_SPIEWNIK_OWN_SONG_ADD_PERS, <String>[]);
              }
              else if(editType == EditType.EDIT_OFFICIAL)
                currItemProv = CurrentItemProvider(song: song.copyWith(fileName: '${OwnSong.lastFileName + 1}'));

              return currItemProv;

            }),
            ChangeNotifierProvider(create: (context) {
              hidTitleProv = HidTitlesProvider(hidTitles: song==null?[]:song.hidTitles);
              return hidTitleProv;
            }),
            ChangeNotifierProvider(create: (context) => RefrenEnabProvider(song==null?true:song.hasRefren)),
            ChangeNotifierProvider(create: (context) => RefrenPartProvider()),
            ChangeNotifierProvider(create: (context) => TagsProvider(Tag.ALL_TAG_NAMES, song==null?[]:song.tags)),

            ChangeNotifierProvider(create: (context) => TitleCtrlProvider(text: song==null?'':song.title)),
            //ChangeNotifierProvider(create: (context) => AuthorCtrlProvider(text: song==null?'':song.authors)),
            //ChangeNotifierProvider(create: (context) => ComposerCtrlProvider(text: song==null?'':song.composers)),
            //ChangeNotifierProvider(create: (context) => PerformerCtrlProvider(text: song==null?'':song.performers)),
            //ChangeNotifierProvider(create: (context) => YTCtrlProvider(text: song==null?'':song.youtubeLink)),
            /*
            ChangeNotifierProvider(create: (context){
              AddPersCtrlProvider prov = AddPersCtrlProvider(texts: song==null?shaPref.getStringList(ShaPref.SHA_PREF_SPIEWNIK_OWN_SONG_ADD_PERS, <String>[]):song.addPers);
              if(song==null)
                prov.controller.addListener(() => shaPref.setString(ShaPref.SHA_PREF_SPIEWNIK_OWN_SONG_ADD_PERS, prov.controller.text));
              return prov;
            }),
             */
          ],

          builder: (context, child) => BottomNavScaffold(
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              slivers: [

                appBar(),

                SliverList(delegate: SliverChildListDelegate([
                  SongPartsListWidget(
                    physics: NeverScrollableScrollPhysics(),
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

                        SongWebEditorInfo(),

                        Padding(
                          padding: EdgeInsets.only(left: Dimen.ICON_MARG),
                          child: TitleShortcutRowWidget(title: 'Informacje ogólne', /*icon: MdiIcons.textBoxOutline*/ textAlign: TextAlign.start),
                        ),
                        TopCards(
                          accentColor: Album.current.avgColorDarkSensitive(context),
                          onChangedTitle: (text) => currItemProv.title = text,
                          onChangedAuthor: (texts) => currItemProv.authors = texts,
                          onChangedPerformer: (texts) => currItemProv.performers = texts,
                          onChangedComposer: (texts) => currItemProv.composers = texts,
                          onChangedYT: (text) => currItemProv.youtubeLink = text,
                          onChangedAddPers: (texts) => currItemProv.addPers = texts,
                        ),

                        SizedBox(height: SEP),

                        TagsWidget(
                          onChanged: (List<String> tags) => currItemProv.tags = tags,
                        ),

                        SizedBox(height: SEP),

                        if(Album.allOwn.isNotEmpty)
                          AlbumPart(this),

                        if(Album.allOwn.isNotEmpty)
                          SizedBox(height: SEP),

                        RefrenTemplate(
                            accentColor: Album.current.avgColorDarkSensitive(context),
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

                        SizedBox(height: SEP),

                        Padding(
                          padding: EdgeInsets.only(left: Dimen.ICON_MARG),
                          child: TitleShortcutRowWidget(title: 'Struktura piosenki', /*icon: MdiIcons.playlistMusic*/ textAlign: TextAlign.start),
                        ),

                      ],
                    ),
                    footer: buildAddButtonsWidget(context),
                  )
                ]))

              ],
            ),

          ),
        )
    );
  }

  AddButtonsWidget buildAddButtonsWidget(BuildContext context) {
    return AddButtonsWidget(
                      accentColor: Album.current.avgColorDarkSensitive(context),
                      onPressed: () => scrollToBottom(scrollController),
                  );
  }

  SliverAppBar appBar() => SliverAppBar(
    backgroundColor: background_(context),
    centerTitle: true,
    floating: true,
    title: Text(widget.song==null?'Nowa piosenka':'Edytuj piosenkę'),
    actions: <Widget>[

      IconButton(
          icon: Icon(MdiIcons.eyeOutline),
          onPressed: () async {

            SongRaw songRaw = currItemProv.song;
            Song song = OffSong.fromMap('', jsonDecode(songRaw.toCode(withFileName: false)));

            await Navigator.push(context, MaterialPageRoute(
              builder: (context) => AppScaffold(
                body: NestedScrollView(
                  physics: BouncingScrollPhysics(),
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    SliverAppBar(
                      title: Text('Podgląd piosenki'),
                      centerTitle: true,
                      floating: true,
                    )
                  ],
                  body: SongWidget(
                    null,
                    song,
                    0,
                  ),
                ),
              )
            ));

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

  @override
  Widget build(BuildContext context) {
    return AppCard(
        elevation: AppCard.bigElevation,
        margin: EdgeInsets.all(Dimen.SIDE_MARG),
        padding: EdgeInsets.zero,
        radius: AppCard.BIG_RADIUS,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(Dimen.SIDE_MARG),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Chcesz skorzystać z edytora piosenek\nw przeglądarce na komputerze?',
                    style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: Dimen.ICON_MARG),

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
                    SizedBox(width: Dimen.ICON_MARG),
                    Icon(MdiIcons.music, size: 84.0, color: backgroundIcon_(context)),
                    Expanded(child: Container()),
                    Icon(MdiIcons.laptop, size: 84.0, color: backgroundIcon_(context)),
                    SizedBox(width: Dimen.ICON_MARG),
                  ],
                )
            ),

          ],
        )
    );
  }

}
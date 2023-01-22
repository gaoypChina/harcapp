
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
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
import 'package:harcapp_core_own_song/page_widgets/add_buttons_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/refren_template.dart';
import 'package:harcapp_core_own_song/page_widgets/song_parts_list_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/top_cards.dart';
import 'package:harcapp_core_own_song/page_widgets/add_pers_list_widget.dart';
import 'package:harcapp_core_own_song/page_widgets/tags_widget.dart';
import 'package:harcapp_core_own_song/providers.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
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

  final SongRaw? song;
  final EditType editType;
  final Function(Song song, EditType editType)? onSaved;

  const OwnSongPage(this.song, this.editType, this.onSaved, {super.key});

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

  SongRaw? get song => widget.song;
  EditType get editType => widget.editType;

  ScrollController? scrollController;

  List<Album>? albums;

  CurrentItemProvider? currItemProv;
  HidTitlesProvider? hidTitleProv;

  GlobalKey? addButtonsKey;

  @override
  void initState() {

    scrollController = ScrollController();

    albums = [];

    if(song != null)
      for(Album album in Album.allOwn) {
        if (album != Album.omega &&
            album.songs.map((song) => song.fileName).contains(song!.fileName))
          albums!.add(album);
      }

    addButtonsKey = GlobalKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
        data: Theme.of(context).copyWith(
          // This is the accent color
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Album.current.avgColor),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: Album.current.avgColor,
            selectionHandleColor: Album.current.avgColor,
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
                    song: SongRaw.empty(fileName: '${OwnSong.lastFileName + 1}'),
                    initAddPersName: initAddPersName,
                    initAddPersEmail: initAddPersEmail,
                    initAddPersUserKey: initAddPersUserKey,
                );
              }
              else if(editType == EditType.editOfficial)
                currItemProv = CurrentItemProvider(song: song!.copyWith(fileName: '${OwnSong.lastFileName + 1}'));

              return currItemProv;

            }),
            ChangeNotifierProvider(create: (context) {
              hidTitleProv = HidTitlesProvider(hidTitles: song==null?[]:song!.hidTitles);
              return hidTitleProv;
            }),
            ChangeNotifierProvider(create: (context) => RefrenEnabProvider(song==null?true:song!.hasRefren)),
            ChangeNotifierProvider(create: (context) => RefrenPartProvider()),
            ChangeNotifierProvider(create: (context) => TagsProvider(Tag.ALL_TAG_NAMES, song==null?[]:song!.tags)),

            ChangeNotifierProvider(create: (context) => TitleCtrlProvider(text: song==null?'':song!.title)),
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
                      initText: currItemProv!.song.songParts[index].getText(),
                      initChords: currItemProv!.song.songParts[index].chords,
                      initShifted: currItemProv!.song.songParts[index].shift,
                      isRefren: currItemProv!.song.songParts[index].isRefren(context),
                      onTextChanged: (text, errCount){
                        currItemProv!.song.songParts[index].setText(text);
                        currItemProv!.song.songParts[index].isError = errCount != 0;
                        currItemProv!.notify();
                      },
                      onChordsChanged: (text, errCount){
                        currItemProv!.song.songParts[index].chords = text;
                        currItemProv!.song.songParts[index].isError = errCount != 0;
                        currItemProv!.notify();
                      },
                      onShiftedChanged: (shifted){
                        currItemProv!.song.songParts[index].shift = shifted;
                        currItemProv!.notify();
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
                          accentColor: Album.current.avgColorDarkSensitive(context),
                          onChangedTitle: (text) => currItemProv!.title = text,
                          onChangedAuthor: (texts) => currItemProv!.authors = texts,
                          onChangedPerformer: (texts) => currItemProv!.performers = texts,
                          onChangedComposer: (texts) => currItemProv!.composers = texts,
                          onChangedYT: (text) => currItemProv!.youtubeLink = text,
                        ),

                        const SizedBox(height: sep),

                        const AddPersListWidget(),

                        const SizedBox(height: sep),

                        TagsWidget(
                          onChanged: (List<String>? tags) => currItemProv!.tags = tags!,
                        ),

                        const SizedBox(height: sep),

                        if(Album.allOwn.isNotEmpty)
                          AlbumPart(this),

                        if(Album.allOwn.isNotEmpty)
                          const SizedBox(height: sep),

                        RefrenTemplate(
                            accentColor: Album.current.avgColorDarkSensitive(context),
                            onPartTap: () => openDialog(context: context, builder: (_) =>
                                SongPartEditor(
                                  initText: currItemProv!.song.refrenPart.getText(),
                                  initChords: currItemProv!.song.refrenPart.chords,
                                  initShifted: currItemProv!.song.refrenPart.shift,
                                  isRefren: currItemProv!.song.refrenPart.isRefren(context),
                                  onTextChanged: (text, errCount){
                                    currItemProv!.song.refrenPart.setText(text);
                                    currItemProv!.song.refrenPart.isError = errCount != 0;
                                    currItemProv!.notify();
                                    Provider.of<RefrenPartProvider>(context, listen: false).notify();
                                  },
                                  onChordsChanged: (text, errCount){
                                    currItemProv!.song.refrenPart.chords = text;
                                    currItemProv!.song.refrenPart.isError = errCount != 0;
                                    currItemProv!.notify();
                                    Provider.of<RefrenPartProvider>(context, listen: false).notify();
                                  },
                                  onShiftedChanged: (shifted){
                                    currItemProv!.song.refrenPart.shift = shifted;
                                    currItemProv!.notify();
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
                      accentColor: Album.current.avgColorDarkSensitive(context),
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
  }

  SliverAppBar appBar() => SliverAppBar(
    backgroundColor: background_(context),
    centerTitle: true,
    floating: true,
    title: Text(widget.song==null?'Nowa piosenka':'Edytuj piosenkę'),
    actions: <Widget>[

      IconButton(
          icon: const Icon(MdiIcons.eyeOutline),
          onPressed: () async {

            SongRaw songRaw = currItemProv!.song;
            Song song = await OffSong.fromRespMap('', jsonDecode(songRaw.toCode(withFileName: false)));

            await Navigator.push(context, MaterialPageRoute(
              builder: (context) => AppScaffold(
                body: NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                    const SliverAppBar(
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

  const SongWebEditorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
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

}
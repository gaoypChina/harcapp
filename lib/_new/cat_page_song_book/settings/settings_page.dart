import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core_song_widget/providers.dart';
import 'package:provider/provider.dart';

import '../album/album_name.dart';


class SettingsPage extends StatefulWidget {

  final void Function(bool)? onScreenAlwaysOnChanged;

  const SettingsPage({this.onScreenAlwaysOnChanged, super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();

}

class SettingsPageState extends State<SettingsPage> {

  AppTextStyle get hintStyle => settingsHintStyle(context);
  AppTextStyle get textStyle => settingsTextStyle(context);

  @override
  Widget build(BuildContext context) {

    Widget alwaysOnScreen = SwitchListTile(
      value: SongBookSettings.alwaysOnScreen,
      title: Text('Nie wygaszaj ekranu', style: textStyle),
      subtitle: Text('W śpiewniku ekran zawsze będzie włączony.', style: hintStyle),
      onChanged: (bool value){
        setState(() => SongBookSettings.alwaysOnScreen = value);
        if(widget.onScreenAlwaysOnChanged!=null) widget.onScreenAlwaysOnChanged!(value);
      },
      activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
    );

    Widget textScroll = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        SwitchListTile(
          value: SongBookSettings.scrollText,
          title: Text('Przewiń tekst klikając', style: textStyle),
          subtitle: Text('Naciśnij tekst piosenki, by przewinąć ją w dół o dwie trzecie ekranu.', style: hintStyle),
          onChanged: (bool value){
            setState(() => SongBookSettings.scrollText = value);
          },
          activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
        ),

      ],);

    Widget chords = Column(
        children: <Widget>[

          Consumer<ShowChordsProvider>(
            builder: (context, prov, child) => SwitchListTile(
              value: prov.showChords,
              title: Text('Pokaż chwyty', style: textStyle),
              onChanged: (bool value) => prov.showChords = value,
              activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
            ),
          ),

          Consumer<ChordsTrailingProvider>(
            builder: (context, prov, child) => SwitchListTile(
              value: prov.chordsTrailing,
              title: Text('Chwyty po prawej', style: textStyle),
              onChanged: (bool value) => prov.chordsTrailing = value,
              activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
            ),
          ),

          Consumer<ChordsDrawShowProvider>(
            builder: (context, prov, child) => SwitchListTile(
              value: prov.chordsDrawShow,
              title: Text('Pokaż obrazki do chwytów', style: textStyle),
              onChanged: (bool value){
                prov.chordsDrawShow = value;
                Provider.of<TextSizeProvider>(context, listen: false).reinit(
                    BaseAlbum.current.lastOpenSong,
                    chordsVisible: ShowChordsProvider.of(context).showChords
                );
              },
              activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
            ),
          ),

        ]);

    Widget albumColor = SwitchListTile(
      value: SongBookSettings.showAlbumIcon,
      title: Text('Pokaż ikonę $albumu_', style: textStyle),
      subtitle: Text('Pokaż ikonę $albumu_ podczas przewijania piosenek.', style: hintStyle),
      onChanged: (bool value){
        setState(() => SongBookSettings.showAlbumIcon = value);
        //!!!!!!!!!!!!!!!!!!!!!!1
        //widget.parent.setSettings();
        //widget.parent.notify(false);
      },
      activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
    );

    Widget tabOfContOnStart = SwitchListTile(
      value: SongBookSettings.showTabOfContOnStart,
      title: Text('Otwórz spis treści przy otwarciu śpiewnika', style: textStyle),
      onChanged: (bool value){
        setState(() => SongBookSettings.showTabOfContOnStart = value);
        //widget.parent.notify(false);
      },
      activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
    );

    Widget albumNameCard = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        ListTile(
          title: Text(
              'Nazwa własnych zbiorów piosenek:',
              style: AppTextStyle(
                  fontWeight: weight.halfBold,
                  color: textEnab_(context),
                  fontSize: Dimen.TEXT_SIZE_BIG
              )
          ),
        ),

        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.album),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.album,
          groupValue: albumName,
          onChanged: (AlbumName? value) => setState(() => albumName = AlbumName.album),
          activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.wolumin),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.wolumin,
          groupValue: albumName,
          onChanged: (AlbumName? value) => setState(() => albumName = AlbumName.wolumin),
          activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.grajdziupla),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.grajdziupla,
          groupValue: albumName,
          onChanged: (AlbumName? value) => setState(() => albumName = AlbumName.grajdziupla),
          activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.skladanka),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.skladanka,
          groupValue: albumName,
          onChanged: (AlbumName? value) => setState(() => albumName = AlbumName.skladanka),
          activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.didzejka),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.didzejka,
          groupValue: albumName,
          onChanged: (AlbumName? value) => setState(() => albumName = AlbumName.didzejka),
          activeColor: BaseAlbum.current.avgColorDarkSensitive(context),
        ),
      ],
    );

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            backgroundColor: background_(context),
            title: const Text('Ustawienia'),
            centerTitle: true,
            floating: true,
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              alwaysOnScreen,
              const SizedBox(height: Dimen.SETTINGS_MARG),
              textScroll,
              const SizedBox(height: Dimen.SETTINGS_MARG),
              chords,
              const SizedBox(height: Dimen.SETTINGS_MARG),
              albumColor,
              const SizedBox(height: Dimen.SETTINGS_MARG),
              tabOfContOnStart,
              const SizedBox(height: Dimen.SETTINGS_MARG),
              albumNameCard,
            ]),
          )
        ],
      ),
    );
  }
}

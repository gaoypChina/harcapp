import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core_song_widget/providers.dart';
import 'package:harcapp_core_song_widget/settings.dart';
import 'package:provider/provider.dart';


class SettingsPage extends StatefulWidget {

  final void Function(bool) onScreenAlwaysOnChanged;

  const SettingsPage({this.onScreenAlwaysOnChanged});

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
        if(widget.onScreenAlwaysOnChanged!=null) widget.onScreenAlwaysOnChanged(value);
      },
      activeColor: Album.current.avgColorDarkSensitive(context),
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
          activeColor: Album.current.avgColorDarkSensitive(context),
        ),

      ],);

    Widget chords = Column(
        children: <Widget>[

          Consumer<ShowChordsProvider>(
            builder: (context, prov, child) => SwitchListTile(
              value: prov.showChords,
              title: Text('Pokaż chwyty', style: textStyle),
              onChanged: (bool value) => prov.showChords = value,
              activeColor: Album.current.avgColorDarkSensitive(context),
            ),
          ),

          Consumer<ChordsDrawShowProvider>(
            builder: (context, prov, child) => SwitchListTile(
              value: prov.chordsDrawShow,
              title: Text('Pokaż obrazki do chwytów', style: textStyle),
              onChanged: (bool value) => prov.chordsDrawShow = value,
              activeColor: Album.current.avgColorDarkSensitive(context),
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
      activeColor: Album.current.avgColorDarkSensitive(context),
    );

    Widget tabOfContOnStart = SwitchListTile(
      value: SongBookSettings.showTabOfContOnStart,
      title: Text('Otwórz spis treści przy otwarciu śpiewnika', style: textStyle),
      onChanged: (bool value){
        setState(() => SongBookSettings.showTabOfContOnStart = value);
        //widget.parent.notify(false);
      },
      activeColor: Album.current.avgColorDarkSensitive(context),
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
          onChanged: (AlbumName value) => setState(() => setAlbumName(shaPref, AlbumName.album)),
          activeColor: Album.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.wolumin),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.wolumin,
          groupValue: albumName,
          onChanged: (AlbumName value) => setState(() => setAlbumName(shaPref, AlbumName.wolumin)),
          activeColor: Album.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.grajdziupla),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.grajdziupla,
          groupValue: albumName,
          onChanged: (AlbumName value) => setState(() => setAlbumName(shaPref, AlbumName.grajdziupla)),
          activeColor: Album.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.skladanka),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.skladanka,
          groupValue: albumName,
          onChanged: (AlbumName value) => setState(() => setAlbumName(shaPref, AlbumName.skladanka)),
          activeColor: Album.current.avgColorDarkSensitive(context),
        ),
        RadioListTile<AlbumName>(
          title: Text(
            albumNameToString(AlbumName.didzejka),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
          ),
          dense: true,
          value: AlbumName.didzejka,
          groupValue: albumName,
          onChanged: (AlbumName value) => setState(() => setAlbumName(shaPref, AlbumName.didzejka)),
          activeColor: Album.current.avgColorDarkSensitive(context),
        ),
      ],
    );

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            backgroundColor: background_(context),
            title: Text('Ustawienia'),
            centerTitle: true,
            floating: true,
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              alwaysOnScreen,
              SizedBox(height: Dimen.SETTINGS_MARG),
              textScroll,
              SizedBox(height: Dimen.SETTINGS_MARG),
              chords,
              SizedBox(height: Dimen.SETTINGS_MARG),
              albumColor,
              SizedBox(height: Dimen.SETTINGS_MARG),
              tabOfContOnStart,
              SizedBox(height: Dimen.SETTINGS_MARG),
              albumNameCard,
            ]),
          )
        ],
      ),
    );
  }
}

class SongBookBaseSetting extends SongBookSettTempl{

  @override
  bool get alwaysOnScreen => shaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_ALWAYS_ON_SCREEN, false);
  @override
  set alwaysOnScreen(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_ALWAYS_ON_SCREEN, value);

  @override
  bool get scrollText => shaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SCROLL_TEXT, true);
  @override
  set scrollText(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SCROLL_TEXT, value);

  @override
  double get autoscrollTextSpeed => shaPref.getDouble(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT_SPEED, 0.4);
  @override
  set autoscrollTextSpeed(double value) => shaPref.setDouble(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT_SPEED, value);

  @override
  bool get showChords => shaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_CHORDS, true);
  @override
  set showChords(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_CHORDS, value);

  @override
  bool get chordsDrawShow => shaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW, true);
  @override
  set chordsDrawShow(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW, value);

  @override
  InstrumentType get chordsDrawType => intToTstrumentType(shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW_TYPE, 0));
  @override
  set chordsDrawType(InstrumentType value) => shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW_TYPE, instrumentTypeToInt(value));

}

class SongBookSettings{

  static bool get alwaysOnScreen => SongBookBaseSetting().alwaysOnScreen;
  static set alwaysOnScreen(bool value) => SongBookBaseSetting().alwaysOnScreen = value;

  static bool get scrollText => SongBookBaseSetting().scrollText;
  static set scrollText(bool value) => SongBookBaseSetting().scrollText = value;

  static double get autoscrollTextSpeed => SongBookBaseSetting().autoscrollTextSpeed;
  static set autoscrollTextSpeed(double value) => SongBookBaseSetting().autoscrollTextSpeed = value;

  static bool get showChords => SongBookBaseSetting().showChords;
  static set showChords(bool value) => SongBookBaseSetting().showChords = value;

  static bool get chordsDrawShow => SongBookBaseSetting().chordsDrawShow;
  static set chordsDrawShow(bool value) => SongBookBaseSetting().chordsDrawShow = value;

  static InstrumentType get chordsDrawType => SongBookBaseSetting().chordsDrawType;
  static set chordsDrawType(InstrumentType value) => SongBookBaseSetting().chordsDrawType = value;

  static bool get showAlbumIcon => shaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON, true);
  static set showAlbumIcon(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON, value);

  static bool get showTabOfContOnStart => shaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START, true);
  static set showTabOfContOnStart(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START, value);

}
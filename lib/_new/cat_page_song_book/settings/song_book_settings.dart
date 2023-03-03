import 'package:harcapp/_new/cat_page_song_book/settings/song_book_base_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings_resp.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';

import '../../../_common_classes/sha_pref.dart';
import '../../../sync/syncable.dart';

class SongBookSettings with SyncableParamGroupMixin, SyncGetRespNode<SongBookSettingsResp>{

  static const String PARAM_ALWAYS_ON_SCREEN = 'always_on_screen';
  static const String PARAM_SCROLL_TEXT = 'scroll_text';
  static const String PARAM_AUTOSCROLL_TEXT_SPEED = 'autoscroll_text_speed';
  static const String PARAM_SHOW_CHORDS = 'show_chords';
  static const String PARAM_CHORDS_TRAILING = 'chords_trailing';
  static const String PARAM_SHOW_DRAW_CHORDS = 'show_draw_chords';
  static const String PARAM_DRAW_CHORDS_TYPE = 'draw_chords_type';
  static const String PARAM_SHOW_ALBUM_ICON = 'show_album_icon';
  static const String PARAM_SHOW_TAB_OF_CONT_ON_START = 'show_tab_of_cont_on_start';


  static bool get alwaysOnScreen => SongBookBaseSetting().alwaysOnScreen;
  static set alwaysOnScreen(bool value) => setAlwaysOnScreen(value);
  static setAlwaysOnScreen(bool value, {bool localOnly = false}){
    SongBookBaseSetting().alwaysOnScreen = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_ALWAYS_ON_SCREEN, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get scrollText => SongBookBaseSetting().scrollText;
  static set scrollText(bool value) => setScrollText(value);
  static setScrollText(bool value, {bool localOnly = false}){
    SongBookBaseSetting().scrollText = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_SCROLL_TEXT, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static double get autoscrollTextSpeed => SongBookBaseSetting().autoscrollTextSpeed;
  static set autoscrollTextSpeed(double value) => setAutoscrollTextSpeed(value);
  static setAutoscrollTextSpeed(double value, {bool localOnly = false}){
    SongBookBaseSetting().autoscrollTextSpeed = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_AUTOSCROLL_TEXT_SPEED, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get showChords => SongBookBaseSetting().showChords;
  static set showChords(bool value) => setShowChords(value);
  static setShowChords(bool value, {bool localOnly = false}){
    SongBookBaseSetting().showChords = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_SHOW_CHORDS, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get chordsTrailing => SongBookBaseSetting().chordsTrailing;
  static set chordsTrailing(bool value) => setChordsTrailing(value);
  static setChordsTrailing(bool value, {bool localOnly = false}){
    SongBookBaseSetting().chordsTrailing = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_CHORDS_TRAILING, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get showDrawChords => SongBookBaseSetting().chordsDrawShow;
  static set showDrawChords(bool value) => setShowDrawChords(value);
  static setShowDrawChords(bool value, {bool localOnly = false}){
    SongBookBaseSetting().chordsDrawShow = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_SHOW_DRAW_CHORDS, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static InstrumentType get drawChordsType => SongBookBaseSetting().chordsDrawType;
  static set drawChordsType(InstrumentType value) => setDrawChordsType(value);
  static setDrawChordsType(InstrumentType value, {bool localOnly = false}){
    SongBookBaseSetting().chordsDrawType = value;
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_DRAW_CHORDS_TYPE, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get showAlbumIcon => ShaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON, true);
  static set showAlbumIcon(bool value) => setShowAlbumIcon(value);
  static setShowAlbumIcon(bool value, {bool localOnly = false}){
    ShaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON, value);
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_SHOW_ALBUM_ICON, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get showTabOfContOnStart => ShaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START, true);
  static set showTabOfContOnStart(bool value) => setShowTabOfContOnStart(value);
  static setShowTabOfContOnStart(bool value, {bool localOnly = false}){
    ShaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START, value);
    if(localOnly) return;
    SongBookSettings().setSingleState(SongBookSettings.PARAM_SHOW_TAB_OF_CONT_ON_START, SyncableParamSingleMixin.stateNotSynced);
    synchronizer.post();
  }

  static bool get isDrawChordsBarVisible => SongBookBaseSetting().isDrawChordsBarVisible;

  @override
  void applySyncGetResp(SongBookSettingsResp resp) {
    if(resp.alwaysOnScreen != null) setAlwaysOnScreen(resp.alwaysOnScreen!, localOnly: true);
    if(resp.scrollText != null) setScrollText(resp.scrollText!, localOnly: true);
    if(resp.autoscrollTextSpeed != null) setAutoscrollTextSpeed(resp.autoscrollTextSpeed!, localOnly: true);
    if(resp.showChords != null) setShowChords(resp.showChords!, localOnly: true);
    if(resp.showDrawChords != null) setShowDrawChords(resp.showDrawChords!, localOnly: true);
    if(resp.drawChordsType != null) setDrawChordsType(resp.drawChordsType!, localOnly: true);
    if(resp.showAlbumIcon != null) setShowAlbumIcon(resp.showAlbumIcon!, localOnly: true);
    if(resp.showTabOfContOnStart != null) setShowTabOfContOnStart(resp.showTabOfContOnStart!, localOnly: true);
  }

  @override
  List<SyncableParam> get childParams => [
    SyncableParamSingle(
        this,
        paramId: PARAM_ALWAYS_ON_SCREEN,
        value_: () => alwaysOnScreen,
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SCROLL_TEXT,
        value_: () => scrollText
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_AUTOSCROLL_TEXT_SPEED,
        value_: () => autoscrollTextSpeed
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_CHORDS,
        value_: () => showChords
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_CHORDS_TRAILING,
        value_: () => chordsTrailing
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_DRAW_CHORDS,
        value_: () => showDrawChords
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_DRAW_CHORDS_TYPE,
        value_: () => instrumentTypeToInt(drawChordsType)
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_ALBUM_ICON,
        value_: () => showAlbumIcon
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_TAB_OF_CONT_ON_START,
        value_: () => showTabOfContOnStart
    ),
  ];

  static const String syncClassId = 'song_book_settings';

  @override
  SyncableParam? get parentParam => null;

  @override
  String get paramId => syncClassId;

}
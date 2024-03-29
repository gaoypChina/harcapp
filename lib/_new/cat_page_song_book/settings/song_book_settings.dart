import 'package:harcapp/_new/cat_page_song_book/settings/song_book_base_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings_resp.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';

import '../../../_common_classes/sha_pref.dart';
import '../../../sync/syncable.dart';

class SongBookSettings with SyncableParamGroupMixin, SyncGetRespNode<SongBookSettingsResp>{

  static const String PARAM_ALWAYS_ON_SCREEN = 'alwaysOnScreen';
  static const String PARAM_SCROLL_TEXT = 'scrollText';
  static const String PARAM_AUTOSCROLL_TEXT_SPEED = 'autoscrollTextSpeed';
  static const String PARAM_SHOW_CHORDS = 'showChords';
  static const String PARAM_CHORDS_TRAILING = 'chordsTrailing';
  static const String PARAM_SHOW_DRAW_CHORDS = 'showDrawChords';
  static const String PARAM_DRAW_CHORDS_TYPE = 'drawChordsType';
  static const String PARAM_SHOW_ALBUM_ICON = 'showAlbumIcon';
  static const String PARAM_SHOW_TAB_OF_CONT_ON_START = 'showTabOfContOnStart';


  static bool get alwaysOnScreen => SongBookBaseSetting().alwaysOnScreen;
  static set alwaysOnScreen(bool value) => setAlwaysOnScreen(value);
  static setAlwaysOnScreen(bool value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().alwaysOnScreen = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_ALWAYS_ON_SCREEN,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get scrollText => SongBookBaseSetting().scrollText;
  static set scrollText(bool value) => setScrollText(value);
  static setScrollText(bool value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().scrollText = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_SCROLL_TEXT,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static double get autoscrollTextSpeed => SongBookBaseSetting().autoscrollTextSpeed;
  static set autoscrollTextSpeed(double value) => setAutoscrollTextSpeed(value);
  static setAutoscrollTextSpeed(double value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().autoscrollTextSpeed = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_AUTOSCROLL_TEXT_SPEED,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get showChords => SongBookBaseSetting().showChords;
  static set showChords(bool value) => setShowChords(value);
  static setShowChords(bool value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().showChords = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_SHOW_CHORDS,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get chordsTrailing => SongBookBaseSetting().chordsTrailing;
  static set chordsTrailing(bool value) => setChordsTrailing(value);
  static setChordsTrailing(bool value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().chordsTrailing = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_CHORDS_TRAILING,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get showDrawChords => SongBookBaseSetting().chordsDrawShow;
  static set showDrawChords(bool value) => setShowDrawChords(value);
  static setShowDrawChords(bool value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().chordsDrawShow = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_SHOW_DRAW_CHORDS,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static InstrumentType get drawChordsType => SongBookBaseSetting().chordsDrawType;
  static set drawChordsType(InstrumentType value) => setDrawChordsType(value);
  static setDrawChordsType(InstrumentType value, {bool localOnly = false, bool? synced = false}){
    SongBookBaseSetting().chordsDrawType = value;

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_DRAW_CHORDS_TYPE,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get showAlbumIcon => ShaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON, true);
  static set showAlbumIcon(bool value) => setShowAlbumIcon(value);
  static setShowAlbumIcon(bool value, {bool localOnly = false, bool? synced = false}){
    ShaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON, value);

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_SHOW_ALBUM_ICON,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get showTabOfContOnStart => ShaPref.getBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START, true);
  static set showTabOfContOnStart(bool value) => setShowTabOfContOnStart(value);
  static setShowTabOfContOnStart(bool value, {bool localOnly = false, bool? synced = false}){
    ShaPref.setBool(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START, value);

    if(synced != null)
      SongBookSettings().setSingleState(
          SongBookSettings.PARAM_SHOW_TAB_OF_CONT_ON_START,
          synced == true?
          SyncableParamSingleMixin.stateSynced:
          SyncableParamSingleMixin.stateNotSynced
      );

    if(!localOnly)
      synchronizer.post();
  }

  static bool get isDrawChordsBarVisible => SongBookBaseSetting().isDrawChordsBarVisible;

  @override
  void applySyncGetResp(SongBookSettingsResp resp) {

    if(resp.alwaysOnScreen != null)
      setAlwaysOnScreen(resp.alwaysOnScreen!, localOnly: true, synced: null);

    if(resp.scrollText != null)
      setScrollText(resp.scrollText!, localOnly: true, synced: null);

    if(resp.autoscrollTextSpeed != null)
      setAutoscrollTextSpeed(resp.autoscrollTextSpeed!, localOnly: true, synced: null);

    if(resp.showChords != null)
      setShowChords(resp.showChords!, localOnly: true, synced: null);

    if(resp.showDrawChords != null)
      setShowDrawChords(resp.showDrawChords!, localOnly: true, synced: null);

    if(resp.drawChordsType != null)
      setDrawChordsType(resp.drawChordsType!, localOnly: true, synced: null);

    if(resp.showAlbumIcon != null)
      setShowAlbumIcon(resp.showAlbumIcon!, localOnly: true, synced: null);

    if(resp.showTabOfContOnStart != null)
      setShowTabOfContOnStart(resp.showTabOfContOnStart!, localOnly: true, synced: null);
  }

  @override
  List<SyncableParam> get childParams => [
    SyncableParamSingle(
        this,
        paramId: PARAM_ALWAYS_ON_SCREEN,
        value: () => alwaysOnScreen,
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SCROLL_TEXT,
        value: () => scrollText
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_AUTOSCROLL_TEXT_SPEED,
        value: () => autoscrollTextSpeed
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_CHORDS,
        value: () => showChords
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_CHORDS_TRAILING,
        value: () => chordsTrailing
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_DRAW_CHORDS,
        value: () => showDrawChords
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_DRAW_CHORDS_TYPE,
        value: () => instrumentTypeToInt(drawChordsType)
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_ALBUM_ICON,
        value: () => showAlbumIcon
    ),
    SyncableParamSingle(
        this,
        paramId: PARAM_SHOW_TAB_OF_CONT_ON_START,
        value: () => showTabOfContOnStart
    ),
  ];

  static const String syncClassId = 'song_book_settings';
  
  @override
  String get debugClassId => syncClassId;
  
  @override
  SyncableParam? get parentParam => null;

  @override
  String get paramId => syncClassId;

}
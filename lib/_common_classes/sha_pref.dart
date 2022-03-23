import 'dart:convert';

import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logger.dart';

ShaPref shaPref;

class ShaPref{
  //static const String SHA_PREF_INIT_SONGS_COPIED = 'SHA_PREF_INIT_SONGS_COPIED';

  static Future<void> init() async {
    ShaPref _shaPref = await ShaPref.getInstance();
    await initPaths();
    shaPref = _shaPref;
  }

  String badTypeErrMess(String key, dynamic e) => 'Tried to read value from shaPref key $key as incorrect type: ${e.toString()}';

  SharedPreferences _preferences;
  ShaPref(this._preferences);

  static Future<ShaPref> getInstance()async => ShaPref(await SharedPreferences.getInstance());

  static const String SHA_PREF_LAST_OPENED_VERSION = 'SHA_PREF_LAST_OPENED_VERSION';

  static const String SHA_PREF_USAGE_STATS_SUM  = 'SHA_PREF_USAGE_STATS_SUM';
  static const String _SHA_PREF_USAGE_STATS_ = 'SHA_PREF_USAGE_STATS_';
  static SHA_PREF_USAGE_STATS_(String entryId) => _SHA_PREF_USAGE_STATS_ + entryId;

  static const String SHA_PREF_ORG  = 'SHA_PREF_ORG';

  static const String SHA_PREF_SETTINGS_APP_DEV_MODE = 'SHA_PREF_SETTINGS_APP_DEV_MODE';
  static const String SHA_PREF_SETTINGS_APP_BACK_OPEN_DRAWER = 'SHA_PREF_SETTINGS_APP_BACK_OPEN_DRAWER';
  static const String SHA_PREF_SETTINGS_APP_FULLSCREEN = 'SHA_PREF_SETTINGS_APP_FULLSCREEN';

  static const String SHA_PREF_SETTINGS_BLACK_THEME = 'SHA_PREF_SETTINGS_BLACK_THEME';

  static const String SHA_PREF_SPIEWNIK_LAST_OPEN_SONG = 'SHA_PREF_SPIEWNIK_LAST_OPEN_SONG';

  static const String SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H = 'SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M = 'SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H = 'SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M = 'SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M';

  static const String SHA_PREF_SPIEWNIK_SETTINGS_ALWAYS_ON_SCREEN = 'SHA_PREF_SPIEWNIK_SETTINGS_ALWAYS_ON_SCREEN';

  static const String SHA_PREF_SPIEWNIK_SETTINGS_SCROLL_TEXT = 'SHA_PREF_SPIEWNIK_SETTINGS_SCROLL_TEXT';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT = 'SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT_SPEED = 'SHA_PREF_SPIEWNIK_SETTINGS_AUTOSCROLL_TEXT_SPEED';

  static const String SHA_PREF_SPIEWNIK_SETTINGS_SHOW_CHORDS = 'SHA_PREF_SPIEWNIK_SETTINGS_SHOW_CHORDS';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_TRAILING = 'SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_TRAILING';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_SHIFT = 'SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_SHIFT';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW = 'SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_LOCK_CHORDS_DRAW = 'SHA_PREF_SPIEWNIK_SETTINGS_LOCK_CHORDS_DRAW';
  static const String SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW_TYPE = 'SHA_PREF_SPIEWNIK_SETTINGS_CHORDS_DRAW_TYPE';

  static const String SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START = 'SHA_PREF_SPIEWNIK_SETTINGS_SHOW_TAB_OF_CONT_ON_START';

  static const String _SHA_PREF_SPIEWNIK_SONG_RATE_ = 'SHA_PREF_SPIEWNIK_SONG_RATE_';
  static String SHA_PREF_SPIEWNIK_SONG_RATE_(String songFileName) =>
      _SHA_PREF_SPIEWNIK_SONG_RATE_ + songFileName;

  static const String _SHA_PREF_SPIEWNIK_IS_FAVORITE_ = 'SHA_PREF_SPIEWNIK_IS_FAVORITE_';
  static String SHA_PREF_SPIEWNIK_IS_FAVORITE_(String songFileName) =>
    _SHA_PREF_SPIEWNIK_IS_FAVORITE_ + songFileName;

  static const String _SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_ = 'SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_';
  static String SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(String songFileName) =>
    _SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_ + songFileName;


  static const String SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON = 'SHA_PREF_SPIEWNIK_SETTINGS_SHOW_ALBUM_ICON';

  //tmp
  static const String SHA_PREF_SPIEWNIK_CONVERTED_OLD_SONG_CODES_TO_NEW = 'SHA_PREF_SPIEWNIK_CONVERTED_OLD_SONG_CODES_TO_NEW';
  static const String SHA_PREF_SPIEWNIK_CONVERTED_OLD_SONG_CODES_TO_NEW_2 = 'SHA_PREF_SPIEWNIK_CONVERTED_OLD_SONG_CODES_TO_NEW_2';


  static const String SHA_PREF_SPIEWNIK_OWN_SONG_ADD_PERS = 'SHA_PREF_SPIEWNIK_OWN_SONG_ADD_PERS';

  static const String SHA_PREF_SPIEWNIK_CURR_ALBUM = 'SHA_PREF_SPIEWNIK_CURR_SONG_BOOK';

  static const String SHA_PREF_SPIEWNIK_ALBUM_NAME = 'SHA_PREF_SPIEWNIK_ALBUM_NAME';

  static const String SHA_PREF_SPIEWNIK_YT_RANDOM = 'SHA_PREF_SPIEWNIK_YT_RANDOM';

  static const String SHA_PREF_SPIEWNIK_YT_AUTOPLAY = 'SHA_PREF_SPIEWNIK_YT_AUTOPLAY';
  
  // SPRAWNOSCI
  // SPRAWNOSCI
  // SPRAWNOSCI

  static const String SHA_PREF_LAST_VIEWED_SPRAWBOOK = 'SHA_PREF_LAST_VIEWED_SPRAWBOOK';

  //static const String _SHA_PREF_SPRAW_SAVED_ = 'SHA_PREF_SPRAW_SAVED_';
  //static String SHA_PREF_SPRAW_SAVED_(Spraw data) => _SHA_PREF_SPRAW_SAVED_ + data.uid.toString();

  static const String _SHA_PREF_SPRAW_IN_PROGRESS_ = 'SHA_PREF_SPRAW_IN_PROGRESS_';
  static String SHA_PREF_SPRAW_IN_PROGRESS_(Spraw data) => _SHA_PREF_SPRAW_IN_PROGRESS_ + data.uniqName;

  static const String _SHA_PREF_SPRAW_COMPLETED_ = 'SHA_PREF_SPRAW_COMPLETED_';
  static String SHA_PREF_SPRAW_COMPLETED_(Spraw data) => _SHA_PREF_SPRAW_COMPLETED_ + data.uniqName;

  static const String _SHA_PREF_SPRAW_COMPLETED_DATE_ = 'SHA_PREF_SPRAW_COMPLETED_DATE_';
  static String SHA_PREF_SPRAW_COMPLETED_DATE_(Spraw data) => _SHA_PREF_SPRAW_COMPLETED_DATE_ + data.uniqName;

  static const String SHA_PREF_SPRAW_COMPLETED_LIST = 'SHA_PREF_SPRAW_COMPLETED_LIST';
  static const String SHA_PREF_SPRAW_IN_PROGRESS_LIST = 'SHA_PREF_SPRAW_IN_PROGRESS_LIST';
  //static const String SHA_PREF_SPRAW_SAVED_LIST = 'SHA_PREF_SPRAW_SAVED_LIST';

  static const String _SHA_PREF_SPRAW_COMPLETED_REQ_MAP_ = 'SHA_PREF_SPRAW_COMPLETED_REQ_MAP_';
  static String SHA_PREF_SPRAW_COMPLETED_REQ_MAP_(Spraw data) => _SHA_PREF_SPRAW_COMPLETED_REQ_MAP_ + data.uniqName;

  static const String _SHA_PREF_SPRAW_REQ_NOTES_MAP_ = 'SHA_PREF_SPRAW_REQ_NOTES_MAP_';
  static String SHA_PREF_SPRAW_REQ_NOTES_MAP_(Spraw data) => _SHA_PREF_SPRAW_REQ_NOTES_MAP_ + data.uniqName;


  static const String SHA_PREF_SPRAW_FOLDER_LAST_USED_ID = 'SHA_PREF_SPRAW_FOLDER_LAST_USED_ID';

  static const String _SHA_PREF_SPRAW_FOLDER_NAME_ = 'SHA_PREF_SPRAW_FOLDER_NAME_';
  static String SHA_PREF_SPRAW_FOLDER_NAME_(String id) => _SHA_PREF_SPRAW_FOLDER_NAME_ + '\$' + id;
  
  static const String SHA_PREF_SPRAW_OWN_FOLDER_NAMES = 'SHA_PREF_SPRAW_OWN_FOLDER_NAMES';
  static const String _SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_ = '_SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_';
  static String SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(String id) => _SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_ + '\$' + id;

  static const String _SHA_PREF_SPRAW_FOLDER_ICON_ = 'SHA_PREF_SPRAW_FOLDER_ICON_';
  static String SHA_PREF_SPRAW_FOLDER_ICON_(String id) => _SHA_PREF_SPRAW_FOLDER_ICON_ + '\$' + id;

  static const String _SHA_PREF_SPRAW_FOLDER_COLOR_ = 'SHA_PREF_SPRAW_FOLDER_COLOR_';
  static String SHA_PREF_SPRAW_FOLDER_COLOR_(String id) => _SHA_PREF_SPRAW_FOLDER_COLOR_ + '\$' + id;

  // Competition

  static const String _SHA_PREF_INDIV_COMP_PINNED_ = 'SHA_PREF_INDIV_COMP_PINNED_';
  static String SHA_PREF_INDIV_COMP_PINNED_(String key) => _SHA_PREF_INDIV_COMP_PINNED_ + key;





  static const String SHA_PREF_SZYFR_MORSE_SIGNAL_SPEED = 'SHA_PREF_SZYFR_MORSE_SIGNAL_SPEED';

  static const String SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME = 'SHA_PREF_GRY_SLOWO_KLUCZ_SAVED_GAME';


  //SONG SYNC
  //SONG SYNC
  /*
  static const String _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_RATE_ = 'SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_RATE';
  static String SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_RATE_(String songFileName)
    => _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_RATE_ + songFileName;


  static const String _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_CHORD_SHIFT_ = '_SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_CHORD_SHIFT_';
  static String SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_CHORD_SHIFT_(String songFileName)
    => _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_CHORD_SHIFT_ + songFileName;

  static const String _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_FILE_NAME_ = '_SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_FILE_NAME_';
  static String SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_FILE_NAME_(String songFileName)
  => _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_FILE_NAME_ + songFileName;

  static const String _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_SONG_CODE_ = '_SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_SONG_CODE_';
  static String SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_SONG_CODE_(String songFileName)
  => _SHA_PREF_SPIEWNIK_SONG_SYNC_STATE_SONG_CODE_ + songFileName;
*/

  //SYNC
  //SYNC
  static const String SHA_PREF_SYNC_ON = 'SHA_PREF_SYNC_ON';

  static const String _SHA_PREF_SYNC_ITEM_PARAM_ = '_SHA_PREF_SYNC_ITEM_PARAM_';
  static String SHA_PREF_SYNC_ITEM_PARAM_(String classGroupId, String objectId, String paramId)
  => _SHA_PREF_SYNC_ITEM_PARAM_ + '\$' + classGroupId + '\$' + objectId + '\$' + paramId;

  static const String _SHA_PREF_SYNC_PARAM_ = '_SHA_PREF_SYNC_PARAM_';
  static String SHA_PREF_SYNC_PARAM_(String uniqParamId)
  => _SHA_PREF_SYNC_PARAM_ + '\$' + uniqParamId;

  static const String _SHA_PREF_SYNC_ITEM_LAST_SYNC_ = '_SHA_PREF_SYNC_ITEM_LAST_SYNC_';
  static String SHA_PREF_SYNC_ITEM_LAST_SYNC_(String classGroupId, String objectId)
  => _SHA_PREF_SYNC_ITEM_LAST_SYNC_ + '\$' + classGroupId + '\$' + objectId;

  static const String SHA_PREF_SYNC_LAST_SYNC = 'SHA_PREF_SYNC_LAST_SYNC';

  static const String _SHA_PREF_SYNC_ITEM_REMOVE_ = '_SHA_PREF_SYNC_ITEM_REMOVE_';
  static String SHA_PREF_SYNC_ITEM_REMOVE_(String classGroupId, String objectId)
  => _SHA_PREF_SYNC_ITEM_REMOVE_ + '\$' + classGroupId + '\$' + objectId;

  // HARCTHOUGHT
  // HARCTHOUGHT

  static const String SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN = 'SHA_PREF_HARCTHOUGHT_ARTICLES_SEEN';
  static const String SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED = 'SHA_PREF_HARCTHOUGHT_ARTICLES_BOOKMARKED';
  static const String SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED = 'SHA_PREF_HARCTHOUGHT_ARTICLES_LIKED';
  static const String _SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_ = 'SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_';
  static String SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_(String id) => _SHA_PREF_HARCTHOUGHT_ARTICLES_COVER_VERSION_ + '\$' + id;

  static const String SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID = 'SHA_PREF_HARCTHOUGHT_ARTICLES_LAST_SEEN_ID';

  //STREFA DUCHA
  //STREFA DUCHA
  static const String _SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_ = 'SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_';
  static String SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_(String sourceCode)
  => _SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_ + sourceCode;


  static const String _SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_ = 'SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_';
  static String SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_(String sourceCode)
  => _SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_ + sourceCode;


  static const String SHA_PREF_DUCHOWE_SAVE_LOCALLY = 'SHA_PREF_DUCHOWE_SAVE_LOCALLY';
  static const String SHA_PREF_DUCHOWE_FAVORITE_ITEMS = 'SHA_PREF_DUCHOWE_FAVORITE_ITEMS';

  static const String _SHA_PREF_DUCHOWE_SOURCE_DISPLAY_ = 'SHA_PREF_DUCHOWE_SOURCE_DISPLAY_';
  static String SHA_PREF_DUCHOWE_SOURCE_DISPLAY_(Source source)
  => _SHA_PREF_DUCHOWE_SOURCE_DISPLAY_ + source.code;


  static const String SHA_PREF_DUCHOWE_ITEM_LOCKED = 'SHA_PREF_DUCHOWE_ITEM_LOCKED';
  static const String SHA_PREF_DUCHOWE_INIT_MESSAGE = 'SHA_PREF_DUCHOWE_INIT_MESSAGE';

  //STOPNIE
  //STOPNIE

  static const String _SHA_PREF_STOP_UID_ = 'SHA_PREF_STOP_UID_';
  static String SHA_PREF_STOP_UID_(String uid) => _SHA_PREF_STOP_UID_ + uid;

  static const String _SHA_PREF_STOPNIE_UID_ = 'SHA_PREF_STOPNIE_UID_';
  static String SHA_PREF_STOPNIE_UID_(String uid) => _SHA_PREF_STOPNIE_UID_ + uid;

  static const String _SHA_PREF_STOP_IN_PROGRESS_ = 'SHA_PREF_STOP_IN_PROGRESS_';
  static String SHA_PREF_RANK_IN_PROGRESS_(Rank rank) => _SHA_PREF_STOP_IN_PROGRESS_ + rank.uniqRankName;

  static const String _SHA_PREF_STOP_COMPLETED_ = 'SHA_PREF_STOP_COMPLETED_';
  static String SHA_PREF_RANK_COMPLETED_(Rank rank) => _SHA_PREF_STOP_COMPLETED_ + rank.uniqRankName;

  static const String _SHA_PREF_RANK_COMPLETED_DATE_ = 'SHA_PREF_STOP_COMPLETED_DATE_';
  static String SHA_PREF_RANK_COMPLETED_DATE_(Rank rank) => _SHA_PREF_RANK_COMPLETED_DATE_ + rank.uniqRankName;
  
  static const String _SHA_PREF_RANK_COMPLETED_REQ_MAP_ = 'SHA_PREF_STOP_COMPLETED_REQ_MAP_';
  static String SHA_PREF_RANK_COMPLETED_REQ_MAP_(Rank rank) => _SHA_PREF_RANK_COMPLETED_REQ_MAP_ + rank.uniqRankName;

  static const String _SHA_PREF_RANK_REQ_NOTES_MAP_ = 'SHA_PREF_STOP_REQ_NOTES_MAP_';
  static String SHA_PREF_RANK_REQ_NOTES_MAP_(Rank rank) => _SHA_PREF_RANK_REQ_NOTES_MAP_ + rank.uniqRankName;


  static const String _SHA_PREF_RANK_ZHP_EXT_TEXT_ = 'SHA_PREF_STOP_ZHP_EXT_TEXT_';
  static String SHA_PREF_STOP_ZHP_EXT_TEXT_(String rankId, String code, int position) => _SHA_PREF_RANK_ZHP_EXT_TEXT_ + rankId + '\$' + code + '\$' + position.toString();

  static const String _SHA_PREF_RANK_ZHP_EXT_COMPLETED_ = 'SHA_PREF_STOP_ZHP_EXT_COMPLETED_';
  static String SHA_PREF_STOP_ZHP_EXT_COMPLETED_(String rankId, String code, int position) => _SHA_PREF_RANK_ZHP_EXT_COMPLETED_ + rankId + '\$' + code + '\$' + position.toString();


  static const String _SHA_PREF_SHARE_RANK_DUMP_ = 'SHA_PREF_SHARE_RANK_DUMP_';
  static String SHA_PREF_SHARE_RANK_DUMP_(String sharedRankKey) => _SHA_PREF_SHARE_RANK_DUMP_ + sharedRankKey;

  // STATISTICS

  static const String SHA_PREF_STATISTICS_LAST_SYNC_TIME = 'SHA_PREF_STATISTICS_LAST_SYNC_TIME';
  static const String SHA_PREF_STATISTICS_SONGS = 'SHA_PREF_STATISTICS_SONGS';
  static const String SHA_PREF_STATISTICS_MODULE = 'SHA_PREF_STATISTICS_MODULE';
  
  //GET SET
  //GET SET
  bool getBool(String key, bool def) {
    try {
      bool value = _preferences.getBool(key);
      if(value == null) return def;
      else return value;
    } catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  Future<void> setBool(String key, bool value) => _preferences.setBool(key, value);

  String getString(String key, String def) {
    try {
      String value = _preferences.getString(key);
      if(value == null) return def;
      else return value;
    } catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  Future<void> setString(String key, String value) => _preferences.setString(key, value);

  List<String> getStringList(String key, List<String> def) {
    try {
      List<String> value = _preferences.getStringList(key);
      if(value == null) return def;
      else return value;
    } catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  Future<void> setStringList(String key, List<String> value) => _preferences.setStringList(key, value);

  Future<void> setMap(String key, Map map) => _preferences.setString(key, jsonEncode(map));

  Map<T_KEY, T_VAL> getMap<T_KEY, T_VAL>(String key, Map<T_KEY, T_VAL> def){
    try {
      String code = _preferences.getString(key);
      if(code == null) return def;
      Map<T_KEY, T_VAL> map =  (jsonDecode(code) as Map).cast<T_KEY, T_VAL>();
      return map;
    } catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  int getInt(String key, int def) {
    try {
      int value = _preferences.getInt(key);
      if(value == null) return def;
      else return value;
    } catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  Future<void> setInt(String key, int value) => _preferences.setInt(key, value);

  double getDouble(String key, double def) {
    try {
      double value = _preferences.getDouble(key);
      if(value == null) return def;
      else return value;
    } catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  Future<void> setDouble(String key, double value) => _preferences.setDouble(key, value);

  DateTime getDateTime(String key, DateTime def){
    try {
      String dateTimeStr = getString(key, 'nic');
      if(dateTimeStr == 'nic') return def;
      return DateTime.tryParse(dateTimeStr)??def;
    } on Exception catch (e){
      logger.w(badTypeErrMess(key, e));
      _preferences.remove(key);
      return def;
    }
  }

  Future<void> setDateTime(String key, DateTime value) async {
    if(value == null) await remove(key);
    else await setString(key, value.toIso8601String());
  }

  bool exists(String key) => _preferences.get(key) != null;

  Future<void> remove(String key) => _preferences.remove(key);

  void clear() => _preferences.clear();

}
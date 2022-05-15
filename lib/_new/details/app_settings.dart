import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/app_settings_resp.dart';
import 'package:harcapp/sync/syncable_new.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';

import '../../_common_classes/sha_pref.dart';

enum AppTheme{
  light,
  dark,
  auto
}

Map<AppTheme, String> appThemeToStr = {
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
  AppTheme.auto: 'auto',
};

Map<String, AppTheme> appThemeFromStr = {
  'light': AppTheme.light,
  'dark': AppTheme.dark,
  'auto': AppTheme.auto,
};

class AppSettings extends SyncableParamGroup_ with SyncNode<AppSettingsResp>{

  static bool get fullscreen => ShaPref.getBool(ShaPref.SHA_PREF_SETTINGS_APP_FULLSCREEN, false);
  static set fullscreen(bool value) => setFullscreen(value);
  static void setFullscreen(bool? value, {bool localOnly = false}){
    if(value == null) ShaPref.remove(ShaPref.SHA_PREF_SETTINGS_APP_FULLSCREEN);
    else ShaPref.setBool(ShaPref.SHA_PREF_SETTINGS_APP_FULLSCREEN, value);
    if(localOnly) return;
    AppSettings().setSingleState(AppSettings.PARAM_FULLSCREEN, SyncableParamSingle_.stateNotSynced);
    synchronizer.post();
  }

  static bool get devMode => ShaPref.getBool(ShaPref.SHA_PREF_SETTINGS_APP_DEV_MODE, false);
  static set devMode(bool value) => setDevMode(value);
  static void setDevMode(bool? value, {bool localOnly = false}){
    if(value == null) ShaPref.remove(ShaPref.SHA_PREF_SETTINGS_APP_FULLSCREEN);
    else ShaPref.setBool(ShaPref.SHA_PREF_SETTINGS_APP_DEV_MODE, value);
    if(localOnly) return;
    AppSettings().setSingleState(AppSettings.PARAM_DEV_MODE, SyncableParamSingle_.stateNotSynced);
    synchronizer.post();
  }

  static TimeOfDay defSunriseTime = const TimeOfDay(hour: 5, minute: 0);
  static TimeOfDay defSunsetTime = const TimeOfDay(hour: 20, minute: 00);

  static TimeOfDay? toDfromInt(int? seconds){
    if(seconds == null) return null;
    int minutes = (seconds~/60) % 60;
    int hours = (seconds~/(60*60));
    return TimeOfDay(hour: hours, minute: minutes);
  }

  static int _toSecsDT(DateTime time) => time.hour*60*60 + time.minute*60 + time.second;
  static int _toSecsToD(TimeOfDay time) => time.hour*60*60 + time.minute*60;

  static int get secsTillSunrise{
    int now = _toSecsDT(DateTime.now());
    int sunrise = _toSecsToD(sunriseTime);
    if(now < sunrise) return sunrise - now;
    else return 24*60*60 - (now - sunrise);
  }

  static int get secsTillSunset{
    int now = _toSecsDT(DateTime.now());
    int sunset = _toSecsToD(sunsetTime);
    if(now < sunset) return sunset - now;
    else return 24*60*60 - (now - sunset);
  }

  static int get secsTillThemeChange{
    return min(secsTillSunrise, secsTillSunset);
  }

  static TimeOfDay get sunriseTime{
    int hour = ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H, defSunriseTime.hour);
    int minute = ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M, defSunriseTime.minute);
    return TimeOfDay(hour: hour, minute: minute);
  }
  static set sunriseTime(TimeOfDay value) => setSunriseTime(value);
  static setSunriseTime(TimeOfDay? value, {bool localOnly = false}){
    if(value == null) {
      ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H);
      ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M);
    } else {
      ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_H, value.hour);
      ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNRISE_TIME_M, value.minute);
    }
    if(localOnly) return;
    AppSettings().setSingleState(AppSettings.PARAM_THEME_SUNRISE_TIME, SyncableParamSingle_.stateNotSynced);
    synchronizer.post();
  }

  static TimeOfDay get sunsetTime{
    int hour = ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H, defSunsetTime.hour);
    int minute = ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M, defSunsetTime.minute);
    return TimeOfDay(hour: hour, minute: minute);
  }
  static set sunsetTime(TimeOfDay value) => setSunsetTime(value);
  static setSunsetTime(TimeOfDay? value, {bool localOnly = false}){
    if(value == null) {
      ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H);
      ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M);
    } else {
      ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_H, value.hour);
      ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SETTINGS_SUNSET_TIME_M, value.minute);
    }
    if(localOnly) return;
    AppSettings().setSingleState(AppSettings.PARAM_THEME_SUNSET_TIME, SyncableParamSingle_.stateNotSynced);
    synchronizer.post();
  }

  static bool get isAutoDark{
    DateTime now = DateTime.now();
    if(_toSecsDT(now) > _toSecsToD(sunriseTime) && _toSecsDT(now) < _toSecsToD(sunsetTime))
      return false;
    else
      return true;
  }

  static bool get isDark{
    if(theme == AppTheme.light) return false;
    else if (theme == AppTheme.dark) return true;
    else return isAutoDark;
  }

  static const String _themeCodeLight = 'themeLight';
  static const String _themeCodeDark = 'themeDark';
  static const String _themeCodeAuto = 'themeAuto';


  static AppTheme get theme{
    String? themeCode = ShaPref.getString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeAuto);
    switch(themeCode){
      case _themeCodeLight: return AppTheme.light;
      case _themeCodeDark: return AppTheme.dark;
      case _themeCodeAuto: return AppTheme.auto;
      default: return AppTheme.auto;
    }
  }

  static set theme(AppTheme value) => setTheme(value);
  static setTheme(AppTheme? value, {bool localOnly = false}){
    if(value == null) ShaPref.remove(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME);
    switch(value){
      case AppTheme.light: ShaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeLight); break;
      case AppTheme.dark: ShaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeDark); break;
      case AppTheme.auto: ShaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeAuto); break;
      default: ShaPref.setString(ShaPref.SHA_PREF_SETTINGS_BLACK_THEME, _themeCodeAuto);
    }
    if(localOnly) return;
    AppSettings().setSingleState(AppSettings.PARAM_THEME, SyncableParamSingle_.stateNotSynced);
    synchronizer.post();
  }

  static const String PARAM_THEME = 'theme';
  static const String PARAM_THEME_SUNRISE_TIME = 'theme_sunrise_time';
  static const String PARAM_THEME_SUNSET_TIME = 'theme_sunset_time';

  static const String PARAM_FULLSCREEN = 'fullscreen';
  static const String PARAM_DEV_MODE = 'dev_mode';

  @override
  List<SyncableParam> get childParams => [
    SyncableParamSingle(
        this,
        paramId: PARAM_THEME,
        value_: () => appThemeToStr[theme]
    ),

    SyncableParamSingle(
        this,
        paramId: PARAM_THEME_SUNRISE_TIME,
        value_: () => _toSecsToD(sunriseTime)
    ),

    SyncableParamSingle(
        this,
        paramId: PARAM_THEME_SUNSET_TIME,
        value_: () => _toSecsToD(sunsetTime)
    ),

    SyncableParamSingle(
        this,
        paramId: PARAM_FULLSCREEN,
        value_: () => fullscreen
    ),

    SyncableParamSingle(
        this,
        paramId: PARAM_DEV_MODE,
        value_: () => devMode
    ),
  ];

  static const String syncClassId = 'app_settings';

  @override
  String get paramId => syncClassId;

  @override
  void applySyncGetResp(AppSettingsResp resp) {
    setTheme(resp.theme, localOnly: true);
    setFullscreen(resp.fullscreen, localOnly: true);
    setDevMode(resp.devMode, localOnly: true);
    setSunriseTime(resp.defSunriseTime, localOnly: true);
    setSunsetTime(resp.defSunsetTime, localOnly: true);
  }

}

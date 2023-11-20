import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/details/app_settings.dart';


class AppSettingsResp extends SyncGetResp{

  static const String collName = AppSettings.syncClassId;

  final AppTheme? theme;
  final bool? fullscreen;
  final bool? devMode;
  final TimeOfDay? defSunriseTime;
  final TimeOfDay? defSunsetTime;

  const AppSettingsResp({
    required this.theme,
    required this.fullscreen,
    required this.devMode,
    required this.defSunriseTime,
    required this.defSunsetTime,
  });

  static AppSettingsResp from(Map respData) => AppSettingsResp(
      theme: appThemeFromStr[respData[AppSettings.PARAM_THEME]],
      fullscreen: respData[AppSettings.PARAM_FULLSCREEN],
      devMode: respData[AppSettings.PARAM_DEV_MODE],
      defSunriseTime: AppSettings.toDfromInt(respData[AppSettings.PARAM_THEME_SUNRISE_TIME]),
      defSunsetTime: AppSettings.toDfromInt(respData[AppSettings.PARAM_THEME_SUNSET_TIME])
  );


}
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/account/account.dart';
import 'package:intl/intl.dart';
import 'package:system_time_check/system_time_check.dart';

import '../_new/api/statistics.dart';
import '../logger.dart';

class Statistics{

  static const String syncPeriodSep = '@';
  static const String syncPeriodStrCurr = syncPeriodStr1h;
  static const String syncPeriodStr1h = '1h';

  static const Duration syncInterval = Duration(hours: 1);
  static const Duration syncPeriod = Duration(days: 1);

  DateTime get lastSyncTime => shaPref.getDateTime(ShaPref.SHA_PREF_STATISTICS_LAST_SYNC_TIME, null);

  static Map<String, Map<String, int>> get standardSongSearch{
    Map map = shaPref.getMap<String, dynamic>(ShaPref.SHA_PREF_STATISTICS_SONG_SIMPLE_SEARCH, {});
    Map<String, Map<String, int>> castMap = {};
    for(String key in map.keys){
      Map<String, int> inMap = Map.from(map[key]);
      castMap[key] = inMap;
    }
    return castMap;
  }
  static set standardSongSearch(Map<String, Map<String, int>> value) => shaPref.setMap(ShaPref.SHA_PREF_STATISTICS_SONG_SIMPLE_SEARCH, value);

  static Future<void> registerStandardSongSearch(String songFileName) async {

    bool isTimeAutomatic;
    try {isTimeAutomatic = await SystemTimeCheck.isSystemTimeAutomatic ?? false;}
    on PlatformException {isTimeAutomatic = false;}

    if(!isTimeAutomatic) {
      logger.w('System time not set to automatic.');
      return;
    }

    Map<String, Map<String, int>> _allStandardSongSearch = standardSongSearch;

    String localDate = DateFormat('yyyy-MM-ddTHH:00:00').format(DateTime.now());
    localDate = '$localDate$syncPeriodSep$syncPeriodStrCurr';

    Map<String, int> _todaysStandardSongSearch = _allStandardSongSearch[localDate]??{};

    if(!_todaysStandardSongSearch.containsKey(songFileName))
      _todaysStandardSongSearch[songFileName] = 1;
    else
      _todaysStandardSongSearch[songFileName] = _todaysStandardSongSearch[songFileName] + 1;

    _allStandardSongSearch[localDate] = _todaysStandardSongSearch;
    standardSongSearch = _allStandardSongSearch;
  }

  static Future<void> commit() async {
    if(!AccSecData.loggedIn) {
      logger.i('Statistics post aborted - not logged in.');
      return;
    }

    if(!AccSecData.emailConf) {
      logger.i('Statistics post aborted - email not confirmed.');
      return;
    }

    if(Statistics.standardSongSearch.isEmpty)
      return;

    await ApiStatistics.postObservations(
      onSuccess: (List<String> tooEarly, List<String> alreadyExisted, List<String> saved){
        Map<String, Map<String, int>> _allStandardSongSearch = standardSongSearch;
        for(String timeStr in tooEarly)
          _allStandardSongSearch.remove(timeStr);

        for(String timeStr in alreadyExisted)
          _allStandardSongSearch.remove(timeStr);

        for(String timeStr in saved)
          _allStandardSongSearch.remove(timeStr);

        standardSongSearch = _allStandardSongSearch;
      },
      onError: (){}
    );
  }

}
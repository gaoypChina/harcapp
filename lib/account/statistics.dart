import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/account/account.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import '../_new/api/statistics.dart';
import '../_new/cat_page_song_book/songs_statistics_registrator.dart';
import '../logger.dart';

class Statistics{

  static const Duration syncInterval = Duration(hours: 1);
  static const Duration syncPeriod = Duration(days: 1);

  DateTime get lastSyncTime => shaPref.getDateTime(ShaPref.SHA_PREF_STATISTICS_LAST_SYNC_TIME, null);

  static Map<String, Map<String, dynamic>> get songStats{
    Map<String, Map<String, dynamic>> map = shaPref.getMap(ShaPref.SHA_PREF_STATISTICS_SONGS, {});
    Map<String, Map<String, dynamic>> castMap = {};
    for(String key in map.keys){
      Map<String, dynamic> innerMap = Map.from(map[key]);
      castMap[key] = innerMap;
    }
    return castMap;
  }

  static set songStats(Map<String, Map<String, dynamic>> value) => shaPref.setMap(ShaPref.SHA_PREF_STATISTICS_SONGS, value);

  static Future<void> registerSongAction(String songFileName, DateTime openTime, SongOpenType type, Duration openDuration, List<Tuple2<int, double>> scrollEvents) async {

    Map<String, Map<String, dynamic>> _allStandardSongSearch = songStats;

    String localDate = DateFormat('yyyy-MM-ddTHH:mm:ss.mmm').format(openTime);

    _allStandardSongSearch[localDate] = {
      "songLclId": songFileName,
      "openType": type.name.toUpperCase(),
      "openDuration": openDuration.inSeconds,
      "scrollEvents": scrollEvents.map(
        (scrollEvent) => {
          "time": scrollEvent.item1,
          "scrollVal": scrollEvent.item2,
        }
      ).toList()
    };

    songStats = _allStandardSongSearch;
  }

  static Map<String, Map<String, dynamic>> get moduleStats{
    Map<String, Map<String, dynamic>> map = shaPref.getMap(ShaPref.SHA_PREF_STATISTICS_MODULE, {});
    Map<String, Map<String, dynamic>> castMap = {};
    for(String key in map.keys){
      Map<String, dynamic> innerMap = Map.from(map[key]);
      castMap[key] = innerMap;
    }
    return null;
  }

  static set moduleStats(Map<String, Map<String, dynamic>> value) => shaPref.setMap(ShaPref.SHA_PREF_STATISTICS_MODULE, value);


  static Future<void> registerModuleAction(String moduleId, DateTime openTime, Duration openDuration) async {

    Map<String, Map<String, dynamic>> _allModuleStats = moduleStats;

    _allModuleStats[moduleId][DateFormat('yyyy-MM-ddTHH:mm:ss.mmm').format(openTime)] = openDuration.inSeconds;

    moduleStats = _allModuleStats;

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

    if(Statistics.songStats.isEmpty)
      return;

    await ApiStatistics.postObservations(
      onSuccess: (List<String> modulesTooEarly, List<String> modulesAlreadyExisted, List<String> modulesSaved, List<String> songsTooEarly, List<String> songsAlreadyExisted, List<String> songsSaved){
        Map<String, Map<String, dynamic>> _allModuleStats = moduleStats;
        for(String timeStr in modulesTooEarly)
          _allModuleStats.remove(timeStr);
        for(String timeStr in modulesAlreadyExisted)
          _allModuleStats.remove(timeStr);
        for(String timeStr in modulesSaved)
          _allModuleStats.remove(timeStr);
        moduleStats = _allModuleStats;

        Map<String, Map<String, dynamic>> _allSongStats = songStats;
        for(String timeStr in songsTooEarly)
          _allSongStats.remove(timeStr);
        for(String timeStr in songsAlreadyExisted)
          _allSongStats.remove(timeStr);
        for(String timeStr in songsSaved)
          _allSongStats.remove(timeStr);

        songStats = _allSongStats;
      },
      onError: (){}
    );
  }

}
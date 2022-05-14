import 'package:flutter/cupertino.dart';
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

  DateTime? get lastSyncTime => shaPref!.getDateTime(ShaPref.SHA_PREF_STATISTICS_LAST_SYNC_TIME, null);

  static Map<String?, Map<String, dynamic>> get songStats{
    Map<String, Map<String, dynamic>> map = shaPref!.getMap(ShaPref.SHA_PREF_STATISTICS_SONGS, {});
    Map<String?, Map<String, dynamic>> castMap = {};
    for(String key in map.keys){
      Map<String, dynamic> innerMap = Map.from(map[key]!);
      castMap[key] = innerMap;
    }
    return castMap;
  }

  static set songStats(Map<String?, Map<String, dynamic>> value) => shaPref!.setMap(ShaPref.SHA_PREF_STATISTICS_SONGS, value);

  static Future<void> registerSongAction(String? songFileName, DateTime openTime, SongOpenType type, Duration openDuration, List<Tuple4<int, int, int, Orientation>> scrollEvents) async {

    Map<String?, Map<String, dynamic>> allStats = Statistics.songStats;
    Map<String, dynamic> songStats = allStats[songFileName] ?? {};

    String localDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(openTime.toUtc());
    songStats[localDate] = {
      'openType': type.name.toUpperCase(),
      'openDuration': openDuration.inSeconds,
      'scrollEvents': scrollEvents.map((scrollEvent) => {
          'time': scrollEvent.item1,
          'topLine': scrollEvent.item2,
          'bottomLine': scrollEvent.item3,
          'orientation': scrollEvent.item4==Orientation.portrait?'vertical':'horizontal',
        }).toList()
    };

    allStats[songFileName] = songStats;
    Statistics.songStats = allStats;
  }

  static Map<String?, Map<String, dynamic>> get moduleStats{
    Map<String, Map<String, dynamic>> map = shaPref!.getMap(ShaPref.SHA_PREF_STATISTICS_MODULE, {});
    Map<String?, Map<String, dynamic>> castMap = {};
    for(String key in map.keys){
      Map<String, dynamic> innerMap = Map.from(map[key]!);
      castMap[key] = innerMap;
    }
    return castMap;
  }

  static set moduleStats(Map<String?, Map<String, dynamic>> value) => shaPref!.setMap(ShaPref.SHA_PREF_STATISTICS_MODULE, value);

  static Future<void> registerModuleAction(String? moduleId, DateTime openTime, Duration openDuration) async {

    Map<String?, Map<String, dynamic>> allStats = Statistics.moduleStats;
    Map<String, dynamic> moduleStats = allStats[moduleId]??{};

    String localDate = DateFormat('yyyy-MM-ddTHH:mm:ss').format(openTime.toUtc());
    moduleStats[localDate] = {
      "openDuration": openDuration.inSeconds,
    };

    allStats[moduleId] = moduleStats;
    Statistics.moduleStats = allStats;
  }

  static Future<void> commit() async {
    if(!AccountData.loggedIn) {
      logger.i('Statistics post aborted - not logged in.');
      return;
    }

    if(!AccountData.emailConf) {
      logger.i('Statistics post aborted - email not confirmed.');
      return;
    }

    if(Statistics.songStats.isEmpty && Statistics.moduleStats.isEmpty)
      return;

    await ApiStatistics.postObservations(
      onSuccess: (List<StatRespItem> modules, List<StatRespItem> songs){

        Map<String?, Map<String, dynamic>> _allModuleStats = moduleStats;
        for(StatRespItem respItem in modules){
          if(respItem.state == StatRespState.tooEarly || respItem.state == StatRespState.alreadyExisted)
            _allModuleStats[respItem.uniqId]!.remove(respItem.time);
          else if(respItem.state == StatRespState.saved)
            _allModuleStats[respItem.uniqId]!.remove(respItem.time);

          if(_allModuleStats[respItem.uniqId]!.isEmpty) _allModuleStats.remove(respItem.uniqId);
        }
        moduleStats = _allModuleStats;

        Map<String?, Map<String, dynamic>> _allSongStats = songStats;
        for(StatRespItem respItem in songs){
          if(respItem.state == StatRespState.tooEarly || respItem.state == StatRespState.alreadyExisted)
            _allSongStats[respItem.uniqId]!.remove(respItem.time);
          else if(respItem.state == StatRespState.saved)
            _allSongStats[respItem.uniqId]!.remove(respItem.time);

          if(_allSongStats[respItem.uniqId]!.isEmpty) _allSongStats.remove(respItem.uniqId);
        }
        songStats = _allSongStats;

      },
      onError: (){}
    );
  }

}
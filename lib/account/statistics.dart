import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/account/account.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';

import '../_common_classes/time_settings.dart';
import '../_new/api/statistics.dart';
import '../_new/cat_page_song_book/songs_statistics_registrator.dart';
import '../logger.dart';

class Statistics{

  static const Duration syncInterval = Duration(hours: 1);
  static const Duration syncPeriod = Duration(days: 1);

  DateTime get lastSyncTime => shaPref.getDateTime(ShaPref.SHA_PREF_STATISTICS_LAST_SYNC_TIME, null);

  static Map<String, Map<String, dynamic>> get songSearchRequests{
    Map<String, Map<String, dynamic>> map = shaPref.getMap(ShaPref.SHA_PREF_STATISTICS_SONG_SIMPLE_SEARCH, {});
    Map<String, Map<String, dynamic>> castMap = {};
    for(String key in map.keys){
      Map<String, dynamic> innerMap = Map.from(map[key]);
      castMap[key] = innerMap;
    }
    return castMap;
  }

  static set songSearchRequests(Map<String, Map<String, dynamic>> value) => shaPref.setMap(ShaPref.SHA_PREF_STATISTICS_SONG_SIMPLE_SEARCH, value);

  static Future<void> registerSongAction(String songFileName, SongOpenType songOpenType, Duration openDuration, List<Tuple2<int, double>> scrollEvents) async {

    if(!await TimeSettings.isTimeAutomatic) {
      logger.w('System time not set to automatic.');
      return;
    }

    Map<String, Map<String, dynamic>> _allStandardSongSearch = songSearchRequests;

    String localDate = DateFormat('yyyy-MM-ddTHH:mm:ss.mmm').format(DateTime.now());

    _allStandardSongSearch[localDate] = {
      "songLclId": songFileName,
      "openType": songOpenType.name.toUpperCase(),
      "openDuration": openDuration.inSeconds,
      "scrollEvents": scrollEvents.map(
        (scrollEvent) => {
          "time": scrollEvent.item1,
          "scrollVal": scrollEvent.item2,
        }
      ).toList()
    };

    songSearchRequests = _allStandardSongSearch;
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

    if(Statistics.songSearchRequests.isEmpty)
      return;

    await ApiStatistics.postObservations(
      onSuccess: (List<String> tooEarly, List<String> alreadyExisted, List<String> saved){
        Map<String, Map<String, dynamic>> _allStandardSongSearch = songSearchRequests;
        for(String timeStr in tooEarly)
          _allStandardSongSearch.remove(timeStr);

        for(String timeStr in alreadyExisted)
          _allStandardSongSearch.remove(timeStr);

        for(String timeStr in saved)
          _allStandardSongSearch.remove(timeStr);

        songSearchRequests = _allStandardSongSearch;
      },
      onError: (){}
    );
  }

}
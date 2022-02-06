import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:intl/intl.dart';

class Statistics{

  static const Duration syncPeriod = Duration(days: 1);

  DateTime get lastSyncTime => shaPref.getDateTime(ShaPref.SHA_PREF_STATISTICS_LAST_SYNC_TIME, null);

  static Map<String, Map<String, int>> get standardSongSearch => shaPref.getMap(ShaPref.SHA_PREF_STATISTICS_SONG_SIMPLE_SEARCH, {});
  static set standardSongSearch(Map<String, Map<String, int>> value) => shaPref.setMap(ShaPref.SHA_PREF_STATISTICS_SONG_SIMPLE_SEARCH, value);

  static void registerStandardSongSearch(String songFileName){
    Map<String, Map<String, int>> _allStandardSongSearch = standardSongSearch;

    String localDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    Map<String, int> _todaysStandardSongSearch = _allStandardSongSearch[localDate];

    if(!_todaysStandardSongSearch.containsKey(songFileName))
      _todaysStandardSongSearch[songFileName] = 1;
    else
      _todaysStandardSongSearch[songFileName] = _todaysStandardSongSearch[songFileName] + 1;

    _allStandardSongSearch[localDate] = _todaysStandardSongSearch;
    standardSongSearch = _allStandardSongSearch;
  }

  Future<void> send() async {



  }

}
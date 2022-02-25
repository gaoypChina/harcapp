import 'package:harcapp/account/statistics.dart';
import 'package:harcapp/logger.dart';
import 'package:tuple/tuple.dart';

enum SongOpenType{init, swipe, search, recommend, random}
class SongsStatisticsRegistrator{

  DateTime _lastPausedTime;
  Duration _totalPausedDuration;
  String _songLclId;
  SongOpenType _songOpenType;
  DateTime _songOpenTime;
  List<Tuple2<Duration, double>> _scrollRegisters;

  Duration get totalOpenDuration => DateTime.now().difference(_songOpenTime) - _totalPausedDuration;

  SongsStatisticsRegistrator(){
    _totalPausedDuration = Duration.zero;
    _scrollRegisters = [];
  }

  bool get pause => _lastPausedTime != null;
  set pause(bool value){
    if(value)
      _lastPausedTime = DateTime.now();
    else{
      if(_lastPausedTime == null) _totalPausedDuration = Duration.zero;
      else _totalPausedDuration += DateTime.now().difference(_lastPausedTime);
      _lastPausedTime = null;
    }

    logger.d('UsageStatisticsRegistrator ($_songLclId) paused: $value, total paused duration: $_totalPausedDuration');
  }

  void clear(){
    _lastPausedTime = null;
    _totalPausedDuration = Duration.zero;
    _songLclId = null;
    _scrollRegisters.clear();
  }

  void openSong(String songLclId, SongOpenType songOpenType){
    if(_songLclId != null) commit();
    clear();
    _songLclId = songLclId;
    _songOpenType = songOpenType;
    _songOpenTime = DateTime.now();
    logger.d('UsageStatisticsRegistrator ($_songLclId) song opened.');
  }

  void registerScroll(scrollValue){
    if(_lastPausedTime != null) logger.e('UsageStatisticsRegistrator ($_songLclId) scrolled while paused!');
    _scrollRegisters.add(Tuple2(totalOpenDuration, scrollValue));
    logger.d('UsageStatisticsRegistrator ($_songLclId) scrolled to $scrollValue after ${_scrollRegisters.last.item1}.');
  }

  void commit(){
    if(_songLclId == null) return;

    Statistics.registerStandardSongSearch(songFileName);

    logger.d('UsageStatisticsRegistrator ($_songLclId) song stats saved.');
  }
}
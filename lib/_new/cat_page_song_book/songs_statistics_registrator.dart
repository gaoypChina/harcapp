import 'package:harcapp/logger.dart';
import 'package:tuple/tuple.dart';

class SongsStatisticsRegistrator{

  DateTime _lastPausedTime;
  Duration _totalPausedDuration;
  String _songLclId;
  DateTime _songOpenTime;
  List<Tuple2<DateTime, double>> _scrollRegisters;

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
    }

    logger.d('UsageStatisticsRegistrator ($_songLclId) paused: $value, total paused duration: $_totalPausedDuration');
  }

  void openSong(String songLclId){
    if(_songLclId != null) _save();
    _lastPausedTime = null;
    _totalPausedDuration = Duration.zero;
    _songLclId = songLclId;
    _songOpenTime = DateTime.now();
    _scrollRegisters.clear();
    logger.d('UsageStatisticsRegistrator ($_songLclId) song opened.');
  }

  void registerScroll(scrollValue){
    if(_lastPausedTime != null) logger.e('UsageStatisticsRegistrator ($_songLclId) scrolled while paused!');
    _scrollRegisters.add(Tuple2(DateTime.now().subtract(_totalPausedDuration), scrollValue));
    logger.d('UsageStatisticsRegistrator ($_songLclId) scrolled to $scrollValue.');

  }

  void _save(){
    logger.d('UsageStatisticsRegistrator ($_songLclId) song stats saved.');
  }
}
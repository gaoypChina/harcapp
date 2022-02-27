import 'package:harcapp/account/statistics.dart';
import 'package:harcapp/logger.dart';
import 'package:tuple/tuple.dart';

import '../../_common_classes/time_settings.dart';

enum SongOpenType{init, swipe, search, recommend, random}
class SongsStatisticsRegistrator{

  bool _autoTimeChanged;
  Future<void> checkAutoTimeChanged() async {
    if(!await TimeSettings.isTimeAutomatic)
      _autoTimeChanged = true;
  }

  DateTime _lastPausedTime;
  Duration _totalPausedDuration;
  String _songLclId;
  SongOpenType _songOpenType;
  DateTime _songOpenTime;
  List<Tuple2<int, double>> _scrollEvents;

  Duration get totalOpenDuration => DateTime.now().difference(_songOpenTime) - _totalPausedDuration;

  SongsStatisticsRegistrator(){
    _totalPausedDuration = Duration.zero;
    _scrollEvents = [];
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

  Future<void> clear() async {
    _autoTimeChanged = !await TimeSettings.isTimeAutomatic;
    _lastPausedTime = null;
    _totalPausedDuration = Duration.zero;
    _songLclId = null;
    _scrollEvents.clear();
  }

  Future<void> openSong(String songLclId, SongOpenType songOpenType) async {
    if(_songLclId != null) commit();
    if(!await TimeSettings.isTimeAutomatic) return;

    await clear();
    _songLclId = songLclId;
    _songOpenType = songOpenType;
    _songOpenTime = DateTime.now();
    logger.d('UsageStatisticsRegistrator ($_songLclId) song opened.');
  }

  Future<void> registerScroll(double scrollValue) async {
    if(!await TimeSettings.isTimeAutomatic) return;
    if(_lastPausedTime != null) logger.e('UsageStatisticsRegistrator ($_songLclId) scrolled while paused!');
    scrollValue = double.parse(scrollValue.toStringAsFixed(3));
    _scrollEvents.add(Tuple2(totalOpenDuration.inSeconds, scrollValue));
    logger.d('UsageStatisticsRegistrator ($_songLclId) scrolled to $scrollValue after ${_scrollEvents.last.item1} seconds.');
  }

  void commit(){
    if(_autoTimeChanged) return;
    if(_songLclId == null) return;
    
    Duration totalOpenDuration = _songOpenTime.difference(DateTime.now()) - _totalPausedDuration;

    if(totalOpenDuration < const Duration(seconds: 10))
      return;

    Statistics.registerSongAction(
        _songLclId,
        _songOpenType,
        totalOpenDuration,
        _scrollEvents
    );

    logger.d('UsageStatisticsRegistrator ($_songLclId) song stats saved.');
  }
}
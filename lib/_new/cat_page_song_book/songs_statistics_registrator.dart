import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/account/statistics.dart';
import 'package:harcapp/logger.dart';
import 'package:tuple/tuple.dart';

import '../../_common_classes/time_settings.dart';

enum SongOpenType{init, swipe, search, recommend, random}
class SongsStatisticsRegistrator{

  String _songLclId;
  DateTime _openTime;

  DateTime _lastPausedTime;
  Duration _totalPausedDuration;
  SongOpenType _songOpenType;
  Orientation _orientation;
  List<Tuple4<int, int, int, Orientation>> _scrollEvents;

  Duration get totalOpenDuration => DateTime.now().difference(_openTime) - _totalPausedDuration;

  SongsStatisticsRegistrator(){
    _totalPausedDuration = Duration.zero;
    _scrollEvents = [];
  }

  bool get pause => _lastPausedTime != null;
  set pause(bool value){
    if(_songLclId == null) return;

    if(value)
      _lastPausedTime = DateTime.now();
    else{
      if(_lastPausedTime == null) _totalPausedDuration = Duration.zero;
      else _totalPausedDuration += DateTime.now().difference(_lastPausedTime);
      _lastPausedTime = null;
    }

    logger.d('SongsStatisticsRegistrator ($_songLclId) paused: $value, total paused duration: $_totalPausedDuration');
  }

  void clear() {
    _lastPausedTime = null;
    _totalPausedDuration = Duration.zero;
    _songLclId = null;
    _orientation = null;
    _scrollEvents.clear();
  }

  Future<void> openSong(Song song, SongOpenType songOpenType, Orientation orientation) async {
    //if(_songLclId != null) commit();
    if(!song.isOfficial) return;

    if(!await TimeSettings.isTimeAutomatic){
      logger.d('ModuleStatisticsRegistrator ($_songLclId) stats aborted. Time not automatic.');
      clear();
      return;
    }

    _songLclId = song.fileName;
    _songOpenType = songOpenType;
    _openTime = DateTime.now();
    _orientation = orientation;
    logger.d('SongsStatisticsRegistrator ($_songLclId) song opened.');
  }

  Future<void> registerScroll(int topVisibleLine, int bottomVisibleLine, Orientation orientation) async {
    if(!await TimeSettings.isTimeAutomatic){
      clear();
      return;
    }

    if(_songLclId == null) return;

    if(_lastPausedTime != null) logger.e('SongsStatisticsRegistrator ($_songLclId) scrolled while paused!');

    _scrollEvents.add(Tuple4(totalOpenDuration.inSeconds, topVisibleLine, bottomVisibleLine, orientation));
    logger.d('SongsStatisticsRegistrator ($_songLclId) '
        'scrolled to ($topVisibleLine:$bottomVisibleLine) (${orientation==Orientation.portrait?'portrait':'horizontal'}) '
        'after ${_scrollEvents.last.item1} seconds.');
  }

  Future<void> commit() async {
    if(!await TimeSettings.isTimeAutomatic){
      clear();
      logger.d('SongsStatisticsRegistrator ($_songLclId) stats aborted. Time not automatic.');
      return;
    }

    if(_songLclId == null) return;
    
    Duration totalOpenDuration = DateTime.now().difference(_openTime) - _totalPausedDuration;

    if(totalOpenDuration < const Duration(seconds: 10)) {
      logger.d('SongsStatisticsRegistrator ($_songLclId, $totalOpenDuration) stat aborted. Open time too short.');
      clear();
      return;
    }

    Statistics.registerSongAction(
        _songLclId,
        _openTime,
        _songOpenType,
        totalOpenDuration,
        _scrollEvents,
    );

    logger.d('SongsStatisticsRegistrator ($_songLclId) song stats saved.');
    clear();
  }
}
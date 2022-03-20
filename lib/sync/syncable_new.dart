import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_def.dart';
import 'package:path/path.dart';

import '../_common_classes/sha_pref.dart';
import '../_common_classes/storage.dart';
import '../_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import '../_new/cat_page_guide_book/_stopnie/models/rank_zhp_sim_2022.dart';
import '../_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import '../_new/cat_page_song_book/song_management/album.dart';
import '../_new/cat_page_song_book/song_management/off_song.dart';
import '../_new/cat_page_song_book/song_management/own_song.dart';
import '../logger.dart';

class NothingToSyncException implements Exception{}

mixin SyncNode<T extends SyncGetResp> on SyncableParam{

  static Map<String, List<SyncableParam>> get allBaseNodes => {
    OffSong.syncClassId: OffSong.allOfficial,
    OwnSong.syncClassId: OwnSong.allOwn,
    Album.syncClassId: Album.allOwn,

    RankDef.syncClassId: Rank.allSyncClassIdDef,
    RankZHPSim2022.syncClassId: RankZHPSim2022.all,

    Spraw.syncClassId: Spraw.all,
  };

  void applySyncGetResp(T resp);

}

abstract class SyncableParam{

  List<String> get paramList{
    List<String> parentParams = [paramId];
    SyncableParam _parentParam = parentParam;
    while(_parentParam != null){
      parentParams.insert(0, _parentParam.paramId);
      _parentParam = _parentParam.parentParam;
    }
    return parentParams;
  }

  SyncableParam get parentParam => null;

  String get paramId;

  bool get isSynced;

  const SyncableParam();

  Map<String, dynamic> getUnsyncedMap();

  void changeSyncStateInAll(List<int> stateFrom, int stateTo);

  void setSingleState(String paramId, int state) =>
      SyncableParamSingle_.setState(paramList + [paramId], state);

  Future<dynamic> buildPostReq({bool includeDefaults = false, bool setSyncStateInProgress = false});

  void saveSyncResult(dynamic synced, DateTime lastSync){
    if(this is SyncableParamSingle_) {
      if(synced is! bool) logger.e('Sync problem! Single sync result: $synced');
      SyncableParamSingle_.setState(paramList, synced == true ? SyncableParamSingle_.STATE_SYNCED : SyncableParamSingle_.STATE_ERROR);
    } else if (this is SyncableParamGroup_) {
      if(synced is! Map) logger.e('Sync problem! Group sync result: $synced');
      for (String paramId in synced.keys) {
        (this as SyncableParamGroup_)
            .childParams.firstWhere((param) => param.paramId == paramId)
            .saveSyncResult(synced[paramId], lastSync);
      }
    }
  }

}

class RootSyncable extends SyncableParam{

  @override
  void changeSyncStateInAll(List<int> stateFrom, int stateTo) {}

  @override
  Map<String, dynamic> getUnsyncedMap() => {};

  @override
  bool get isSynced => throw UnimplementedError();

  @override
  Future<dynamic> buildPostReq({bool includeDefaults = false, bool setSyncStateInProgress = false}) async => {};

  @override
  final String paramId;

  const RootSyncable(this.paramId);

}

class SyncableParamSingle extends SyncableParamSingle_{

  @override
  final SyncableParam parentParam;

  @override
  final String paramId;

  final dynamic Function() value_;

  bool Function() isNotSet_;

  @override
  dynamic get value => value_();

  @override
  bool get isNotSet => isNotSet_?.call()??false;

  SyncableParamSingle(this.parentParam, {@required this.paramId, @required this.value_, this.isNotSet_});

}

abstract class SyncableParamSingle_ extends SyncableParam{

  static bool logSyncStateChanges = true;

  static const String paramSepChar = '@';

  static const int STATE_WAITING_DOWNLOAD = 0;
  static const int STATE_NOT_SYNCED = 1;
  static const int STATE_SYNCED = 2;
  static const int STATE_SYNC_IN_PROGRESS = 3;
  static const int STATE_ERROR = 4;

  static const Map<int, String> stateToString = {
    STATE_WAITING_DOWNLOAD: 'STATE_WAITING_DOWNLOAD',
    STATE_NOT_SYNCED: 'STATE_NOT_SYNCED',
    STATE_SYNCED: 'STATE_SYNCED',
    STATE_SYNC_IN_PROGRESS: 'STATE_SYNC_IN_PROGRESS',
    STATE_ERROR: 'STATE_ERROR',
  };

  @override
  bool get isSynced => state == STATE_SYNCED;

  dynamic get value;

  bool get isNotSet;

  String get shaPrefKey => getShaPrefKey(paramList);

  static String getShaPrefKey(List<String> paramList) => ShaPref.SHA_PREF_SYNC_PARAM_(paramList.join(paramSepChar));
  
  bool get hasState => shaPref.exists(shaPrefKey);

  int get state => shaPref.getInt(shaPrefKey, STATE_SYNCED);

  static int getState(List<String> paramList) => shaPref.getInt(getShaPrefKey(paramList), STATE_SYNCED);

  set state(int value) => setState(paramList, value);

  static void setState(List<String> paramList, int state){
    if(logSyncStateChanges)
      logger.i('Sync state change applied: ${paramList.join(', ')}: ${stateToString[state]}.');
    shaPref.setInt(getShaPrefKey(paramList), state);
  }

  void removeShaPrefState(){
    if(logSyncStateChanges)
      logger.i('Sync state change removed: ${paramList.join(', ')}.');
    shaPref.remove(shaPrefKey);
  }

  bool get shaPrefExists => shaPref.exists(shaPrefKey);

  @override
  bool operator == (Object other) => other is SyncableParamSingle && shaPrefKey == other.shaPrefKey;

  @override
  int get hashCode => shaPrefKey.hashCode;

  @override
  Map<String, dynamic> getUnsyncedMap() {
    Map<String, dynamic> result = {};
    if (state != STATE_SYNCED)
      result[paramId] = stateToString[state];

    return result;
  }

  @override
  void changeSyncStateInAll(List<int> stateFrom, int stateTo) {
    if(hasState && stateFrom.contains(state))
      state = stateTo;
  }

  @override
  Future<dynamic> buildPostReq({bool includeDefaults = false, bool setSyncStateInProgress = false}) async {

    int _state = state;

    if(isNotSet || (_state == SyncableParamSingle_.STATE_SYNCED || _state == SyncableParamSingle_.STATE_WAITING_DOWNLOAD))
      throw NothingToSyncException();

    dynamic val = await value;
    if(setSyncStateInProgress)
      state = SyncableParamSingle_.STATE_SYNC_IN_PROGRESS;

    return val;
  }

}

class SyncableParamGroup extends SyncableParamGroup_ {

  @override
  final SyncableParam parentParam;

  @override
  final String paramId;

  @override
  final List<SyncableParam> childParams;

  SyncableParamGroup(this.parentParam, {@required this.paramId, @required this.childParams});

}

abstract class SyncableParamGroup_ extends SyncableParam{

  @override
  bool get isSynced{
    for(SyncableParam param in childParams)
      if(!param.isSynced) return false;
    return true;
  }

  List<SyncableParam> get childParams;

  void setAllSyncState(int state){
    for(SyncableParam param in childParams)
      if(param is SyncableParamGroup)
        param.setAllSyncState(state);
      else if(param is SyncableParamSingle)
        param.state = state;
  }

  @override
  void changeSyncStateInAll(List<int> stateFrom, int stateTo) {
    for(SyncableParam param in childParams)
        param.changeSyncStateInAll(stateFrom, stateTo);
  }

  void clearAllSyncState(){
    for(SyncableParam param in childParams)
      if(param is SyncableParamGroup)
        param.clearAllSyncState();
      else if(param is SyncableParamSingle)
        param.removeShaPrefState();
  }

  @override
  Map<String, dynamic> getUnsyncedMap(){

    Map<String, dynamic> result = {};

    for(SyncableParam param in childParams){
      Map _result = param.getUnsyncedMap();
      if(_result.isNotEmpty) result[paramId] = _result;
    }

    return result;
  }

  @override
  Future<Map<String, dynamic>> buildPostReq({bool includeDefaults = false, bool setSyncStateInProgress = false}) async {

    Map<String, dynamic> map = {};

    for(SyncableParam childParam in childParams) {
      try {
        dynamic data = await childParam.buildPostReq(includeDefaults: includeDefaults, setSyncStateInProgress: setSyncStateInProgress);
        map[childParam.paramId] = data;
      } on NothingToSyncException{
        continue;
      }
    }

    if(map.isEmpty)
      throw NothingToSyncException();

    return map;
  }

}

mixin RemoveSyncItem on SyncableParam{

  static const String paramSep = '@';

  static List<String> all;

  static void addToAll(List<String> paramList){
    all.add(paramList.join(paramSep));
  }

  static void removeFromAll(List<String> paramList){
    all.remove(paramList.join(paramSep));
  }

  /*
  @override
  Future<Map<String, dynamic>> buildPostReq({bool returnAllNotNone = false, bool setSyncStateInProgress = false}) async => {
    'id': paramList.join(paramSep),
    'remove': true
  };
*/

  static String getFileName(List<String> paramList) => paramList.join(paramSep);
  String get _fileName => getFileName(paramList);

  static String getPath(List<String> paramList) => join(getRemoveSyncReqFolderPath, getFileName(paramList));
  String get path => join(getRemoveSyncReqFolderPath, _fileName);

  /*
  void deleteSyncRemoveMark(){
    File file = File(path);
    file.deleteSync(recursive: true);
  }
*/
  void markSyncAsRemoved(){
    File file = File(getPath(paramList));
    file.createSync(recursive: true);
    addToAll(paramList);
  }

  static void readAll(){
    Directory dir = Directory(getRemoveSyncReqFolderPath);
    dir.createSync(recursive: true);
    List<FileSystemEntity> entities = dir.listSync();

    List<String> _all = [];
    for(FileSystemEntity entity in entities){
      String fileName = basename(entity.path);
      _all.add(fileName);
    }

    RemoveSyncItem.all = _all;
  }

}
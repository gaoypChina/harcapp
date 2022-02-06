import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:path/path.dart';
import 'package:pretty_json/pretty_json.dart';

class SyncParamRequestBuilder{

  static Future<Map<String, dynamic>> build(List<SyncableParam> params, bool returnAllNotNone, bool setSyncStateInProgress) async {

    Map<String, dynamic> map = {};

    for(SyncableParam param in params) {

      if(param.isGroup){

        Map<String, dynamic> _map = {};
        for(SyncableItem item in param.paramGroup.items) {
          Map<String, dynamic> apiReq = await build(item.syncParams, returnAllNotNone, setSyncStateInProgress);
          if(apiReq.isEmpty) continue;
          _map[item.objectId] = apiReq;
        }

        if(_map.isNotEmpty)
          map[param.paramGroup.groupClassId] = _map;

        continue;
      }

      SyncableParamSingle item = param.paramSingle;

      int state = item.state;

      bool include;
      if(returnAllNotNone)
        include = item.notNone();
      else
        include = state == SyncableParamSingle.STATE_NOT_SYNCED;;

      if (include) {
        dynamic val = await item.value();
        if (!(val is List && val.isEmpty)) {
          if(setSyncStateInProgress)
            item.state = SyncableParamSingle.STATE_SYNC_IN_PROGRESS;
          map[item.paramId] = val;
        }
      }
    }

    return map;

  }

}

class SyncableParam{

  /*
  Objects of this class may only have one nonnull value: paramSingle, paramList or paramDict.
  */

  bool get isSynced{

    if(isSingle)
      return paramSingle.state == SyncableParamSingle.STATE_SYNCED;

    if(isGroup) {
      for (SyncableEntity item in paramGroup.items)
        if(item is SyncableItem && !item.isSynced) return false;
      return true;
    }

    throw Exception();
  }

  void setAllSyncState(int state){

    if(isSingle)
      paramSingle.state = state;

    if(isGroup)
      for(SyncableEntity item in paramGroup.items)
        if(item is SyncableItem) item.setAllSyncState(state);

  }

  Future<void> changeSyncStateInAll(List<int> stateFrom, int stateTo) async {

    if(isSingle && paramSingle.hasState && stateFrom.contains(paramSingle.state))
      paramSingle.state = stateTo;

    else if(isGroup)
      for(SyncableEntity item in paramGroup.items)
        if(item is SyncableItem) await item.changeSyncStateInAll(stateFrom, stateTo);

  }

  void clearAllSyncState(){

    if(isSingle)
      paramSingle.removeShaPrefState();

    if(isGroup)
      for(SyncableEntity item in paramGroup.items)
        if(item is SyncableItem) item.clearAllSyncState();

  }

  bool get isSingle => paramSingle != null;
  bool get isGroup => paramGroup != null;

  final SyncableParamSingle paramSingle;
  final SyncableParamGroup paramGroup;

  const SyncableParam({this.paramSingle, this.paramGroup});

  static SyncableParam single(
    SyncableItem parent,
    {String paramId,
    Future<dynamic> Function() value,
    @required bool Function() notNone
  }) => SyncableParam(paramSingle: SyncableParamSingle(
    parent.classId,
    parent.objectId,
    paramId,
    value: value,
    notNone: notNone,
  ));

  static SyncableParam group<T extends SyncableEntity>(
      SyncableItem parent,
      {@required List<T> items}
  ) => SyncableParam(
      paramGroup: SyncableParamGroup<T>(
          parent.classId,
          parent.objectId,
          items: items)
  );

}

class SyncableParamSingle{

  static bool logSyncStateChanges = true;

  static const int STATE_WAITING_DOWNLOAD = 0;
  static const int STATE_NOT_SYNCED = 1;
  static const int STATE_SYNCED = 2;
  static const int STATE_SYNC_IN_PROGRESS = 3;

  static const Map<int, String> stateToString = {
    STATE_WAITING_DOWNLOAD: 'STATE_WAITING_DOWNLOAD',
    STATE_NOT_SYNCED: 'STATE_NOT_SYNCED',
    STATE_SYNCED: 'STATE_SYNCED',
    STATE_SYNC_IN_PROGRESS: 'STATE_SYNC_IN_PROGRESS',
  };

  final String classId;
  final String objectId;

  final String paramId;
  final dynamic Function() value;
  final bool Function() notNone;

  const SyncableParamSingle(this.classId, this.objectId, this.paramId, {@required this.value, @required this.notNone});

  String get shaPrefSyncStateKey => ShaPref.SHA_PREF_SYNC_ITEM_PARAM_(classId, objectId, paramId);

  bool get hasState => shaPref.exists(shaPrefSyncStateKey);

  int get state => getState(classId, objectId, paramId);

  static int getState(String classId, String objectId, String paramId){
    int value = shaPref.getInt(ShaPref.SHA_PREF_SYNC_ITEM_PARAM_(classId, objectId, paramId), STATE_SYNCED);
    return value;
  }

  set state(int value) => setState(classId, objectId, paramId, value);

  static void setState(String classId, objectId, paramId, int state){
    if(logSyncStateChanges)
      logger.i('Sync state change applied: $classId, $objectId, $paramId: ${stateToString[state]}.');
    shaPref.setInt(ShaPref.SHA_PREF_SYNC_ITEM_PARAM_(classId, objectId, paramId), state);
  }

  void removeShaPrefState(){
    if(logSyncStateChanges)
      logger.i('Sync state change removed: $classId, $objectId, $paramId.');
    shaPref.remove(shaPrefSyncStateKey);
  }

  bool get shaPrefExists => shaPref.exists(shaPrefSyncStateKey);

  bool operator == (Object other) => other is SyncableParamSingle && shaPrefSyncStateKey == other.shaPrefSyncStateKey;
  int get hashCode => shaPrefSyncStateKey.hashCode;

}

class SyncableParamGroup<T extends SyncableEntity>{

  final String classId;
  final String objectId;
  final List<T> items;

  String get groupClassId => items.isEmpty?null:items[0].classId;

  const SyncableParamGroup(this.classId, this.objectId, {@required this.items});

}

abstract class SyncableEntity{

  /*
  This cannot be merged with SyncableItem.
  Reason: this also has to support RemoveSyncReq, which doesn't have the SyncableItems fields.
   */

  static List<SyncableEntity> get allSyncables {

    List<SyncableEntity> syncables = [];
    syncables.addAll(OffSong.allOfficial);
    syncables.addAll(OwnSong.allOwn);
    syncables.addAll(Album.allOwn);
    //syncables.addAll(Memory.all);

    syncables.addAll(Spraw.all);
    syncables.addAll(Rank.all);
    syncables.addAll(RemoveSyncReq.all);

    return syncables;
  }

  String get classId;
  String get objectId;

  Future<Map<String, dynamic>> getAPIReqItem({bool returnAllNotNone = false, bool setSyncStateInProgress = false});

  bool get isSynced;

}

abstract class SyncableItem<T extends SyncEntityResp> implements SyncableEntity{

  static const String PARAM_LAST_SYNC = 'last_sync';

  List<SyncableParam> get syncParams;

  @override
  bool get isSynced{
    for(SyncableParam syncParam in syncParams)
      if (!syncParam.isSynced) return false;

    return true;
  }

  Map<String, dynamic> getUnsyncedMap(){

    Map<String, dynamic> result = {};

    for(SyncableParam param in syncParams)
      if(param.isGroup) {
        Map<String, dynamic> _result = {};
        for(SyncableItem item in param.paramGroup.items)
          _result[item.objectId] = item.getUnsyncedMap();
        if(_result.isNotEmpty) result[param.paramGroup.groupClassId] = _result;
      }else {
        if(param.paramSingle.state != SyncableParamSingle.STATE_SYNCED)
          result[param.paramSingle.paramId] = SyncableParamSingle.stateToString[param.paramSingle.state];
      }
      return result;
  }

  void setSyncState(Map<String, int> data){
    SyncableParamSingle.logSyncStateChanges = false;
    logger.i('Sync state change applied for params in ($classId: $objectId) as follows: '
        '${prettyJson({ for(String param in data.keys) param: SyncableParamSingle.stateToString[data[param]] })}');
    for(String paramId in data.keys)
      SyncableParamSingle.setState(classId, objectId, paramId, data[paramId]);
    SyncableParamSingle.logSyncStateChanges = true;
  }

  @override
  Future<Map<String, dynamic>> getAPIReqItem({bool returnAllNotNone = false, bool setSyncStateInProgress = false}) async {
    if(setSyncStateInProgress) SyncableParamSingle.logSyncStateChanges = false;
    Map apiReq = await SyncParamRequestBuilder.build(syncParams, returnAllNotNone, setSyncStateInProgress);

    if(setSyncStateInProgress && apiReq.isNotEmpty)
      logger.i('Sync state ${SyncableParamSingle.stateToString[SyncableParamSingle.STATE_SYNC_IN_PROGRESS]} '
          'applied for params in ($classId: $objectId) as follows: '
          '${prettyJson(apiReq)}');

    if(setSyncStateInProgress) SyncableParamSingle.logSyncStateChanges = true;

    return apiReq;
  }

  Future<void> setSyncStateRemove() async {

    await synchronizer.reloadSyncables();

    RemoveSyncReq removeSyncReq = RemoveSyncReq.create(classId, objectId);
    RemoveSyncReq.addToAll(removeSyncReq);
  }

  void clearAllSyncState(){
    for(SyncableParam syncParam in syncParams)
      syncParam.clearAllSyncState();
  }

  Future<void> changeSyncStateInAll(List<int> stateFrom, int stateTo) async {
    for(SyncableParam syncParam in syncParams)
      await syncParam.changeSyncStateInAll(stateFrom, stateTo);
  }

  void setAllSyncState(int state){
    SyncableParamSingle.logSyncStateChanges = false;
    logger.i('Sync state change applied for all params in ($classId: $objectId) to ${SyncableParamSingle.stateToString[state]}.');
    for(SyncableParam syncParam in syncParams)
      syncParam.setAllSyncState(state);
    SyncableParamSingle.logSyncStateChanges = true;
  }

  Future<void> syncPost(List<String> syncParams)async{
    if(syncParams==null)
      setAllSyncState(SyncableParamSingle.STATE_NOT_SYNCED);
    else
      setSyncState({for(String param in syncParams) param: SyncableParamSingle.STATE_NOT_SYNCED});

    await synchronizer.post();
  }

  void saveSyncResult(Map<String, dynamic> resData, DateTime lastSync){
    Map<String, int> syncedParamsMap = {for (String param in resData.keys) param: SyncableParamSingle.STATE_SYNCED};
    setSyncState(syncedParamsMap);

    this.lastSync = lastSync;
  }

  static DateTime getLastSync_(String classId, String objectId){
    String code = shaPref.getString(ShaPref.SHA_PREF_SYNC_ITEM_LAST_SYNC_(classId, objectId), null);
    return code==null?null:DateTime.parse(code);
  }

  DateTime get lastSync => getLastSync_(classId, objectId);

  static void setLastSync_(String classId, String objectId, DateTime dateTime){
    shaPref.setString(ShaPref.SHA_PREF_SYNC_ITEM_LAST_SYNC_(classId, objectId), dateTime==null?null:dateTime.toIso8601String());
  }

  set lastSync(DateTime dateTime) => setLastSync_(classId, objectId, dateTime);

  void applySyncResp(T resp);

  //void delete();
}

class RemoveSyncReq extends SyncableEntity{

  static const String NAME_SEPARATPOR = '\$';

  static List<RemoveSyncReq> all;
  static Map<String, RemoveSyncReq> _allMap;
  static RemoveSyncReq get(String classGroupId, String objectId) => _allMap[getFileName(classGroupId, objectId)];

  static void addToAll(RemoveSyncReq removeSyncReq){
    all.add(removeSyncReq);
    _allMap[removeSyncReq.fileName] = removeSyncReq;
  }

  static void removeFromAll(RemoveSyncReq removeSyncReq){
    all.remove(removeSyncReq);
    _allMap.remove(removeSyncReq.fileName);
  }

  String _classGroupId;
  String _objectId;

  String get classId => _classGroupId;
  String get objectId => _objectId;

  RemoveSyncReq(this._classGroupId, this._objectId);

  @override
  Future<Map<String, dynamic>> getAPIReqItem({bool returnAllNotNone = false, bool setSyncStateInProgress = false}) async => {
    'id': objectId,
    'remove': true
  };

  static String getFileName(String classGroupId, String objectId) => classGroupId + NAME_SEPARATPOR + objectId;
  String get fileName => getFileName(classId, objectId);

  static String getPath(String classGroupId, String objectId) => getRemoveSyncReqFolderPath + getFileName(classGroupId, objectId);
  String get path => getRemoveSyncReqFolderPath + fileName;

  void delete(){

    removeFromAll(this);

    File file = File(path);
    file.deleteSync(recursive: true);
  }

  static RemoveSyncReq create(String classGroupId, String objectId){
    File file = File(getPath(classGroupId, objectId));
    file.createSync(recursive: true);
    return RemoveSyncReq(classGroupId, objectId);
  }

  static void readAll(){
    Directory dir = Directory(getRemoveSyncReqFolderPath);
    dir.createSync(recursive: true);
    List<FileSystemEntity> entities = dir.listSync();

    List<RemoveSyncReq> _all = [];
    Map<String, RemoveSyncReq> _allMap = {};
    for(FileSystemEntity entity in entities){

      String fileName = basename(entity.path);
      List<String> elements = fileName.split(NAME_SEPARATPOR);

      RemoveSyncReq removeSyncReq = RemoveSyncReq(elements[0], elements[1]);

      _all.add(removeSyncReq);
      _allMap[fileName] = removeSyncReq;
    }

    RemoveSyncReq.all = _all;
    RemoveSyncReq._allMap = _allMap;
  }

  @override
  bool get isSynced => false; // if exists, then it should be synced;
}
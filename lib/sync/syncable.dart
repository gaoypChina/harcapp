import 'dart:async';
import 'dart:io';

import 'package:harcapp/_common_classes/org/org_handler.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/article.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:path/path.dart';

import '../_common_classes/sha_pref.dart';
import '../_common_classes/storage.dart';
import '../_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import '../_new/cat_page_guidebook_development/development/stopnie/models/rank_zhp_sim_2022.dart';
import '../_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import '../_new/cat_page_song_book/settings/song_book_settings.dart';
import '../_new/cat_page_song_book/song_management/album.dart';
import '../_new/cat_page_song_book/song_management/off_song.dart';
import '../_new/cat_page_song_book/song_management/own_song.dart';
import '../logger.dart';


class NothingToSyncException implements Exception{}

class InvalidParamIdException implements Exception{

  final String paramId;
  const InvalidParamIdException(this.paramId);

  @override
  String toString() => "Invalid paramId: '$paramId'";
}

mixin SyncGetRespNode<T extends SyncGetResp> on SyncableParam{
  
  static SyncableParam get articleNode => SyncableParamGroup(
    null,
    paramId: Article.syncClassId,
    childParams: ArticleSyncData.initialized?ArticleSyncData.all:[],
  );
  
  static SyncableParam get offSongNode => SyncableParamGroup(
    null,
    paramId: OffSong.syncClassId,
    childParams: OffSong.initialized?OffSong.allOfficial:[],
  );

  static SyncableParam get ownSongNode => SyncableParamGroup(
    null,
    paramId: OwnSong.syncClassId,
    childParams: OwnSong.initialized?OwnSong.allOwn:[],
  );

  static SyncableParam get ownAlbumNode => SyncableParamGroup(
      null,
      paramId: OwnAlbum.syncClassId,
      childParams: OwnAlbum.initialized?OwnAlbum.all:[],
  );

  static SyncableParam get rankDefNode => SyncableParamGroup(
      null,
      paramId: RankDef.syncClassId,
      childParams: Rank.allSyncClassIdDef,
  );

  static SyncableParam get rankZHPSim2022Node => SyncableParamGroup(
      null,
      paramId: RankZHPSim2022.syncClassId,
      childParams: RankZHPSim2022.all,
  );

  static SyncableParam get sprawNode => SyncableParamGroup(
      null,
      paramId: Spraw.syncClassId,
      childParams: Spraw.all
  );

  static SyncableParam get tropNode => SyncableParamGroup(
      null,
      paramId: Trop.syncClassId,
      childParams: Trop.initialized?Trop.allOwn:[]
  );

  static List<SyncableParam> get all => [
    OrgHandler(),
    AppSettings(),
    SongBookSettings(),

    articleNode,
    offSongNode,
    ownSongNode,
    ownAlbumNode,
    ToLearnAlbum.loaded,

    rankDefNode,
    rankZHPSim2022Node,

    sprawNode,
    tropNode,
  ];

  FutureOr<void> applySyncGetResp(T resp);

}

abstract class SyncableParam{

  // Returns the nested param id path which uniquely identifies the syncable
  // parameter.
  List<String> get paramIdPath{

    // This is one of the most stupid bugs in dart! If a class implements an
    // interface with implemented methods, the implementation of these methods
    // will be ignored!
    // Solution:
    // Copy the body of this method into:
    // `SyncableParamSingleMixin` and `SyncableParamGroupMixin`.

    List<String> parentParamIds = [paramId];
    SyncableParam? parent = parentParam;
    while(parent != null){
      parentParamIds.insert(0, parent.paramId);
      parent = parent.parentParam;
    }
    return parentParamIds;
  }

  List<SyncableParam> get paramPath{

    // This is one of the most stupid bugs in dart! If a class implements an
    // interface with implemented methods, the implementation of these methods
    // will be ignored!
    // Solution:
    // Copy the body of this method into:
    // `SyncableParamSingleMixin` and `SyncableParamGroupMixin`.

    List<SyncableParam> parentParamIds = [this];
    SyncableParam? parent = parentParam;
    while(parent != null){
      parentParamIds.insert(0, parent);
      parent = parent.parentParam;
    }
    return parentParamIds;
  }

  // Some syncable parameter containing this parameter. If null, it means this
  // parameter is the root (SyncNode).
  SyncableParam? get parentParam;

  String get debugClassId;

  String get paramId;

  bool get isSynced;

  Map<String, dynamic> getUnsyncedMap();

  void changeSyncStateInAll(List<int> stateFrom, int stateTo);

  Future<dynamic> buildPostReq({bool includeDefaults = false, bool setSyncStateInProgress = false});

  void saveSyncResult(dynamic synced, DateTime? lastSync);

}

mixin SyncableParamSingleMixin implements SyncableParam{

  static bool logSyncStateChanges = true;

  static const String paramSepChar = '@';

  static const int stateWaitingDownload = 0;
  static const int stateNotSynced = 1;
  static const int stateSynced = 2;
  static const int stateSyncInProgress = 3;
  static const int stateError = 4;

  static const Map<int, String> stateToString = {
    stateWaitingDownload: 'STATE_WAITING_DOWNLOAD',
    stateNotSynced: 'STATE_NOT_SYNCED',
    stateSynced: 'STATE_SYNCED',
    stateSyncInProgress: 'STATE_SYNC_IN_PROGRESS',
    stateError: 'STATE_ERROR',
  };

  @override
  bool get isSynced => state == stateSynced;

  dynamic get value;

  // If true, it means this param has not been changed from it's default value.
  // In such case there is no need to sync it.
  bool get isNotSet;

  // ShaPref key pointing to the stored syncState value.
  String get shaPrefKey => getShaPrefKey(paramIdPath);

  static String getShaPrefKey(List<String?> paramList) => ShaPref.SHA_PREF_SYNC_PARAM_(paramList.join(paramSepChar));

  bool get hasState => ShaPref.exists(shaPrefKey);

  int get state => ShaPref.getInt(shaPrefKey, stateSynced);

  static int getState(List<String> paramList) => ShaPref.getInt(getShaPrefKey(paramList), stateSynced);

  set state(int value) => setState(paramPath, value);

  static void setState(List<SyncableParam> paramList, int state){
    if(logSyncStateChanges)
      logger.i('Sync state change applied: ${paramList.map((p) => '${p.debugClassId}: ${p.paramId}').join(', ')} :: ${stateToString[state]}.');
    ShaPref.setInt(getShaPrefKey(paramList.map((p) => p.paramId).toList()), state);
  }

  void removeShaPrefState(){
    if(logSyncStateChanges)
      logger.i('Sync state change removed: ${paramIdPath.join(', ')}.');
    ShaPref.remove(shaPrefKey);
  }

  bool get shaPrefExists => ShaPref.exists(shaPrefKey);

  @override
  bool operator == (Object other) => other is SyncableParamSingle && shaPrefKey == other.shaPrefKey;

  @override
  int get hashCode => shaPrefKey.hashCode;

  @override
  Map<String, dynamic> getUnsyncedMap() {
    Map<String, dynamic> result = {};
    if (!isNotSet && state != stateSynced)
      result[paramId] = {"sync_state": stateToString[state], "isNotSet": isNotSet};

    return result;
  }

  @override
  void changeSyncStateInAll(List<int> stateFrom, int stateTo) {
    if(hasState && stateFrom.contains(state))
      state = stateTo;
  }

  @override
  Future<dynamic> buildPostReq({bool includeDefaults = false, bool setSyncStateInProgress = false}) async {

    if(isNotSet || (state == stateSynced || state == stateWaitingDownload))
      throw NothingToSyncException();

    dynamic val = await value;
    if(setSyncStateInProgress)
      state = stateSyncInProgress;

    return val;
  }

  @override
  List<String> get paramIdPath{
    // Copied from `SyncableParam`.
    List<String> parentParamIds = [paramId];
    SyncableParam? parent = parentParam;
    while(parent != null){
      parentParamIds.insert(0, parent.paramId);
      parent = parent.parentParam;
    }
    return parentParamIds;
  }

  @override
  List<SyncableParam> get paramPath{
    // Copied from `SyncableParam`.
    List<SyncableParam> parentParamIds = [this];
    SyncableParam? parent = parentParam;
    while(parent != null){
      parentParamIds.insert(0, parent);
      parent = parent.parentParam;
    }
    return parentParamIds;
  }

  @override
  void saveSyncResult(synced, DateTime? lastSync) {
    if(synced is! bool) logger.e('Sync problem! Single sync result: $synced');
    setState(paramPath, synced == true ? stateSynced : stateError);
  }

}

class SyncableParamSingle with SyncableParamSingleMixin{

  @override
  final SyncableParam parentParam;

  @override
  final String paramId;

  @override
  String get debugClassId => '__singleParam__';

  final dynamic Function() value_;

  bool Function()? isNotSet_;

  @override
  dynamic get value => value_();

  @override
  bool get isNotSet => isNotSet_?.call()??false;

  SyncableParamSingle(
      this.parentParam,
      { required this.paramId,
        required dynamic Function() value,
        bool Function()? isNotSet
      }):
        value_ = value,
        isNotSet_ = isNotSet;

}

mixin SyncableParamGroupMixin implements SyncableParam{

  @override
  bool get isSynced{
    for(SyncableParam param in childParams)
      if(!param.isSynced) return false;
    return true;
  }

  List<SyncableParam> get childParams;

  void setAllSyncState(int state){
    for(SyncableParam param in childParams)
      if(param is SyncableParamGroupMixin)
        param.setAllSyncState(state);
      else if(param is SyncableParamSingleMixin)
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
      Map result0 = param.getUnsyncedMap();
      if(result0.isNotEmpty) result[paramId] = result0;
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

  @override
  List<String> get paramIdPath{
    // Copied from `SyncableParam`.
    List<String> parentParamIds = [paramId];
    SyncableParam? parent = parentParam;
    while(parent != null){
      parentParamIds.insert(0, parent.paramId);
      parent = parent.parentParam;
    }
    return parentParamIds;
  }

  @override
  List<SyncableParam> get paramPath{
    // Copied from `SyncableParam`.
    List<SyncableParam> parentParams = [this];
    SyncableParam? parent = parentParam;
    while(parent != null){
      parentParams.insert(0, parent);
      parent = parent.parentParam;
    }
    return parentParams;
  }

  @override
  void saveSyncResult(synced, DateTime? lastSync) {
    if(synced is! Map) logger.e('Sync problem! Group sync result: $synced');
    for (String paramId in synced.keys) {

      if(synced[paramId] == RemoveSyncItem.removedRespCode)
        RemoveSyncItem.resolve((paramIdPath + [paramId]).join(RemoveSyncItem.paramSep));
      else
        childParams.firstWhere((param) => param.paramId == paramId)
            .saveSyncResult(synced[paramId], lastSync);
    }
  }

  void setSingleState(String paramId, int state) {
    try{
      // TODO: it used to be `SyncableParamSingleMixin.setState(paramPath + [this], state);`
      SyncableParamSingleMixin.setState(
          paramPath + [childParams.firstWhere((param) => param.paramId == paramId)],
          state
      );
    } on StateError{
      throw InvalidParamIdException(paramId);
    }
  }

}

class SyncableParamGroup with SyncableParamGroupMixin {

  @override
  SyncableParam? parentParam;

  @override
  final String paramId;

  @override
  String get debugClassId => '__groupParam__';

  @override
  final List<SyncableParam> childParams;

  SyncableParamGroup(this.parentParam, {required this.paramId, required this.childParams});

}

mixin RemoveSyncItem<T> on SyncableParam{

  static const String removeReqParam = 'remove';
  static const String removedRespCode = 'removed';
  static const String paramSep = '@';

  static List<String>? all;

  static void addToAll(List<String?> paramList){
    all!.add(paramList.join(paramSep));
  }

  static void removeFromAll(List<String> paramList){
    all!.remove(paramList.join(paramSep));
  }

  /*
  @override
  Future<Map<String, dynamic>> buildPostReq({bool returnAllNotNone = false, bool setSyncStateInProgress = false}) async => {
    'id': paramList.join(paramSep),
    'remove': true
  };
*/

  static String getFileName(List<String?> paramList) => paramList.join(paramSep);
  String get _fileName => getFileName(paramIdPath);

  static String getPath(List<String?> paramList) => join(getRemoveSyncReqFolderPath, getFileName(paramList));
  String get path => join(getRemoveSyncReqFolderPath, _fileName);

  static void resolve(String fileName){
    File file = File(join(getRemoveSyncReqFolderPath, fileName));
    file.deleteSync(recursive: true);
    all!.remove(fileName);
  }

  void markSyncAsRemoved(){
    File file = File(getPath(paramIdPath));
    file.createSync(recursive: true);
    addToAll(paramIdPath);
    logger.d('Marked ${getFileName(paramIdPath)} for removal.');
  }

  static void readAll(){
    Directory dir = Directory(getRemoveSyncReqFolderPath);
    dir.createSync(recursive: true);
    List<FileSystemEntity> entities = dir.listSync();

    List<String> all = [];
    for(FileSystemEntity entity in entities){
      String fileName = basename(entity.path);
      all.add(fileName);
    }

    RemoveSyncItem.all = all;
  }

}
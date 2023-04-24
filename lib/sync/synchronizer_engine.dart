import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/sync.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_song_book/song_loader.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:semaphore/semaphore.dart';

import '../_common_classes/storage.dart';
import '../logger.dart';

SynchronizerEngine synchronizer = SynchronizerEngine();

enum SyncOper{get, post}

class SynchronizerListener{

  final void Function(SyncOper)? onStart;
  final void Function(SyncOper)? onEnd;

  const SynchronizerListener({this.onStart, this.onEnd});

  dispose() => synchronizer.removeListener(this);

}

class SynchronizerEngine{

  static bool get syncOn => ShaPref.getBool(ShaPref.SHA_PREF_SYNC_ON, true);
  static set syncOn(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_SYNC_ON, value);

  static set lastSyncTimeLocal(DateTime? dateTime){
    if(dateTime == null) ShaPref.remove(ShaPref.SHA_PREF_SYNC_LAST_SYNC);
    else ShaPref.setString(ShaPref.SHA_PREF_SYNC_LAST_SYNC, dateTime.toIso8601String());
  }
  static DateTime? get lastSyncTimeLocal{
    String? code = ShaPref.getStringOrNull(ShaPref.SHA_PREF_SYNC_LAST_SYNC);
    return code==null?null:DateTime.parse(code);
  }

  final semaphore = LocalSemaphore(10000000);

  static const Duration aggregateTextInputDuration = Duration(seconds: 7);
  static const Duration aggregateChordChangeDuration = Duration(seconds: 5);

  final aggregateDelaySemaphore = LocalSemaphore(10000000);
  static int currAggregateDelayIndex = 0;

  final List<SynchronizerListener?> _listeners = [];
  SyncOper? _runningOper;
  late bool _runPostAfterFinish;
  late bool _runGetAfterFinish;

  bool get isRunning => _runningOper != null;
  SyncOper? get runningOper => _runningOper;

  SynchronizerEngine(){
    _runningOper = null;
    _runPostAfterFinish = false;
    _runGetAfterFinish = false;
  }

  void addListener(SynchronizerListener? listener) => _listeners.add(listener);
  void removeListener(SynchronizerListener? listener) => _listeners.remove(listener);

  Future<bool> _callStart(SyncOper oper)async{

    await semaphore.acquire();

    debugPrint('callStart: $oper,'
        '\t_runningOper: $_runningOper,'
        '\t_runGetAfterFinish: $_runGetAfterFinish,'
        '\t_runPostAfterFinish: $_runPostAfterFinish');

    if(isRunning){
      if(oper == SyncOper.get) _runGetAfterFinish = true;
      else if(oper == SyncOper.post) _runPostAfterFinish = true;
      semaphore.release();
      return false;
    }else
      _runningOper = oper;

    semaphore.release();

    for(SynchronizerListener? listener in _listeners)
      if(listener!.onStart != null) listener.onStart!(oper);

    return true;
  }

  Future<void> _callEnd(SyncOper oper)async{

    await semaphore.acquire();

    debugPrint('callEnd,'
        '\t_runningOper: $_runningOper,'
        '\t_runGetAfterFinish: $_runGetAfterFinish,'
        '\t_runPostAfterFinish: $_runPostAfterFinish');

    if(_runGetAfterFinish){
      _runGetAfterFinish = false;
      _runningOper = null;
      semaphore.release();

      await _get();
      return;
    }

    if(_runPostAfterFinish){
      _runPostAfterFinish = false;
      _runningOper = null;
      semaphore.release();

      await _post();
      return;
    }

    _runningOper = null;
    semaphore.release();

    for(SynchronizerListener? listener in _listeners)
      listener!.onEnd?.call(oper);
  }

  Future<bool?> _post({bool? dumpReplaceExisting}) async {

    bool go = await _callStart(SyncOper.post);
    if(!go) return null;

    await synchronizer.reloadSyncables();
    bool? result;
    await ApiSync.postAndSave(
      dumpReplaceExisting: dumpReplaceExisting,
      onSuccess: () => result = true,
      onError: (response) => result = false
    );

    await _callEnd(SyncOper.post);
    return result;
  }

  Future<bool?> _get() async {
    bool go = await _callStart(SyncOper.get);
    if(!go) return null;

    await synchronizer.reloadSyncables();
    bool? result;

    await ApiSync.getAndSave(
      onSuccess: () => result = true,
      onError: () => result = false,
    );

    await _callEnd(SyncOper.get);
    return result;
  }

  Future<bool> isAllSynced() async {
    await synchronizer.reloadSyncables();

    for(SyncableParam param in SyncGetRespNode.all)
      if(!param.isSynced) return false;

    return !Directory(getRemoveSyncReqFolderPath).existsSync()
        || Directory(getRemoveSyncReqFolderPath).listSync(recursive: true).isEmpty;
  }

  Future<Map<String?, dynamic>> allUnsynced() async {
    await synchronizer.reloadSyncables();

    Map<String?, dynamic> result = {};

    for(SyncableParam param in SyncGetRespNode.all) {
      Map<String?, dynamic> unsyncedMap = param.getUnsyncedMap();
      if (unsyncedMap.isNotEmpty) result[param.paramId] = unsyncedMap;
    }
    return result;

  }

  static Future<void> setAllSyncState(int state) async {
    await synchronizer.reloadSyncables();

    for(SyncableParam param in SyncGetRespNode.all)
      if(param is SyncableParamGroupMixin)
        param.setAllSyncState(state);
      else if(param is SyncableParamSingleMixin)
        param.state = state;
  }

  static Future<void> changeSyncStateInAll(List<int> stateFrom, int stateTo) async {
    await synchronizer.reloadSyncables();
    for(SyncableParam param in SyncGetRespNode.all)
      param.changeSyncStateInAll(stateFrom, stateTo);
  }

  Future<bool> reloadSyncables({bool force = false}) async {
    bool result = false;
    if(force || !OffSong.initialized) {
      await songLoader.run(awaitFinish: true);
      result = true;
    }

    if(force || !Trop.initialized) {
      await Trop.init();
      result = true;
    }

    if(force || RemoveSyncItem.all == null){
      RemoveSyncItem.readAll();
      result = true;
    }

    return result;
  }

  Future<bool?> post({bool forceSync = false, bool? dumpReplaceExisting, Duration? aggregateDelay}) async {

    if(!await isNetworkAvailable()) {
      logger.i('Sync post aborted - no network available.');
      return false;
    }

    if(!AccountData.loggedIn) {
      logger.i('Sync post aborted - not logged in.');
      return false;
    }

    if(!SynchronizerEngine.syncOn && !forceSync) {
      logger.i('Sync post aborted - sync not turned on.');
      return false;
    }

    if(!AccountData.emailConf) {
      logger.i('Sync post aborted - email not confirmed.');
      return false;
    }

    await aggregateDelaySemaphore.acquire();
    int? thisAggregateDelayIndex;
    if(aggregateDelay != null)
      thisAggregateDelayIndex = ++currAggregateDelayIndex;
    aggregateDelaySemaphore.release();

    if(aggregateDelay != null)
      await Future.delayed(aggregateDelay);

    await aggregateDelaySemaphore.acquire();
    if(aggregateDelay != null && thisAggregateDelayIndex != currAggregateDelayIndex) {
      aggregateDelaySemaphore.release();
      return false;
    }
    aggregateDelaySemaphore.release();

    return await _post(dumpReplaceExisting: dumpReplaceExisting);
  }

  Future<bool?> get({bool forceSync = false}) async {

    if(!await isNetworkAvailable()) {
      logger.i('Sync get aborted - no network available.');
      return false;
    }

    if(!AccountData.loggedIn) {
      logger.i('Sync get aborted - not logged in.');
      return false;
    }

    if(!SynchronizerEngine.syncOn && !forceSync) {
      logger.i('Sync get aborted - sync not turned on.');
      return false;
    }

    if(!AccountData.emailConf) {
      logger.i('Sync get aborted - email not confirmed.');
      return false;
    }

    return await _get();
  }
}

import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/_new/api/sync.dart';
import 'package:harcapp/_new/cat_page_song_book/song_loader.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:semaphore/semaphore.dart';

import '../logger.dart';

SynchronizerEngine synchronizer = SynchronizerEngine();

enum SyncOper{GET, POST}

class SynchronizerListener{

  final void Function(SyncOper) onStart;
  final void Function(SyncOper) onEnd;

  const SynchronizerListener({this.onStart, this.onEnd});

  dispose() => synchronizer.removeListener(this);

}

class SynchronizerEngine{

  static bool get syncOn => shaPref.getBool(ShaPref.SHA_PREF_SYNC_ON, true);
  static set syncOn(bool value) => shaPref.setBool(ShaPref.SHA_PREF_SYNC_ON, value);

  static set lastSyncTimeLocal(DateTime dateTime){
    if(dateTime == null) shaPref.remove(ShaPref.SHA_PREF_SYNC_LAST_SYNC);
    else shaPref.setString(ShaPref.SHA_PREF_SYNC_LAST_SYNC, dateTime.toIso8601String());
  }
  static DateTime get lastSyncTimeLocal{
    String code = shaPref.getString(ShaPref.SHA_PREF_SYNC_LAST_SYNC, null);
    return code==null?null:DateTime.parse(code);
  }

  final semaphore = LocalSemaphore(10000000);

  static const Duration aggregateTextInputDuration = Duration(seconds: 7);
  static const Duration aggregateChordChangeDuration = Duration(seconds: 5);

  final aggregateDelaySemaphore = LocalSemaphore(10000000);
  static int currAggregateDelayIndex = 0;

  final List<SynchronizerListener> _listeners = [];
  SyncOper _runningOper;
  bool _runPostAfterFinish;
  bool _runGetAfterFinish;

  bool get isRunning => _runningOper != null;
  SyncOper get runningOper => _runningOper;

  SynchronizerEngine(){
    _runningOper = null;
    _runPostAfterFinish = false;
    _runGetAfterFinish = false;
  }

  void addListener(SynchronizerListener listener) => _listeners.add(listener);
  void removeListener(SynchronizerListener listener) => _listeners.remove(listener);

  Future<bool> _callStart(SyncOper oper)async{

    await semaphore.acquire();

    debugPrint('callStart: $oper,'
        '\t_runningOper: $_runningOper,'
        '\t_runGetAfterFinish: $_runGetAfterFinish,'
        '\t_runPostAfterFinish: $_runPostAfterFinish');

    if(isRunning){
      if(oper == SyncOper.GET) _runGetAfterFinish = true;
      else if(oper == SyncOper.POST) _runPostAfterFinish = true;
      semaphore.release();
      return false;
    }else
      _runningOper = oper;

    semaphore.release();

    for(SynchronizerListener listener in _listeners)
      if(listener.onStart != null) listener.onStart(oper);

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

    for(SynchronizerListener listener in _listeners)
      listener.onEnd?.call(oper);
  }

  Future<bool> _post({bool dumpReplaceExisting}) async {

    bool go = await _callStart(SyncOper.POST);
    if(!go) return null;

    await synchronizer.reloadSyncables();
    bool result;
    await ApiSync.postAndSave(
      syncables: SyncableEntity.allSyncables,
      dumpReplaceExisting: dumpReplaceExisting,
      onSuccess: () => result = true,
      onError: (response) => result = false
    );

    await _callEnd(SyncOper.POST);
    return result;
  }

  Future<bool> _get() async {
    bool go = await _callStart(SyncOper.GET);
    if(!go) return null;

    await synchronizer.reloadSyncables();
    bool result;

    await ApiSync.getAndSave(
      onSuccess: () => result = true,
      onError: () => result = false,
    );

    await _callEnd(SyncOper.GET);
    return result;
  }

  Future<bool> isAllSynced() async {
    await synchronizer.reloadSyncables();
    for(SyncableEntity syncable in SyncableEntity.allSyncables)
      if(!syncable.isSynced)
        return false;

    return true;
  }

  Future<Map<String, dynamic>> allUnsynced() async {

    Map<String, dynamic> result = {};

    for(SyncableEntity syncable in SyncableEntity.allSyncables)

      if(!syncable.isSynced) {

        if(!result.containsKey(syncable.classId)) result[syncable.classId] = {};
        if(!result[syncable.classId].containsKey(syncable.objectId)) result[syncable.classId][syncable.objectId] = {};

        if(syncable is RemoveSyncReq)
          result[syncable.classId][syncable.objectId]['remove'] = true;
        else if(syncable is SyncableItem) {
          Map<String, dynamic> unsyncedMap = syncable.getUnsyncedMap();
          if(unsyncedMap.isNotEmpty) result[syncable.classId][syncable.objectId] = unsyncedMap;
        }

      }
    return result;
  }

  static void setAllSyncState(int state){
    synchronizer.reloadSyncables();
    for(SyncableEntity syncable in SyncableEntity.allSyncables)
      if(syncable is SyncableItem)
        syncable.setAllSyncState(state);
  }

  static Future<void> changeSyncStateInAll(List<int> stateFrom, int stateTo) async {
    await synchronizer.reloadSyncables();
    for(SyncableEntity syncable in SyncableEntity.allSyncables)
      if(syncable is SyncableItem)
        await syncable.changeSyncStateInAll(stateFrom, stateTo);
  }

  Future<bool> reloadSyncables() async {
    bool result = false;
    if(OffSong.allOfficial == null) {
      await songLoader.run();
      result = true;
    }

    if(RemoveSyncReq.all == null){
      RemoveSyncReq.readAll();
      result = true;
    }

    return result;
  }

  Future<bool> post({bool forceSync = false, bool dumpReplaceExisting, Duration aggregateDelay}) async {

    if(!await isNetworkAvailable()) {
      logger.i('Sync post aborted - no network available.');
      return false;
    }

    if(!AccSecData.loggedIn) {
      logger.i('Sync post aborted - not logged in.');
      return false;
    }

    if(!SynchronizerEngine.syncOn && !forceSync) {
      logger.i('Sync post aborted - sync not turned on.');
      return false;
    }

    if(!AccSecData.emailConf) {
      logger.i('Sync post aborted - email not confirmed.');
      return false;
    }

    await aggregateDelaySemaphore.acquire();
    int thisAggregateDelayIndex;
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

  Future<bool> get({bool forceSync = false}) async {

    if(!await isNetworkAvailable()) {
      logger.i('Sync get aborted - no network available.');
      return false;
    }

    if(!AccSecData.loggedIn) {
      logger.i('Sync get aborted - not logged in.');
      return false;
    }

    if(!SynchronizerEngine.syncOn && !forceSync) {
      logger.i('Sync get aborted - sync not turned on.');
      return false;
    }

    if(!AccSecData.emailConf) {
      logger.i('Sync get aborted - email not confirmed.');
      return false;
    }

    return await _get();
  }
}
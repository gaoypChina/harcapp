import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/logger.dart';
import 'package:semaphore/semaphore.dart';

abstract class SingleComputer<TErr, TListener extends SingleComputerListener<TErr?>>{

  final checkRunningSemaphore = LocalSemaphore(1);
  final runningSemaphore = LocalSemaphore(1);

  @protected
  String get computerName;

  @protected
  late List<TListener> listeners;

  late List<TListener> _listenersToRemove;

  late bool _runRequested;
  late bool _running;
  late Completer completer;
  TErr? _errorCalled;

  bool get running => _runRequested || _running;

  SingleComputer(){
    listeners = [];
    _listenersToRemove = [];
    _runRequested = false;
    _running = false;
    _errorCalled = null;
  }

  void addListener(TListener listener) => listeners.add(listener);
  void removeListener(TListener listener){

    _listenersToRemove.add(listener);

  }

  /// Function returns TRUE if it wasn't already running;
  /// Function returns FALSE if it was already running (in which case it waits);
  Future<bool> run({bool awaitFinish = false}) async {

    // This param is used to mark the single computer as running before checking
    // if it was already running before using the `running` parameter.
    _runRequested = true;

    // Exclude others from messing with the `running` param while checking and settings it's value.
    await checkRunningSemaphore.acquire();

    logger.i('Single computer $computerName called. ${_running?'Computer was already running - run merged.':'Computer was idle - run started.'}');

    _runRequested = false;
    if(running){
      checkRunningSemaphore.release();

      // This is here to wait until the computer finishes and call the onEnd listeners.
      await runningSemaphore.acquire();

      for(TListener listener in listeners)
        if(!_listenersToRemove.contains(listener))
          listener.onEnd?.call(null, false);

      _removeListeners();

      runningSemaphore.release();
      if(awaitFinish) await completer.future;
      return false;
    }

    completer = Completer();
    _running = true;

    await runningSemaphore.acquire();

    checkRunningSemaphore.release();

    for(TListener listener in listeners)
      if (!_listenersToRemove.contains(listener))
        listener.onStart?.call();

    _removeListeners();

    if(awaitFinish) {

      await perform();
      await _callFinish(forceFinished: false);
      completer.complete();

    } else {

      () async {
        await perform();
        await _callFinish(forceFinished: false);
        completer.complete();
      }();

    }
    return true;
  }
  
  Future<void> perform();
  
  Future<void> callError(TErr err) async {
    _errorCalled = err;
    for(TListener listener in listeners)
      await listener.onError?.call(err);
  }

  @protected
  Future<void> _callFinish({bool forceFinished=true}) async{

    await checkRunningSemaphore.acquire();
    _running = false;
    logger.i('Single computer $computerName finished.');
    checkRunningSemaphore.release();

    for(TListener listener in listeners)
      listener.onEnd?.call(_errorCalled, forceFinished);

    _errorCalled = null;

    runningSemaphore.release();

  }

  _removeListeners(){
    for(TListener listener in _listenersToRemove)
      listeners.remove(listener);
    _listenersToRemove.clear();
  }

}
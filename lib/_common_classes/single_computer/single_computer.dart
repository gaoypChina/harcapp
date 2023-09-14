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

  late bool _runRequested;
  late bool _running;
  late Completer completer;
  TErr? _errorCalled;

  bool get running => _runRequested || _running;

  SingleComputer(){
    listeners = [];
    _runRequested = false;
    _running = false;
    _errorCalled = null;
  }

  void addListener(TListener listener) => listeners.add(listener);
  void removeListener(TListener listener) async { // This must not be Future<void>! Otherwise it will end up in a deadlock if someone calls it while executing a computer.
    listener.toBeRemoved = true;
    listeners.remove(listener);
  }

  Future<void> awaitFinishIfRunning()async{
    await checkRunningSemaphore.acquire();
    if(!running){
      checkRunningSemaphore.release();
      return;
    }
    checkRunningSemaphore.release();

    await completer.future;
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

      // await listenerRemoverSemaphore.acquire();
      for(TListener listener in List.of(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
        if(!listener.toBeRemoved) await listener.onEnd?.call(null, false);
      // listenerRemoverSemaphore.release();

      // _removeListeners();

      runningSemaphore.release();
      if(awaitFinish) await completer.future;
      return false;
    }

    completer = Completer();
    _running = true;

    await runningSemaphore.acquire();

    checkRunningSemaphore.release();

    // await listenerRemoverSemaphore.acquire();
    for(TListener listener in List.of(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
      if(!listener.toBeRemoved) await listener.onStart?.call();
    // listenerRemoverSemaphore.release();

    // _removeListeners();

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

  @protected
  Future<void> perform();
  
  Future<void> callError(TErr err) async {
    _errorCalled = err;
    for(TListener listener in List.from(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
      if(!listener.toBeRemoved) await listener.onError?.call(err);
  }

  @protected
  Future<void> _callFinish({bool forceFinished=true}) async{

    await checkRunningSemaphore.acquire();
    _running = false;
    logger.i('Single computer $computerName finished.');
    checkRunningSemaphore.release();

    for(TListener listener in List.from(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
      if(!listener.toBeRemoved) await listener.onEnd?.call(_errorCalled, forceFinished);

    _errorCalled = null;

    runningSemaphore.release();

  }

}
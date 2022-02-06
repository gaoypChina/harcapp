
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/logger.dart';
import 'package:semaphore/semaphore.dart';

abstract class SingleComputer<TErr, TListener extends SingleComputerListener<TErr>>{

  final checkRunningSemaphore = LocalSemaphore(100000000);
  final runningSemaphore = LocalSemaphore(100000000);

  @protected
  String get computerName;

  @protected
  List<TListener> listeners;

  List<TListener> _listenersToRemove;

  bool _runRequested;
  bool _running;
  TErr _errorCalled;

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

    List<TListener> _newListeners = [];
    _newListeners.addAll(listeners);
    _newListeners.remove(listener);

    listeners = _newListeners;

  }

  /// Function returns TRUE if it wasn't already running;
  /// Function returns FALSE if it was already running (in which case it waits);
  Future<bool> run() async {

    _runRequested = true;

    await checkRunningSemaphore.acquire();

    logger.i('Single computer $computerName called. ${_running?'Computer was already running - run merged.':'Computer was idle - run started.'}');

    _runRequested = false;
    if(running){

      await runningSemaphore.acquire();

      for(TListener listener in listeners)
        if(!_listenersToRemove.contains(listener))
          await listener.onEnd?.call(null, false);

      for(TListener listener in _listenersToRemove)
        listeners.remove(listener);
      _listenersToRemove.clear();

      runningSemaphore.release();
      return false;
    }

    _running = true;

    await runningSemaphore.acquire();

    checkRunningSemaphore.release();

    for(TListener listener in listeners)
      if (!_listenersToRemove.contains(listener) && listener.onStart != null) await listener.onStart();

    for(TListener listener in _listenersToRemove)
      listeners.remove(listener);
    _listenersToRemove.clear();

    await perform();

    await _callFinish(forceFinished: false);

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
      await listener.onEnd?.call(_errorCalled, forceFinished);

    _errorCalled = null;

    runningSemaphore.release();

  }

}
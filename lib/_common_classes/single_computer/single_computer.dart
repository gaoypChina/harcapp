import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/logger.dart';
import 'package:semaphore_plus/semaphore_plus.dart';

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
  late bool _unknownErrorCalled;

  bool get running => _runRequested || _running;

  SingleComputer(){
    listeners = [];
    _runRequested = false;
    _running = false;
    _errorCalled = null;
    _unknownErrorCalled = false;
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

      _callFinish();

      if(awaitFinish) await completer.future;
      return false;
    }

    completer = Completer();
    _running = true;

    await runningSemaphore.acquire();

    checkRunningSemaphore.release();

    // await listenerRemoverSemaphore.acquire();
    for(TListener listener in List.of(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
      if(!listener.toBeRemoved)
        try{ await listener.onStart?.call(); }
        catch(e){ registerUnknownError(e); }
    // listenerRemoverSemaphore.release();

    // _removeListeners();

    if(awaitFinish) {
      
      try { await perform(); }
      catch (e){ registerUnknownError(e); }
      await _callFinish(forceFinished: false);
      completer.complete();

    } else {

      () async {
        try { await perform(); }
        catch (e){ registerUnknownError(e); }
        await _callFinish(forceFinished: false);
        completer.complete();
      }();

    }
    return true;
  }

  @protected
  Future<void> perform();

  void registerUnknownError(dynamic e){

    String message = e is Error?
    (e.stackTrace?.toString()??'Null stack trace'):

    e is Exception?
    e.toString():

    'Unknown';

    _unknownErrorCalled = true;
    logger.i('Single computer $computerName raised an error while running the `perform` function.\n\n$message');
  }

  Future<void> callKnownError(TErr err) async {
    _errorCalled = err;
    for(TListener listener in List.from(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
      if(!listener.toBeRemoved) try{
        await listener.onError?.call(err);
      } catch(e){
        registerUnknownError(e);
      }
  }

  @protected
  Future<void> _callFinish({bool forceFinished=true}) async{

    await checkRunningSemaphore.acquire();
    _running = false;
    logger.i('Single computer $computerName finished.');
    checkRunningSemaphore.release();

    for(TListener listener in List.from(listeners)) // List.from is used to copy the list so that it can be modified by other processes while iterating.
      if(!listener.toBeRemoved) try {
        await listener.onEnd?.call(_errorCalled, _unknownErrorCalled, forceFinished);
      } catch(e){
        registerUnknownError(e);
      }

    _errorCalled = null;
    _unknownErrorCalled = false;

    runningSemaphore.release();

  }

}
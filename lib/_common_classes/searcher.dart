import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:semaphore_plus/semaphore_plus.dart';


abstract class SearchOptions{

  bool get isEmpty;
  bool get isNotEmpty => !isEmpty;
  void clear();
}

class SearchArguments<TInItem, TOutItem, TOpt>{

  final List<TInItem> allSearchableItems;
  final TOpt options;
  final SendPort outPort;

  final List<TOutItem>? Function(String phrase, List<TInItem> allItems, TOpt options, bool Function() stillValid) selectItems;


  SearchArguments(this.allSearchableItems, this.options, this.selectItems, this.outPort);
  
}

void _runSearchProcess<TInItem, TOutItem, TOpt extends SearchOptions?>(
  SearchArguments<TInItem, TOutItem, TOpt> searchArgs,
) async {

  final List<TInItem> allItems = searchArgs.allSearchableItems;
  final TOpt options = searchArgs.options;
  final SendPort outPort = searchArgs.outPort;
  final Function selectItems = searchArgs.selectItems;

  int lastRunId = 0;

  final ReceivePort inPort = ReceivePort();
  inPort.listen((message) async {
    if (message == null)
      return;

    message as (int, String);

    int currRunId = message.$1;
    String phrase = message.$2;

    lastRunId = currRunId;

    List<TOutItem>? result = selectItems(phrase, allItems, options, () => currRunId==lastRunId);

    if(result == null) {
      outPort.send(null);
      return;
    }

    outPort.send(result);
  });

  outPort.send(inPort.sendPort);

  await Future.delayed(const Duration(days: 365*1000000));

}

enum SearcherMessages{BREAK}
class Searcher<TInItem, TOutItem, TOpt extends SearchOptions?>{

  late List<TInItem> allItems;

  Isolate? isolate;

  late SendPort outPort;
  ReceivePort? inPort;

  late List<void Function(String)> _onStartListeners;
  late List<void Function(List<TOutItem>, bool Function())> _onCompleteListeners;

  final List<TOutItem>? Function(String phrase, List<TInItem> allItems, TOpt options, bool Function() stillValid) selectItems;

  int lastCompleteId;
  int lastRunId;

  final LocalSemaphore semaphore;

  Searcher(this.selectItems):
        lastCompleteId = 0,
        lastRunId = 0,
        semaphore = LocalSemaphore(1)
  {
    allItems = [];
    _onStartListeners = [];
    _onCompleteListeners = [];

  }

  void addOnStartListener(void Function(String) listener) => _onStartListeners.add(listener);
  void addOnCompleteListener(void Function(List<TOutItem>, bool Function()) listener) => _onCompleteListeners.add(listener);

  Future<void> init(List<TInItem> allItems, TOpt options) async {

    this.allItems = allItems;

    ReceivePort inPort = ReceivePort();

    SearchArguments<TInItem, TOutItem, TOpt> args = SearchArguments(
        allItems, // !!! jeśli ma być zrealizowane podpowiadanie piosenek z innych śpiewników, trzeba to zmienić.
        options,
        selectItems,
        inPort.sendPort,
    );

    Isolate isolate = await Isolate.spawn<SearchArguments<TInItem, TOutItem, TOpt>>(
        _runSearchProcess,
        args
    );

    isolate.addOnExitListener(inPort.sendPort);

    SendPort outPort = await connect(inPort: inPort);

    this.isolate = isolate;
    this.outPort = outPort;
    this.inPort = inPort;

  }

  Future<SendPort> connect({required ReceivePort inPort}) async {

    Completer completer = Completer<SendPort>();

    inPort.listen((message) async {
      if(message == SearcherMessages.BREAK) semaphore.release();
      else if (message is SendPort) completer.complete(message);
      else if (message is String) debugPrint(message);
      else if(message is List<TOutItem>) {
        int thisCompleteId = ++lastCompleteId;
        for (void Function(List<TOutItem>, bool Function()) listener in _onCompleteListeners)
          listener(message, () => thisCompleteId == lastCompleteId);
        semaphore.release();
      }
    });

    return completer.future as FutureOr<SendPort>;

  }

  Future<void> run(String phrase) async {
    int currRunId = ++lastRunId;
    await semaphore.acquire();
    if(currRunId != lastRunId){
      semaphore.release();
      return;
    }

    for(void Function(String) listener in _onStartListeners)
      listener(phrase);
    
    outPort.send((currRunId, phrase));
  }

  void dispose() => isolate?.kill();//await task?.cancel();

}
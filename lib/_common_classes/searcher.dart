import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:semaphore/semaphore.dart';
import 'package:tuple/tuple.dart';


abstract class SearchOptions{

  bool get isEmpty;
  void clear();
}

void selectTemplate<TInItem, TOutItem, TOpt extends SearchOptions>(
    Tuple3<List<TInItem>, TOpt, SendPort> args,
    List<TOutItem> Function(String phrase, List<TInItem> allItems, TOpt options, bool Function()) select
    ) async {

  final List<TInItem> allItems = args.item1;
  final TOpt options = args.item2;
  final SendPort outPort = args.item3;

  int lastRunId = 0;

  final ReceivePort inPort = ReceivePort();
  inPort.listen((message) async {
    if (message == null)
      return;

    int currRunId = (message as Tuple2<int, String>).item1;
    String phrase = (message as Tuple2<int, String>).item2;

    lastRunId = currRunId;

    List<TOutItem> result = select(phrase, allItems, options, () => currRunId==lastRunId);

    if(result == null) {
      outPort.send(null);
      return;
    }

    outPort.send(result);
  });

  outPort.send(inPort.sendPort);

  await Future.delayed(Duration(days: 365*1000000));

}

enum SearcherMessages{BREAK}
class Searcher<TInItem, TOutItem, TOpt extends SearchOptions>{

  List<TInItem> allItems;

  Isolate isolate;

  SendPort outPort;
  ReceivePort inPort;

  List<void Function(String)> _onStartListeners;
  List<void Function(List<TOutItem>, bool Function())> _onCompleteListeners;

  final void Function(Tuple3<List<TInItem>, TOpt, SendPort>) loopFunction;

  int lastCompleteId;
  int lastRunId;

  LocalSemaphore semaphore;

  Searcher(this.loopFunction){
    this._onStartListeners = [];
    this._onCompleteListeners = [];
    lastCompleteId = 0;
    lastRunId = 0;
    semaphore = LocalSemaphore(1);
  }

  void addOnStartListener(void Function(String) listener) => _onStartListeners.add(listener);
  void addOnCompleteListener(void Function(List<TOutItem>, bool Function()) listener) => _onCompleteListeners.add(listener);

  Future<void> init(
      List<TInItem> allItems,
      TOpt options,
      ) async {

    this.allItems = allItems;

    ReceivePort inPort = ReceivePort();

    Tuple3<List<TInItem>, TOpt, SendPort> args = Tuple3(
        allItems, // !!! jeśli ma być zrealizowane podpowiadanie piosenek z innych śpiewników, trzeba to zmienić.
        options,
        inPort.sendPort,
    );

    Isolate isolate = await Isolate.spawn<Tuple3<List<TInItem>, TOpt, SendPort>>(
        loopFunction,
        args
    );

    isolate.addOnExitListener(inPort.sendPort);

    SendPort outPort = await connect(
        inPort: inPort,
    );

    this.isolate = isolate;
    this.outPort = outPort;
    this.inPort = inPort;

  }

  Future<SendPort> connect({@required ReceivePort inPort}) async {

    Completer completer = Completer<SendPort>();

    inPort.listen((message) async {
      if(message == SearcherMessages.BREAK) semaphore.release();
      else if (message is SendPort) completer.complete(message);
      else if (message is String) debugPrint(message);
      else if(message is List<TOutItem>) {
        int thisCompleteId = ++lastCompleteId;
        for (void Function(List<TOutItem>, bool Function()) listener in _onCompleteListeners)
          await listener(message, () => thisCompleteId == lastCompleteId);
        semaphore.release();
      }
    });

    return completer.future;

  }

  Future<void> run(String phrase) async {
    int currRunId = ++lastRunId;
    await semaphore.acquire();
    if(currRunId != lastRunId){
      semaphore.release();
      return;
    }

    for(void Function(String) listener in _onStartListeners)
      await listener(phrase);
    outPort.send(Tuple2(currRunId, phrase));
  }

  void dispose() => isolate?.kill();//await task?.cancel();

}
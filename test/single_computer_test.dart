// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read Lk_9_28b-36$text, and verify that the values of widget properties are correct.

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';

import 'package:flutter_test/flutter_test.dart';

class TestLoader extends SingleComputer<String, SingleComputerListener<String>>{

  static const Duration runningDuration = Duration(seconds: 3);

  @override
  String get computerName => 'TestLoader';

  @override
  Future<void> perform() async {

    await Future.delayed(runningDuration);

  }

}

void main() {


  test('Single computer test two test', () async {

    TestLoader testLoader = TestLoader();

    bool justStartedFirst = await testLoader.run();
    bool justStartedSecond = await testLoader.run();

    assert(justStartedFirst == true);
    assert(justStartedSecond == false);

  });

  test('Single computer test two listeners, first awaiting finish', () async {

    TestLoader testLoader = TestLoader();

    bool justStartedFirst = await testLoader.run(awaitFinish: true);
    bool justStartedSecond = await testLoader.run();

    assert(justStartedFirst == true);
    assert(justStartedSecond == true);

  });

  test('Single computer test two loaders, second awaiting finish', () async {

    TestLoader testLoader = TestLoader();

    bool finished = false;

    late SingleComputerListener<String> listener = SingleComputerListener<String>(
      onEnd: (_, __) async => finished = true,
    );

    testLoader.addListener(listener);

    await testLoader.run();
    await testLoader.run(awaitFinish: true);

    assert(finished == true);

  });

  test('Single computer test listener', () async {

    TestLoader testLoader = TestLoader();

    bool listenerOnStartCalled = false;
    bool listenerOnEndCalled = false;

    late SingleComputerListener<String> listener = SingleComputerListener<String>(
      onStart: () => listenerOnStartCalled = true,
      onEnd: (_, __) async => listenerOnEndCalled = true,
    );

    testLoader.addListener(listener);
    await testLoader.run(awaitFinish: true);

    assert(listenerOnStartCalled == true);
    assert(listenerOnEndCalled == true);

  });

  test('Single computer test removing self listener in onStart', () async {

    TestLoader testLoader = TestLoader();

    bool listenerOnEndCalled = false;

    late SingleComputerListener<String> listener;
    listener = SingleComputerListener<String>(
      onStart: () => testLoader.removeListener(listener),
      onEnd: (_, __) async => listenerOnEndCalled = true,
    );

    testLoader.addListener(listener);
    await testLoader.run(awaitFinish: true);

    assert(listenerOnEndCalled == false);

  });

  test('Single computer test removing other listener in onStart', () async {

    TestLoader testLoader = TestLoader();

    bool listenerSecondOnStartCalled = false;

    late SingleComputerListener<String> listenerFirst;
    late SingleComputerListener<String> listenerSecond;

    listenerSecond = SingleComputerListener<String>(
      onStart: (){
        listenerSecondOnStartCalled = true;
      },
    );

    listenerFirst = SingleComputerListener<String>(
      onStart: (){
        testLoader.removeListener(listenerSecond);
      },
    );

    testLoader.addListener(listenerFirst);
    testLoader.addListener(listenerSecond);
    await testLoader.run(awaitFinish: true);

    assert(listenerSecondOnStartCalled == false);

  });

  test('Single computer test removing self listener in onEnd', () async {

    TestLoader testLoader = TestLoader();

    late SingleComputerListener<String> listener;
    listener = SingleComputerListener<String>(
      onEnd: (_, __) => testLoader.removeListener(listener)
    );

    testLoader.addListener(listener);
    await testLoader.run(awaitFinish: true);

    // If it didn't fail so far = success.
  });

  test('Single computer test removing other listener in onEnd', () async {

    TestLoader testLoader = TestLoader();

    bool listenerSecondOnEndCalled = false;

    late SingleComputerListener<String> listenerFirst;
    late SingleComputerListener<String> listenerSecond;

    listenerSecond = SingleComputerListener<String>(
      onEnd: (_, __){
        listenerSecondOnEndCalled = true;
      },
    );

    listenerFirst = SingleComputerListener<String>(
      onEnd: (_, __){
        testLoader.removeListener(listenerSecond);
      },
    );

    testLoader.addListener(listenerFirst);
    testLoader.addListener(listenerSecond);
    await testLoader.run(awaitFinish: true);

    assert(listenerSecondOnEndCalled == false);

  });

  test('Single computer test checkRunningSemaphore', () async {

    TestLoader testLoader = TestLoader();

    await testLoader.checkRunningSemaphore.acquire();
    testLoader.run();
    await Future.delayed(TestLoader.runningDuration);
    await Future.delayed(TestLoader.runningDuration);
    assert(testLoader.running == true);

  });

}

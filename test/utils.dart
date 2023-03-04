import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/account/account.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initTestShaPref() async {
  SharedPreferences.setMockInitialValues({});
  await ShaPref.init();
}

const String initTestPathsDir = "./tmp_test_data";
Future<void> initTestPaths() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    // ATTENTION!!!
    // ATTENTION!!!
    // UNDER NO CIRCUMSTANCES USE `return '.'`! If in such case you remove all
    // files in a test, YOU WILL DELETE THE ENTIRE FLUTTER PROJECT!!!
    return initTestPathsDir;
  });
  await initPaths();
}

Future<void> initTestAccountData() async {

  Map secureStorageData = {};

  const MethodChannel channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    if(methodCall.method == 'read')
      return secureStorageData[methodCall.arguments['key']];
    else if (methodCall.method == 'write')
      secureStorageData[methodCall.arguments['key']] = methodCall.arguments['value'];
  });
  await AccountData.init();
}

class _MyHttpOverrides extends HttpOverrides {}
void enableHttpRequests() {
  // Setting a customer override that'll use an unmocked HTTP client
  HttpOverrides.global = _MyHttpOverrides();
}

void enableTestConnected() {
  const MethodChannel channel = MethodChannel('plugins.flutter.io/connectivity');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    if(methodCall.method == 'check')
      return 'wifi';
  });

}

class MockBuildContext extends Mock implements BuildContext {}
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initTestShaPref() async {
  SharedPreferences.setMockInitialValues({});
  await ShaPref.init();
}

Future<void> initTestPaths() async {
  const MethodChannel channel = MethodChannel('plugins.flutter.io/path_provider');
  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    return ".";
  });
  await initPaths();
}
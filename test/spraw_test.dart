// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read Lk_9_28b-36$text, and verify that the values of widget properties are correct.

import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';

import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {

  test('Spraw uniqueness test', () async {
    TestWidgetsFlutterBinding.ensureInitialized(); // This is for enabling assets from tests.
    await ShaPref.init();
    await initPaths();
    await synchronizer.reloadSyncables();

    List<String> uniqNames = [];

    for (Spraw spraw in Spraw.all){
      if(uniqNames.contains(spraw.uniqName)) {
        print(spraw.uniqName);
        assert(false);
      }
      uniqNames.add(spraw.uniqName);
    }

    assert(true);

  });

  test('Spraw valid chars test', () async {
    TestWidgetsFlutterBinding.ensureInitialized(); // This is for enabling assets from tests.
    await ShaPref.init();
    await initPaths();
    await synchronizer.reloadSyncables();

    for (Spraw spraw in Spraw.all) {

      String uniqName = spraw.uniqName.toLowerCase();

      if (uniqName.contains('/') ||
          uniqName.contains('#') ||
          uniqName.contains('ą') ||
          uniqName.contains('ć') ||
          uniqName.contains('ę') ||
          uniqName.contains('ł') ||
          uniqName.contains('ń') ||
          uniqName.contains('ó') ||
          uniqName.contains('ś') ||
          uniqName.contains('ź') ||
          uniqName.contains('ż') ||
          uniqName.contains(' ')
      ) {
        print(spraw.uniqName);
        assert(false);
      }
    }
    assert(true);

  });

}

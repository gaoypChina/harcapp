import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';

import 'utils.dart';

void main() {

  // This test has to be run on a fresh server. Otherwise sync might not work well.

  setUp(() {
    Directory dir = Directory(initTestPathsDir);
    if(dir.existsSync())
      dir.deleteSync(recursive: true);
  });

  test('Sync test', () async {

    await initTestShaPref();
    await initTestPaths();
    await initTestAccountData();

    enableHttpRequests();
    enableTestConnected();

    Response? response = await ApiRegLog.carefullyLogin(
      context: MockBuildContext(),
      email: 'a@a.com',
      password: 'adminadmin',
      awaitSyncFinished: true
    );

    assert(response?.statusCode == 200);

    OffSong.allOfficial[0].setRate(SongRate.RATE_LIKE_1, localOnly: true);
    OffSong.allOfficial[0].setChordShift(5, localOnly: true);
    OffSong.allOfficial[0].addMemory(Memory.create(
      OffSong.allOfficial[0].fileName,
      DateTime(2011, 11, 11),
      'Kraków',
      'Rajd Nierozwiązanych Tajemnic',
      0,
      false,
      localOnly: true
    ));

    await synchronizer.post();

    await factoryResetLocalSilent();
    await synchronizer.reloadSyncables(force: true);

    assert(OffSong.allOfficial[0].rate == SongRate.RATE_NULL);

    // Get is run two times - cause maybe calling twice saves something twice?
    // It surely shouldn't.
    await synchronizer.get();
    await synchronizer.get();

    assert(OffSong.allOfficial[0].rate == SongRate.RATE_LIKE_1);
    assert(OffSong.allOfficial[0].chordShift == 5);

    assert(OffSong.allOfficial[0].memories.length == 1);
    Memory memory = OffSong.allOfficial[0].memories.first;
    assert(memory.songFileName == OffSong.allOfficial[0].fileName);
    assert(memory.date == DateTime(2011, 11, 11));
    assert(memory.place == 'Kraków');
    assert(memory.desc == 'Rajd Nierozwiązanych Tajemnic');
    assert(memory.fontIndex == 0);
    assert(memory.published == false);

  });

  tearDown(() {
    Directory dir = Directory(initTestPathsDir);
    if(dir.existsSync())
      dir.deleteSync(recursive: true);
  });

}
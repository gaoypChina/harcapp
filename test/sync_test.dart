import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';

import 'utils.dart';

void main() {

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

    await synchronizer.post();

    await factoryResetLocalSilent();

    await synchronizer.get();

  });

}
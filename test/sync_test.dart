import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core_song/song_core.dart';
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
      OffSong.allOfficial[0].lclId,
      DateTime(2011, 11, 11),
      'Kraków',
      'Rajd Nierozwiązanych Tajemnic',
      0,
      false,
      localOnly: true
    ));

    Map song1CodeMap = jsonDecode(OwnSong.emptySongCode);
    song1CodeMap[SongCore.PARAM_TITLE] = 'Tytuł mojej super testowej piosenki 1';
    OwnSong ownSong1 = (await OwnSong.create(lclId: 'abcd-1234-1', code: jsonEncode(song1CodeMap)))!;
    ownSong1.save(localOnly: true);
    OwnSong.addToAll(ownSong1);

    Map song2CodeMap = jsonDecode(OwnSong.emptySongCode);
    song2CodeMap[SongCore.PARAM_TITLE] = 'Tytuł mojej super testowej piosenki 2';
    OwnSong ownSong2 = (await OwnSong.create(lclId: 'abcd-1234-2', code: jsonEncode(song2CodeMap)))!;
    ownSong2.save(localOnly: true);
    OwnSong.addToAll(ownSong2);

    Map song3CodeMap = jsonDecode(OwnSong.emptySongCode);
    song3CodeMap[SongCore.PARAM_TITLE] = 'Tytuł mojej super testowej piosenki 3';
    OwnSong ownSong3 = (await OwnSong.create(lclId: 'abcd-1234-3', code: jsonEncode(song3CodeMap)))!;
    ownSong3.save(localOnly: true);
    OwnSong.addToAll(ownSong3);

    Album album = Album.create(
        title: 'Obóz 2021',
        offSongs: [OffSong.allOfficial[10], OffSong.allOfficial[11], OffSong.allOfficial[12]],
        ownSongs: [ownSong1, ownSong2],
        colorsKey: CommonColorData.all.keys.toList()[10],
        iconKey: CommonIconData.all.keys.toList()[20]
    );
    album.save(localOnly: true);
    Album.addToAll(album);

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
    assert(memory.songFileName == OffSong.allOfficial[0].lclId);
    assert(memory.date == DateTime(2011, 11, 11));
    assert(memory.place == 'Kraków');
    assert(memory.desc == 'Rajd Nierozwiązanych Tajemnic');
    assert(memory.fontIndex == 0);
    assert(memory.published == false);

    assert(OwnSong.allOwn.length == 3);
    assert(OwnSong.allOwnMap['abcd-1234-1']!.title == 'Tytuł mojej super testowej piosenki 1');
    assert(OwnSong.allOwnMap['abcd-1234-2']!.title == 'Tytuł mojej super testowej piosenki 2');
    assert(OwnSong.allOwnMap['abcd-1234-3']!.title == 'Tytuł mojej super testowej piosenki 3');

    assert(Album.allOwn.length == 1);
    assert(Album.allOwn[0].lclId == album.lclId);
    assert(Album.allOwn[0].title == 'Obóz 2021');
    assert(Album.allOwn[0].offSongs.length == 3);
    assert(Album.allOwn[0].offSongs[0].lclId == OffSong.allOfficial[10].lclId);
    assert(Album.allOwn[0].offSongs[1].lclId == OffSong.allOfficial[11].lclId);
    assert(Album.allOwn[0].offSongs[2].lclId == OffSong.allOfficial[12].lclId);

    assert(Album.allOwn[0].ownSongs.length == 2);
    assert(Album.allOwn[0].ownSongs[0].lclId == 'abcd-1234-1');
    assert(Album.allOwn[0].ownSongs[1].lclId == 'abcd-1234-2');
    assert(Album.allOwn[0].colorsKey == CommonColorData.all.keys.toList()[10]);
    assert(Album.allOwn[0].iconKey == CommonIconData.all.keys.toList()[20]);

  });

  tearDown(() {
    Directory dir = Directory(initTestPathsDir);
    if(dir.existsSync())
      dir.deleteSync(recursive: true);
  });

}
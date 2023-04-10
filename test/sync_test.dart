import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';
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

    // This has to be run with:
    // const String SERVER_IP = 'http://0.0.0.0';
    // const String SERVER_PORT = '8080';

    // And the server has to be run in debug mode.

    await initTestShaPref();
    await initTestPaths();
    await initTestAccountData();
    await synchronizer.reloadSyncables();

    enableHttpRequests();
    enableTestConnected();

    Response? response = await ApiRegLog.carefullyLogin(
      context: MockBuildContext(),
      email: 'a@a.com',
      password: 'adminadmin',
      awaitSyncFinished: true
    );

    assert(response?.statusCode == 200);

    OffSong.allOfficial[0].setRate(SongRate.RATE_1, localOnly: true);
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

    ToLearnAlbum.init();
    ToLearnAlbum.loaded.addSong(OffSong.allOfficial[42]);
    ToLearnAlbum.loaded.addSong(OffSong.allOfficial[41]);
    ToLearnAlbum.loaded.addSong(OffSong.allOfficial[43]);
    ToLearnAlbum.loaded.save(localOnly: true);

    OwnAlbum album = OwnAlbum.create(
        title: 'Obóz 2021',
        offSongs: [OffSong.allOfficial[10], OffSong.allOfficial[11], OffSong.allOfficial[12]],
        ownSongs: [ownSong1, ownSong2],
        colorsKey: CommonColorData.all.keys.toList()[10],
        iconKey: CommonIconData.all.keys.toList()[20]
    );
    album.save(localOnly: true);
    OwnAlbum.addToAll(album);

    Trop trop = Trop.create(
        name: 'Mój super trop',
        category: TropCategory.harcNatura,
        aims: [
          'Cel tropu 1',
          'Cel tropu 2'
        ],
        startTime: DateTime(2023, 10, 1),
        endTime: DateTime(2023, 10, 21),
        completed: false,
        completionTime: null,
        tasks: [
          TropTaskData(
            content: 'Zadanie 1, w którym dzieje się cośtam.',
            summary: 'Jakieś podsumowanko zadania 1...',
            deadline: DateTime(2023, 10, 5),
            assigneeCustomText: 'Jan Kowalski i jego przyjaciele',
            completed: false,
          ),
          TropTaskData(
            content: 'Zadanie 2, w którym dzieje się cośtam.',
            summary: 'Jakieś podsumowanko zadania 2...',
            deadline: DateTime(2023, 10, 15),
            assigneeCustomText: 'Malwina i jej koleżanki',
            completed: true,
          ),
        ]
    );
    trop.save(localOnly: true);
    Trop.addToAll(trop);

    await synchronizer.post();

    await factoryResetLocalSilent();

    assert(OffSong.allOfficial[0].rate == SongRate.RATE_NULL);

    // Get is run two times - cause maybe calling twice saves something twice?
    // It surely shouldn't.
    await synchronizer.get();
    await synchronizer.get();

    assert(OffSong.allOfficial[0].rate == SongRate.RATE_1);
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

    ToLearnAlbum.init();
    assert(ToLearnAlbum.loaded.songs.length == 3);
    assert(ToLearnAlbum.loaded.songs[0].lclId == OffSong.allOfficial[41].lclId);
    assert(ToLearnAlbum.loaded.songs[1].lclId == OffSong.allOfficial[42].lclId);
    assert(ToLearnAlbum.loaded.songs[2].lclId == OffSong.allOfficial[43].lclId);

    assert(OwnAlbum.all.length == 1);
    assert(OwnAlbum.all[0].lclId == album.lclId);
    assert(OwnAlbum.all[0].title == 'Obóz 2021');
    assert(OwnAlbum.all[0].offSongs.length == 3);
    assert(OwnAlbum.all[0].offSongs[0].lclId == OffSong.allOfficial[10].lclId);
    assert(OwnAlbum.all[0].offSongs[1].lclId == OffSong.allOfficial[11].lclId);
    assert(OwnAlbum.all[0].offSongs[2].lclId == OffSong.allOfficial[12].lclId);

    assert(OwnAlbum.all[0].ownSongs.length == 2);
    assert(OwnAlbum.all[0].ownSongs[0].lclId == 'abcd-1234-1');
    assert(OwnAlbum.all[0].ownSongs[1].lclId == 'abcd-1234-2');
    assert(OwnAlbum.all[0].colorsKey == CommonColorData.all.keys.toList()[10]);
    assert(OwnAlbum.all[0].iconKey == CommonIconData.all.keys.toList()[20]);

    assert(Trop.all.length == 1);
    assert(Trop.all[0].uniqName == trop.uniqName);
    assert(Trop.all[0].name == trop.name);
    assert(Trop.all[0].customIconTropName == trop.customIconTropName);
    assert(Trop.all[0].category == trop.category);
    assert(Trop.all[0].startDate == trop.startDate);
    assert(Trop.all[0].endDate == trop.endDate);
    assert(Trop.all[0].completed == trop.completed);
    assert(Trop.all[0].completionDate == trop.completionDate);
    assert(Trop.all[0].tasks.length == 2);
    // ---
    assert(Trop.all[0].tasks[0].lclId == trop.tasks[0].lclId);
    assert(Trop.all[0].tasks[0].content == trop.tasks[0].content);
    assert(Trop.all[0].tasks[0].summary == trop.tasks[0].summary);
    assert(Trop.all[0].tasks[0].deadline == trop.tasks[0].deadline);
    assert(Trop.all[0].tasks[0].assigneeCustomText == trop.tasks[0].assigneeCustomText);
    assert(Trop.all[0].tasks[0].completed == trop.tasks[0].completed);
    // ---
    assert(Trop.all[0].tasks[1].lclId == trop.tasks[1].lclId);
    assert(Trop.all[0].tasks[1].content == trop.tasks[1].content);
    assert(Trop.all[0].tasks[1].summary == trop.tasks[1].summary);
    assert(Trop.all[0].tasks[1].deadline == trop.tasks[1].deadline);
    assert(Trop.all[0].tasks[1].assigneeCustomText == trop.tasks[1].assigneeCustomText);
    assert(Trop.all[0].tasks[1].completed == trop.tasks[1].completed);

  });

  tearDown(() {
    Directory dir = Directory(initTestPathsDir);
    if(dir.existsSync())
      dir.deleteSync(recursive: true);
  });

}
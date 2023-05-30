import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/_new/api/sync.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/server.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';

import 'utils.dart';

void main() {

  // This test has to be run on a fresh server. Otherwise sync might not work well.

  setUp(() async {
    Directory dir = Directory(initTestPathsDir);
    if(dir.existsSync())
      dir.deleteSync(recursive: true);

    // Server has to be run in debug (non-release) mode.
    testBackendUrl = 'http://0.0.0.0:8080';

    await initTestShaPref();
    await initTestPaths();
    await initTestAccountData();
    await synchronizer.reloadSyncables();

    enableHttpRequests();
    enableTestConnected();

    Intl.defaultLocale = 'pl_PL';

  });

  test('Sync test', () async {

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
      songLclId: OffSong.allOfficial[0].lclId,
      date: DateTime(2011, 11, 11),
      place: 'Kraków',
      desc: 'Rajd Nierozwiązanych Tajemnic',
      fontIndex: 0,
      published: false,
      localOnly: true
    ));
    OffSong.allOfficial[0].addMemory(Memory.create(
        songLclId: OffSong.allOfficial[0].lclId,
        date: DateTime(2012, 12, 12),
        place: 'Gdańsk',
        desc: 'Rajd Dziwnych Tajemnic',
        fontIndex: 1,
        published: false,
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

    OwnAlbum album1 = OwnAlbum.create(
        title: 'Obóz 2021',
        offSongs: [OffSong.allOfficial[10], OffSong.allOfficial[11], OffSong.allOfficial[12]],
        ownSongs: [ownSong1, ownSong2],
        colorsKey: CommonColorData.all.keys.toList()[10],
        iconKey: CommonIconData.all.keys.toList()[20]
    );
    album1.save(localOnly: true);
    OwnAlbum.addToAll(album1);
    
    OwnAlbum album2 = OwnAlbum.create(
        title: 'Zimowisko 2023',
        offSongs: [OffSong.allOfficial[20], OffSong.allOfficial[21], OffSong.allOfficial[22], OffSong.allOfficial[23]],
        ownSongs: [ownSong2, ownSong3],
        colorsKey: CommonColorData.all.keys.toList()[9],
        iconKey: CommonIconData.all.keys.toList()[24]
    );
    album2.save(localOnly: true);
    OwnAlbum.addToAll(album2);
    
    Trop trop = Trop.createOwn(
        name: 'Mój super trop',
        category: TropCategory.harcNatura,
        customIconTropName: null,
        aims: [
          'Cel tropu 1',
          'Cel tropu 2'
        ],
        startDate: DateTime(2023, 10, 1),
        endDate: DateTime(2023, 10, 21),
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
        ],
        lastUpdateTime: null
    );
    trop.saveOwn(localOnly: true);
    Trop.addOwnToAll(trop);

    await synchronizer.post();

    await factoryResetLocalSilent();

    // Just to make sure factory reset was successful.
    assert(OffSong.allOfficial[0].rate == SongRate.RATE_NULL);
    assert(Trop.allOwn.isEmpty);

    // Get is run two times - cause maybe calling twice saves something twice?
    // It surely shouldn't.
    await synchronizer.get();
    await synchronizer.get();

    assert(OffSong.allOfficial[0].rate == SongRate.RATE_1);
    assert(OffSong.allOfficial[0].chordShift == 5);

    assert(OffSong.allOfficial[0].memories.length == 2);
    Memory memory1 = OffSong.allOfficial[0].memories.first;
    assert(memory1.song.lclId == OffSong.allOfficial[0].lclId);
    assert(memory1.date == DateTime(2011, 11, 11));
    assert(memory1.place == 'Kraków');
    assert(memory1.desc == 'Rajd Nierozwiązanych Tajemnic');
    assert(memory1.fontIndex == 0);
    assert(memory1.published == false);
    Memory memory2 = OffSong.allOfficial[0].memories.last;
    assert(memory2.song.lclId == OffSong.allOfficial[0].lclId);
    assert(memory2.date == DateTime(2012, 12, 12));
    assert(memory2.place == 'Gdańsk');
    assert(memory2.desc == 'Rajd Dziwnych Tajemnic');
    assert(memory2.fontIndex == 1);
    assert(memory2.published == false);

    assert(OwnSong.allOwn.length == 3);
    assert(OwnSong.allOwnMap['abcd-1234-1']!.title == 'Tytuł mojej super testowej piosenki 1');
    assert(OwnSong.allOwnMap['abcd-1234-2']!.title == 'Tytuł mojej super testowej piosenki 2');
    assert(OwnSong.allOwnMap['abcd-1234-3']!.title == 'Tytuł mojej super testowej piosenki 3');

    ToLearnAlbum.init();
    assert(ToLearnAlbum.loaded.songs.length == 3);
    assert(ToLearnAlbum.loaded.songs[0].lclId == OffSong.allOfficial[41].lclId);
    assert(ToLearnAlbum.loaded.songs[1].lclId == OffSong.allOfficial[42].lclId);
    assert(ToLearnAlbum.loaded.songs[2].lclId == OffSong.allOfficial[43].lclId);

    assert(OwnAlbum.all.length == 2);
    assert(OwnAlbum.all[0].lclId == album1.lclId);
    assert(OwnAlbum.all[0].title == 'Obóz 2021');
    assert(OwnAlbum.all[0].offSongs.length == 3);
    assert(OwnAlbum.all[0].offSongs[0].lclId == OffSong.allOfficial[10].lclId);
    assert(OwnAlbum.all[0].offSongs[1].lclId == OffSong.allOfficial[11].lclId);
    assert(OwnAlbum.all[0].offSongs[2].lclId == OffSong.allOfficial[12].lclId);

    assert(OwnAlbum.all[1].lclId == album2.lclId);
    assert(OwnAlbum.all[1].title == 'Zimowisko 2023');
    assert(OwnAlbum.all[1].offSongs.length == 4);
    assert(OwnAlbum.all[1].offSongs[0].lclId == OffSong.allOfficial[20].lclId);
    assert(OwnAlbum.all[1].offSongs[1].lclId == OffSong.allOfficial[21].lclId);
    assert(OwnAlbum.all[1].offSongs[2].lclId == OffSong.allOfficial[22].lclId);
    assert(OwnAlbum.all[1].offSongs[3].lclId == OffSong.allOfficial[23].lclId);

    assert(OwnAlbum.all[0].ownSongs.length == 2);
    assert(OwnAlbum.all[0].ownSongs[0].lclId == 'abcd-1234-1');
    assert(OwnAlbum.all[0].ownSongs[1].lclId == 'abcd-1234-2');
    assert(OwnAlbum.all[0].colorsKey == CommonColorData.all.keys.toList()[10]);
    assert(OwnAlbum.all[0].iconKey == CommonIconData.all.keys.toList()[20]);

    assert(Trop.allOwn.length == 1);
    assert(Trop.allOwn[0].lclId == trop.lclId);
    assert(Trop.allOwn[0].name == trop.name);
    assert(Trop.allOwn[0].customIconTropName == trop.customIconTropName);
    assert(Trop.allOwn[0].category == trop.category);
    assert(Trop.allOwn[0].startDate == trop.startDate);
    assert(Trop.allOwn[0].endDate == trop.endDate);
    assert(Trop.allOwn[0].completed == trop.completed);
    assert(Trop.allOwn[0].completionDate == trop.completionDate);
    assert(Trop.allOwn[0].tasks.length == 2);
    // ---
    assert(Trop.allOwn[0].tasks[0].lclId == trop.tasks[0].lclId);
    assert(Trop.allOwn[0].tasks[0].content == trop.tasks[0].content);
    assert(Trop.allOwn[0].tasks[0].summary == trop.tasks[0].summary);
    assert(Trop.allOwn[0].tasks[0].deadline == trop.tasks[0].deadline);
    assert(Trop.allOwn[0].tasks[0].assigneeCustomText == trop.tasks[0].assigneeCustomText);
    assert(Trop.allOwn[0].tasks[0].completed == trop.tasks[0].completed);
    // ---
    assert(Trop.allOwn[0].tasks[1].lclId == trop.tasks[1].lclId);
    assert(Trop.allOwn[0].tasks[1].content == trop.tasks[1].content);
    assert(Trop.allOwn[0].tasks[1].summary == trop.tasks[1].summary);
    assert(Trop.allOwn[0].tasks[1].deadline == trop.tasks[1].deadline);
    assert(Trop.allOwn[0].tasks[1].assigneeCustomText == trop.tasks[1].assigneeCustomText);
    assert(Trop.allOwn[0].tasks[1].completed == trop.tasks[1].completed);

    // -- Try some updating.

    OffSong.allOfficial[0].removeMemoryAt(0, localOnly: true);

    OwnSong.allOwn[1].delete(localOnly: true);

    OwnAlbum.all[0].delete(localOnly: true);
    
    Trop.allOwn[0].tasks.removeAt(0);
    Trop.allOwn[0].saveOwn(localOnly: true);

    await synchronizer.post();

    await factoryResetLocalSilent();

    // Just to make sure factory reset was successful.
    assert(OffSong.allOfficial[0].rate == SongRate.RATE_NULL);
    assert(Trop.allOwn.isEmpty);

    // Get is run two times - cause maybe calling twice saves something twice?
    // It surely shouldn't.
    await synchronizer.get();
    await synchronizer.get();

    assert(OffSong.allOfficial[0].memories.length == 1);
    assert(OffSong.allOfficial[0].memories.first.song.lclId == OffSong.allOfficial[0].lclId);
    assert(OffSong.allOfficial[0].memories.first.date == DateTime(2012, 12, 12));
    assert(OffSong.allOfficial[0].memories.first.place == 'Gdańsk');
    assert(OffSong.allOfficial[0].memories.first.desc == 'Rajd Dziwnych Tajemnic');
    assert(OffSong.allOfficial[0].memories.first.fontIndex == 1);
    assert(OffSong.allOfficial[0].memories.first.published == false);

    assert(OwnSong.allOwn.length == 2);
    assert(OwnSong.allOwn[0].lclId == ownSong1.lclId);
    assert(OwnSong.allOwn[1].lclId == ownSong3.lclId);

    assert(OwnAlbum.all.length == 1);
    assert(OwnAlbum.all[0].lclId == album2.lclId);
    assert(OwnAlbum.all[0].title == 'Zimowisko 2023');
    assert(OwnAlbum.all[0].offSongs.length == 4);
    assert(OwnAlbum.all[0].offSongs[0].lclId == OffSong.allOfficial[20].lclId);
    assert(OwnAlbum.all[0].offSongs[1].lclId == OffSong.allOfficial[21].lclId);
    assert(OwnAlbum.all[0].offSongs[2].lclId == OffSong.allOfficial[22].lclId);
    assert(OwnAlbum.all[0].offSongs[3].lclId == OffSong.allOfficial[23].lclId);

    assert(Trop.allOwn.length == 1);
    assert(Trop.allOwn[0].lclId == trop.lclId);
    assert(Trop.allOwn[0].name == trop.name);
    assert(Trop.allOwn[0].customIconTropName == trop.customIconTropName);
    assert(Trop.allOwn[0].category == trop.category);
    assert(Trop.allOwn[0].startDate == trop.startDate);
    assert(Trop.allOwn[0].endDate == trop.endDate);
    assert(Trop.allOwn[0].completed == trop.completed);
    assert(Trop.allOwn[0].completionDate == trop.completionDate);
    assert(Trop.allOwn[0].tasks.length == 1);
    // ---
    assert(Trop.allOwn[0].tasks[0].lclId == trop.tasks[1].lclId);
    assert(Trop.allOwn[0].tasks[0].content == trop.tasks[1].content);
    assert(Trop.allOwn[0].tasks[0].summary == trop.tasks[1].summary);
    assert(Trop.allOwn[0].tasks[0].deadline == trop.tasks[1].deadline);
    assert(Trop.allOwn[0].tasks[0].assigneeCustomText == trop.tasks[1].assigneeCustomText);
    assert(Trop.allOwn[0].tasks[0].completed == trop.tasks[1].completed);

  });

  test('Sync post isolate test', () async {

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
        songLclId: OffSong.allOfficial[0].lclId,
        date: DateTime(2011, 11, 11),
        place: 'Kraków',
        desc: 'Rajd Nierozwiązanych Tajemnic',
        fontIndex: 0,
        published: false,
        localOnly: true
    ));
    OffSong.allOfficial[0].addMemory(Memory.create(
        songLclId: OffSong.allOfficial[0].lclId,
        date: DateTime(2012, 12, 12),
        place: 'Gdańsk',
        desc: 'Rajd Dziwnych Tajemnic',
        fontIndex: 1,
        published: false,
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

    OwnAlbum album1 = OwnAlbum.create(
        title: 'Obóz 2021',
        offSongs: [OffSong.allOfficial[10], OffSong.allOfficial[11], OffSong.allOfficial[12]],
        ownSongs: [ownSong1, ownSong2],
        colorsKey: CommonColorData.all.keys.toList()[10],
        iconKey: CommonIconData.all.keys.toList()[20]
    );
    album1.save(localOnly: true);
    OwnAlbum.addToAll(album1);

    OwnAlbum album2 = OwnAlbum.create(
        title: 'Zimowisko 2023',
        offSongs: [OffSong.allOfficial[20], OffSong.allOfficial[21], OffSong.allOfficial[22], OffSong.allOfficial[23]],
        ownSongs: [ownSong2, ownSong3],
        colorsKey: CommonColorData.all.keys.toList()[9],
        iconKey: CommonIconData.all.keys.toList()[24]
    );
    album2.save(localOnly: true);
    OwnAlbum.addToAll(album2);

    Trop trop = Trop.createOwn(
        name: 'Mój super trop',
        category: TropCategory.harcNatura,
        customIconTropName: null,
        aims: [
          'Cel tropu 1',
          'Cel tropu 2'
        ],
        startDate: DateTime(2023, 10, 1),
        endDate: DateTime(2023, 10, 21),
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
        ],
        lastUpdateTime: null
    );
    trop.saveOwn(localOnly: true);
    Trop.addOwnToAll(trop);

    // Here is the proper test:

    Map<String, dynamic> resultNoIsolate = await ApiSync.buildPostReqMap(
      PostReqMapArgs(false, null, null, null, ReceivePort().sendPort)
    );

    Map<String, dynamic> resultIsolate = await compute(
        ApiSync.buildPostReqMap,
        PostReqMapArgs(
            false,
            SyncGetRespNode.all,
            RemoveSyncItem.all!,
            ShaPref.toMap(),
            ReceivePort().sendPort
        )
    );

    assert(const DeepCollectionEquality().equals(resultNoIsolate, resultIsolate));


  });

  tearDown(() {
    Directory dir = Directory(initTestPathsDir);
    if(dir.existsSync())
      dir.deleteSync(recursive: true);
  });

}
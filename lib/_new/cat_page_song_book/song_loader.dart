import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/logger.dart';
import 'package:path/path.dart';
import 'package:tuple/tuple.dart';

Future<Tuple7<
    List<OffSong?>,
    Map<String, OffSong>,

    List<OffSong?>,
    Map<String, OffSong>,

    List<OwnSong>,
    Map<String, OwnSong>,

    List<String>      //allErrors

>> decodeSongs(Tuple2<String?, String?> args) async{

  List<String> allErrors = [];

  String? allSongsCode = args.item1;
  String? ownSongsCode = args.item2;

  Map? allSongsJSONMap;
  if(allSongsCode != null) allSongsJSONMap = jsonDecode(allSongsCode);

  // OFFICIAL SONGS
  Map offSongsMap = {};
  if(allSongsJSONMap != null) offSongsMap = allSongsJSONMap['official'];
  List<OffSong?> allOffSongs = List.filled(offSongsMap.length, null, growable: true);
  Map<String, OffSong> allOffSongsMap = {};
  for(String fileName in offSongsMap.keys as Iterable<String>) {
    try {
      Map songMap = offSongsMap[fileName]['song'];
      int index = offSongsMap[fileName]['index'];

      OffSong song = OffSong.fromRespMap(fileName, songMap);
      allOffSongs[index] = song;
      allOffSongsMap[song.fileName] = song;
    } on Error {
      allErrors.add(fileName);
    }
  }
  allOffSongs.removeWhere((song) => song == null);
  allOffSongs = allOffSongs.cast<OffSong>();

  // CONFIDENTIAL SONGS
  Map confSongsMap = {};
  if(allSongsJSONMap != null) confSongsMap = allSongsJSONMap['conf'];
  List<OffSong?> allConfidSongs = List.filled(confSongsMap.length, null, growable: true);
  Map<String, OffSong> allConfidSongsMap = {};
  for(String fileName in confSongsMap.keys as Iterable<String>) {
    try {
      Map songMap = confSongsMap[fileName]['song'];
      int index = confSongsMap[fileName]['index'];

      OffSong song = OffSong.fromRespMap(fileName, songMap);
      allConfidSongs[index] = song;
      allConfidSongsMap[song.fileName] = song;
    } on Error {
      allErrors.add(fileName);
    }
  }
  allConfidSongs.removeWhere((song) => song == null);
  allConfidSongs = allConfidSongs.cast<OffSong>();

  // OWN SONGS
  Map ownSongsMap = {};
  if(ownSongsCode != null) ownSongsMap = jsonDecode(ownSongsCode);

  List<OwnSong> allOwnSongs = [];
  Map<String, OwnSong> allOwnSongsMap = {};
  for(String fileName in ownSongsMap.keys) {
    try {
      OwnSong song = OwnSong.fromRespMap(fileName, ownSongsMap[fileName]);
      allOwnSongs.add(song);
      allOwnSongsMap[song.fileName] = song;
    } catch (e){
      allErrors.add(fileName);
    }
  }

  return Tuple7(
      allOffSongs,
      allOffSongsMap,
      allConfidSongs,
      allConfidSongsMap,
      allOwnSongs,
      allOwnSongsMap,
      allErrors
  );

}

SongLoader songLoader = SongLoader();
class SongLoader extends SingleComputer<String, SingleComputerListener<String>>{

  @override
  String get computerName => 'SongLoader';

  @override
  Future<void> perform() async {
    List<Album> allAlbums = [];
    Map<String, Album> allAlbumsMap = {};

    List<Memory> allMemories = [];
    Map<String, Memory> allMemoriesMap = {};

    String? allSongsCode = await readStringFromAssets('assets/songs/all_songs.hrcpsng');

    String? ownSongsCode;
    try {
      ownSongsCode = readFileAsString(getOwnSongFilePath);
    } on FileNotFoundError{}
    catch (e) {
      logger.e(e);
    }

    Tuple7 result = await compute(decodeSongs, Tuple2(allSongsCode, ownSongsCode));

    OffSong.allOfficial = result.item1;
    OffSong.allOfficialMap = result.item2;
    OffSong.allConfid = result.item3;
    OffSong.allConfidMap = result.item4;
    OwnSong.init(result.item5, result.item6, recalculateAddPersRanking: false);
    Song.recalculateAddPersRanking();

    for (OffSong song in OffSong.allOfficial)
      song.initRate();

    for (OffSong song in OffSong.allConfid)
      song.initRate();

    for (OwnSong song in OwnSong.allOwn)
      song.initRate();

    for (String fileName in result.item7)
      await callError(fileName);

    // LOAD MEMORIES
    // LOAD MEMORIES
    Directory memoryDir = Directory(getSongMemoriesFolderPath);
    await memoryDir.create();

    for (FileSystemEntity file in memoryDir.listSync(recursive: false)) {
      try {
        Memory memory = Memory.read(basename(file.path));

        Song? song = OffSong.allOfficialMap[memory.songFileName];
        if (song == null) continue;
        song.addMemory(memory);
        allMemories.add(memory);
        allMemoriesMap[memory.fileName] = memory;
      } catch (e) {
        logger.e(e);
      }
    }

    // LOAD ALBUMS
    // LOAD ALBUMS
    Directory albumDir = Directory(getAlbumFolderPath);
    await albumDir.create();

    for (FileSystemEntity file in albumDir.listSync(recursive: false)) {
      try {
        Album album = Album.read(basename(file.path), Song.all);

        allAlbums.add(album);
        allAlbumsMap[album.fileName] = album;
      } catch (e) {
        logger.e(e);
      }
    }

    Album.allOwn = allAlbums;
    Album.allMap = allAlbumsMap;

    Memory.all = allMemories;
    Memory.allMap = allMemoriesMap;

    // LOAD CURRENT ALBUM
    // LOAD CURRENT ALBUM

    String? currAlbumFileName = ShaPref.getString(
        ShaPref.SHA_PREF_SPIEWNIK_CURR_ALBUM, Album.omega.fileName);

    bool currAlbumSet = false;
    for (Album album in allAlbums)
      if (album.fileName == currAlbumFileName) {
        Album.initCurrent(album);
        currAlbumSet = true;
        break;
      }

    if (!currAlbumSet)
      Album.initCurrent(Album.omega);

    OffSong.initialized = true;
    OwnSong.initialized = true;
    Memory.initialized = true;
    Album.initialized = true;
  }

}

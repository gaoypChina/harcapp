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
import 'package:harcapp_core_song_widget/song_rate.dart';
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

>> decodeSongs(Tuple3<String?, String?, String?> args) async{

  List<String> allErrors = [];

  String? allSongsCode = args.item1;
  String? ownSongsCode = args.item2;
  String? audioMetaRaw = args.item3;

  Map? allSongsJSONMap;
  if(allSongsCode != null) allSongsJSONMap = jsonDecode(allSongsCode);

  Map songAudioMap =
  audioMetaRaw==null?
  {}:
  jsonDecode(audioMetaRaw).cast<String, List>();

  // OFFICIAL SONGS
  Map offSongsMap = {};
  if(allSongsJSONMap != null) offSongsMap = allSongsJSONMap['official'];
  List<OffSong?> allOffSongs = List.filled(offSongsMap.length, null, growable: true);
  Map<String, OffSong> allOffSongsMap = {};
  for(String fileName in offSongsMap.keys as Iterable<String>) {
    try {
      Map songMap = offSongsMap[fileName]['song'];
      int index = offSongsMap[fileName]['index'];

      OffSong song = await OffSong.fromRespMap(
          fileName,
          songMap,
          songAudioMapList: songAudioMap[fileName]
      );
      allOffSongs[index] = song;
      allOffSongsMap[song.lclId] = song;
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

      OffSong song = await OffSong.fromRespMap(
          fileName,
          songMap,
          songAudioMapList: songAudioMap[fileName]
      );
      allConfidSongs[index] = song;
      allConfidSongsMap[song.lclId] = song;
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
  for(String lclId in ownSongsMap.keys) {
    try {
      OwnSong song = await OwnSong.fromRespMapSaved(lclId, ownSongsMap[lclId]);
      allOwnSongs.add(song);
      allOwnSongsMap[song.lclId] = song;
    } catch (e){
      allErrors.add(lclId);
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
    List<OwnAlbum> allAlbums = [];
    Map<String, OwnAlbum> allAlbumsMap = {};

    List<Memory> allMemories = [];
    Map<String, Memory> allMemoriesMap = {};

    String? allSongsCode = await readStringFromAssets('assets/songs/all_songs.hrcpsng');
    String? audioMetaRaw = await readStringFromAssets("assets/songs/audio_meta.json");

    String? ownSongsCode;
    try {
      ownSongsCode = readFileAsString(getOwnSongFilePath);
    } on FileNotFoundError{}
    catch (e) {
      logger.e(e);
    }

    Tuple7 result = await compute(decodeSongs, Tuple3(allSongsCode, ownSongsCode, audioMetaRaw));

    OffSong.allOfficial = result.item1;
    OffSong.allOfficialMap = result.item2;
    OffSong.allConfid = result.item3;
    OffSong.allConfidMap = result.item4;
    OwnSong.init(result.item5, result.item6, recalculateAddPersRanking: false);
    Song.recalculateAddPersRanking();

    for (OffSong song in OffSong.allOfficial)
      song.initReadableParams();

    for (OffSong song in OffSong.allConfid)
      song.initReadableParams();

    for (OwnSong song in OwnSong.allOwn)
      song.initReadableParams();

    for (String fileName in result.item7)
      await callError(fileName);

    // LOAD MEMORIES
    // LOAD MEMORIES
    Directory memoryDir = Directory(getSongMemoriesFolderPath);
    await memoryDir.create(recursive: true);

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
        OwnAlbum? album = OwnAlbum.read(basename(file.path), Song.all);
        if(album == null) continue;

        allAlbums.add(album);
        allAlbumsMap[album.lclId] = album;
      } catch (e) {
        logger.e(e);
      }
    }

    ToLearnAlbum.init();

    // TMP TMP TMP
    for(Song song in Song.all){
      if(song.rate == -1) {
        ToLearnAlbum.loaded.addSong(song);
        song.setRate(SongRate.RATE_NULL);
      }
    }
    if(ToLearnAlbum.loaded.songs.isNotEmpty)
      ToLearnAlbum.loaded.save();
    // End: TMP

    OwnAlbum.all = allAlbums;
    OwnAlbum.allMap = allAlbumsMap;

    Memory.all = allMemories;
    Memory.allMap = allMemoriesMap;

    // LOAD CURRENT ALBUM
    // LOAD CURRENT ALBUM

    String? currAlbumFileName = ShaPref.getString(
        ShaPref.SHA_PREF_SPIEWNIK_CURR_ALBUM, OmegaAlbum().lclId);

    bool currAlbumSet = false;
    for (OwnAlbum album in allAlbums)
      if (album.lclId == currAlbumFileName) {
        BaseAlbum.current = album;
        currAlbumSet = true;
        break;
      }

    if (!currAlbumSet)
      BaseAlbum.current = OmegaAlbum();

    OffSong.initialized = true;
    OwnSong.initialized = true;
    Memory.initialized = true;
    OwnAlbum.initialized = true;
  }

}


import 'dart:collection';
import 'dart:convert';

import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/own_song_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';

import 'memory.dart';
import 'song.dart';

class OwnSong extends Song<OwnSongResp>{

  static int get lastFileName{
    try {
      String content = readFileAsString(getOwnLastFileNameFilePath);
      if(content.isEmpty) return 0;

      return int.parse(content);
    }on Error{
      return allOwn.isEmpty?0:int.tryParse(allOwn.last.fileName)??-1;
    }
  }

  static List<OwnSong> allOwn;
  static SplayTreeMap<String, OwnSong> _allOwnMap;
  static SplayTreeMap<String, OwnSong> get allOwnMap => _allOwnMap;
  static set allOwnMap(Map<String, OwnSong> value) => _allOwnMap = value==null?null:SplayTreeMap.from(value);
  static addOwn(Song song){
    allOwn.add(song);
    _allOwnMap[song.fileName] = song;
  }
  static removeOwn(Song song){
    allOwn.remove(song);
    _allOwnMap.remove(song.fileName);
  }

  static const String PARAM_CODE = 'code';
  static const String SONG_TOO_LONG_RESP_CODE = 'songTooLong';
  static const int CODE_MAX_LENGTH = 5000;
  static const String EMPTY_SONG_CODE = """
  {
      \"title\": \"za_długa_piosenka\",
      \"hid_titles\": [],
      \"text_authors\": [],
      \"composers\": [],
      \"performers\": [],
      \"release_date\": null,
      \"show_rel_date_month\": false,
      \"show_rel_date_day\": false,
      \"yt_link\": null,
      \"add_pers\": [],
      \"tags\": [],
      \"parts\": []
  }
  """;

  OwnSong(
      String fileName,
      String title,
      List<String> hidTitles,
      List<String> authors,
      List<String> composers,
      List<String> performers,
      DateTime releaseDate,
      bool showRelDateMonth,
      bool showRelDateDay,
      List<String> addPers,
      String youtubeLink,
      List<String> tags,
      bool hasChords, String text,
      String baseChords,
      PrimitiveWrapper<int> rate,
      List<Memory> memoryList,
      Map<String, Memory> memoryMap
  ) : super(fileName,
      title,
      hidTitles,
      authors,
      composers,
      performers,
      releaseDate,
      showRelDateMonth,
      showRelDateDay,
      addPers,
      youtubeLink,
      tags,
      hasChords,
      text,
      baseChords,
      rate,
      memoryList,
      memoryMap
  );

  static OwnSong fromMap(String fileName, Map map){
    SongDataEntity songStuff = Song.fromMap(fileName, map);
    return OwnSong(
      fileName,
      songStuff.title,
      songStuff.hidTitles,
      songStuff.authors,
      songStuff.composers,
      songStuff.performers,
      songStuff.releaseDate,
      songStuff.showRelDateMonth,
      songStuff.showRelDateDay,
      songStuff.addPers,
      songStuff.youtubeLink,
      songStuff.tags,
      songStuff.hasChords,
      songStuff.text,
      songStuff.baseChords,
      songStuff.ratePrimWrap,
      songStuff.memoryList,
      songStuff.memoryMap
    );
  }

  copyWith(OwnSong song){
    title = song.title;
    hidTitles = song.hidTitles;
    authors = song.authors;
    composers = song.composers;
    performers = song.performers;
    addPers = song.addPers;
    youtubeLink = song.youtubeLink;
    tags = song.tags;
    hasChords = song.hasChords;
    text = song.text;
    baseChords = song.baseChords;
    ratePrimWrap = song.ratePrimWrap;
    memoryList = song.memoryList;
    memoryMap = song.memoryMap;

  }

  static OwnSong saveOwnSong(String code, {String lclId}) {

    if(lclId == null)
      lclId = '${OwnSong.lastFileName + 1}';
    else{
      int testVal = int.tryParse(lclId);
      if(testVal == null)
        throw Exception();
    }

    String allOwnSngsJsonStr;
    try{
      allOwnSngsJsonStr = readFileAsString(getOwnSongFilePath);
    } on Error{}

    Map allOwnSongsMap;
    if(allOwnSngsJsonStr != null)
      allOwnSongsMap = jsonDecode(allOwnSngsJsonStr);
    else
      allOwnSongsMap = {};

    Map jsonMap = jsonDecode(code);

    allOwnSongsMap[lclId] = jsonMap;
    allOwnSngsJsonStr = jsonEncode(allOwnSongsMap);
    saveStringAsFile(getOwnSongFilePath, allOwnSngsJsonStr);
    saveStringAsFile(getOwnLastFileNameFilePath, lclId);

    return OwnSong.fromMap(lclId, jsonMap);

  }

  recode(String code){
    Map map = jsonDecode(code);
    OwnSong song = OwnSong.fromMap(fileName, map);
    copyWith(song);
  }

  static const String REQ_GROUP = 'own_song';

  @override
  String get classId => REQ_GROUP;

  @override
  List<SyncableParam> get syncParams{

    List<SyncableParam> syncParams = super.syncParams;

    syncParams.add(
        SyncableParam.single(
          this,
          paramId: PARAM_CODE,
          value: () async => await code,
          notNone: () => false,
        )
    );

    return syncParams;
  }

  @override
  void saveSyncResult(Map<String, dynamic> resData, DateTime lastSync) {
    super.saveSyncResult(resData, lastSync);

    if(resData.containsKey(PARAM_CODE)) {
      dynamic resp = resData[PARAM_CODE];
      if(resp == true)
        setSyncState({PARAM_CODE: SyncableParamSingle.STATE_SYNCED});
      else if(resData == SONG_TOO_LONG_RESP_CODE) {
        setSyncState({PARAM_CODE: SyncableParamSingle.STATE_SYNCED});
        recode(EMPTY_SONG_CODE);
      }
    }
  }
  
  @override
  void applySyncResp(OwnSongResp resp) {
    super.applySyncResp(resp);
    if(resp.code != null) {
      recode(resp.code);
      saveOwnSong(resp.code);
    }
  }

}
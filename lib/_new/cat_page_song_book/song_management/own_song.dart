import 'dart:convert';

import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/own_song_get_resp.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core_song/song_core.dart';

import '../../../sync/syncable.dart';
import 'memory.dart';
import 'song.dart';

class OwnSong extends Song<OwnSongGetResp>{

  static int get lastFileName{
    try {
      String content = readFileAsString(getOwnLastFileNameFilePath);
      if(content.isEmpty) return 0;
      return int.parse(content);
    }on Error{
      return _allOwn.isEmpty?0:int.tryParse(_allOwn.last.fileName)??-1;
    }
  }

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static late List<OwnSong> _allOwn;
  static List<OwnSong> get allOwn => _allOwn;
  static late Map<String, OwnSong> _allOwnMap;
  static Map<String, OwnSong> get allOwnMap => _allOwnMap;
  static set allOwnMap(Map<String, OwnSong> value) => _allOwnMap = Map.from(value);
  static init(List<OwnSong> allOwn, Map<String, OwnSong> allOwnMap, {bool recalculateAddPersRanking = true}){
    _allOwn = allOwn;
    _allOwnMap = allOwnMap;
    if(recalculateAddPersRanking)
      Song.recalculateAddPersRanking();
  }
  static void addOwn(OwnSong song, {bool recalculateAddPersRanking = true}){
    _allOwn.add(song);
    _allOwnMap[song.fileName] = song;
    if(recalculateAddPersRanking)
      Song.recalculateAddPersRanking();
  }
  static void removeOwn(OwnSong song, {bool recalculateAddPersRanking = true}){
    _allOwn.remove(song);
    _allOwnMap.remove(song.fileName);
    if(recalculateAddPersRanking)
      Song.recalculateAddPersRanking();
  }

  static const String paramCode = 'code';
  static const String songTooLongRespCode = 'songTooLong';
  static const int codeMaxLength = 5000;
  static const String emptySongCode = """
  {
      "title": "za_długa_piosenka",
      "hid_titles": [],
      "text_authors": [],
      "composers": [],
      "performers": [],
      "release_date": null,
      "show_rel_date_month": false,
      "show_rel_date_day": false,
      "yt_link": null,
      "add_pers": [],
      "tags": [],
      "parts": []
  }
  """;

  OwnSong(
      String fileName,
      String title,
      List<String> hidTitles,
      List<String> authors,
      List<String> composers,
      List<String> performers,
      DateTime? releaseDate,
      bool showRelDateMonth,
      bool showRelDateDay,
      List<AddPerson> addPers,
      String youtubeLink,
      List<SongAudio> audios,
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
      audios,
      tags,
      hasChords,
      text,
      baseChords,
      rate,
      memoryList,
      memoryMap
  );

  static Future<OwnSong> fromRespMap(String fileName, Map respMap) async {
    SongDataEntity songStuff = await Song.fromRespMap(fileName, respMap);
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
      songStuff.audios,
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

  static Future<OwnSong> saveOwnSong(String code, {String? lclId}) async {

    if(lclId == null)
      lclId = '${OwnSong.lastFileName + 1}';
    else{
      int? testVal = int.tryParse(lclId);
      if(testVal == null)
        throw Exception();
    }

    String? allOwnSngsJsonStr;
    try{
      allOwnSngsJsonStr = readFileAsString(getOwnSongFilePath);
    } on Error{}

    Map? allOwnSongsMap;
    if(allOwnSngsJsonStr != null)
      allOwnSongsMap = jsonDecode(allOwnSngsJsonStr);
    else
      allOwnSongsMap = {};

    Map jsonMap = jsonDecode(code);

    allOwnSongsMap![lclId] = jsonMap;
    allOwnSngsJsonStr = jsonEncode(allOwnSongsMap);
    saveStringAsFile(getOwnSongFilePath, allOwnSngsJsonStr);
    saveStringAsFile(getOwnLastFileNameFilePath, lclId);

    return await OwnSong.fromRespMap(lclId, jsonMap);

  }

  Future<void> recode(String code) async {
    Map map = jsonDecode(code);
    OwnSong song = await OwnSong.fromRespMap(fileName, map);
    copyWith(song);
  }

  static const String syncClassId = 'ownSong';

  @override
  String get classId => syncClassId;

  @override
  List<SyncableParam> get childParams{

    List<SyncableParam> childParams = super.childParams;

    childParams.add(
        SyncableParamSingle(
          this,
          paramId: paramCode,
          value_: () => code,
          isNotSet_: () => false,
        )
    );

    return childParams;
  }

  @override
  void applySyncGetResp(OwnSongGetResp resp) {
    super.applySyncGetResp(resp);
    if(resp.code != null) {
      recode(resp.code!);
      saveOwnSong(resp.code!);
    }
  }

}
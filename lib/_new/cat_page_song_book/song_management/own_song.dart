import 'dart:convert';

import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/own_song_get_resp.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:uuid/uuid.dart';

import '../../../sync/syncable.dart';
import 'song.dart';

class OwnSong extends Song<OwnSongGetResp>{

  // static int get lastFileName{
  //   try {
  //     String content = readFileAsString(getOwnLastFileNameFilePath);
  //     if(content.isEmpty) return 0;
  //     return int.parse(content);
  //   }on Error{
  //     return _allOwn.isEmpty?0:int.tryParse(_allOwn.last.fileName)??-1;
  //   }
  // }

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static late List<OwnSong> _allOwn;
  static List<OwnSong> get allOwn => _allOwn;
  static late Map<String, OwnSong> _allOwnMap;
  static Map<String, OwnSong> get allOwnMap => _allOwnMap;
  static set allOwnMap(Map<String, OwnSong> value) => _allOwnMap = Map.from(value);
  static void sortSongs() => _allOwn.sort((s1, s2) => compareText(s1.title, s2.title));
  static void init(List<OwnSong> allOwn, Map<String, OwnSong> allOwnMap, {bool recalculateAddPersRanking = true}){
    _allOwn = allOwn;
    // Sort alphabetically
    sortSongs();
    _allOwnMap = allOwnMap;
    if(recalculateAddPersRanking) Song.recalculateAddPersRanking();
  }
  static void addToAll(OwnSong song, {bool recalculateAddPersRanking = true, bool sort = true}){
    if(_allOwnMap[song.lclId] != null) return;
    _allOwn.add(song);
    _allOwnMap[song.lclId] = song;
    if(recalculateAddPersRanking) Song.recalculateAddPersRanking();
    // Sort alphabetically
    if(sort) sortSongs();
  }
  static void removeFromAll(OwnSong song, {bool recalculateAddPersRanking = true}){
    _allOwn.remove(song);
    _allOwnMap.remove(song.lclId);
    if(recalculateAddPersRanking) Song.recalculateAddPersRanking();
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
      super.lclId,
      super.title,
      super.hidTitles,
      super.authors,
      super.composers,
      super.performers,
      super.releaseDate,
      super.showRelDateMonth,
      super.showRelDateDay,
      super.addPers,
      super.youtubeLink,
      super.audios,
      super.tags,
      super.hasChords,
      super.text,
      super.baseChords,
      super.rate,
      super.memoryList,
      super.memoryMap,
      super.hasExplanation,
      { required String code,
        required this.isSaved
      }): _code = code;

  String _code;

  @override
  String get code{
    if(isSaved){
      Map ownSongsMap = jsonDecode(readFileAsStringOrNull(getOldOwnSongFilePath)??'{}');
      Map? map = ownSongsMap[lclId];
      if(map == null) throw Exception();
      return jsonEncode(map);
    }
    return _code;
  }

  bool isSaved;

  static Future<OwnSong?> create({
    String? lclId,
    required String code,
  }) async {
    Map jsonMap;
    try{ jsonMap = jsonDecode(code); }
    on Error{ return null; }

    OwnSong song = await fromRespMapNotSaved(
      lclId??const Uuid().v4(),
      jsonMap,
      code: code
    );

    return song;
  }

  Future<void> save({bool localOnly=false, bool synced=false}) async {
    String? allOwnSngsJsonStr;
    try{
      allOwnSngsJsonStr = readFileAsString(getOldOwnSongFilePath);
    } on Error{}

    Map allOwnSongsMap;
    if(allOwnSngsJsonStr != null)
      allOwnSongsMap = jsonDecode(allOwnSngsJsonStr);
    else
      allOwnSongsMap = {};

    Map jsonMap = jsonDecode(code);

    allOwnSongsMap[lclId] = jsonMap;
    allOwnSngsJsonStr = jsonEncode(allOwnSongsMap);
    saveStringAsFile(getOldOwnSongFilePath, allOwnSngsJsonStr);

    _code = '';
    isSaved = true;

    setAllSyncState(
        synced?SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();
  }
  
  static Future<OwnSong> fromRespMapSaved(String lclId, Map respMap) async {
    SongDataEntity songStuff = await Song.fromRespMap(lclId, respMap);
    return OwnSong(
      lclId,
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
      songStuff.memoryMap,

      songStuff.hasExplanationPrimWrap,

      code: '',
      isSaved: true
    );
  }
  static Future<OwnSong> fromRespMapNotSaved(String lclId, Map respMap, {String? code}) async {
    SongDataEntity songStuff = await Song.fromRespMap(lclId, respMap);
    return OwnSong(
        lclId,
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
        PrimitiveWrapper(songStuff.ratePrimWrap.get()),
        songStuff.memoryList,
        songStuff.memoryMap,
        PrimitiveWrapper(songStuff.hasExplanationPrimWrap.get()),

        code: jsonEncode(respMap),
        isSaved: false
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
    hasExplanationPrimWrap = song.hasExplanationPrimWrap;
  }

  // static Future<OwnSong> saveOwnSong(String code, {String? lclId}) async {
  //
  //   lclId ??= const Uuid().v4();
  //
  //   String? allOwnSngsJsonStr;
  //   try{
  //     allOwnSngsJsonStr = readFileAsString(getOwnSongFilePath);
  //   } on Error{}
  //
  //   Map? allOwnSongsMap;
  //   if(allOwnSngsJsonStr != null)
  //     allOwnSongsMap = jsonDecode(allOwnSngsJsonStr);
  //   else
  //     allOwnSongsMap = {};
  //
  //   Map jsonMap = jsonDecode(code);
  //
  //   allOwnSongsMap![lclId] = jsonMap;
  //   allOwnSngsJsonStr = jsonEncode(allOwnSongsMap);
  //   saveStringAsFile(getOwnSongFilePath, allOwnSngsJsonStr);
  //   // saveStringAsFile(getOwnLastFileNameFilePath, lclId);
  //
  //   return await OwnSong.fromRespMap(lclId, jsonMap);
  //
  // }

  Future<bool> recode(String code) async {
    OwnSong? song = await OwnSong.create(lclId: lclId, code: code);
    if(song == null) return false;
    copyWith(song);
    _code = code;
    isSaved = false;
    return true;
  }

  static const String syncClassId = 'ownSong';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => SyncGetRespNode.ownSongNodes;

  @override
  List<SyncableParam> get childParams{

    List<SyncableParam> childParams = super.childParams;

    childParams.add(
        SyncableParamSingle(
          this,
          paramId: paramCode,
          value: () => code,
          isNotSet: () => false,
        )
    );

    return childParams;
  }

  @override
  Future<void> applySyncGetResp(OwnSongGetResp resp) async {
    recode(resp.code);
    // await save(localOnly: true, synced: true);
    super.applySyncGetResp(resp);
  }

}
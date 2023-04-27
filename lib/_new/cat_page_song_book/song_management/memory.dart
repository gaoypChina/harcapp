import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/date_format.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_new/api/sync_resp_body/memory_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:uuid/uuid.dart';

class MemoryBuilder{
  String songFileName;
  DateTime? date;
  String? place;
  String? desc;
  int fontIndex;
  bool published;

  MemoryBuilder(
    this.songFileName,
    this.date,
    this.place,
    this.desc,
    this.fontIndex,
    this.published
  );

  static MemoryBuilder from(Memory memory) => MemoryBuilder(
      memory.songLclId,
      memory.date,
      memory.place,
      memory.desc,
      memory.fontIndex,
      memory.published
  );

  static MemoryBuilder empty(Song song) => MemoryBuilder(song.lclId, DateTime.now(), '', '', 1, false);

  Memory build(String fileName) => Memory(
    fileName,
    songFileName,
    date,
    place,
    desc,
    fontIndex,
    published
  );
}

class Memory extends SyncableParamGroupMixin with SyncGetRespNode<MemoryGetResp>, RemoveSyncItem{

  static const fontNameMap = {
    0: 'Annie',
    1: 'Dekko',
    2: 'Caveat',
    3: 'Cedarville',
    4: 'Architects daughter',
    5: 'Gloria hallelujah',
    6: 'Grand hotel',
    7: 'Havanna',
    8: 'Kalam',
    9: 'Marck script',
    10: 'Montez',
    11: 'Reenie beanie',
    12: 'Sacramento',
    13: 'Scriptina pro',
    14: 'Into light',
    15: 'Trypewriter',
  };

  static const fontSizeRatioMap = {
    0: 1.2,
    1: 1.1,
    2: 1.3,
    3: 1.1,
    4: 1.0,
    5: 1.0,
    6: 1.2,
    7: 1.1,
    8: 1.0,
    9: 1.1,
    10: 1.3,
    11: 1.4,
    12: 1.5,
    13: 1.2,
    14: 1.0,
    15: 1.0,
  };

  static const String paramLclId = 'file_name';
  static const String paramSongLclId = 'song_file_name';
  static const String paramDate = 'date';
  static const String paramPlace = 'place';
  static const String paramDesc = 'desc';
  static const String paramFontKey = 'fontKey';
  static const String paramPublished = 'published';

  static String get fontName => 'Hand';
  static int get fontLength => 16;

  static const int maxLenPlace = 80;
  static const int maxLenDescription = 200;

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static late List<Memory> all;
  static late Map<String?, Memory> allMap;

  static void addToAll(Memory memory){

    if(allMap[memory.lclId] != null) return;

    all.add(memory);
    allMap[memory.lclId] = memory;
  }

  static void removeFromAll(Memory memory){

    if(allMap[memory.lclId] != null) return;

    all.remove(memory);
    allMap.remove(memory.lclId);
  }

  static TextStyle get(BuildContext context, int index) =>
      TextStyle(
          fontSize: Dimen.TEXT_SIZE_BIG,
          fontFamily: '$fontName$index',
          fontWeight: FontWeight.w300,
          color: textEnab_(context)
      );

  final String lclId;
  String songLclId;
  DateTime? date;
  String? place;
  String? desc;
  int fontIndex;
  bool published;

  Memory(this.lclId, this.songLclId, this.date, this.place, this.desc, this.fontIndex, this.published);

  static Memory fromRespMap(Map respMap){

    String lclId = respMap[paramLclId];
    String songLclId = respMap[paramSongLclId]??'!';
    DateTime date = DateTime.parse(respMap[Memory.paramDate]);
    String place = respMap[paramPlace]??'';
    String desc = respMap[paramDesc]??'';
    int fontIndex = respMap[paramFontKey]??0;
    bool published = respMap[paramPublished]??false;

    return Memory(lclId, songLclId, date, place, desc, fontIndex, published);

  }

  static Memory read(String fileName){
    String content = readFileAsString(getSongMemoriesFolderPath + fileName);
    return Memory.decode(fileName, content);
  }

  static Memory create({
      String? lclId,
      required String songLclId,
      required DateTime date,
      required String? place,
      required String? desc,
      required int fontIndex,
      required bool published, 
      bool localOnly=false
  }){

    lclId = lclId??const Uuid().v4();

    String code = Memory.encode(songLclId, date, place, desc, fontIndex, published);
    saveStringAsFileToFolder(
        getSongMemoriesFolderLocalPath,
        code,
        fileName: lclId,
    );

    Memory memory = Memory(lclId, songLclId, date, place, desc, fontIndex, published);
    memory.setAllSyncState(SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly)
      synchronizer.post();
    return memory;
  }

  static String encode(String? songLclId, DateTime date, String? place, String? desc, int fontIndex, bool published){

    Map<String, dynamic> map = {
      paramSongLclId: songLclId,
      paramDate: date.toIso8601String(),
      paramPlace: place,
      paramDesc: desc,
      paramFontKey: fontIndex,
      paramPublished: published,
    };

    return jsonEncode(map);

  }

  static Memory decode(String lclId, String code){

    Map<String, dynamic> map = jsonDecode(code);

    String songFileName = map[paramSongLclId];
    DateTime? date;
    try{
      date = DateTime.tryParse(map[paramDate]);
    } catch(error) {
      date = null;
    }
    String place = map[paramPlace]??(throw MissingDecodeParamError(paramPlace));
    String desc = map[paramDesc]??(throw MissingDecodeParamError(paramDesc));
    int fontIndex = map[paramFontKey]??(throw MissingDecodeParamError(paramFontKey));
    bool published = map[paramPublished]??(throw MissingDecodeParamError(paramPublished));

    return Memory(
        lclId,
        songFileName,
        date,
        place,
        desc,
        fontIndex,
        published
    );

  }

  void save({bool localOnly = false, bool synced = false}) {

    saveStringAsFileToFolder(
        getSongMemoriesFolderLocalPath,
        encode(songLclId, date!, place, desc, fontIndex, published),
        fileName: lclId
    );

    setAllSyncState(
        synced?SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();
  }

  void delete({bool localOnly=false}){
    markSyncAsRemoved();
    File(getSongMemoriesFolderPath + lclId).deleteSync();
    if(!localOnly) synchronizer.post();
  }

  void update({
    required String? songLclId,
    required DateTime? date,
    required String? place,
    required String? desc,
    required int? fontIndex,
    required bool? published,
    bool localOnly=false})
  {
    if(songLclId != null) this.songLclId = songLclId;
    if(date != null) this.date = date;
    if(place != null) this.place = place;
    if(desc != null) this.desc = desc;
    if(fontIndex != null) this.fontIndex = fontIndex;
    if(published != null) this.published = published;

    save(localOnly: localOnly);
  }

  @override
  bool operator == (Object other) => other is Memory && lclId == other.lclId;

  static const syncClassId = 'memory';

  @override
  String get debugClassId => syncClassId;

  @override
  int get hashCode => lclId.hashCode;

  @override
  SyncableParam get parentParam => Song.allMap[songLclId]!.syncParamMemories;

  @override
  String get paramId => lclId;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: paramDate,
      value: () => date==null?null:formatDate(date!),
    ),

    SyncableParamSingle(
      this,
      paramId: paramPlace,
      value: () => place,
    ),

    SyncableParamSingle(
      this,
      paramId: paramDesc,
      value: () => desc,
    ),

    SyncableParamSingle(
      this,
      paramId: paramFontKey,
      value: () => fontIndex,
    ),

    SyncableParamSingle(
      this,
      paramId: paramPublished,
      value: () => published,
    ),
  ];

  @override
  void applySyncGetResp(MemoryGetResp resp) {
    date = resp.date;
    if(resp.place != null)
      place = resp.place;
    if(resp.desc != null)
      desc = resp.desc;
    fontIndex = resp.fontKey;
    published = resp.published;

    save(localOnly: true);
  }

}

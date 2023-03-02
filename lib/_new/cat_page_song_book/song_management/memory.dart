
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_new/api/sync_resp_body/memory_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

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
      memory.songFileName,
      memory.date,
      memory.place,
      memory.desc,
      memory.fontIndex,
      memory.published
  );

  static MemoryBuilder empty(Song song) => MemoryBuilder(song.fileName, DateTime.now(), '', '', 1, false);

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

class Memory extends SyncableParamGroup_ with SyncNode<MemoryGetResp>, RemoveSyncItem{

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

  static const String PARAM_ID = 'file_name';
  static const String paramSongFileName = 'song_file_name';
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

    if(allMap[memory.fileName] != null) return;

    all.add(memory);
    allMap[memory.fileName] = memory;
  }

  static TextStyle get(BuildContext context, int index) =>
      TextStyle(
          fontSize: Dimen.TEXT_SIZE_BIG,
          fontFamily: '$fontName$index',
          fontWeight: FontWeight.w300,
          color: textEnab_(context)
      );

  final String fileName;
  String songFileName;
  DateTime? date;
  String? place;
  String? desc;
  int fontIndex;
  bool published;

  Memory(this.fileName, this.songFileName, this.date, this.place, this.desc, this.fontIndex, this.published);

  static Memory fromRespMap(Map respMap){

    String fileName = respMap[PARAM_ID];
    String songFileName = respMap[paramSongFileName]??'!';
    DateTime date = DateTime.parse(respMap[Memory.paramDate]);
    String place = respMap[paramPlace]??'';
    String desc = respMap[paramDesc]??'';
    int fontIndex = respMap[paramFontKey]??0;
    bool published = respMap[paramPublished]??false;

    return Memory(fileName, songFileName, date, place, desc, fontIndex, published);

  }

  static Memory read(String fileName){
    String content = readFileAsString(getSongMemoriesFolderPath + fileName);
    return Memory.decode(fileName, content);
  }

  static Memory create(String songFileName, DateTime date, String? place, String? desc, int fontIndex, bool published, {bool localOnly=false}){

    String code = Memory.encode(songFileName, date, place, desc, fontIndex, published);
    File file = saveStringAsFileToFolder(getSongMemoriesFolderLocalPath, code);

    Memory memory = Memory(path.basename(file.path), songFileName, date, place, desc, fontIndex, published);
    memory.setAllSyncState(SyncableParamSingle_.stateNotSynced);
    if(!localOnly)
      synchronizer.post();
    return memory;
  }

  static String encode(String? songFileName, DateTime date, String? place, String? desc, int fontIndex, bool published){

    Map<String, dynamic> map = {
      paramSongFileName: songFileName,
      paramDate: date.toIso8601String(),
      paramPlace: place,
      paramDesc: desc,
      paramFontKey: fontIndex,
      paramPublished: published,
    };

    return json.encode(map);

  }

  static Memory decode(String fileName, String code){

    Map<String, dynamic> map = json.decode(code);

    String songFileName = map[paramSongFileName];
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
        fileName,
        songFileName,
        date,
        place,
        desc,
        fontIndex,
        published
    );

  }

  void save({localOnly=false}) {

    saveStringAsFileToFolder(
        getSongMemoriesFolderLocalPath,
        encode(songFileName, date!, place, desc, fontIndex, published),
        fileName: fileName
    );

    if(!localOnly)
      synchronizer.post();
  }

  void delete({bool localOnly=false}){
    markSyncAsRemoved();
    File(getSongMemoriesFolderPath + fileName).deleteSync();
    if(!localOnly) synchronizer.post();
  }

  void update({
    required String? songFileName,
    required DateTime? date,
    required String? place,
    required String? desc,
    required int? fontIndex,
    required bool? published,
    bool localOnly=false})
  {
    if(songFileName != null) this.songFileName = songFileName;
    if(date != null) this.date = date;
    if(place != null) this.place = place;
    if(desc != null) this.desc = desc;
    if(fontIndex != null) this.fontIndex = fontIndex;
    if(published != null) this.published = published;

    save(localOnly: localOnly);
  }

  @override
  bool operator == (Object other) => other is Memory && fileName == other.fileName;

  static const syncClassId = 'memory';

  @override
  int get hashCode => fileName.hashCode;

  @override
  String get paramId => fileName;

  @override
  List<SyncableParam> get childParams => [
    SyncableParamSingle(
      this,
      paramId: paramDate,
      value_: () => date==null?null:DateFormat('yyyy-MM-dd').format(date!),
    ),
    SyncableParamSingle(
      this,
      paramId: paramPlace,
      value_: () => place,
    ),
    SyncableParamSingle(
      this,
      paramId: paramDesc,
      value_: () => desc,
    ),
    SyncableParamSingle(
      this,
      paramId: paramFontKey,
      value_: () => fontIndex,
    ),

    SyncableParamSingle(
      this,
      paramId: paramPublished,
      value_: () => published,
    ),
  ];

  @override
  void applySyncGetResp(MemoryGetResp resp) {
    if(resp.date != null)
      date = resp.date;
    if(resp.place != null)
      place = resp.place;
    if(resp.desc != null)
      desc = resp.desc;
    if(resp.fontKey != null)
      fontIndex = resp.fontKey;
    if(resp.published != null)
      published = resp.published;

    save(localOnly: true);
  }

}

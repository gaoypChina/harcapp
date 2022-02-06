
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/memory_resp.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class MemoryBuilder{
  String songFileName;
  DateTime date;
  String place;
  String desc;
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

class Memory with SyncableItem<MemoryResp>{

  static const FONT_NAME_MAP = {
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

  static const FONT_SIZE_RATIO_MAP = {
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
  static const String PARAM_SONG_FILE_NAME = 'song_file_name';
  static const String PARAM_DATE = 'date';
  static const String PARAM_PLACE = 'place';
  static const String PARAM_DESC = 'desc';
  static const String PARAM_FONT_KEY = 'font_key';
  static const String PARAM_PUBLISHED = 'published';

  static String get fontName => 'Hand';
  static int get fontLength => 16;

  static List<Memory> all;
  static Map<String, Memory> allMap;

  static void addToAll(Memory memory){
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
  DateTime date;
  String place;
  String desc;
  int fontIndex;
  bool published;

  Memory(this.fileName, this.songFileName, this.date, this.place, this.desc, this.fontIndex, this.published);

  static Memory fromResponseData(Map responseData){

    String fileName = responseData[PARAM_ID];
    String songFileName = responseData[PARAM_SONG_FILE_NAME]??'!';
    DateTime date = DateTime.parse(responseData[Memory.PARAM_DATE]);
    String place = responseData[PARAM_PLACE]??'';
    String desc = responseData[PARAM_DESC]??'';
    int fontIndex = responseData[PARAM_FONT_KEY]??0;
    bool published = responseData[PARAM_PUBLISHED]??false;

    return Memory(fileName, songFileName, date, place, desc, fontIndex, published);

  }

  static Memory read(String fileName){
    String content = readFileAsString(getSongMemoriesFolderPath + fileName);
    return Memory.decode(fileName, content);
  }

  static Memory create(String songFileName, DateTime date, String place, String desc, int fontIndex, bool published, {bool localOnly=false, List<String> syncParams}){

    String code = Memory.encode(songFileName, date, place, desc, fontIndex, published);
    File file = saveStringAsFileToFolder(getSongMemoriesFolderLocalPath, code);

    Memory memory = Memory(path.basename(file.path), songFileName, date, place, desc, fontIndex, published);
    memory.setAllSyncState(SyncableParamSingle.STATE_NOT_SYNCED);
    if(!localOnly)
      memory.syncPost(syncParams);
    return memory;
  }

  static String encode(String songFileName, DateTime date, String place, String desc, int fontIndex, bool published){

    Map<String, dynamic> map = {
      PARAM_SONG_FILE_NAME: songFileName,
      PARAM_DATE: date.toIso8601String(),
      PARAM_PLACE: place,
      PARAM_DESC: desc,
      PARAM_FONT_KEY: fontIndex,
      PARAM_PUBLISHED: published,
    };

    return json.encode(map);

  }

  static Memory decode(String fileName, String code){

    Map<String, dynamic> map = json.decode(code);

    String songFileName = map[PARAM_SONG_FILE_NAME];
    DateTime date;
    try{
      date = DateTime.tryParse(map[PARAM_DATE]);
    } catch(error) {
      date = null;
    }
    String place = map[PARAM_PLACE]??'';
    String desc = map[PARAM_DESC]??'';
    int fontIndex = map[PARAM_FONT_KEY]??0;
    bool published = map[PARAM_PUBLISHED]??false;

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

  void save({localOnly=false, List<String> syncParams}) {

    saveStringAsFileToFolder(
        getSongMemoriesFolderLocalPath,
        encode(songFileName, date, place, desc, fontIndex, published),
        fileName: fileName
    );

    if(!localOnly)
      syncPost(syncParams);
  }

  Future<void> delete({bool localOnly=false})async{
    await setSyncStateRemove();
    File(getSongMemoriesFolderPath + fileName).deleteSync();
    if(!localOnly) synchronizer.post();
  }

  void update({
    @required String songFileName,
    @required DateTime date,
    @required String place,
    @required String desc,
    @required int fontIndex,
    @required bool published,
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

  void set(Memory memory, {bool localOnly=false}){
    update(
        songFileName: memory.songFileName,
        date: memory.date,
        place: memory.place,
        desc: memory.desc,
        fontIndex: memory.fontIndex,
        published: memory.published,
        localOnly: localOnly
    );
  }

  bool operator == (Object other) => other is Memory && fileName == other.fileName;

  int get hashCode => fileName.hashCode;

  static const String REQ_GROUP = 'memories';

  @override
  String get classId => REQ_GROUP;

  @override
  String get objectId => fileName;

  @override
  List<SyncableParam> get syncParams => [
    SyncableParam.single(
      this,
      paramId: PARAM_DATE,
      value: () async => await date==null?null:DateFormat('yyyy-MM-dd').format(date),
      notNone: () => false,
    ),
    SyncableParam.single(
      this,
      paramId: PARAM_PLACE,
      value: () async => await place,
      notNone: () => false,
    ),
    SyncableParam.single(
      this,
      paramId: PARAM_DESC,
      value: () async => await desc,
      notNone: () => false,
    ),
    SyncableParam.single(
      this,
      paramId: PARAM_FONT_KEY,
      value: () async => await fontIndex,
      notNone: () => false,
    ),

    SyncableParam.single(
      this,
      paramId: PARAM_PUBLISHED,
      value: () async => await published,
      notNone: () => false,
    ),
  ];

  @override
  void applySyncResp(MemoryResp resp) {
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

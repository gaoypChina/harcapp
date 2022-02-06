
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/memory_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/chord_shifter.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';

import '../common.dart';
import 'memory.dart';
import 'off_song.dart';
import 'old/song_element_old.dart';
import 'own_song.dart';

class SongDataEntity{

  final String fileName;
  final String title;
  final List<String> hidTitles;
  final List<String> authors;
  final List<String> composers;
  final List<String> performers;
  final DateTime releaseDate;
  final bool showRelDateMonth;
  final bool showRelDateDay;
  final List<String> addPers;
  final String youtubeLink;
  final List<String> tags;
  final bool hasChords;
  final String text;
  final String baseChords;
  final PrimitiveWrapper<int> ratePrimWrap;
  final List<Memory> memoryList;
  final Map<String, Memory> memoryMap;

  const SongDataEntity(
      this.fileName,
      this.title,
      this.hidTitles,
      this.authors,
      this.composers,
      this.performers,
      this.releaseDate,
      this.showRelDateMonth,
      this.showRelDateDay,
      this.addPers,
      this.youtubeLink,
      this.tags,
      this.hasChords,
      this.text,
      this.baseChords,
      this.ratePrimWrap,
      this.memoryList,
      this.memoryMap
  );
}

abstract class Song<T extends SongResp> with SyncableItem<T>, SongCore{

  static List<Song> recomended;

  static bool get songsLoaded => OffSong.allOfficial != null;

  static List<Song> get all{
    List<Song> songs = [];
    songs.addAll(OwnSong.allOwn);
    songs.addAll(OffSong.allOfficial);
    return songs;
  }
  static SplayTreeMap<String, Song> get allMap{
    SplayTreeMap<String, Song> map = SplayTreeMap<String, Song>();
    map.addAll(OwnSong.allOwnMap);
    map.addAll(OffSong.allOfficialMap);
    return map;
  }

  static const String PARAM_LCL_ID = 'lcl_id';
  static const String PARAM_RATE = 'rate';
  static const String PARAM_CHORD_SHIFT = 'chord_shift';
  static const String PARAM_MEMORY = Memory.REQ_GROUP;

  static const String TAB_CHAR = '   ';

  static const String DEF_TITLE = '_#NO_TITLE';
  static const List<String> DEF_AUTHORS = [];
  static const List<String> DEF_COMPOSERS = [];
  static const List<String> DEF_PERFORMERS = [];
  static const String DEF_YOUTUBE_LINK = '';
  static const List<String> DEF_ADD_PERS = [];


  @override
  final String fileName;

  String _title;
  @protected
  set title(String value) => _title = value;
  @override
  String get title => _title;

  List<String> _hidTitles;
  @protected
  set hidTitles(List<String> value) => _hidTitles = value;
  @override
  List<String> get hidTitles => _hidTitles;

  List<String> _authors;
  @protected
  set authors(List<String> value) => _authors = value;
  @override
  List<String> get authors => _authors;

  List<String> _composers;
  @protected
  set composers(List<String> value) => _composers = value;
  @override
  List<String> get composers => _composers;

  DateTime _releaseDate;
  @protected
  set releaseDate(DateTime value) => _releaseDate = value;
  @override
  DateTime get releaseDate => _releaseDate;

  bool _showRelDateMonth;
  @protected
  set showRelDateMonth(bool value) => _showRelDateMonth = value;
  @override
  bool get showRelDateMonth => _showRelDateMonth;

  bool _showRelDateDay;
  @protected
  set showRelDateDay(bool value) => _showRelDateDay = value;
  @override
  bool get showRelDateDay => _showRelDateDay;

  List<String> _performers;
  @protected
  set performers(List<String> value) => _performers = value;
  @override
  List<String> get performers => _performers;

  List<String> _addPers;
  @protected
  set addPers(List<String> value) => _addPers = value;
  @override
  List<String> get addPers => _addPers;

  String _youtubeLink;
  @protected
  set youtubeLink(String value) => _youtubeLink = value;
  @override
  String get youtubeLink => _youtubeLink;

  bool get isOwn => !isOfficial && !isConfid;

  bool get isConfid => fileName.length >= 4 && fileName.substring(0, 4) == 'oc!_';
  bool get isOfficial => fileName.length >= 3 && fileName.substring(0, 3) == 'o!_';

  List<String> _tags;
  @protected
  set tags(List<String> value) => _tags = value;
  @override
  List<String> get tags => _tags;

  bool _hasChords;
  @protected
  set hasChords(bool value) => _hasChords = value;
  @override
  bool get hasChords => _hasChords;

  String _text;
  @protected
  set text(String value) => _text = value;
  @override
  String get text => _text;

  @protected
  String baseChords;

  @protected
  PrimitiveWrapper<int> ratePrimWrap;

  @protected
  List<Memory> memoryList;

  @protected
  Map<String, Memory> memoryMap;

  List<Memory> get memories => memoryList;

  String get tagsAsString{
    String text = '';
    for(String tag in tags)
      text += '${tag }   ';
    if(text.isEmpty) return '#';
    return text;
  }

  Song(
      this.fileName,
      this._title,
      this._hidTitles,
      this._authors,
      this._composers,
      this._performers,
      this._releaseDate,
      this._showRelDateDay,
      this._showRelDateMonth,
      this._addPers,
      this._youtubeLink,

      this._tags,

      this._hasChords,
      this._text,
      this.baseChords,
      this.ratePrimWrap,
      this.memoryList,
      this.memoryMap
      );

  static SongDataEntity parse(String fileName, String code) {

    Map<String, dynamic> map = jsonDecode(code)[fileName];

    return Song.fromMap(fileName, map);

  }

  @protected
  static SongDataEntity fromMap(String fileName, Map map){

    List<Memory> memoryList = [];
    Map<String, Memory> memoryMap = {};
    bool hasChords = false;

    String title = map[SongCore.PARAM_TITLE]??DEF_TITLE;
    List<String> addTitles = ((map[SongCore.PARAM_HID_TITLES]??[]) as List).cast<String>();
    List<String> authors = ((map[SongCore.PARAM_TEXT_AUTHORS]??DEF_AUTHORS) as List).cast<String>();
    List<String> performers = ((map[SongCore.PARAM_PERFORMERS]??DEF_PERFORMERS) as List).cast<String>();
    List<String> composers = ((map[SongCore.PARAM_COMPOSERS]??DEF_COMPOSERS) as List).cast<String>();
    DateTime releaseDate = DateTime.tryParse(map[SongCore.PARAM_REL_DATE]??'');
    bool showRelDateMonth = map[SongCore.PARAM_SHOW_REL_DATE_MONTH]??true;
    bool showRelDateDay = map[SongCore.PARAM_SHOW_REL_DATE_DAY]??true;
    String ytLink = map[SongCore.PARAM_YT_LINK]??DEF_YOUTUBE_LINK;
    List<String> addPers = ((map[SongCore.PARAM_ADD_PERS]??DEF_ADD_PERS) as List).cast<String>();
    List<String> tags = ((map[SongCore.PARAM_TAGS]??[]) as List).cast<String>();
    SongElementOld refren;
    if (map.containsKey(SongCore.PARAM_REFREN)) {
      Map refrenMap = map[SongCore.PARAM_REFREN];
      refren = SongElementOld.from(refrenMap['text'], refrenMap['chords']);
    }

    tags.removeWhere((tag) => tag.isEmpty);

    String songChords = '';
    String songText = '';

    List<dynamic> partsList = map[SongCore.PARAM_PARTS]??[];
    for (Map partMap in partsList) {
      if (partMap.containsKey('refren'))
        for (int i = 0; i < partMap['refren']; i++) {
          songText += refren.getText(withTabs: true);
          songChords += refren.getChords();

          int textLines =  refren.getText(withTabs: true).split("\n").length;
          int chodsLines = refren.getChords().split("\n").length;
          for(int j=0; j<chodsLines-textLines; j++)
            songText += '\n';
          for(int j=0; j<textLines-chodsLines; j++)
            songChords += '\n';

          if(songChords.replaceAll('\n', '').isNotEmpty)
            hasChords = true;

          songText += '\n\n';
          songChords += '\n\n';
        }
      else {

        String text = partMap['text'];
        if(partMap['shift'])
          text = TAB_CHAR + text.replaceAll('\n', '\n$TAB_CHAR');

        songText += text;
        songChords += partMap['chords'];

        int textLines = songText.split('\n').length;
        int chodsLines = songChords.split('\n').length;
        for(int j=0; j < chodsLines - textLines; j++)
          songText += '\n';
        for(int j=0; j < textLines - chodsLines; j++)
          songChords += '\n';

        if(songChords.replaceAll('\n', '').isNotEmpty)
          hasChords = true;

        songText += '\n\n';
        songChords += '\n\n';
      }
    }

    //remove last '\n'
    if(songText.isNotEmpty)
      songText = songText.substring(0, songText.length - 2).replaceAll('\t', TAB_CHAR);

    if(songChords.isNotEmpty)
      songChords = songChords.substring(0, songChords.length - 2);

    //ChordShifter chordShifter = ChordShifter(songChords, readChordShift(fileName));
    //PrimitiveWrapper<int> rate = PrimitiveWrapper(readRate(fileName));

    return SongDataEntity(
      fileName,
      title,
      addTitles,
      authors,
      composers,
      performers,
      releaseDate,
      showRelDateMonth,
      showRelDateDay,
      addPers,
      ytLink,

      tags,

      hasChords,
      songText,
      songChords,
      PrimitiveWrapper(null),//rate,
      memoryList,
      memoryMap
    );
  }

  Future<String> get code async => jsonEncode(await getSongMap(fileName));

  Future<String> toQRData() async => Base64Codec().encode(Utf8Encoder().convert(await code).toList());

  static SongDataEntity from(String codeBase64){
    String code = Utf8Decoder().convert(Base64Codec().decode(codeBase64).toList());
    return Song.parse('_shared', code);
  }

  String get chords => ChordShifter.run(baseChords, readChordShift(fileName));

  void shiftChordsUp() =>
    setChordShift(ChordShifter.shiftToneUp(readChordShift(fileName)));

  void shiftChordsDown() =>
    setChordShift(ChordShifter.shiftToneDown(readChordShift(fileName)));

  void initRate() => ratePrimWrap.set(readRate(fileName));

  static int readRate(String fileName) => shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(fileName), SongRate.RATE_NULL);

  @override
  int get rate => ratePrimWrap.get();

  void setRate(int rate, {bool localOnly = false}) {
    this.ratePrimWrap.set(rate);
    shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(fileName), rate);
    setSyncState({PARAM_RATE: SyncableParamSingle.STATE_NOT_SYNCED});
    if(!localOnly) synchronizer.post();
  }

  static int readChordShift(String fileName) => shaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(fileName), 0);
  void setChordShift(int chordShift, {bool localOnly = false}) {
    shaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(fileName), chordShift);
    setSyncState({PARAM_CHORD_SHIFT: SyncableParamSingle.STATE_NOT_SYNCED});
    if(!localOnly) synchronizer.post(aggregateDelay: SynchronizerEngine.aggregateChordChangeDuration);
  }

  void addMemory(Memory memory){
    memories.add(memory);
    memoryMap[memory.fileName] = memory;
  }

  Future<void> removeAllMemories({bool localOnly = false})async{
    for(Memory memory in memories) {
      await memory.delete(localOnly: localOnly);
    }
    memories.clear();
  }

  Future<void> removeMemory(Memory memory, {bool localOnly = false})async{
    await memory.delete(localOnly: localOnly);
    memories.remove(memory);
  }

  Future<bool> deleteSongFile({bool localOnly = false}) async{
    if(isOwn) {
      Map ownSongs = jsonDecode(readFileAsString(getOwnSongFilePath));
      ownSongs.remove(fileName);
      saveStringAsFile(getOwnSongFilePath, jsonEncode(ownSongs));

      for(Memory memory in memories)
        await memory.delete();
      await setSyncStateRemove();
      if(!localOnly) synchronizer.post();
      return true;
    } else
      return false;

  }

  bool operator == (Object other) =>
      other is Song &&
          isConfid == other.isConfid &&
          isOfficial == other.isOfficial &&
          fileName == other.fileName;

  int get hashCode => isConfid.hashCode + isOfficial.hashCode + fileName.hashCode;

  @override
  List<SyncableParam> get syncParams => [

    SyncableParam.single(
      this,
      paramId: PARAM_RATE,
      value: () async => await rate,
      notNone: () => rate != SongRate.RATE_NULL
    ),
    SyncableParam.single(
      this,
      paramId: PARAM_CHORD_SHIFT,
      value: () async => await readChordShift(fileName),
      notNone: () => readChordShift(fileName) != 0
    ),

    SyncableParam.group<Memory>(
        this,
        items: memories
    )

  ];

  @override
  String get objectId => fileName;

  @override
  void saveSyncResult(Map<String, dynamic> resData, DateTime lastSync) {
    if(resData.containsKey(PARAM_RATE))
      setSyncState({PARAM_RATE: SyncableParamSingle.STATE_SYNCED});

    if(resData.containsKey(PARAM_CHORD_SHIFT))
      setSyncState({PARAM_CHORD_SHIFT: SyncableParamSingle.STATE_SYNCED});

    if(resData.containsKey(PARAM_MEMORY))
      for(String lclId in resData[PARAM_MEMORY].keys){
        Memory memory = memoryMap[lclId];
        memory.saveSyncResult(resData[PARAM_MEMORY][lclId], lastSync);
      }

    this.lastSync = lastSync;
  }

  @override
  void applySyncResp(T resp) {
    if(resp.rate != null)
      setRate(resp.rate, localOnly: true);

    if(resp.chordShift != null)
      setChordShift(resp.chordShift, localOnly: true);

    if(resp.memories != null)
      for (String memLclId in resp.memories.keys) {
        MemoryResp memResp = resp.memories[memLclId];
        Memory mem = memoryMap[memLclId];
        if(mem == null) {
          mem = Memory.create(
              fileName,
              memResp.date,
              memResp.place,
              memResp.desc,
              memResp.fontKey,
              memResp.published
          );
          mem.save(localOnly: true);

          Memory.addToAll(mem);
          addMemory(mem);
        }else
          mem.applySyncResp(memResp);
      }
  }
}
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/memory_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_get_resp.dart';
import 'package:harcapp/sync/syncable_new.dart';
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
  final DateTime? releaseDate;
  final bool showRelDateMonth;
  final bool showRelDateDay;
  final List<AddPerson> addPers;
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

abstract class Song<T extends SongGetResp> extends SyncableParamGroup_ with SyncNode<T>, RemoveSyncItem, SongCore{
  
  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;
  
  static List<Song> recomended = [];

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

  static const String paramLclId = 'lcl_id';
  static const String paramRate = 'rate';
  static const String paramChordShift = 'chord_shift';
  static const String paramMemories = 'memories';

  static const String tabChar = '   ';

  static const String defTitle = '_#NO_TITLE';
  static const List<String> defAuthors = [];
  static const List<String> defComposers = [];
  static const List<String> defPerformers = [];
  static const String? defYoutubeLink = null;
  static const List<String> defAddPers = [];


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

  DateTime? _releaseDate;
  @protected
  set releaseDate(DateTime? value) => _releaseDate = value;
  @override
  DateTime? get releaseDate => _releaseDate;

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

  List<AddPerson> _addPers;
  @protected
  set addPers(List<AddPerson> value) => _addPers = value;
  @override
  List<AddPerson> get addPers => _addPers;

  String? _youtubeLink;
  @protected
  set youtubeLink(String? value) => _youtubeLink = value;
  @override
  String? get youtubeLink => _youtubeLink;

  @override
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
      text += '$tag    ';
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

    String title = map[SongCore.PARAM_TITLE]??defTitle;
    List<String> addTitles = ((map[SongCore.PARAM_HID_TITLES]??[]) as List).cast<String>();
    List<String> authors = ((map[SongCore.PARAM_TEXT_AUTHORS]??defAuthors) as List).cast<String>();
    List<String> performers = ((map[SongCore.PARAM_PERFORMERS]??defPerformers) as List).cast<String>();
    List<String> composers = ((map[SongCore.PARAM_COMPOSERS]??defComposers) as List).cast<String>();
    DateTime? releaseDate = DateTime.tryParse(map[SongCore.PARAM_REL_DATE]??'');
    bool showRelDateMonth = map[SongCore.PARAM_SHOW_REL_DATE_MONTH]??true;
    bool showRelDateDay = map[SongCore.PARAM_SHOW_REL_DATE_DAY]??true;
    String ytLink = map[SongCore.PARAM_YT_LINK]??defYoutubeLink;
    List<AddPerson> addPers = ((map[SongCore.PARAM_ADD_PERS]??[]) as List).map((addPersMap) => AddPerson.fromMap(addPersMap)).toList();
    List<String> tags = ((map[SongCore.PARAM_TAGS]??[]) as List).cast<String>();
    late SongElementOld refren;
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
          songText += refren.getText(withTabs: true)!;
          songChords += refren.getChords()!;

          int textLines =  refren.getText(withTabs: true)!.split("\n").length;
          int chodsLines = refren.getChords()!.split("\n").length;
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

        String? text = partMap['text'];
        if(partMap['shift'])
          text = tabChar + text!.replaceAll('\n', '\n$tabChar');

        songText += text!;
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
      songText = songText.substring(0, songText.length - 2).replaceAll('\t', tabChar);

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
      PrimitiveWrapper(SongRate.RATE_NULL), //rate,
      memoryList,
      memoryMap
    );
  }

  Future<String> get code async => jsonEncode(await getSongMap(fileName));

  Future<String> toQRData() async => const Base64Codec().encode(const Utf8Encoder().convert(await code).toList());

  static SongDataEntity from(String codeBase64){
    String code = const Utf8Decoder().convert(const Base64Codec().decode(codeBase64).toList());
    return Song.parse('_shared', code);
  }

  @override
  String get chords => ChordShifter.run(baseChords, readChordShift(fileName));

  void shiftChordsUp() =>
    setChordShift(ChordShifter.shiftToneUp(readChordShift(fileName)));

  void shiftChordsDown() =>
    setChordShift(ChordShifter.shiftToneDown(readChordShift(fileName)));

  void initRate() => ratePrimWrap.set(readRate(fileName));

  bool get hasRate => ShaPref.exists(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(fileName));
  static int readRate(String fileName) => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(fileName), SongRate.RATE_NULL);

  @override
  int get rate => ratePrimWrap.get();

  void setRate(int rate, {bool localOnly = false}) async {
    ratePrimWrap.set(rate);
    ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(fileName), rate);
    setSingleState(paramRate, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();
  }

  bool get hasChordShift => ShaPref.exists(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(fileName));
  static int readChordShift(String fileName) => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(fileName), 0);
  void setChordShift(int chordShift, {bool localOnly = false}) {
    ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(fileName), chordShift);
    setSingleState(paramChordShift, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post(aggregateDelay: SynchronizerEngine.aggregateChordChangeDuration);
  }

  void addMemory(Memory memory){
    memories.add(memory);
    memoryMap[memory.fileName] = memory;
  }

  void removeAllMemories({bool localOnly = false}){
    for(Memory memory in memories) {
      memory.delete(localOnly: localOnly);
    }
    memories.clear();
  }

  void removeMemory(Memory memory, {bool localOnly = false}){
    memory.delete(localOnly: localOnly);
    memories.remove(memory);
  }

  bool deleteSongFile({bool localOnly = false}) {
    if(isOwn) {
      Map ownSongs = jsonDecode(readFileAsString(getOwnSongFilePath));
      ownSongs.remove(fileName);
      saveStringAsFile(getOwnSongFilePath, jsonEncode(ownSongs));

      for(Memory memory in memories)
        memory.delete();

      markSyncAsRemoved();
      if(!localOnly) synchronizer.post();
      return true;
    } else
      return false;

  }

  @override
  bool operator == (Object other) =>
      other is Song &&
          isConfid == other.isConfid &&
          isOfficial == other.isOfficial &&
          fileName == other.fileName;

  @override
  int get hashCode => isConfid.hashCode + isOfficial.hashCode + fileName.hashCode;

  String get classId;

  //@override
  //SyncableParam get parentParam => RootSyncable(classId);

  @override
  String get paramId => fileName;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
        this,
        paramId: paramRate,
        value_: () => rate,
        isNotSet_: () => !hasRate
    ),
    SyncableParamSingle(
        this,
        paramId: paramChordShift,
        value_: () => readChordShift(fileName),
        isNotSet_: () => !hasChordShift
    ),
    SyncableParamGroup(
        this,
        paramId: paramMemories,
        childParams: memories
    )

  ];

  @override
  void applySyncGetResp(T resp) {
    if(resp.rate != null)
      setRate(resp.rate!, localOnly: true);

    if(resp.chordShift != null)
      setChordShift(resp.chordShift!, localOnly: true);

    if(resp.memories != null)
      for (String memLclId in resp.memories!.keys) {
        MemoryGetResp? memResp = resp.memories![memLclId];
        Memory? mem = memoryMap[memLclId];
        if(mem == null) {
          mem = Memory.create(
              fileName,
              memResp!.date!,
              memResp.place,
              memResp.desc,
              memResp.fontKey,
              memResp.published
          );
          mem.save(localOnly: true);

          Memory.addToAll(mem);
          addMemory(mem);
        }else
          mem.applySyncGetResp(memResp!);
      }
  }
}
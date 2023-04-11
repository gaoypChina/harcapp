import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/memory_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_get_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/chord_shifter.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';

import 'memory.dart';
import 'off_song.dart';
import 'old/song_element_old.dart';
import 'own_song.dart';

class SongAudio{

  final String fileName;
  final String? performer;

  String get url => 'https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/songs_audio/$fileName';

  const SongAudio(this.fileName, this.performer);

  static SongAudio fromRespMap(Map<String, String?> respMap) => SongAudio(
      respMap['file']??(throw Exception()),
      respMap['performer']
  );

}

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
  final List<SongAudio> audios;
  final List<String> tags;
  final bool hasChords;
  final String text;
  final String baseChords;
  final PrimitiveWrapper<int> ratePrimWrap;
  final List<Memory> memoryList;
  final Map<String, Memory> memoryMap;

  final PrimitiveWrapper<bool> hasExplanationPrimWrap;

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
      this.audios,
      this.tags,
      this.hasChords,
      this.text,
      this.baseChords,
      this.ratePrimWrap,
      this.memoryList,
      this.memoryMap,

      this.hasExplanationPrimWrap,
  );
}

abstract class Song<T extends SongGetResp> extends SongCore with SyncableParamGroupMixin, SyncGetRespNode<T>, RemoveSyncItem{
  
  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;
  
  static List<Song> recommended = [];

  static Map<AddPerson, List<Song>> _addPersRanking = {};
  static Map<AddPerson, List<Song>> get addPersRanking => _addPersRanking;
  static Map<String, List<Song>> _addPersRankingByEmail = {};
  static Map<String, List<Song>> get addPersRankingByEmail => _addPersRankingByEmail;

  static void recalculateAddPersRanking(){

    // Here there might be a case, where the same person uses two different
    // email addresses which results in two different AddPerson objects,
    // both of which correspond to the same Person object.
    //
    // In such case they should be converted to one AddPerson - it doesn't
    // matter which one, since they will be converted to a Person later when
    // displaying.

    _addPersRanking = {};
    for(OffSong song in OffSong.allOfficial)
      for(AddPerson addPers in song.addPers)
        if(_addPersRanking.containsKey(addPers))
          _addPersRanking[addPers]!.add(song);
        else
          _addPersRanking[addPers] = [song];

    _addPersRankingByEmail = {};
    for(AddPerson addPers in _addPersRanking.keys)
      if(addPers.emailRef != null)
        _addPersRankingByEmail[addPers.emailRef!] = _addPersRanking[addPers]!;

    // Merge AddPerson with multiple emails being the same Person object
    Map<String, AddPerson> addPersonByEmail = {};
    for(AddPerson addPers in _addPersRanking.keys)
      if(addPers.emailRef != null)
        addPersonByEmail[addPers.emailRef!] = addPers;

    Set<String> duplicateEmails = {};
    for(AddPerson addPers in _addPersRanking.keys) {
      if(addPers.emailRef == null) continue;
      if(duplicateEmails.contains(addPers.emailRef)) continue;

      List<String>? emails = allPeopleByEmailMap[addPers.emailRef]?.email;
      if(emails == null) continue;
      if(emails.length <= 1) continue;

      // Aggregate songs
      List<Song<SongGetResp>> allOffSongs = [];
      for(String email in emails){
        if(email != addPers.emailRef) duplicateEmails.add(email);
        List<Song<SongGetResp>>? songs = _addPersRankingByEmail[email];
        if(songs == null) continue;
        allOffSongs.addAll(songs);
      }

      // Update songs lists
      for(String email in emails){
        _addPersRankingByEmail[email] = allOffSongs;

        AddPerson? addPers = addPersonByEmail[email];
        if(addPers == null) continue;
        _addPersRanking[addPers] = allOffSongs;
      }
    }

    // Remove same AddPersons from `_addPersRanking`.
    _addPersRanking.removeWhere((key, value) => duplicateEmails.contains(key.emailRef));


    // Sort by song count
    var sortedKeys = _addPersRanking.keys.toList(growable: false)..sort((k1, k2) => _addPersRanking[k2]!.length.compareTo(_addPersRanking[k1]!.length));
    LinkedHashMap sortedMap = LinkedHashMap.fromIterable(sortedKeys, key: (k) => k, value: (k) => _addPersRanking[k]);

    _addPersRanking = sortedMap.cast<AddPerson, List<Song>>();

  }

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

  // static const String paramLclId = 'lcl_id';
  static const String paramRate = 'rate';
  static const String paramChordShift = 'chordShift';
  static const String paramMemories = 'memories';

  static const String tabChar = '   ';

  static const String defTitle = '_#NO_TITLE';
  static const List<String> defAuthors = [];
  static const List<String> defComposers = [];
  static const List<String> defPerformers = [];
  static const String defYoutubeLink = '';
  static const List<String> defAddPers = [];

  @override
  final String lclId;

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

  final List<SongAudio> audios;

  @override
  bool get isOwn => !isOfficial && !isConfid;

  bool get isConfid => lclId.length >= 4 && lclId.substring(0, 4) == 'oc!_';
  bool get isOfficial => lclId.length >= 3 && lclId.substring(0, 3) == 'o!_';

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

  @protected
  PrimitiveWrapper<bool> hasExplanationPrimWrap;

  String get tagsAsString{
    String text = '';
    for(String tag in tags)
      text += '$tag    ';
    if(text.isEmpty) return '#';
    return text;
  }

  Song(
      this.lclId,
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

      this.audios,

      this._tags,

      this._hasChords,
      this._text,
      this.baseChords,
      this.ratePrimWrap,
      this.memoryList,
      this.memoryMap,
      this.hasExplanationPrimWrap,
  );

  static Future<SongDataEntity> parse(String fileName, String code) async {
    Map<String, dynamic> map = jsonDecode(code)[fileName];
    return Song.fromRespMap(fileName, map);
  }

  @protected
  static Future<SongDataEntity> fromRespMap(String lclId, Map respMap, {List? songAudioMapList}) async {

    List<Memory> memoryList = [];
    Map<String, Memory> memoryMap = {};
    bool hasChords = false;

    String title = respMap[SongCore.PARAM_TITLE]??defTitle;
    List<String> addTitles = ((respMap[SongCore.PARAM_HID_TITLES]??[]) as List).cast<String>();
    List<String> authors = ((respMap[SongCore.PARAM_TEXT_AUTHORS]??defAuthors) as List).cast<String>();
    List<String> performers = ((respMap[SongCore.PARAM_PERFORMERS]??defPerformers) as List).cast<String>();
    List<String> composers = ((respMap[SongCore.PARAM_COMPOSERS]??defComposers) as List).cast<String>();
    DateTime? releaseDate = DateTime.tryParse(respMap[SongCore.PARAM_REL_DATE]??'');
    bool showRelDateMonth = respMap[SongCore.PARAM_SHOW_REL_DATE_MONTH]??true;
    bool showRelDateDay = respMap[SongCore.PARAM_SHOW_REL_DATE_DAY]??true;
    String ytLink = respMap[SongCore.PARAM_YT_LINK]??defYoutubeLink;
    List<AddPerson> addPers = ((respMap[SongCore.PARAM_ADD_PERS]??[]) as List).map<AddPerson>((addPersMap) => AddPerson.fromRespMap(addPersMap)).toList();
    List<String> tags = ((respMap[SongCore.PARAM_TAGS]??[]) as List).cast<String>();
    late SongElementOld refren;
    if (respMap.containsKey(SongCore.PARAM_REFREN)) {
      Map refrenMap = respMap[SongCore.PARAM_REFREN];
      refren = SongElementOld.from(refrenMap['text'], refrenMap['chords']);
    }

    tags.removeWhere((tag) => tag.isEmpty);

    String songChords = '';
    String songText = '';

    List<dynamic> partsList = respMap[SongCore.PARAM_PARTS]??[];
    for (Map partMap in partsList) {
      if (partMap.containsKey('refren'))
        for (int i = 0; i < partMap['refren']; i++) {
          songText += refren.getText(withTabs: true)!;
          songChords += refren.getChords()!;

          int textLines = refren.getText(withTabs: true)!.split("\n").length;
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

    List<SongAudio> audios = [];

    for(Map songMetaMap in songAudioMapList??[])
      try {
        audios.add(SongAudio.fromRespMap(songMetaMap.cast<String, String?>()));
      } catch (_, __){}

    return SongDataEntity(
      lclId,
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
      audios,

      tags,

      hasChords,
      songText,
      songChords,
      PrimitiveWrapper(SongRate.RATE_NULL), //rate,
      memoryList,
      memoryMap,

      PrimitiveWrapper(false)
    );
  }

  FutureOr<String> get code;

  Future<String> toQRData() async => const Base64Codec().encode(const Utf8Encoder().convert(await code).toList());

  static Future<SongDataEntity> fromBase64({required String code}) => Song.parse(
      '_shared',
      const Utf8Decoder().convert(const Base64Codec().decode(code).toList())
  );

  @override
  String get chords => ChordShifter.run(baseChords, chordShift);

  void shiftChordsUp() =>
    setChordShift(ChordShifter.shiftToneUp(chordShift));

  void shiftChordsDown() =>
    setChordShift(ChordShifter.shiftToneDown(chordShift));

  void initRate() => ratePrimWrap.set(readRate(lclId));
  Future<void> initHasExplanation() async => hasExplanationPrimWrap.set(await readStringFromAssets('assets/songs/song_words/$lclId') != null);

  Future<void> initReadableParams() async {
    initRate();
    await initHasExplanation();
  }

  bool get hasRate => ShaPref.exists(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(lclId));
  static int readRate(String fileName) => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(fileName), SongRate.RATE_NULL);

  @override
  int get rate => ratePrimWrap.get();

  void setRate(int rate, {bool localOnly = false}) async {
    ratePrimWrap.set(rate);
    ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_RATE_(lclId), rate);
    setSingleState(paramRate, SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly) synchronizer.post();
  }

  bool get hasChordShift => ShaPref.exists(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(lclId));
  int get chordShift => readChordShift(lclId);
  static int readChordShift(String fileName) => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(fileName), 0);
  void setChordShift(int chordShift, {bool localOnly = false}) {
    ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_SONG_CHORDS_SHIFT_(lclId), chordShift);
    setSingleState(paramChordShift, SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly) synchronizer.post(aggregateDelay: SynchronizerEngine.aggregateChordChangeDuration);
  }

  void addMemory(Memory memory){
    memories.add(memory);
    memoryMap[memory.lclId] = memory;
  }

  void removeAllMemories({bool localOnly = false}){
    for(Memory memory in memories) {
      Memory.removeFromAll(memory);
      memory.delete(localOnly: localOnly);
    }
    memories.clear();
  }

  void removeMemory(Memory memory, {bool localOnly = false}){
    memory.delete(localOnly: localOnly);
    memories.remove(memory);
    Memory.removeFromAll(memory);
  }

  void removeMemoryAt(int index, {bool localOnly = false}){
    Memory memory = memories[index];
    memory.delete(localOnly: localOnly);
    memories.remove(memory);
    Memory.removeFromAll(memory);
  }

  bool get hasExplanation => hasExplanationPrimWrap.get();

  bool delete({bool localOnly = false}) {
    if(isOwn) {
      Map ownSongs = jsonDecode(readFileAsString(getOldOwnSongFilePath));
      ownSongs.remove(lclId);
      saveStringAsFile(getOldOwnSongFilePath, jsonEncode(ownSongs));

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
          lclId == other.lclId;

  @override
  int get hashCode => isConfid.hashCode + isOfficial.hashCode + lclId.hashCode;

  String get debugClassId;

  //@override
  //SyncableParam get parentParam => RootSyncable(classId);

  @override
  String get paramId => lclId;

  SyncableParamSingle get syncParamRate => SyncableParamSingle(
    this,
    paramId: paramRate,
    value: () => rate,
    isNotSet: () => !hasRate
  );
  SyncableParamSingle get syncParamChordShift => SyncableParamSingle(
    this,
    paramId: paramChordShift,
    value: () => chordShift,
    isNotSet: () => !hasChordShift
  );
  SyncableParamGroup get syncParamMemories => SyncableParamGroup(
    this,
    paramId: paramMemories,
    childParams: memories,
  );

  @override
  List<SyncableParam> get childParams => [
    syncParamRate,
    syncParamChordShift,
    syncParamMemories
  ];

  @override
  void applySyncGetResp(T resp) {
    if(resp.rate != null)
      setRate(resp.rate!, localOnly: true);

    if(resp.chordShift != null)
      setChordShift(resp.chordShift!, localOnly: true);

    if(resp.memories != null)
      for (String memLclId in resp.memories!.keys) {
        MemoryGetResp memResp = resp.memories![memLclId]!;
        Memory? mem = memoryMap[memLclId];
        if(mem == null) {
          mem = Memory.create(
              lclId: memLclId,
              songLclId: lclId,
              date: memResp.date,
              place: memResp.place,
              desc: memResp.desc,
              fontIndex: memResp.fontKey,
              published: memResp.published
          );
          mem.save(localOnly: true, synced: true);

          Memory.addToAll(mem);
          addMemory(mem);
        }else
          mem.applySyncGetResp(memResp);
      }
  }
}
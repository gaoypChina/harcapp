import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/sync_resp_body/album/album_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/album/own_album_resp.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/api/sync_resp_body/album/to_learn_album_resp.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';

import 'off_song.dart';
import 'own_song.dart';

abstract class BaseAlbum{

  static List<BaseAlbum> get all{
    List<BaseAlbum> albums = [];
    albums.add(OmegaAlbum());
    if(ConfidAlbum.unlocked) albums.add(ConfidAlbum());
    albums.add(OwnSongAlbum());
    albums.add(ToLearnAlbum.loaded);
    albums.addAll(OwnAlbum.all);
    return albums;
  }

  static final List<void Function(BaseAlbum)> _albumChangedListeners = [];
  static void addAlbumChangedListener(void Function(BaseAlbum) listener) => _albumChangedListeners.add(listener);
  static void removeAlbumChangedListener(void Function(BaseAlbum) listener) => _albumChangedListeners.remove(listener);

  static late BaseAlbum _current;

  static BaseAlbum get current => _current;

  static set current(BaseAlbum value){
    _current = value;
    for(void Function(BaseAlbum) listener in _albumChangedListeners)
      listener.call(value);
    ShaPref.setString(ShaPref.SHA_PREF_SPIEWNIK_CURR_ALBUM, value.lclId);
  }

  static Future<void> delLastPageForAlbum(BaseAlbum album) => ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG_(album));
  static int getLastPageForAlbum(BaseAlbum album) => ShaPref.getInt(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG_(album), 0);
  static Future<void> setLastPageForAlbum(BaseAlbum album, int value) async => ShaPref.setInt(ShaPref.SHA_PREF_SPIEWNIK_LAST_OPEN_SONG_(album), value);

  static int get lastPage => getLastPageForAlbum(BaseAlbum.current);
  // Nobody should use this, since this is an async function.
  // static set lastPage(int value) => setLastPageForAlbum(BaseAlbum.current, value);

  int get lastOpenIndex => getLastPageForAlbum(this);
  // Nobody should use this, since this is an async function.
  // set lastOpenIndex(int value) => setLastPageForAlbum(this, value);
  void deleteLastOpenIndex() => delLastPageForAlbum(this);

  Song get lastOpenSong => songs[lastOpenIndex];

  bool get editable;

  String get lclId;
  String get title;
  String get colorsKey;
  String get iconKey;

  List<OffSong> get offSongs;
  List<OwnSong> get ownSongs;

  List<Song> get songs{
    List<Song> songs = [];
    songs.addAll(ownSongs);
    songs.addAll(offSongs);
    return songs;
  }

  IconData get icon => CommonIconData.all[iconKey]??CommonIconData.all[CommonIconData.defIconKey]!;
  Color get iconColor => CommonColorData.get(colorsKey).iconColor;
  Color get avgColor => CommonColorData.get(colorsKey).avgColor;
  Color? get colorStart => CommonColorData.get(colorsKey).colorStart;
  Color? get colorEnd => CommonColorData.get(colorsKey).colorEnd;
  Color avgColorDarkSensitive(BuildContext context) => Provider.of<ColorPackProvider>(context, listen: false).isDark()?Colors.white:avgColor;


  List<String> get searchHistory => ShaPref.getStringList(ShaPref.SHA_PREF_SPIEWNIK_SEARCH_HISTORY_(this), []);
  set searchHistory(List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_SPIEWNIK_SEARCH_HISTORY_(this), value);
  void removeFromSearchHistory(int index){
    List<String> history = searchHistory;
    history.removeAt(index);
    searchHistory = history;
  }

  void registerSongSearchToHistory(Song song){
    List<String> history = searchHistory;
    history.insert(0, song.lclId);
    if(history.length > 1000)
      history = history.sublist(0, 1000);
    searchHistory = history;
  }

  @override
  bool operator == (Object other)=> other is BaseAlbum && lclId == other.lclId;

  @override
  int get hashCode => lclId.hashCode;

}

class OmegaAlbum extends BaseAlbum{

  @override
  bool get editable => false;

  @override
  String get lclId => 'o!_omega';

  @override
  String get title => 'Wszystkie';

  @override
  String get colorsKey => CommonColorData.omegaAlbumColorsKey;

  @override
  String get iconKey => 'bookMusicOutline';

  @override
  List<OffSong> get offSongs => OffSong.allOfficial;

  @override
  List<OwnSong> get ownSongs => OwnSong.allOwn;

}

class ConfidAlbum extends BaseAlbum{

  static bool unlocked = false;

  @override
  bool get editable => false;

  @override
  String get lclId => 'o!_confid';

  @override
  String get title => 'Tajne piosenki Basi';

  @override
  String get colorsKey => CommonColorData.confColorsKey;

  @override
  String get iconKey => 'fruitPineapple';

  @override
  List<OffSong> get offSongs => OffSong.allConfid;

  @override
  List<OwnSong> get ownSongs => [];

}

class OwnSongAlbum extends BaseAlbum{

  @override
  bool get editable => false;

  @override
  String get lclId => 'o!_own_songs';

  @override
  String get title => 'Piosenki własne';

  @override
  String get colorsKey => CommonColorData.ownSongsAlbumColorsKey;

  @override
  String get iconKey => 'bookEditOutline';

  @override
  List<OffSong> get offSongs => [];

  @override
  List<OwnSong> get ownSongs => OwnSong.allOwn;

}

abstract class SelectableAlbum<T extends AlbumGetResp> extends BaseAlbum with SyncableParamGroupMixin, SyncGetRespNode<T>{

  static const String paramOffSongs = 'offSongs';
  static const String paramOwnSongs = 'ownSongs';

  @override
  List<OffSong> offSongs;

  @override
  List<OwnSong> ownSongs;

  SelectableAlbum(this.offSongs, this.ownSongs);

  void addSong(Song song){
    if(!songs.contains(song)) {

      if(song is OffSong) {
        for (int i = 0; i < offSongs.length; i++) {
          if (compareText(song.title, songs[i].title) < 0) {
            offSongs.insert(i, song);
            return;
          }
        }
        offSongs.add(song);
      }

      else if(song is OwnSong) {
        for (int i = 0; i < ownSongs.length; i++) {
          if (compareText(song.title, songs[i].title) < 0) {
            ownSongs.insert(i, song);
            return;
          }
        }
        ownSongs.add(song);
      }
    }
  }

  void removeSong(Song song){
    if(song is OffSong)
      offSongs.remove(song);
    else if(song is OwnSong)
      ownSongs.remove(song);
  }

  // TODO: replace with multiple return;
  static Tuple2<List<OffSong>, List<OwnSong>> songsFromRespMap(Map<String, dynamic> respMap){

    List<String> offSongsLclIds = ((respMap[SelectableAlbum.paramOffSongs]??[]) as List).cast<String>();
    List<String> ownSongsLclIds = ((respMap[SelectableAlbum.paramOwnSongs]??[]) as List).cast<String>();

    List<OffSong> offSongs = [];
    for(Song song in OffSong.allOfficial)
      if(offSongsLclIds.contains(song.lclId))
        offSongs.add(song as OffSong);

    List<OwnSong> ownSongs = [];
    for(Song song in OwnSong.allOwn)
      if(ownSongsLclIds.contains(song.lclId))
        ownSongs.add(song as OwnSong);

    return Tuple2(offSongs, ownSongs);

  }

  Map toJsonMap();

  void save({localOnly = false, bool synced = false});

  // void update<T extends OwnAlbumOld>(T album) {
  //   offSongs = album.offSongs;
  //   ownSongs = album.ownSongs;
  // }

  bool isNotSet();

  @override
  String get paramId => lclId;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: paramOffSongs,
      value: () => offSongs.map((song) => song.lclId).toList(growable: false),
      isNotSet: isNotSet
    ),

    SyncableParamSingle(
      this,
      paramId: paramOwnSongs,
      value: () => ownSongs.map((song) => song.lclId).toList(growable: false),
      isNotSet: isNotSet
    ),
  ];

  @override
  void applySyncGetResp(T resp) {

    List<OffSong> _offSongs = [];
    for (String sngLclId in resp.offSongs) {
      OffSong? song = OffSong.allOfficialMap[sngLclId];
      if (song != null) _offSongs.add(song);
    }
    offSongs = _offSongs;

    List<OwnSong> _ownSongs = [];
    for (String sngLclId in resp.ownSongs) {
      OwnSong? song = OwnSong.allOwnMap[sngLclId];
      if (song != null) _ownSongs.add(song);
    }
    ownSongs = _ownSongs;

    save(localOnly: true, synced: true);
  }

}

class OwnAlbum extends SelectableAlbum<OwnAlbumGetResp> with RemoveSyncItem{

  static const String paramLclId = 'lclId';
  static const String paramTitle = 'title';
  static const String paramColorsKey = 'colorsKey';
  static const String paramIconKey = 'iconKey';

  static const String defTitle = '_#NO_TITLE';

  static const int maxLenTitle = 64;
  static const int maxLenColorsKey = 42;
  static const int maxLenIconsKey = 42;

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static late List<OwnAlbum> all;
  static late Map<String, OwnAlbum> _allMap;

  static Map<String, OwnAlbum> get allMap => _allMap;
  static set allMap(Map<String, OwnAlbum> value){
    _allMap = Map.from(value);
  }

  static void addToAll(OwnAlbum album){

    if(allMap[album.lclId] != null) return;

    all.add(album);
    allMap[album.lclId] = album;
  }

  static void removeFromAll(OwnAlbum album){
    all.remove(album);
    allMap.remove(album.lclId);
  }

  static void insertToAll(int index, OwnAlbum album){
    all.insert(index, album);
    allMap[album.lclId] = album;
  }

  @override
  bool get editable => true;

  @override
  final String lclId;

  @override
  String title;

  @override
  String colorsKey;

  @override
  String iconKey;

  OwnAlbum(this.lclId, this.title, super.offSongs, super.ownSongs, this.colorsKey, this.iconKey);

  static OwnAlbum? read(String lclId, List<Song> allSongs){
    String? jsonCode = readFileAsStringOrNull(getAlbumFolderPath + lclId);
    if(jsonCode == null) return null;
    Map<String, dynamic>? map = jsonDecode(jsonCode);
    if(map == null) return null;

    return fromRespMap(map, lclId: lclId);
  }

  static OwnAlbum fromRespMap(Map<String, dynamic> respMap, {String? lclId}) {

    lclId = lclId??respMap[paramLclId]??(throw InvalidResponseError(paramLclId));
    String title = respMap[paramTitle]??(throw InvalidResponseError(paramTitle));
    String iconKey = respMap[paramIconKey]??CommonIconData.defIconKey;
    String colorsKey = respMap[paramColorsKey]??CommonColorData.defColorsKey;

    Tuple2<List<OffSong>, List<OwnSong>> songs = SelectableAlbum.songsFromRespMap(respMap);

    return OwnAlbum(lclId!, title, songs.item1, songs.item2, colorsKey, iconKey);
  }

  static OwnAlbum create({
    String? lclId,
    required String title,
    required List<OffSong> offSongs,
    required List<OwnSong> ownSongs,
    required String colorsKey,
    required String iconKey
  }) => OwnAlbum(
      lclId??const Uuid().v4(),
      title,
      offSongs,
      ownSongs,
      colorsKey,
      iconKey
  );

  @override
  Map toJsonMap(){

    // Sort alphabetically
    offSongs.sort((a, b) => compareText(a.title, b.title));
    ownSongs.sort((a, b) => compareText(a.title, b.title));

    Map<String, dynamic> map = {
      paramTitle: title,
      SelectableAlbum.paramOffSongs: offSongs.map((song) => song.lclId).toList(growable: false),
      SelectableAlbum.paramOwnSongs: ownSongs.map((song) => song.lclId).toList(growable: false),
      paramColorsKey: colorsKey,
      paramIconKey: iconKey,
    };

    return map;

  }

  @override
  bool isNotSet() => false;

  void update(OwnAlbum album) {
    title = album.title;
    offSongs = album.offSongs;
    ownSongs = album.ownSongs;
    colorsKey = album.colorsKey;
    iconKey = album.iconKey;
  }

  @override
  void save({localOnly = false, bool synced = false}) {
    saveStringAsFileToFolder(
        getOwnAlbumsFolderLocalPath,
        jsonEncode(toJsonMap()),
        fileName: lclId
    );

    // TODO add selective sync. In this situaltion it is feasable to use e.g.:
    // syncParams: [Album.paramOffSongs, Album.paramOwnSongs];
    // This requires introducing the following changes:
    // 1. Replace `bool synced = false` with `List<String> syncParams = null`.
    // If `null`, all will be synced. If `[]` none will be synced.
    // 2. Add a setSyncableParamState(String param, int state) to all subclases
    // of `SyncableParam`.

    setAllSyncState(
        synced?SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();
  }

  void delete({bool localOnly = false}) {
    markSyncAsRemoved();
    File(getAlbumFolderPath + lclId).deleteSync();
    ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_SEARCH_HISTORY_(this));
    if(!localOnly) synchronizer.post();
  }

  static String toHex(Color color, {bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${color.alpha.toRadixString(16).padLeft(2, '0')}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';

  static const String syncClassId = 'ownAlbum';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => SyncGetRespNode.ownAlbumNodes;

  SyncableParamSingle get syncParamTitle => SyncableParamSingle(
    this,
    paramId: paramTitle,
    value: () => title,
  );

  SyncableParamSingle get syncParamColorsKey => SyncableParamSingle(
    this,
    paramId: paramColorsKey,
    value: () => colorsKey,
  );

  SyncableParamSingle get syncParamIconKey => SyncableParamSingle(
    this,
    paramId: paramIconKey,
    value: () => iconKey,
  );

  @override
  List<SyncableParam> get childParams{

    List<SyncableParam> params = [];
    params.addAll(super.childParams);
    params.addAll([
      syncParamTitle,
      syncParamColorsKey,
      syncParamIconKey,
    ]);

    return params;
  }

  @override
  void applySyncGetResp(OwnAlbumGetResp resp) {

    title = resp.title;

    colorsKey = resp.colorsKey;

    iconKey = resp.iconKey;

    super.applySyncGetResp(resp);
  }

}

class ToLearnAlbum extends SelectableAlbum<ToLearnAlbumGetResp>{

  static bool initialized = false;
  static late ToLearnAlbum loaded;

  // This unfortunately must be a variable, because isolates cannot read storage
  // so it's impossible to check the `isNotSet()` method inside an isolate.
  late bool existsInStorage;

  static void init(){
    ToLearnAlbum? album = ToLearnAlbum.read(Song.all);
    bool existsInStorage = album != null;
    if(existsInStorage) ToLearnAlbum.loaded = album;
    else ToLearnAlbum.loaded = ToLearnAlbum([], []);

    ToLearnAlbum.loaded.existsInStorage = existsInStorage;

    ToLearnAlbum.initialized = true;
  }

  ToLearnAlbum(super.offSongs, super.ownSongs);

  @override
  bool get editable => false;

  @override
  String get lclId => 'o!_to_learn';

  @override
  String get title => 'Do nauki';

  @override
  String get colorsKey => CommonColorData.toLearnAlbumColorsKey;

  @override
  String get iconKey => 'bookEducationOutline';

  @override
  Map toJsonMap(){

    // Sort alphabetically
    offSongs.sort((a, b) => compareText(a.title, b.title));
    ownSongs.sort((a, b) => compareText(a.title, b.title));

    Map<String, dynamic> map = {
      SelectableAlbum.paramOffSongs: offSongs.map((song) => song.lclId).toList(growable: false),
      SelectableAlbum.paramOwnSongs: ownSongs.map((song) => song.lclId).toList(growable: false),
    };

    return map;
  }

  static ToLearnAlbum fromRespMap(Map<String, dynamic> respMap) {
    Tuple2<List<OffSong>, List<OwnSong>> songs = SelectableAlbum.songsFromRespMap(respMap);
    return ToLearnAlbum(songs.item1, songs.item2);
  }

  static ToLearnAlbum? read(List<Song> allSongs){
    String? jsonCode = readFileAsStringOrNull(getToLearnAlbumPath);
    if(jsonCode == null) return null;
    Map<String, dynamic>? map = jsonDecode(jsonCode);
    if(map == null) return null;

    return fromRespMap(map);
  }

  @override
  bool isNotSet() => !existsInStorage;

  void update(SelectableAlbum album) {
    offSongs = album.offSongs;
    ownSongs = album.ownSongs;
  }

  @override
  void save({localOnly = false, bool synced = false}) {
    saveStringAsFile(
        getToLearnAlbumPath,
        jsonEncode(toJsonMap()),
    );

    existsInStorage = true;

    // TODO add selective sync. In this situaltion it is feasable to use e.g.:
    // syncParams: [Album.paramOffSongs, Album.paramOwnSongs];
    // This requires introducing the following changes:
    // 1. Replace `bool synced = false` with `List<String> syncParams = null`.
    // If `null`, all will be synced. If `[]` none will be synced.
    // 2. Add a setSyncableParamState(String param, int state) to all subclases
    // of `SyncableParam`.

    setAllSyncState(
        synced?SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();
  }

  @override
  SyncableParam? get parentParam => null;

  static const String syncClassId = 'toLearnAlbum';

  @override
  String get paramId => syncClassId;

  @override
  String get debugClassId => syncClassId;

}

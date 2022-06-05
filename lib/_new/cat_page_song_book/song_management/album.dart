import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/sync_resp_body/album_resp.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/syncable_new.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:path/path.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import 'off_song.dart';
import 'own_song.dart';

class Album extends SyncableParamGroup_ with SyncNode<AlbumGetResp>, RemoveSyncItem{

  static bool isConfidUnlocked = false;

  static const String PARAM_ID = 'file_name';
  static const String _PARAM_TITLE = 'title';
  static const String paramOffSongs = 'off_songs';
  static const String paramOwnSongs = 'own_songs';
  static const String paramColorsKey = 'colors_key';
  static const String paramIconKey = 'icon_key';

  static const String omegaFileName = 'o!_omega';
  static const String confidFileName = 'o!_confid';

  static const String omegaTitle = 'Wszystkie';
  static const String confidTitle = 'Tajne piosenki Basi';

  static const String defTitle = '_#NO_TITLE';

  static const int maxLenTitle = 64;
  static const int maxLenColorsKey = 42;
  static const int maxLenIconsKey = 42;

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static late List<Album> allOwn;
  static List<Album> get all{
    List<Album> albums = [];
    albums.add(omega);
    if(isConfidUnlocked) albums.add(Album.confid);
    albums.addAll(allOwn);
    return albums;
  }
  static late Map<String, Album> _allOwnMap;

  static Map<String, Album> get allMap => _allOwnMap;
  static set allMap(Map<String, Album> value){
    _allOwnMap = Map.from(value);
  }

  static void addToAll(Album album){
    allOwn.add(album);
    allMap[album.fileName] = album;
  }

  static void removeFromAll(Album album){
    allOwn.remove(album);
    allMap.remove(album.fileName);
  }

  static void insertToAll(int index, Album album){
    allOwn.insert(index, album);
    allMap[album.fileName] = album;
  }

  static Album get omega => Album(omegaFileName, omegaTitle, OffSong.allOfficial, OwnSong.allOwn, CommonColorData.OMEGA_COLORS_KEY, 'null');

  static late Album _current;

  static initCurrent(Album value) => _current = value;

  static Album get current{
    if(_current.isOmega)
      return omega;

    return _current;
  }
  static set current(Album value){
    _current = value;
    ShaPref.setString(ShaPref.SHA_PREF_SPIEWNIK_CURR_ALBUM, value.fileName);
  }


  static Album get confid => Album(
      confidFileName,
      confidTitle,
      OffSong.allConfid,
      [],
      CommonColorData.CONF_COLORS_KEY,
      'fruitPineapple'
  );

  Color get avgColor => CommonColorData.ALL[colorsKey]!.avgColor;
  Color? get colorStart => CommonColorData.ALL[colorsKey]!.colorStart;
  Color? get colorEnd => CommonColorData.ALL[colorsKey]!.colorEnd;
  Color avgColorDarkSensitive(BuildContext context) => Provider.of<ColorPackProvider>(context, listen: false).isDark()?Colors.white:avgColor;

  Color get iconColor => CommonColorData.ALL[colorsKey]!.iconColor;

  final String fileName;
  String? title;

  List<OffSong> offSongs;
  List<OwnSong> ownSongs;

  List<Song> get songs{
    List<Song> songs = [];
    songs.addAll(ownSongs);
    songs.addAll(offSongs);
    return songs;
  }

  String colorsKey;
  String iconKey;

  bool get isOmega => fileName == omegaFileName;
  bool get isConfid => fileName == confidFileName;

  Album(this.fileName, this.title, this.offSongs, this.ownSongs, this.colorsKey, this.iconKey);

  static Album read(String fileName, List<Song> allSongs){
    String content = readFileAsString(getAlbumFolderPath + fileName);
    return Album.decode(fileName, content, allSongs);
  }

  static Album create(String title, List<OffSong> offSongs, List<OwnSong> ownSongs, String colorsKey, String iconKey, {bool localOnly = false, List<String>? syncParams}) {

    String code = Album.encode(title, offSongs, ownSongs, colorsKey, iconKey);
    File file = saveStringAsFileToFolder(getAlbumFolderLocalPath, code);
    Album album = Album(basename(file.path), title, offSongs, ownSongs, colorsKey, iconKey);
    album.setAllSyncState(SyncableParamSingle_.stateNotSynced);
    if(!localOnly)
      synchronizer.post();
    return album;
  }

  static String encode(String? title, List<OffSong> offSongs, List<OwnSong> ownSongs, String? colorsKey, /*Color colorStart, Color colorEnd,*/ String? iconKey){

    // Sort alphabetically
    PolishLettersComparator comparator = PolishLettersComparator();
    offSongs.sort((a, b) => comparator.compare(a.title, b.title));
    ownSongs.sort((a, b) => comparator.compare(a.title, b.title));

    Map<String, dynamic> map = {
      _PARAM_TITLE: title,
      paramOffSongs: offSongs.map((song) => song.fileName).toList(growable: false),
      paramOwnSongs: ownSongs.map((song) => song.fileName).toList(growable: false),
      paramColorsKey: colorsKey,
      paramIconKey: iconKey,
    };

    return json.encode(map);

  }

  static Album decode(String fileName, String code, List<Song> allSongs){

    Map<String, dynamic> map = json.decode(code);

    // OLD OLD OLD
    String? songsFileNames = map['songs_file_names'];
    if(songsFileNames != null){
      List<String> songFileNames = songsFileNames.split(' ');
      List<OffSong> offSongs = [];
      List<OwnSong> ownSongs = [];
      for(String songFileName in songFileNames)
        if(songFileName.substring(0, 3) == 'o!_') {
          OffSong? song = OffSong.allOfficialMap[songFileName];
          if(song != null) offSongs.add(song);
        }else {
          OwnSong? song = OwnSong.allOwnMap[songFileName];
          if(song != null) ownSongs.add(song);
        }


      Album album = Album(
        fileName,
        map[_PARAM_TITLE]??defTitle,
        offSongs,
        ownSongs,
        map[paramColorsKey],
        map[paramIconKey]??CommonIconData.DEF_ICON_KEY,
      );

      album.save(localOnly: true);
      return album;
    }

    Tuple2<List<OffSong>, List<OwnSong>> songTuple = getSongsFromAlbum(
        (map[paramOffSongs] as List).cast<String>(),
        (map[paramOwnSongs] as List).cast<String>(),
        OffSong.allOfficial,
        OwnSong.allOwn);

    return Album(
      fileName,
      map[_PARAM_TITLE]??defTitle,
      songTuple.item1,
      songTuple.item2,
      map[paramColorsKey],
      map[paramIconKey]??CommonIconData.DEF_ICON_KEY,
    );
  }

  addSong(Song? song){
    if(!songs.contains(song)) {

      if(song is OffSong) {
        for (int i = 0; i < offSongs.length; i++) {
          if (song.title.compareTo(songs[i].title) < 0) {
            offSongs.insert(i, song);
            return;
          }
        }
        offSongs.add(song);
      }

      else if(song is OwnSong) {
        for (int i = 0; i < ownSongs.length; i++) {
          if (song.title.compareTo(songs[i].title) < 0) {
            ownSongs.insert(i, song);
            return;
          }
        }
        ownSongs.add(song);
      }
    }
  }

  void removeSong(Song? song){
    if(song is OffSong)
      offSongs.remove(song);
    else if(song is OwnSong)
      ownSongs.remove(song);
  }

  void save({localOnly = false, List<String>? syncParams}) {

    saveStringAsFileToFolder(
        getAlbumFolderLocalPath,
        encode(title, offSongs, ownSongs, colorsKey, iconKey),
        fileName: fileName);

    if(!localOnly)
      synchronizer.post();
  }

  void delete({bool localOnly = false}) {
    markSyncAsRemoved();
    File(getAlbumFolderPath + fileName).deleteSync();
    ShaPref.remove(ShaPref.SHA_PREF_SPIEWNIK_SEARCH_HISTORY_(this));
    if(!localOnly) synchronizer.post();
  }

  static String toHex(Color color, {bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${color.alpha.toRadixString(16).padLeft(2, '0')}'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';

  static Tuple2<List<OffSong>, List<OwnSong>> getSongsFromAlbum(List<String> offSongsLclIds, List<String> ownSongsLclIds, List<OffSong> allOffSongs, allOwnSongs){

    List<OffSong> offSongs = [];
    for(Song song in allOffSongs)
      if(offSongsLclIds.contains(song.fileName))
        offSongs.add(song as OffSong);

    List<OwnSong> ownSongs = [];
    for(Song song in allOwnSongs)
      if(ownSongsLclIds.contains(song.fileName))
        ownSongs.add(song as OwnSong);

    return Tuple2(offSongs, ownSongs);

  }

  static Album fromResponseData(Map responseData) {

    String fileName = responseData[PARAM_ID]??(throw InvalidResponseError(PARAM_ID));
    String title = responseData[_PARAM_TITLE]??(throw InvalidResponseError(_PARAM_TITLE));
    List<String> offSongsLclIds = responseData[paramOffSongs]??[];
    List<String> ownSongsLclIds = responseData[paramOwnSongs]??[];
    String iconKey = responseData[paramIconKey]??CommonIconData.DEF_ICON_KEY;
    String colorsKey = responseData[paramColorsKey]??CommonColorData.DEF_COLORS_KEY;

    List<OffSong> offSongs = [];
    for (String lclId in offSongsLclIds) {
      OffSong? song = OffSong.allOfficialMap[lclId];
      if (song != null)
        offSongs.add(song);
    }

    List<OwnSong> ownSongs = [];
    for (String lclId in ownSongsLclIds) {
      OwnSong? song = OwnSong.allOwnMap[lclId];
      if (song != null)
        ownSongs.add(song);
    }

    return Album(fileName, title, offSongs, ownSongs, colorsKey, iconKey);
  }

  Album copy(){
    return Album(fileName, title, offSongs, ownSongs, colorsKey, iconKey);
  }

  void update({
    required String? title,
    required List<OffSong>? offSongs,
    required List<OwnSong>? ownSongs,
    required String? colorsKey,
    required String? iconKey,
    localOnly = false
  }) {
    if(title != null) this.title = title;
    if(offSongs != null) this.offSongs = offSongs;
    if(ownSongs != null) this.ownSongs = ownSongs;
    if(colorsKey != null) this.colorsKey = colorsKey;
    if(iconKey != null) this.iconKey = iconKey;

    save(localOnly: localOnly);
  }

  void set(Album album, {bool localOnly = false}){
    album.update(
      title: album.title,
      offSongs: album.offSongs,
      ownSongs: album.ownSongs,
      colorsKey: album.colorsKey,
      iconKey: album.iconKey,
      localOnly: localOnly
    );
  }

  List<String> get searchHistory => ShaPref.getStringList(ShaPref.SHA_PREF_SPIEWNIK_SEARCH_HISTORY_(this), []);
  set searchHistory(List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_SPIEWNIK_SEARCH_HISTORY_(this), value);
  void removeFromSeachHistory(int index){
    List<String> history = searchHistory;
    history.removeAt(index);
    searchHistory = history;
  }

  void registerSongSearchToHistory(Song song){
    List<String> history = searchHistory;
    history.insert(0, song.fileName);
    if(history.length > 1000)
      history = history.sublist(0, 1000);
    searchHistory = history;
  }
  
  @override
  bool operator == (Object other)=> other is Album && fileName == other.fileName;

  @override
  int get hashCode => fileName.hashCode;

  @override
  String get paramId => fileName;

  static const String syncClassId = 'album';

  //@override
  //SyncableParam get parentParam => RootSyncable(syncClassId);

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: _PARAM_TITLE,
      value_: () => title,
    ),

    SyncableParamSingle(
      this,
      paramId: paramOffSongs,
      value_: () => offSongs.map((song) => song.fileName).toList(growable: false),
    ),
    SyncableParamSingle(
      this,
      paramId: paramOwnSongs,
      value_: () => ownSongs.map((song) => song.fileName).toList(growable: false),
    ),
    SyncableParamSingle(
      this,
      paramId: paramColorsKey,
      value_: () => colorsKey,
    ),

    SyncableParamSingle(
      this,
      paramId: paramIconKey,
      value_: () => iconKey,
    ),
  ];

  @override
  void applySyncGetResp(AlbumGetResp resp) {

    title = resp.title;

    List<OffSong> offSongs = [];
    for (String sngLclId in resp.offSongs) {
      OffSong? song = OffSong.allOfficialMap[sngLclId];
      if (song != null)
        offSongs.add(song);
    }
    offSongs = offSongs;

    List<OwnSong> ownSongs = [];
    for (String sngLclId in resp.ownSongs) {
      OwnSong? song = OwnSong.allOwnMap[sngLclId];
      if (song != null)
        ownSongs.add(song);
    }
    ownSongs = ownSongs;

    colorsKey = resp.colorsKey;

    iconKey = resp.iconKey;

    save(localOnly: true);
  }

}

enum AlbumName{
  album,
  wolumin,
  grajdziupla,
  skladanka,
  didzejka
}

AlbumName? get albumName => stringToAlbumName(ShaPref.getString(ShaPref.SHA_PREF_SPIEWNIK_ALBUM_NAME, albumNameToString(AlbumName.album)));
set albumName(AlbumName? name) => ShaPref.setString(ShaPref.SHA_PREF_SPIEWNIK_ALBUM_NAME, albumNameToString(name));

String albumNameToString(AlbumName? name){
  switch (name) {
    case AlbumName.album: return 'Album';
    case AlbumName.wolumin: return 'Wolumin';
    case AlbumName.grajdziupla: return 'Grajdziupla';
    case AlbumName.skladanka: return 'Składanka';
    case AlbumName.didzejka: return 'Didżejka';
    default: return '#Błąd!';
  }
}
AlbumName? stringToAlbumName(String? name){
  switch (name) {
    case 'Album': return AlbumName.album;
    case 'Wolumin': return AlbumName.wolumin;
    case 'Grajdziupla': return AlbumName.grajdziupla;
    case 'Składanka': return AlbumName.skladanka;
    case 'Didżejka': return AlbumName.didzejka;
    default: return null;
  }
}

String get Nowy_ {
  switch (albumName) {
    case AlbumName.album: return 'Nowy';
    case AlbumName.wolumin: return 'Nowy';
    case AlbumName.grajdziupla: return 'Nowa';
    case AlbumName.skladanka: return 'Nowa';
    case AlbumName.didzejka: return 'Nowa';
    default: return '#Błąd!';
  }
}
String get Nowy_album_ {
  switch (albumName) {
    case AlbumName.album: return 'Nowy album';
    case AlbumName.wolumin: return 'Nowy wolumin';
    case AlbumName.grajdziupla: return 'Nowa grajdziupla';
    case AlbumName.skladanka: return 'Nowa składanka';
    case AlbumName.didzejka: return 'Nowa didżejka';
    default: return '#Błąd!';
  }
}
String get Otwarty_album_ {
  switch (albumName) {
    case AlbumName.album: return 'OTWARTY ALBUM';
    case AlbumName.wolumin: return 'OTWARTY WOLUMIN';
    case AlbumName.grajdziupla: return 'OTWARTA GRAJDZIUPLA';
    case AlbumName.skladanka: return 'OTWARTA SKŁADANKA';
    case AlbumName.didzejka: return 'OTWARTA DIDŻEJKA';
    default: return '#Błąd!';
  }
}
String get Zmien_album_ {
  switch (albumName) {
    case AlbumName.album: return 'Zmień album';
    case AlbumName.wolumin: return 'Zmień wolumin';
    case AlbumName.grajdziupla: return 'Zmień grajdziuplę';
    case AlbumName.skladanka: return 'Zmień składankę';
    case AlbumName.didzejka: return 'Zmień didżejkę';
    default: return '#Błąd!';
  }
}
String get album_ {
  switch (albumName) {
    case AlbumName.album: return 'album';
    case AlbumName.wolumin: return 'wolumin';
    case AlbumName.grajdziupla: return 'grajdziupla';
    case AlbumName.skladanka: return 'składanka';
    case AlbumName.didzejka: return 'didżejka';
    default: return '#Błąd!';
  }
}
String get Album_ => albumNameToString(albumName);
String get Albumy_ {
  switch (albumName) {
    case AlbumName.album: return 'Albumy';
    case AlbumName.wolumin: return 'Woluminy';
    case AlbumName.grajdziupla: return 'Grajdziuple';
    case AlbumName.skladanka: return 'Składanki';
    case AlbumName.didzejka: return 'Didżejki';
    default: return '#Błąd!';
  }
}
String get albumy_ {
  switch (albumName) {
    case AlbumName.album: return 'albumy';
    case AlbumName.wolumin: return 'woluminy';
    case AlbumName.grajdziupla: return 'grajdziuple';
    case AlbumName.skladanka: return 'składanki';
    case AlbumName.didzejka: return 'didżejki';
    default: return '#Błąd!';
  }
}
String get albumu_ {
  switch (albumName) {
    case AlbumName.album: return 'albumu';
    case AlbumName.wolumin: return 'woluminu';
    case AlbumName.grajdziupla: return 'grajdziupli';
    case AlbumName.skladanka: return 'składanki';
    case AlbumName.didzejka: return 'didżejki';
    default: return '#Błąd!';
  }
}
String get albumow_ {
  switch (albumName) {
    case AlbumName.album: return 'albumów';
    case AlbumName.wolumin: return 'woluminów';
    case AlbumName.grajdziupla: return 'grajdziupli';
    case AlbumName.skladanka: return 'składanek';
    case AlbumName.didzejka: return 'didżejek';
    default: return '#Błąd!';
  }
}
String get albumie_ {
  switch (albumName) {
    case AlbumName.album:
      return 'albumie';
    case AlbumName.wolumin:
      return 'woluminie';
    case AlbumName.grajdziupla:
      return 'grajdziupli';
    case AlbumName.skladanka:
      return 'składance';
    case AlbumName.didzejka:
      return 'didżejce';
    default: return '#Błąd!';
  }
}
String get tym_albumie_ {
  switch (albumName) {
    case AlbumName.album:
      return 'tym albumie';
    case AlbumName.wolumin:
      return 'tym woluminie';
    case AlbumName.grajdziupla:
      return 'tej grajdziupli';
    case AlbumName.skladanka:
      return 'tej składance';
    case AlbumName.didzejka:
      return 'tej didżejce';
    default: return '#Błąd!';
  }
}
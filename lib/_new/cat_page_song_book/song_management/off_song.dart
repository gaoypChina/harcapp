import 'dart:convert';

import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/off_song_get_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'song.dart';

class OffSong extends Song<OffSongGetResp>{

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static late List<OffSong> allOfficial;
  static late Map<String, OffSong> _allOfficialMap;
  static Map<String, OffSong> get allOfficialMap => _allOfficialMap;
  static set allOfficialMap(Map<String, OffSong> value) => _allOfficialMap = Map.from(value);

  static late List<OffSong> allConfid;
  static late Map<String, OffSong> _allConfidMap;
  static Map<String, OffSong> get allConfidMap => _allConfidMap;
  static set allConfidMap(Map<String, OffSong> value) => _allConfidMap = Map.from(value);

  OffSong(
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
      super.hasExplanationPrimWrap,
  );

  static Future<OffSong> fromRespMap(String fileName, Map respMap, {List? songAudioMapList}) async {
    SongDataEntity songStuff = await Song.fromRespMap(fileName, respMap, songAudioMapList: songAudioMapList);
    return OffSong(
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
      songStuff.memoryMap,
      songStuff.hasExplanationPrimWrap,
    );
  }

  static const String syncClassId = 'offSong';

  @override
  SyncableParam? get parentParam => null;

  @override
  String get debugClassId => syncClassId;

  @override
  Future<String> get code async {
    if(lclId.length > 4 && lclId.substring(0, 4) == 'oc!_') {
      String? jsonCode = await readStringFromAssets('assets/songs/all_songs.hrcpsng');
      Map allSongsMap = jsonDecode(jsonCode!);
      return jsonEncode(allSongsMap['conf'][lclId]['song']);
    }

    String? jsonCode = await readStringFromAssets('assets/songs/all_songs.hrcpsng');
    Map allSongsMap = jsonDecode(jsonCode!);
    return jsonEncode(allSongsMap['official'][lclId]['song']);
  }

}
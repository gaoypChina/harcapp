import 'package:harcapp/_new/api/sync_resp_body/off_song_get_resp.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core_song/song_core.dart';

import 'memory.dart';
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
      String fileName,
      String title,
      List<String> hidTitles,
      List<String> authors,
      List<String> composers,
      List<String> performers,
      DateTime? releaseDate,
      bool showRelDateMonth,
      bool showRelDateDay,
      List<AddPerson> addPers,
      String youtubeLink,
      List<String> tags,
      bool hasChords,
      String text,
      String baseChords,
      PrimitiveWrapper<int> rate,
      List<Memory> memoryList,
      Map<String, Memory> memoryMap
  ) : super(fileName,
      title,
      hidTitles,
      authors,
      composers,
      performers,
      releaseDate,
      showRelDateMonth,
      showRelDateDay,
      addPers,
      youtubeLink,
      tags,
      hasChords,
      text,
      baseChords,
      rate,
      memoryList,
      memoryMap
  );

  static OffSong fromMap(String fileName, Map map){
    SongDataEntity songStuff = Song.fromMap(fileName, map);
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
      songStuff.tags,
      songStuff.hasChords,
      songStuff.text,
      songStuff.baseChords,
      songStuff.ratePrimWrap,
      songStuff.memoryList,
      songStuff.memoryMap
    );
  }

  static const String syncClassId = 'offSong';

  @override
  String get classId => syncClassId;

}
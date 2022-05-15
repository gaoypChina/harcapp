import 'package:harcapp/_new/api/sync_resp_body/song_get_resp.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';

import 'memory_resp.dart';

class OwnSongGetResp extends SongGetResp{

  static const String collName = OwnSong.syncClassId;

  static const String paramCode = OwnSong.paramCode;
  final String? code;

  const OwnSongGetResp({
    required int? rate,
    required int? chordShift,
    required Map<String, MemoryGetResp>? memories,
    required this.code,
  }):super(rate: rate, chordShift: chordShift, memories: memories);

  static OwnSongGetResp from(Map respData) => OwnSongGetResp(
    rate: respData[SongGetResp.paramRate],
    chordShift: respData[SongGetResp.paramChordShift],
    memories: SongGetResp.getMemories(respData[SongGetResp.paramMemories]),
    code: respData[paramCode],
  );
}
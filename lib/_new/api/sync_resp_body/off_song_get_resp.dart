import 'package:harcapp/_new/api/sync_resp_body/song_get_resp.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';

class OffSongGetResp extends SongGetResp{

  static const String collName = OffSong.syncClassId;

  const OffSongGetResp({
    required super.rate,
    required super.chordShift,
    required super.memories,
  });

  static OffSongGetResp from(Map respData) => OffSongGetResp(
    rate: respData[SongGetResp.paramRate],
    chordShift: respData[SongGetResp.paramChordShift],
    memories: SongGetResp.getMemories(respData[SongGetResp.paramMemories]),
  );

}
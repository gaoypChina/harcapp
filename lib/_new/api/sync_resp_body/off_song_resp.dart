import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_resp.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../_api.dart';
import 'memory_resp.dart';

class OffSongResp extends SongResp{

  static const String COLL_NAME = OffSong.REQ_GROUP;

  const OffSongResp({
    @required int rate,
    @required int chordShift,
    @required Map<String, MemoryResp> memories,
  }):super(rate: rate, chordShift: chordShift, memories: memories);

  static OffSongResp from(Map respData) => OffSongResp(
    rate: respData[SongResp.PARAM_RATE],
    chordShift: respData[SongResp.PARAM_CHORD_SHIFT],
    memories: SongResp.getMemories(respData[SongResp.PARAM_MEMORIES]),
  );

}
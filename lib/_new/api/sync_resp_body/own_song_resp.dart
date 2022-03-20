import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_resp.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';

import 'memory_resp.dart';

class OwnSongResp extends SongResp{

  static const String collName = OwnSong.syncClassId;

  static const String PARAM_CODE = OwnSong.PARAM_CODE;
  final String code;

  const OwnSongResp({
    @required int rate,
    @required int chordShift,
    @required Map<String, MemoryResp> memories,
    @required this.code,
  }):super(rate: rate, chordShift: chordShift, memories: memories);

  static OwnSongResp from(Map respData) => OwnSongResp(
    rate: respData[SongResp.PARAM_RATE],
    chordShift: respData[SongResp.PARAM_CHORD_SHIFT],
    memories: SongResp.getMemories(respData[SongResp.PARAM_MEMORIES]),
    code: respData[PARAM_CODE],
  );
}
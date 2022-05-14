import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import 'memory_resp.dart';

class SongResp extends SyncGetResp{

  static const String PARAM_RATE = 'rate';
  final int? rate;

  static const String PARAM_CHORD_SHIFT = 'chord_shift';
  final int? chordShift;

  static const String PARAM_MEMORIES = 'memories';
  final Map<String, MemoryResp>? memories;

  const SongResp({
    required this.rate,
    required this.chordShift,
    required this.memories,
  });

  static Map<String, MemoryResp>? getMemories(Map? memRespData){
    if(memRespData == null) return null;

    Map<String, MemoryResp> memories = {};
    for(String lclId in memRespData.keys as Iterable<String>){
      Map memMap = memRespData[lclId];
      memories[lclId] = MemoryResp.from(memMap);
    }
    return memories;
  }
}
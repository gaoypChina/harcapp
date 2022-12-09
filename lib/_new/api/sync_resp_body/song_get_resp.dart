import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import 'memory_resp.dart';

class SongGetResp extends SyncGetResp{

  static const String paramRate = 'rate';
  final int? rate;

  static const String paramChordShift = 'chordShift';
  final int? chordShift;

  static const String paramMemories = 'memories';
  final Map<String, MemoryGetResp>? memories;

  const SongGetResp({
    required this.rate,
    required this.chordShift,
    required this.memories,
  });

  static Map<String, MemoryGetResp>? getMemories(Map? memRespData){
    if(memRespData == null) return null;

    Map<String, MemoryGetResp> memories = {};
    for(String lclId in memRespData.keys as Iterable<String>){
      Map memMap = memRespData[lclId];
      memories[lclId] = MemoryGetResp.from(memMap);
    }
    return memories;
  }
}
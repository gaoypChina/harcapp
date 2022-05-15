import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../_api.dart';

class MemoryGetResp extends SyncGetResp{

  static const String collName = Memory.syncClassId;

  static const String paramDesc = Memory.paramDesc;
  final String? desc;

  static const String paramDate = Memory.paramDate;
  final DateTime? date;

  static const String paramPlace = Memory.paramPlace;
  final String? place;

  static const String paramFontKey = Memory.paramFontKey;
  final int fontKey;

  static const String paramPublished = Memory.paramPublished;
  final bool published;

  const MemoryGetResp({
    required this.desc,
    required this.date,
    required this.place,
    required this.fontKey,
    required this.published
  });

  static MemoryGetResp from(Map respData) => MemoryGetResp(
      desc: respData[paramDesc],
      date: DateTime.tryParse(respData[paramDate]??(throw InvalidResponseError(paramDate))),
      place: respData[paramPlace],
      fontKey: respData[paramFontKey]??(throw InvalidResponseError(paramFontKey)),
      published: respData[paramPublished]??(throw InvalidResponseError(paramPublished)));

}
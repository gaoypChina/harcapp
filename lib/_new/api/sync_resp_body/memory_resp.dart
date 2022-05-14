import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../_api.dart';

class MemoryResp extends SyncGetResp{

  static const String COLL_NAME = Memory.syncClassId;

  static const String PARAM_DESC = Memory.PARAM_DESC;
  final String? desc;

  static const String PARAM_DATE = Memory.PARAM_DATE;
  final DateTime? date;

  static const String PARAM_PLACE = Memory.PARAM_PLACE;
  final String? place;

  static const String PARAM_FONT_KEY = Memory.PARAM_FONT_KEY;
  final int fontKey;

  static const String PARAM_PUBLISHED = Memory.PARAM_PUBLISHED;
  final bool published;

  const MemoryResp({
    required this.desc,
    required this.date,
    required this.place,
    required this.fontKey,
    required this.published
  });

  static MemoryResp from(Map respData) => MemoryResp(
      desc: respData[PARAM_DESC],
      date: DateTime.tryParse(respData[PARAM_DATE]??(throw InvalidResponseError(PARAM_DATE))),
      place: respData[PARAM_PLACE],
      fontKey: respData[PARAM_FONT_KEY]??(throw InvalidResponseError(PARAM_FONT_KEY)),
      published: respData[PARAM_PUBLISHED]??(throw InvalidResponseError(PARAM_PUBLISHED)));

}
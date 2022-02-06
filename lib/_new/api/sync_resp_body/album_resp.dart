import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../_api.dart';

class AlbumResp extends SyncEntityResp{

  static const String COLL_NAME = 'album';

  static const String PARAM_TITLE = 'title';
  final String title;

  static const String PARAM_OFF_SONGS = 'off_song';
  final List<String> offSongs;

  static const String PARAM_OWN_SONGS = 'own_song';
  final List<String> ownSongs;

  static const String PARAM_COLORS_KEY = 'colors_key';
  final String colorsKey;

  static const String PARAM_ICON_KEY = 'icon_key';
  final String iconKey;

  const AlbumResp({
    @required this.title,
    @required this.offSongs,
    @required this.ownSongs,
    @required this.colorsKey,
    @required this.iconKey
  });

  static AlbumResp from(Map respData) => AlbumResp(
    title: respData[AlbumResp.PARAM_TITLE]??(throw InvalidResponseError(AlbumResp.PARAM_TITLE)),
    offSongs: (respData[AlbumResp.PARAM_OFF_SONGS] as List).cast<String>(),
    ownSongs: (respData[AlbumResp.PARAM_OWN_SONGS] as List).cast<String>(),
    colorsKey: respData[AlbumResp.PARAM_COLORS_KEY]??(throw InvalidResponseError(AlbumResp.PARAM_COLORS_KEY)),
    iconKey: respData[AlbumResp.PARAM_ICON_KEY]??(throw InvalidResponseError(AlbumResp.PARAM_ICON_KEY)),
  );
}
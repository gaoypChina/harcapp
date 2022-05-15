import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../_api.dart';

class AlbumGetResp extends SyncGetResp{

  static const String collName = 'album';

  static const String paramTitle = 'title';
  final String title;

  static const String paramOffSongs = 'off_song';
  final List<String> offSongs;

  static const String paramOwnSongs = 'own_song';
  final List<String> ownSongs;

  static const String paramColorsKey = 'colors_key';
  final String colorsKey;

  static const String paramIconKey = 'icon_key';
  final String iconKey;

  const AlbumGetResp({
    required this.title,
    required this.offSongs,
    required this.ownSongs,
    required this.colorsKey,
    required this.iconKey
  });

  static AlbumGetResp from(Map respData) => AlbumGetResp(
    title: respData[AlbumGetResp.paramTitle]??(throw InvalidResponseError(AlbumGetResp.paramTitle)),
    offSongs: ((respData[AlbumGetResp.paramOffSongs]??[]) as List).cast<String>(),
    ownSongs: ((respData[AlbumGetResp.paramOwnSongs]??[]) as List).cast<String>(),
    colorsKey: respData[AlbumGetResp.paramColorsKey]??(throw InvalidResponseError(AlbumGetResp.paramColorsKey)),
    iconKey: respData[AlbumGetResp.paramIconKey]??(throw InvalidResponseError(AlbumGetResp.paramIconKey)),
  );
}
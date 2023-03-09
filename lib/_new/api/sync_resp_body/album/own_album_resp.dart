import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../../_api.dart';

class OwnAlbumGetResp extends SyncGetResp{

  static const String collName = 'album';

  static const String paramTitle = 'title';
  final String title;

  static const String paramOffSongs = 'offSongs';
  final List<String> offSongs;

  static const String paramOwnSongs = 'ownSongs';
  final List<String> ownSongs;

  static const String paramColorsKey = 'colorsKey';
  final String colorsKey;

  static const String paramIconKey = 'iconKey';
  final String iconKey;

  const OwnAlbumGetResp({
    required this.title,
    required this.offSongs,
    required this.ownSongs,
    required this.colorsKey,
    required this.iconKey
  });

  static OwnAlbumGetResp from(Map respData) => OwnAlbumGetResp(
    title: respData[paramTitle]??(throw InvalidResponseError(paramTitle)),
    offSongs: ((respData[paramOffSongs]??[]) as List).cast<String>(),
    ownSongs: ((respData[paramOwnSongs]??[]) as List).cast<String>(),
    colorsKey: respData[paramColorsKey]??(throw InvalidResponseError(paramColorsKey)),
    iconKey: respData[paramIconKey]??(throw InvalidResponseError(paramIconKey)),
  );
}
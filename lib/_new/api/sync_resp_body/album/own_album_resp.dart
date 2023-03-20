import '../../_api.dart';
import 'album_resp.dart';

class OwnAlbumGetResp extends AlbumGetResp{

  static const String collName = 'ownAlbum';

  static const String paramTitle = 'title';
  final String title;

  static const String paramColorsKey = 'colorsKey';
  final String colorsKey;

  static const String paramIconKey = 'iconKey';
  final String iconKey;

  const OwnAlbumGetResp({
    required this.title,
    required super.offSongs,
    required super.ownSongs,
    required this.colorsKey,
    required this.iconKey
  });

  static OwnAlbumGetResp from(Map respData) => OwnAlbumGetResp(
    title: respData[paramTitle]??(throw InvalidResponseError(paramTitle)),
    offSongs: ((respData[AlbumGetResp.paramOffSongs]??[]) as List).cast<String>(),
    ownSongs: ((respData[AlbumGetResp.paramOwnSongs]??[]) as List).cast<String>(),
    colorsKey: respData[paramColorsKey]??(throw InvalidResponseError(paramColorsKey)),
    iconKey: respData[paramIconKey]??(throw InvalidResponseError(paramIconKey)),
  );
}
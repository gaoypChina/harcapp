import 'album_resp.dart';

class ToLearnAlbumGetResp extends AlbumGetResp{

  static const String collName = 'toLearnAlbum';

  const ToLearnAlbumGetResp({
    required super.offSongs,
    required super.ownSongs,
  });

  static ToLearnAlbumGetResp from(Map respData) => ToLearnAlbumGetResp(
    offSongs: ((respData[AlbumGetResp.paramOffSongs]??[]) as List).cast<String>(),
    ownSongs: ((respData[AlbumGetResp.paramOwnSongs]??[]) as List).cast<String>(),
  );
}
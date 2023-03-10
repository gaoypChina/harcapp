import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class ToLearnAlbumGetResp extends SyncGetResp{

  static const String collName = 'toLearnAlbum';

  static const String paramOffSongs = 'offSongs';
  final List<String> offSongs;

  static const String paramOwnSongs = 'ownSongs';
  final List<String> ownSongs;

  const ToLearnAlbumGetResp({
    required this.offSongs,
    required this.ownSongs,
  });

  static ToLearnAlbumGetResp from(Map respData) => ToLearnAlbumGetResp(
    offSongs: ((respData[paramOffSongs]??[]) as List).cast<String>(),
    ownSongs: ((respData[paramOwnSongs]??[]) as List).cast<String>(),
  );
}
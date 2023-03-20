import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

abstract class AlbumGetResp extends SyncGetResp{

  static const String paramOffSongs = 'offSongs';
  final List<String> offSongs;

  static const String paramOwnSongs = 'ownSongs';
  final List<String> ownSongs;

  const AlbumGetResp({
    required this.offSongs,
    required this.ownSongs,
  });

}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/_new/api/sync_resp_body/album_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/off_song_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/own_song_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_def_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_zhp_sim_2022_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhp_sim_2022.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:pretty_json/pretty_json.dart';

import '_api.dart';



//class NotEnoughParamsError extends Error{}

class ApiSync{

  static const String URL = 'api/sync/';

  static Future<Response> post(
      List<SyncableEntity> syncables,
      {bool dumpReplaceExisting,
        void Function(Response response, Map<String, dynamic> offSongs, Map<String, dynamic> ownSongs, Map<String, dynamic> albums, Map<String, dynamic> spraws, Map<String, dynamic> rankDefs, Map<String, dynamic> rankZhpSim2022, DateTime syncedTime) onSuccess,
        void Function(Response response) onError,
      }) async {

    Map<String, dynamic> reqMap = {};
    if(dumpReplaceExisting??false)
      reqMap['dumpReplaceExisting'] = true;

    for(SyncableEntity syncable in syncables){

      Map reqItem = await syncable.getAPIReqItem(setSyncStateInProgress: true, returnAllNotNone: dumpReplaceExisting??false);
      if(reqItem.isEmpty) continue;

      if(!reqMap.keys.contains(syncable.classId))
        reqMap[syncable.classId] = {};

      reqMap[syncable.classId][syncable.objectId] = reqItem;
    }

    logger.i('Sync post request:\n${prettyJson(reqMap)}');

    return await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => await dio.post(API.SERVER_URL + URL + 'post', data: reqMap),
      onSuccess: (Response response) async {
        Map<String, dynamic> offSongs = response.data['off_song'];
        Map<String, dynamic> ownSongs = response.data['own_song'];
        Map<String, dynamic> albums = response.data['album'];
        Map<String, dynamic> spraws = response.data['spraw'];
        Map<String, dynamic> rankDefs = response.data['rank_def'];
        Map<String, dynamic> rankZhpSim2022 = response.data[RankZHPSim2022Templ.REQ_GROUP];

        DateTime syncedTime = DateTime.tryParse(response.data['time']);

        logger.i('Sync post response:\n${prettyJson(response.data)}');

        onSuccess?.call(
            response,
            offSongs,
            ownSongs,
            albums,
            spraws,
            rankDefs,
            rankZhpSim2022,
            syncedTime
        );
      },
      onError: (err) async => onError?.call(err.response)
    );
  }

  static Future<Response> postAndSave({
    @required List<SyncableEntity> syncable,
    bool dumpReplaceExisting,
    void Function() onSuccess,
    void Function(Response response) onError,
  }) async => await post(
      syncable,
      dumpReplaceExisting: dumpReplaceExisting,
      onSuccess: (Response response, Map offSongs, Map ownSongs, Map albums, Map spraws, Map rankDefs, Map rankZhpSim2022, DateTime syncedTime) {

        DateTime syncedTime = DateTime.tryParse(response.data['time']);

        if(offSongs != null)
          for(String lclId in offSongs.keys){
            Song song = OffSong.allOfficialMap[lclId];
            song.saveSyncResult(offSongs[lclId], syncedTime);
          }

        if(ownSongs != null)
          for(String lclId in ownSongs.keys){
            Song song = OwnSong.allOwnMap[lclId];
            song.saveSyncResult(ownSongs[lclId], syncedTime);
          }

        if(albums != null)
          for(String lclId in albums.keys){
            Album album = Album.allMap[lclId];
            album.saveSyncResult(albums[lclId], syncedTime);
          }

        if(spraws != null)
          for(String uniqName in spraws.keys){
            Spraw spraw = Spraw.allMap[uniqName];
            spraw.saveSyncResult(spraws[uniqName], syncedTime);
          }

        if(rankDefs != null)
          for(String uniqName in rankDefs.keys){
            Rank rank = Rank.allMap[uniqName];
            rank.saveSyncResult(rankDefs[uniqName], syncedTime);
          }

        if(rankZhpSim2022 != null)
          for(String uniqName in rankZhpSim2022.keys){
            Rank rank = Rank.allMap[uniqName];
            rank.saveSyncResult(rankZhpSim2022[uniqName], syncedTime);
          }
        
        SynchronizerEngine.lastSyncTimeLocal = syncedTime;

        onSuccess?.call();
      },
      onError: onError
  );
  
  static Future<Response> get({
    void Function(Response response, Map<String, OffSongResp> offSongs, Map<String, OwnSongResp> ownSongs, Map<String, AlbumResp> albums, Map<String, SprawResp> spraws, Map<String, RankDefResp> rankDefs,  Map<String, RankZhpSim2022Resp> rankZhpSim2022, DateTime syncedTime) onSuccess,
    void Function(Response) onError,
  }) async {
    
    logger.i('Sync get request sent.');
    
    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => await dio.get(API.SERVER_URL + URL + 'get'),
        onSuccess: (Response response) async {
          
          Map<String, dynamic> offSongs = response.data[OffSongResp.COLL_NAME];
          Map<String, OffSongResp> offSongResps = {};
          if(offSongs != null)
            for(String lclId in offSongs.keys){
              Map<String, dynamic> response = offSongs[lclId];
              try {
                offSongResps[lclId] = OffSongResp.from(response);
              } catch (e){
                logger.e('Off song from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic> ownSongs = response.data[OwnSongResp.COLL_NAME];
          Map<String, OwnSongResp> ownSongResps = {};
          if(ownSongs != null)
            for(String lclId in ownSongs.keys){
              Map<String, dynamic> response = ownSongs[lclId];
              try {
                ownSongResps[lclId] = OwnSongResp.from(response);
              } catch (e){
                logger.e('Own song from respnse creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic> albums = response.data[AlbumResp.COLL_NAME];
          Map<String, AlbumResp> albumResps = {};
          if(albums != null)
            for(String lclId in albums.keys){
              Map<String, dynamic> response = albums[lclId];
              try {
                albumResps[lclId] = AlbumResp.from(response);
              } catch (e){
                logger.e('Album from respnse creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic> spraws = response.data[SprawResp.COLL_NAME];
          Map<String, SprawResp> sprawResps = {};
          if(spraws != null)
            for(String uniqName in spraws.keys){
              Map<String, dynamic> response = spraws[uniqName];
              try {
                sprawResps[uniqName] = SprawResp.from(response);
              } catch (e){
                logger.e('Spraw from respnse creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic> rankDefs = response.data[RankDefResp.COLL_NAME];
          Map<String, RankDefResp> rankDefResps = {};
          if(rankDefs != null)
            for(String uniqName in rankDefs.keys){
              Map<String, dynamic> response = rankDefs[uniqName];
              try {
                rankDefResps[uniqName] = RankDefResp.from(response);
              } catch (e){
                logger.e('RankDef from respnse creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic> rankZhpSim2022 = response.data[RankZhpSim2022Resp.COLL_NAME];
          Map<String, RankZhpSim2022Resp> rankZhpSim2022Resps = {};
          if(rankZhpSim2022 != null)
            for(String uniqName in rankZhpSim2022.keys){
              Map<String, dynamic> response = rankZhpSim2022[uniqName];
              try {
                rankZhpSim2022Resps[uniqName] = RankZhpSim2022Resp.from(response);
              } catch (e){
                logger.e('RankZhpSim2022 from respnse creation error: ${e.toString()}');
              }
            }

          DateTime syncedTime;
          if(response.data['time'] != null) {
            syncedTime = DateTime.tryParse(response.data['time']);
            SynchronizerEngine.lastSyncTimeLocal = syncedTime;
          }

          logger.i('Sync get response received:'
              '\nOffSongs:'
              '\n${prettyJson(offSongs)}'
              '\nOwnSongs:'
              '\n${prettyJson(ownSongs)}'
              '\nAlbums:'
              '\n${prettyJson(albums)}'
              '\nSpraws:'
              '\n${prettyJson(spraws)}'
              '\nRankDefs:'
              '\n${prettyJson(rankDefs)}'
              '\nRankZhpSim2022:'
              '\n${prettyJson(rankZhpSim2022)}'

          );

          onSuccess?.call(
              response,
              offSongResps,
              ownSongResps,
              albumResps,
              sprawResps,
              rankDefResps,
              rankZhpSim2022Resps,
              syncedTime
          );
        },
        onError: (err) async => await onError?.call(err.response)
    );
  }

  static Future<Response> getAndSave({
    void Function() onSuccess,
    void Function() onError,
  }) async => await get(
      onSuccess: (Response response, Map<String, OffSongResp> offSongs, Map<String, OwnSongResp> ownSongs, Map<String, AlbumResp> albums, Map<String, SprawResp> spraws, Map<String, RankDefResp> rankDefs, Map<String, RankZhpSim2022Resp> rankZhpSim2022, DateTime syncedTime){

        for(String lclId in offSongs.keys){
          OffSong song = OffSong.allOfficialMap[lclId];
          if(song == null) continue;
          SongResp songResp = offSongs[lclId];
          song.applySyncResp(songResp);
        }

        for(String lclId in ownSongs.keys){
          OwnSong song = OwnSong.allOwnMap[lclId];
          OwnSongResp songResp = ownSongs[lclId];
          if(song == null) {
            song = OwnSong.saveOwnSong(songResp.code, lclId: lclId);
            OwnSong.addOwn(song);
          }

          song.applySyncResp(songResp);
        }

        for(String lclId in albums.keys){
          Album album = Album.allMap[lclId];
          AlbumResp albumResp = albums[lclId];
          if(album == null) {

            List<OffSong> offSongs = [];
            for(String lclId in albumResp.offSongs){
              OffSong song = OffSong.allOfficialMap[lclId];
              if(song != null) offSongs.add(song);
            }

            List<OwnSong> ownSongs = [];
            for(String lclId in albumResp.offSongs){
              OwnSong song = OwnSong.allOwnMap[lclId];
              if(song != null) ownSongs.add(song);
            }

            album = Album.create(
                albumResp.title,
                offSongs,
                ownSongs,
                albumResp.colorsKey,
                albumResp.iconKey,
                localOnly: true
            );
            Album.addToAll(album);
          }
          album.applySyncResp(albumResp);
        }

        for(String uniqSprawName in spraws.keys){
          Spraw spraw = Spraw.allMap[uniqSprawName];
          SprawResp sprawResp = spraws[uniqSprawName];
          spraw.applySyncResp(sprawResp);
        }

        for(String uniqRankName in rankDefs.keys){
          Rank rank = Rank.allMap[uniqRankName];
          RankDefResp rankResp = rankDefs[uniqRankName];
          rank.applySyncResp(rankResp);
        }

        for(String uniqRankName in rankZhpSim2022.keys){
          Rank rank = Rank.allMap[uniqRankName];
          RankZhpSim2022Resp rankResp = rankZhpSim2022[uniqRankName];
          rank.applySyncResp(rankResp);
        }

        onSuccess?.call();

      },
      onError: (err) => onError?.call()
  );

  static Future<Response> lastSync({
    void Function(DateTime) onSuccess,
    void Function(Response) onError
  }) async => await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => await dio.get(API.SERVER_URL + URL + 'last_sync'),
        onSuccess: (Response response) async {
          DateTime lastSync;
          lastSync = DateTime.tryParse(response.data);
          onSuccess?.call(lastSync);
        },
        onError: (err) async => await onError?.call(err.response)
    );

}
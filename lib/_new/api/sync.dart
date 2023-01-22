import 'dart:async';

import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/org/org_handler.dart';
import 'package:harcapp/_new/api/sync_resp_body/album_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/off_song_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/own_song_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_def_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_zhp_sim_2022_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/song_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_get_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhp_sim_2022.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings_resp.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/sync/syncable_new.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:pretty_json/pretty_json.dart';

import '../../_common_classes/org/org_entity_resp.dart';
import '../cat_page_guide_book/_stopnie/models/rank_def.dart';
import '../cat_page_song_book/settings/song_book_settings.dart';
import '../details/app_settings.dart';
import '../details/app_settings_resp.dart';
import '_api.dart';


class ApiSync{

  static const String url = 'api/sync/';
  
  static Future<Response?> post(
        {bool? dumpReplaceExisting,
        void Function(
            Response response,
            bool? orgHandler,
            Map<String, dynamic>? appSettings,
            Map<String, dynamic>? songBookSettings,
            Map<String, dynamic>? offSongs,
            Map<String, dynamic>? ownSongs,
            Map<String, dynamic>? albums,
            Map<String, dynamic>? spraws,
            Map<String, dynamic>? rankDefs,
            Map<String, dynamic>? rankZhpSim2022,
            DateTime? syncedTime)? onSuccess,
        void Function(Response? response)? onError,
      }) async {

    Map<String?, dynamic> reqMap = {};
    if(dumpReplaceExisting??false)
      reqMap['dumpReplaceExisting'] = true;

    for(SyncableParam param in SyncNode.all){
      try {
        reqMap[param.paramId] = await param.buildPostReq(
            setSyncStateInProgress: true,
            includeDefaults: dumpReplaceExisting ?? false);
      } on NothingToSyncException{
        continue;
      }
    }

    for(String removeSyncItemName in RemoveSyncItem.all!){

      List<String> paramIds = removeSyncItemName.split(RemoveSyncItem.paramSep);
      String currParam;
      Map? currReqMap = reqMap;
      while(paramIds.isNotEmpty){
        currParam = paramIds.first;
        paramIds.removeAt(0);

        if(currReqMap![currParam] == null)
          currReqMap[currParam] = {};

        currReqMap = currReqMap[currParam];
      }

      currReqMap!['remove'] = true;

    }

    logger.i('Sync post request:\n${prettyJson(reqMap)}');

    return await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => await dio.post(API.SERVER_URL + url, data: reqMap),
      onSuccess: (Response response, DateTime now) async {
        dynamic orgHandler = response.data[OrgHandler.syncClassId];
        Map<String, dynamic>? appSettings = response.data[AppSettings.syncClassId];
        Map<String, dynamic>? songBookSettings = response.data[SongBookSettings.syncClassId];
        Map<String, dynamic>? offSongs = response.data[OffSong.syncClassId];
        Map<String, dynamic>? ownSongs = response.data[OwnSong.syncClassId];
        Map<String, dynamic>? albums = response.data[Album.syncClassId];
        Map<String, dynamic>? spraws = response.data[Spraw.syncClassId];
        Map<String, dynamic>? rankDefs = response.data[RankDef.syncClassId];
        Map<String, dynamic>? rankZhpSim2022 = response.data[RankZHPSim2022.syncClassId];

        DateTime? syncedTime = DateTime.tryParse(response.data['time']);

        logger.i('Sync post response:\n${prettyJson(response.data)}');

        onSuccess?.call(
          response,
          orgHandler,
          appSettings,
          songBookSettings,
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

  static Future<Response?> postAndSave({
    bool? dumpReplaceExisting,
    void Function()? onSuccess,
    void Function(Response? response)? onError,
  }) async => await post(
      dumpReplaceExisting: dumpReplaceExisting,
      onSuccess: (Response response, dynamic orgHandler, Map? appSettings, Map? songBookSettings, Map? offSongs, Map? ownSongs, Map? albums, Map? spraws, Map? rankDefs, Map? rankZhpSim2022, DateTime? syncedTime) {

        DateTime? syncedTime = DateTime.tryParse(response.data['time']);

        if(orgHandler != null)
          OrgHandler().saveSyncResult(orgHandler, syncedTime);

        if(appSettings != null)
          AppSettings().saveSyncResult(appSettings, syncedTime);

        if(songBookSettings != null)
          SongBookSettings().saveSyncResult(songBookSettings, syncedTime);

        if(offSongs != null)
          for(String lclId in offSongs.keys as Iterable<String>){
            OffSong.allOfficialMap[lclId]!.saveSyncResult(offSongs[lclId], syncedTime);
          }

        if(ownSongs != null)
          for(String lclId in ownSongs.keys as Iterable<String>){
            if(ownSongs[lclId] == RemoveSyncItem.removedRespCode) RemoveSyncItem.resolve('${OwnSong.syncClassId}${RemoveSyncItem.paramSep}$lclId');
            else OwnSong.allOwnMap[lclId]!.saveSyncResult(ownSongs[lclId], syncedTime);
          }

        if(albums != null)
          for(String lclId in albums.keys as Iterable<String>){
            if(albums[lclId] == RemoveSyncItem.removedRespCode) RemoveSyncItem.resolve('${Album.syncClassId}${RemoveSyncItem.paramSep}$lclId');
            else Album.allMap[lclId]!.saveSyncResult(albums[lclId], syncedTime);
          }

        if(spraws != null)
          for(String uniqName in spraws.keys as Iterable<String>){
            Spraw.allMap[uniqName]!.saveSyncResult(spraws[uniqName], syncedTime);
          }

        if(rankDefs != null)
          for(String uniqName in rankDefs.keys as Iterable<String>){
            Rank.allMap[uniqName]!.saveSyncResult(rankDefs[uniqName], syncedTime);
          }

        if(rankZhpSim2022 != null)
          for(String uniqName in rankZhpSim2022.keys as Iterable<String>){
            Rank.allMap[uniqName]!.saveSyncResult(rankZhpSim2022[uniqName], syncedTime);
          }
        
        SynchronizerEngine.lastSyncTimeLocal = syncedTime;

        onSuccess?.call();
      },
      onError: onError
  );
  
  static Future<Response?> get({
    FutureOr<void> Function(Response response, OrgEntityResp? orgResp, AppSettingsResp? appSettingsResp, SongBookSettingsResp? songBookSettingsResp, Map<String, OffSongGetResp> offSongs, Map<String, OwnSongGetResp> ownSongs, Map<String, AlbumGetResp> albums, Map<String, SprawGetResp> spraws, Map<String, RankDefGetResp> rankDefs,  Map<String, RankZhpSim2022GetResp> rankZhpSim2022, DateTime? syncedTime)? onSuccess,
    FutureOr<void> Function(Response?)? onError,
  }) async {
    
    logger.i('Sync get request sent.');
    
    return await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => await dio.get(API.SERVER_URL + url),
        onSuccess: (Response response, DateTime now) async {

          dynamic orgData = response.data[OrgEntityResp.collName];
          OrgEntityResp? orgResp;
          if(orgData != null)
            orgResp = OrgEntityResp.from(orgData);

          dynamic appSettingsData = response.data[AppSettingsResp.collName];
          AppSettingsResp? appSettingsResp;
          if(appSettingsData != null)
            appSettingsResp = AppSettingsResp.from(appSettingsData);

          dynamic songBookSettingsData = response.data[SongBookSettingsResp.collName];
          SongBookSettingsResp? songBookSettingsResp;
          if(songBookSettingsData != null)
            songBookSettingsResp = SongBookSettingsResp.from(songBookSettingsData);

          Map<String, dynamic>? offSongs = response.data[OffSongGetResp.collName];
          Map<String, OffSongGetResp> offSongResps = {};
          if(offSongs != null)
            for(String lclId in offSongs.keys){
              Map<String, dynamic> response = offSongs[lclId];
              try {
                offSongResps[lclId] = OffSongGetResp.from(response);
              } catch (e){
                logger.e('Off song from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? ownSongs = response.data[OwnSongGetResp.collName];
          Map<String, OwnSongGetResp> ownSongResps = {};
          if(ownSongs != null)
            for(String lclId in ownSongs.keys){
              Map<String, dynamic> response = ownSongs[lclId];
              try {
                ownSongResps[lclId] = OwnSongGetResp.from(response);
              } catch (e){
                logger.e('Own song from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? albums = response.data[AlbumGetResp.collName];
          Map<String, AlbumGetResp> albumResps = {};
          if(albums != null)
            for(String lclId in albums.keys){
              Map<String, dynamic> response = albums[lclId];
              try {
                albumResps[lclId] = AlbumGetResp.from(response);
              } catch (e){
                logger.e('Album from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? spraws = response.data[SprawGetResp.COLL_NAME];
          Map<String, SprawGetResp> sprawResps = {};
          if(spraws != null)
            for(String uniqName in spraws.keys){
              Map<String, dynamic> response = spraws[uniqName];
              try {
                sprawResps[uniqName] = SprawGetResp.from(response);
              } catch (e){
                logger.e('Spraw from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? rankDefs = response.data[RankDefGetResp.COLL_NAME];
          Map<String, RankDefGetResp> rankDefResps = {};
          if(rankDefs != null)
            for(String uniqName in rankDefs.keys){
              Map<String, dynamic> response = rankDefs[uniqName];
              try {
                rankDefResps[uniqName] = RankDefGetResp.from(response);
              } catch (e){
                logger.e('RankDef from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? rankZhpSim2022 = response.data[RankZhpSim2022GetResp.COLL_NAME];
          Map<String, RankZhpSim2022GetResp> rankZhpSim2022Resps = {};
          if(rankZhpSim2022 != null)
            for(String uniqName in rankZhpSim2022.keys){
              Map<String, dynamic> response = rankZhpSim2022[uniqName];
              try {
                rankZhpSim2022Resps[uniqName] = RankZhpSim2022GetResp.from(response);
              } catch (e){
                logger.e('RankZhpSim2022 from response creation error: ${e.toString()}');
              }
            }

          DateTime? syncedTime;
          if(response.data['time'] != null) {
            syncedTime = DateTime.tryParse(response.data['time']);
            SynchronizerEngine.lastSyncTimeLocal = syncedTime;
          }

          logger.i('Sync get response received:'
              '\nOrgData:'
              '\n${prettyJson(orgData)}'
              '\nAppSettings:'
              '\n${prettyJson(appSettingsData)}'
              '\nSongBookSettings'
              '\n${prettyJson(songBookSettingsData)}'
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

          await onSuccess?.call(
              response,
              orgResp,
              appSettingsResp,
              songBookSettingsResp,
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

  static Future<Response?> getAndSave({
    void Function()? onSuccess,
    void Function()? onError,
  }) async => await get(
      onSuccess: (Response response, OrgEntityResp? orgResp, AppSettingsResp? appSettingsResp, SongBookSettingsResp? songBookSettingsResp, Map<String, OffSongGetResp> offSongs, Map<String, OwnSongGetResp> ownSongs, Map<String, AlbumGetResp> albums, Map<String, SprawGetResp> spraws, Map<String, RankDefGetResp> rankDefs, Map<String, RankZhpSim2022GetResp> rankZhpSim2022, DateTime? syncedTime) async {

        if(orgResp != null)
          OrgHandler().applySyncGetResp(orgResp);

        if(appSettingsResp != null)
          AppSettings().applySyncGetResp(appSettingsResp);

        if(songBookSettingsResp != null)
          SongBookSettings().applySyncGetResp(songBookSettingsResp);

        for(String lclId in offSongs.keys){
          OffSong? song = OffSong.allOfficialMap[lclId];
          if(song == null) continue;
          SongGetResp? songResp = offSongs[lclId];
          song.applySyncGetResp(songResp as OffSongGetResp);
        }

        for(String lclId in ownSongs.keys){
          OwnSong? song = OwnSong.allOwnMap[lclId];
          if(song == null) continue;
          OwnSongGetResp songResp = ownSongs[lclId]!;
          song = await OwnSong.saveOwnSong(songResp.code!, lclId: lclId);
          OwnSong.addOwn(song);

          song.applySyncGetResp(songResp);
        }

        for(String lclId in albums.keys){
          Album? album = Album.allMap[lclId];
          AlbumGetResp albumResp = albums[lclId]!;
          if(album == null) {

            List<OffSong> offSongs = [];
            for(String lclId in albumResp.offSongs){
              OffSong? song = OffSong.allOfficialMap[lclId];
              if(song != null) offSongs.add(song);
            }

            List<OwnSong> ownSongs = [];
            for(String lclId in albumResp.offSongs){
              OwnSong? song = OwnSong.allOwnMap[lclId];
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
          album.applySyncGetResp(albumResp);
        }

        for(String uniqSprawName in spraws.keys){
          Spraw spraw = Spraw.allMap[uniqSprawName]!;
          SprawGetResp sprawResp = spraws[uniqSprawName]!;
          spraw.applySyncGetResp(sprawResp);
        }

        for(String uniqRankName in rankDefs.keys){
          Rank rank = Rank.allMap[uniqRankName]!;
          RankDefGetResp? rankResp = rankDefs[uniqRankName]!;
          rank.applySyncGetResp(rankResp);
        }

        for(String uniqRankName in rankZhpSim2022.keys){
          Rank rank = Rank.allMap[uniqRankName]!;
          RankZhpSim2022GetResp? rankResp = rankZhpSim2022[uniqRankName]!;
          rank.applySyncGetResp(rankResp);
        }

        onSuccess?.call();

      },
      onError: (err) => onError?.call()
  );

  static Future<Response?> lastSync({
    void Function(DateTime?)? onSuccess,
    void Function(Response?)? onError
  }) async => await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => await dio.get('${API.SERVER_URL}${url}last_sync'),
        onSuccess: (Response response, DateTime now) async {
          DateTime? lastSync = DateTime.tryParse(response.data);
          onSuccess?.call(lastSync);
        },
        onError: (err) async => onError?.call(err.response)
    );

}
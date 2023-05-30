import 'dart:async';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/org/org_handler.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/sync_resp_body/album/own_album_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/album/to_learn_album_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/off_song_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/own_song_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_def_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_zhp_sim_2022_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_task_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_zhp_sim_2022.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings_resp.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/off_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:pretty_json/pretty_json.dart';

import '../../_common_classes/org/org_entity_resp.dart';
import '../cat_page_song_book/settings/song_book_settings.dart';
import '../details/app_settings.dart';
import '../details/app_settings_resp.dart';
import '_api.dart';


class PostReqMapArgs{

  final bool? dumpReplaceExisting;
  final List<SyncableParam> allSyncables;
  final List<String> removeSyncItems;
  final Map<String, dynamic> shaPrefMap;
  final SendPort sendPort;

  const PostReqMapArgs(
    this.dumpReplaceExisting,
    this.allSyncables,
    this.removeSyncItems,
    this.shaPrefMap,
    this.sendPort,
  );

}


class ApiSync{

  static const String url = 'api/sync/';

  static Future<Map<String, dynamic>> buildPostReqMap(PostReqMapArgs args) async {

    ShaPref.setCustomMethods(
        customGetBoolOrNull: (String key) => args.shaPrefMap[key],
        customSetBool: (String key, bool value) => args.shaPrefMap[key] = value,
        customGetStringOrNull: (String key) => args.shaPrefMap[key],
        customSetString: (String key, String value) => args.shaPrefMap[key] = value,
        customGetStringListOrNull: (String key) => args.shaPrefMap[key],
        customSetStringList: (String key, List<String> value) {  },
        customGetIntOrNull: (String key) => args.shaPrefMap[key],
        customSetInt: (String key, int value) => args.shaPrefMap[key] = value,
        customGetDoubleOrNull: (String key) => args.shaPrefMap[key],
        customSetDouble: (String key, double value) => args.shaPrefMap[key] = value,
        customGetDateTimeOrNull: (String key) => args.shaPrefMap[key],
        customSetDateTime: (String key, DateTime? value) => args.shaPrefMap[key] = value,
        customExists: (String key) => args.shaPrefMap.containsKey(key),
        customRemove: (String key) => args.shaPrefMap.remove(key),
        customClear: () => args.shaPrefMap.clear()
    );

    // args.sendPort.send(call);

    Map<String, dynamic> reqMap = {};
    if(args.dumpReplaceExisting??false)
      reqMap['dumpReplaceExisting'] = true;

    for(SyncableParam param in args.allSyncables){
      try {
        reqMap[param.paramId] = await param.buildPostReq(
            setSyncStateInProgress: true,
            includeDefaults: args.dumpReplaceExisting ?? false);
      } on NothingToSyncException{
        continue;
      }
    }

    for(String removeSyncItemName in args.removeSyncItems){

      List<String> paramIds = removeSyncItemName.split(RemoveSyncItem.paramSep);
      String currParam;
      Map<dynamic, dynamic> currReqMap = reqMap;
      while(paramIds.isNotEmpty){
        currParam = paramIds.first;
        paramIds.removeAt(0);

        if(currReqMap[currParam] == null)
          currReqMap[currParam] = {};

        currReqMap = currReqMap[currParam];
      }

      currReqMap[RemoveSyncItem.removeReqParam] = true;

    }

    return reqMap;

  }

  static Future<Response?> post(
        {bool? dumpReplaceExisting,
        FutureOr<void> Function(
            Response response,
            bool? orgHandler,
            Map<String, dynamic>? appSettings,
            Map<String, dynamic>? songBookSettings,
            Map<String, dynamic>? offSongs,
            Map<String, dynamic>? ownSongs,
            Map<String, dynamic>? ownAlbums,
            Map<String, dynamic>? toLearnAlbum,
            Map<String, dynamic>? spraws,
            Map<String, dynamic>? rankDefs,
            Map<String, dynamic>? rankZhpSim2022,
            Map<String, dynamic>? trops,

            Map? extraTrops,

            DateTime? syncedTime)? onSuccess,
        FutureOr<void> Function(Response? response)? onError,
      }) async {

    ReceivePort receivePort = ReceivePort();
    receivePort.listen((dynamic message) {
      //do whatever you want to do with message!
    });

    Map<String, dynamic> _reqMap = await compute(
        buildPostReqMap,
        PostReqMapArgs(
            dumpReplaceExisting,
            SyncGetRespNode.all,
            RemoveSyncItem.all!,
            ShaPref.toMap(),
            receivePort.sendPort
        )
    );

    Map<String, dynamic> reqMap = {};
    if(dumpReplaceExisting??false)
      reqMap['dumpReplaceExisting'] = true;

    for(SyncableParam param in SyncGetRespNode.all){
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
      Map<dynamic, dynamic> currReqMap = reqMap;
      while(paramIds.isNotEmpty){
        currParam = paramIds.first;
        paramIds.removeAt(0);

        if(currReqMap[currParam] == null)
          currReqMap[currParam] = {};

        currReqMap = currReqMap[currParam];
      }

      currReqMap[RemoveSyncItem.removeReqParam] = true;

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
        Map<String, dynamic>? ownAlbums = response.data[OwnAlbum.syncClassId];
        Map<String, dynamic>? toLearnAlbum = response.data[ToLearnAlbum.syncClassId];
        Map<String, dynamic>? spraws = response.data[Spraw.syncClassId];
        Map<String, dynamic>? rankDefs = response.data[RankDef.syncClassId];
        Map<String, dynamic>? rankZhpSim2022 = response.data[RankZHPSim2022.syncClassId];
        Map<String, dynamic>? trops = response.data[Trop.syncClassId];

        Map<String, dynamic>? extraTrops;
        if((response.data as Map).containsKey("extra"))
          extraTrops = response.data["extra"][Trop.syncClassId];

        DateTime? syncedTime = DateTime.tryParse(response.data['time']);

        logger.i('Sync post response:\n${prettyJson(response.data)}');

        await onSuccess?.call(
          response,
          orgHandler,
          appSettings,
          songBookSettings,
          offSongs,
          ownSongs,
          ownAlbums,
          toLearnAlbum,
          spraws,
          rankDefs,
          rankZhpSim2022,
          trops,

          extraTrops,

          syncedTime,
        );
      },
      onError: (err) async => await onError?.call(err.response)
    );
  }

  static Future<Response?> postAndSave({
    bool? dumpReplaceExisting,
    FutureOr<void> Function()? onSuccess,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await post(
      dumpReplaceExisting: dumpReplaceExisting,
      onSuccess: (
          Response response, 
          dynamic orgHandler, 
          Map? appSettings,
          Map? songBookSettings,
          Map? offSongs,
          Map? ownSongs, 
          Map? ownAlbums,
          Map? toLearnAlbum, 
          Map? spraws, 
          Map? rankDefs,
          Map? rankZhpSim2022, 
          Map? trops,

          Map? extraTrops,

          DateTime? syncedTime
      ) async {

        DateTime? syncedTime = DateTime.tryParse(response.data['time']);

        if(orgHandler != null)
          OrgHandler().saveSyncResult(orgHandler, syncedTime);

        if(appSettings != null)
          AppSettings().saveSyncResult(appSettings, syncedTime);

        if(songBookSettings != null)
          SongBookSettings().saveSyncResult(songBookSettings, syncedTime);

        if(offSongs != null)
          for(String lclId in offSongs.keys as Iterable<String>)
            OffSong.allOfficialMap[lclId]!.saveSyncResult(offSongs[lclId], syncedTime);

        if(ownSongs != null)
          for(String lclId in ownSongs.keys as Iterable<String>){
            if(ownSongs[lclId] == RemoveSyncItem.removedRespCode) RemoveSyncItem.resolve('${OwnSong.syncClassId}${RemoveSyncItem.paramSep}$lclId');
            else OwnSong.allOwnMap[lclId]!.saveSyncResult(ownSongs[lclId], syncedTime);
          }

        if(ownAlbums != null)
          for(String lclId in ownAlbums.keys as Iterable<String>){
            if(ownAlbums[lclId] == RemoveSyncItem.removedRespCode) RemoveSyncItem.resolve('${OwnAlbum.syncClassId}${RemoveSyncItem.paramSep}$lclId');
            else OwnAlbum.allMap[lclId]!.saveSyncResult(ownAlbums[lclId], syncedTime);
          }

        if(toLearnAlbum != null)
          ToLearnAlbum.loaded.saveSyncResult(toLearnAlbum, syncedTime);

        if(spraws != null)
          for(String uniqName in spraws.keys as Iterable<String>)
            Spraw.allMap[uniqName]!.saveSyncResult(spraws[uniqName], syncedTime);

        if(rankDefs != null)
          for(String uniqName in rankDefs.keys)
            Rank.allMap[uniqName]!.saveSyncResult(rankDefs[uniqName], syncedTime);

        if(rankZhpSim2022 != null)
          for(String uniqName in rankZhpSim2022.keys)
            Rank.allMap[uniqName]!.saveSyncResult(rankZhpSim2022[uniqName], syncedTime);
        
        if(trops != null)
          for(String uniqName in trops.keys)
            Trop.allOwnMapByLclId[uniqName]!.saveSyncResult(trops[uniqName], syncedTime);

        if(extraTrops != null)
          Trop.handleExtrasAfterSync(extraTrops);

        SynchronizerEngine.lastSyncTimeLocal = syncedTime;

        await onSuccess?.call();
      },
      onError: onError
  );
  
  static Future<Response?> get({
    FutureOr<void> Function(
        Response response,
        OrgEntityResp? orgResp,
        AppSettingsResp? appSettingsResp,
        SongBookSettingsResp? songBookSettingsResp,
        Map<String, OffSongGetResp> offSongs,
        Map<String, OwnSongGetResp> ownSongs,
        Map<String, OwnAlbumGetResp> albums,
        ToLearnAlbumGetResp? toLearnAlbum,
        Map<String, SprawGetResp> spraws,
        Map<String, RankDefGetResp> rankDefs,
        Map<String, RankZhpSim2022GetResp> rankZhpSim2022,
        Map<String, TropGetResp> trops,
        DateTime? syncedTime
    )? onSuccess,
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
                logger.e('OffSong from response creation error: ${e.toString()}');
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
                logger.e('OwnSong from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? albums = response.data[OwnAlbumGetResp.collName];
          Map<String, OwnAlbumGetResp> albumResps = {};
          if(albums != null)
            for(String lclId in albums.keys){
              Map<String, dynamic> response = albums[lclId];
              try {
                albumResps[lclId] = OwnAlbumGetResp.from(response);
              } catch (e){
                logger.e('OwnAlbum from response creation error: ${e.toString()}');
              }
            }

          Map<String, dynamic>? toLearnAlbum = response.data[ToLearnAlbumGetResp.collName];
          ToLearnAlbumGetResp? toLearnAlbumResp;
          if(toLearnAlbum != null){
            try {
              toLearnAlbumResp = ToLearnAlbumGetResp.from(toLearnAlbum);
            } catch (e){
              logger.e('ToLearnAlbum from response creation error: ${e.toString()}');
            }
          }

          Map<String, dynamic>? spraws = response.data[SprawGetResp.collName];
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

          Map<String, dynamic>? trops = response.data[TropGetResp.collName];
          Map<String, TropGetResp> tropResps = {};
          if(trops != null)
            for(String uniqName in trops.keys){
              Map<String, dynamic> response = trops[uniqName];
              try {
                tropResps[uniqName] = TropGetResp.fromRespMap(response);
              } catch (e){
                logger.e('Trop from response creation error: ${e.toString()}');
              }
            }

          DateTime? syncedTime;
          if(response.data['time'] != null) {
            syncedTime = DateTime.tryParse(response.data['time']);
            SynchronizerEngine.lastSyncTimeLocal = syncedTime;
          }

          logger.i('Sync get response received:'
              '\n\nOrgData:'
              '\n${prettyJson(orgData)}'
              '\n\nAppSettings:'
              '\n${prettyJson(appSettingsData)}'
              '\n\nSongBookSettings:'
              '\n${prettyJson(songBookSettingsData)}'
              '\n\nOffSongs:'
              '\n${prettyJson(offSongs)}'
              '\n\nOwnSongs:'
              '\n${prettyJson(ownSongs)}'
              '\n\nOwnAlbums:'
              '\n${prettyJson(albums)}'
              '\n\nToLearnAlbum:'
              '\n${prettyJson(toLearnAlbum)}'
              '\n\nSpraws:'
              '\n${prettyJson(spraws)}'
              '\n\nRankDefs:'
              '\n${prettyJson(rankDefs)}'
              '\n\nRankZhpSim2022:'
              '\n${prettyJson(rankZhpSim2022)}'
              '\n\nTrop:'
              '\n${prettyJson(trops)}'

          );

          await onSuccess?.call(
              response,
              orgResp,
              appSettingsResp,
              songBookSettingsResp,
              offSongResps,
              ownSongResps,
              albumResps,
              toLearnAlbumResp,
              sprawResps,
              rankDefResps,
              rankZhpSim2022Resps,
              tropResps,
              syncedTime
          );
        },
        onError: (err) async => await onError?.call(err.response)
    );
  }

  static Future<Response?> getAndSave({
    FutureOr<void> Function()? onSuccess,
    FutureOr<void> Function()? onError,
  }) async => await get(
      onSuccess: (
          Response response,
          OrgEntityResp? orgResp,
          AppSettingsResp? appSettingsResp,
          SongBookSettingsResp? songBookSettingsResp,
          Map<String, OffSongGetResp> offSongs,
          Map<String, OwnSongGetResp> ownSongs,
          Map<String, OwnAlbumGetResp> albums,
          ToLearnAlbumGetResp? toLearnAlbum,
          Map<String, SprawGetResp> spraws,
          Map<String, RankDefGetResp> rankDefs,
          Map<String, RankZhpSim2022GetResp> rankZhpSim2022,
          Map<String, TropGetResp> trops,
          DateTime? syncedTime
      ) async {

        if(orgResp != null)
          OrgHandler().applySyncGetResp(orgResp);

        if(appSettingsResp != null)
          AppSettings().applySyncGetResp(appSettingsResp);

        if(songBookSettingsResp != null)
          SongBookSettings().applySyncGetResp(songBookSettingsResp);

        for(String lclId in offSongs.keys){
          OffSong? song = OffSong.allOfficialMap[lclId];
          if(song == null) continue;
          OffSongGetResp songResp = offSongs[lclId]!;
          song.applySyncGetResp(songResp);
        }

        for(String lclId in ownSongs.keys){
          OwnSongGetResp songResp = ownSongs[lclId]!;
          OwnSong? song = OwnSong.allOwnMap[lclId];
          if(song == null) {
            song = await OwnSong.create(lclId: lclId, code: songResp.code);
            if (song == null) continue;
            await song.save(localOnly: true, synced: true);
            OwnSong.addToAll(song, sort: false);
          }
          await song.applySyncGetResp(songResp);
        }

        if(ownSongs.isNotEmpty)
          // Sort alphabetically
          OwnSong.sortSongs();

        for(String lclId in albums.keys){
          OwnAlbumGetResp albumResp = albums[lclId]!;
          OwnAlbum? album = OwnAlbum.allMap[lclId];
          if(album == null) {

            List<OffSong> offSongs = [];
            for(String offSongLclId in albumResp.offSongs){
              OffSong? song = OffSong.allOfficialMap[offSongLclId];
              if(song != null) offSongs.add(song);
            }

            List<OwnSong> ownSongs = [];
            for(String ownSongLclId in albumResp.ownSongs){
              OwnSong? song = OwnSong.allOwnMap[ownSongLclId];
              if(song != null) ownSongs.add(song);
            }

            album = OwnAlbum.create(
                lclId: lclId,
                title: albumResp.title,
                offSongs: offSongs,
                ownSongs: ownSongs,
                colorsKey: albumResp.colorsKey,
                iconKey: albumResp.iconKey,
            );
            album.save(localOnly: true, synced: true);
            OwnAlbum.addToAll(album);
          }
          album.applySyncGetResp(albumResp);
        }

        if(toLearnAlbum != null)
          ToLearnAlbum.loaded.applySyncGetResp(toLearnAlbum);

        for(String sprawUniqName in spraws.keys){
          Spraw spraw = Spraw.allMap[sprawUniqName]!;
          SprawGetResp sprawResp = spraws[sprawUniqName]!;
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

        for(String tropUniqName in trops.keys){
          Trop? trop = Trop.allOwnMapByLclId[tropUniqName];
          TropGetResp? tropResp = trops[tropUniqName]!;
          if(trop == null){

            trop = Trop.createOwn(
                uniqName: tropUniqName,
                name: tropResp.name,
                customIconTropName: tropResp.customIconTropName,
                category: tropResp.category,
                aims: tropResp.aims,
                startDate: tropResp.startDate,
                endDate: tropResp.endDate,
                completed: tropResp.completed,
                completionTime: tropResp.completionDate,
                tasks: [],
                lastUpdateTime: tropResp.lastUpdateTime
            );

            List<TropTask> tasks = [];
            for(String taskLclId in tropResp.tasks.keys){
              TropTaskGetResp taskBody = tropResp.tasks[taskLclId]!;
              tasks.add(TropTask(
                lclId: taskLclId,
                content: taskBody.content,
                summary: taskBody.summary,
                deadline: taskBody.deadline,
                assignee: tropResp.assignedUsers[taskBody.assigneeKey],
                assigneeCustomText: taskBody.assigneeCustomText,
                completed: taskBody.completed,
                trop: trop,
              ));
            }

            trop.tasks = tasks;

            trop.saveOwn(localOnly: true, synced: true);
            Trop.addOwnToAll(trop);
          }else{
            trop.applySyncGetResp(tropResp);
          }
        }

        await onSuccess?.call();

      },
      onError: (err) => onError?.call()
  );

  static Future<Response?> lastSync({
    FutureOr<void> Function(DateTime?)? onSuccess,
    FutureOr<void> Function(Response?)? onError
  }) async => await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => await dio.get('${API.SERVER_URL}${url}last_sync'),
        onSuccess: (Response response, DateTime now) async {
          DateTime? lastSync = DateTime.tryParse(response.data);
          await onSuccess?.call(lastSync);
        },
        onError: (err) async => await onError?.call(err.response)
    );

}
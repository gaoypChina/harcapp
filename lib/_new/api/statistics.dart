import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/account/statistics.dart';
import 'package:harcapp/logger.dart';
import 'package:pretty_json/pretty_json.dart';

import '_api.dart';

enum StatRespState{
  tooEarly, alreadyExisted, saved
}

class StatRespItem{

  static final Map<String, StatRespState> stateMap = {
    'too_early': StatRespState.tooEarly,
    'already_existed': StatRespState.alreadyExisted,
    'saved': StatRespState.saved
  };

  final String uniqId;
  final String time;
  final StatRespState? state;

  StatRespItem(this.uniqId, this.time, String? stateStr): state = StatRespItem.stateMap[stateStr!];

}

class ApiStatistics{

  static Future<Response?> postObservations({
    Function(List<StatRespItem> modules, List<StatRespItem> songs)? onSuccess,
    Function()? onError,
    bool abortIfNothingToSend = true
  }) async {

    Map<String?, Map<String, dynamic>> songRequests = Statistics.songStats;
    Map<String?, Map<String, dynamic>> moduleRequests = Statistics.moduleStats;

    if(abortIfNothingToSend && songRequests.isEmpty && moduleRequests.isEmpty) return null;

    Map body = {};

    if(songRequests.isNotEmpty)
      body['song'] = songRequests;

    if(moduleRequests.isNotEmpty)
      body['module'] = moduleRequests;

    logger.i('Statistics post request:\n${prettyJson(body)}');

    return await API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) async => dio.post(
            '${API.SERVER_URL}api/statistics/observation',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          Map/*<String, Map<String, Map<String, String>>>*/ respData = (response.data as Map);

          Map/*<String, Map<String, String>>*/ modulesResp = respData['module'];
          List<StatRespItem> modules = [];

          for(String moduleUniqId in modulesResp.keys as Iterable<String>) {
            Map/*<String, String>*/ timesResp = modulesResp[moduleUniqId];
            for(String timeStr in timesResp.keys as Iterable<String>){
              StatRespItem respItem = StatRespItem(moduleUniqId, timeStr, timesResp[timeStr]);
              modules.add(respItem);
            }
          }

          Map/*<String, Map<String, String>>*/ songsResp = respData['song'];
          List<StatRespItem> songs = [];
          for(String songId in songsResp.keys as Iterable<String>) {
            Map/*<String, String>*/ timesResp = songsResp[songId];
            for(String timeStr in timesResp.keys as Iterable<String>){
              StatRespItem respItem = StatRespItem(songId, timeStr, timesResp[timeStr]);
              songs.add(respItem);
            }
          }

          logger.i('Statistics post response:\n${prettyJson(respData)}');

          onSuccess(modules, songs);
        }
    );

  }

}
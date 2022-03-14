import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/account/statistics.dart';
import 'package:harcapp/logger.dart';
import 'package:pretty_json/pretty_json.dart';

import '_api.dart';

class ApiStatistics{

  static Future<Response> postObservations({
    Function(
        List<String> modulesTooEarly, List<String> modulesAlreadyExisted, List<String> modulesSaved,
        List<String> songsTooEarly, List<String> songsAlreadyExisted, List<String> songsSaved
    ) onSuccess,
    Function() onError,
    bool abortIfNothingToSend = true
  }) async {

    Map<String, Map<String, dynamic>> songRequests = Statistics.songStats;
    Map<String, Map<String, dynamic>> moduleRequests = Statistics.moduleStats;

    if(abortIfNothingToSend && songRequests.isEmpty) return null;
    logger.i('Statistics post request:\n${prettyJson(songRequests)}');

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
            API.SERVER_URL + 'api/statistics/observation',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode({
              'song': songRequests,
              'module': moduleRequests,
            })
        ),
        onSuccess: (response) async {
          if(onSuccess == null) return;

          List<String> modulesTooEarly = [];
          List<String> modulesAlreadyExisted = [];
          List<String> modulesSaved = [];

          List<String> songsTooEarly = [];
          List<String> songsAlreadyExisted = [];
          List<String> songsSaved = [];

          Map<String, Map<String, String>> respData = (response.data as Map).cast<String, Map<String, String>>();

          for(String timeStr in respData["modules"].keys) {
            String state = respData["modules"][timeStr];
            if(state == 'too_early') modulesTooEarly.add(timeStr);
            else if (state == 'already_existed') modulesAlreadyExisted.add(timeStr);
            else if (state == 'saved') modulesSaved.add(timeStr);
          }

          for(String timeStr in respData["songs"].keys) {
            String state = respData["songs"][timeStr];
            if(state == 'too_early') songsTooEarly.add(timeStr);
            else if (state == 'already_existed') songsAlreadyExisted.add(timeStr);
            else if (state == 'saved') songsSaved.add(timeStr);
          }

          logger.i('Statistics post response:\n${prettyJson(respData)}');

          onSuccess(modulesTooEarly, modulesAlreadyExisted, modulesSaved, songsTooEarly, songsAlreadyExisted, songsSaved);
        }
    );

  }

}
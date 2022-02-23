import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/account/statistics.dart';
import 'package:harcapp/logger.dart';
import 'package:pretty_json/pretty_json.dart';

import '_api.dart';

class ApiStatistics{

  static Future<Response> postObservations({
    Function(List<String> tooEarly, List<String> alreadyExisted, List<String> saved) onSuccess,
    Function() onError,
    bool abortIfNothingToSend = true
  }) async {

    Map<String, Map<String, int>> standardSongSearch = Statistics.standardSongSearch;

    Map data = {};
    for(String timeIntrvlStr in standardSongSearch.keys){

      DateTime time = DateTime.tryParse(timeIntrvlStr.split(Statistics.syncPeriodSep)[0]);

      if(time == null || time.difference(DateTime.now()).abs().compareTo(Statistics.syncInterval) <= 0)
        continue;

      Map intervalData = {};

      Map<String, int> songSearches = standardSongSearch[timeIntrvlStr];

      for(String songLclId in songSearches.keys)
        intervalData[songLclId] = {
          "searchOpens": songSearches[songLclId]
        };

      data[timeIntrvlStr] = intervalData;
    }

    if(abortIfNothingToSend && data.isEmpty) return null;
    logger.i('Statistics post request:\n${prettyJson(data)}');

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
            API.SERVER_URL + 'api/statistics/observation',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(data)
        ),
        onSuccess: (response) async {
          if(onSuccess == null) return;

          List<String> tooEarly = [];
          List<String> alreadyExisted = [];
          List<String> saved = [];

          Map<String, String> respData = (response.data as Map).cast<String, String>();
          for(String timeStr in respData.keys) {
            String state = respData[timeStr];
            if(state == 'too_early') tooEarly.add(timeStr);
            else if (state == 'already_existed') alreadyExisted.add(timeStr);
            else if (state == 'saved') saved.add(timeStr);
          }

          logger.i('Statistics post response:\n${prettyJson(respData)}');

          onSuccess(tooEarly, alreadyExisted, saved);
        }
    );

  }

}
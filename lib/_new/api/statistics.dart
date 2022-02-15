import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/account/statistics.dart';

import '_api.dart';

class ApiStatistics{

  static Future<Response> postObservations({
    Function() onSuccess,
    Function() onError,
  }) async {

    Map data = {};
    for(String time in Statistics.standardSongSearch.keys){
      Map intervalData = {};
      for(String songLoclId in Statistics.standardSongSearch[time].keys)
        intervalData[songLoclId] = {
          "searchOpens": Statistics.standardSongSearch[time][songLoclId]
        };

      data['$time@1h'] = intervalData;
    }

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
            API.SERVER_URL + 'api/statistics/observation',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode(data)
        ),
        onSuccess: (response) async => onSuccess==null?null:onSuccess()
    );

  }

}
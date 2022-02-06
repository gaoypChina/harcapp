import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '_api.dart';

class ApiStatistics{

  static Future<Response> create({
    String title,
    Color color,
    @required List<String> othParticipantIds,
    Function(String id) onSuccess}) async{

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
            API.SERVER_URL + 'api/statistics/post',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode({
              /* CREATE_TITLE: title,
              CREATE_COLOR: color,
              CREATE_OTH_PARTICIPANTS_IDS: othParticipantIds */
            })
        ),
        onSuccess: (response) async => onSuccess==null?null:onSuccess(response.data['id'])
    );

  }

}
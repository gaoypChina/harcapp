
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '_api.dart';

class API_CONVERS{

  static Future<Response> getAll() async => await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.get(
            API.SERVER_URL + 'api/conversations/all',
        ),
    );


  static const String CREATE_TITLE = 'title';
  static const String CREATE_COLOR = 'color';
  static const String CREATE_OTH_PARTICIPANTS_IDS = 'oth_participant_ids';
  static Future<Response> create({
    String title,
    Color color,
    @required List<String> othParticipantIds,
    Function(String id) onSuccess}) async{

    return await API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) async => dio.post(
            API.SERVER_URL + 'api/conversations/create',
            options: Options(headers: {
              HttpHeaders.contentTypeHeader: 'application/json',
            }),
            data: jsonEncode({
              CREATE_TITLE: title,
              CREATE_COLOR: color,
              CREATE_OTH_PARTICIPANTS_IDS: othParticipantIds
            })
        ),
        onSuccess: (response) async => onSuccess==null?null:onSuccess(response.data['id'])
    );

  }


  static const String POST_CONV_ID = 'conv_id';
  static const String POST_TEXT = 'text';
  static Future<Response> post({@required String convId, @required String text}) async => await API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) async => dio.post(
          API.SERVER_URL + 'api/conversations/post',
          data: FormData.fromMap({
            POST_CONV_ID: convId,
            POST_TEXT: text
          })
      ),
  );


  static const String GET_ALL_CONV_ID = 'conv_id';
  static Future<Response> allMessages({@required String convId}) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) async => dio.get(
        API.SERVER_URL + 'api/conversations/all_messages',
        queryParameters: {
          GET_ALL_CONV_ID: convId,
        }
    ),
  );

}
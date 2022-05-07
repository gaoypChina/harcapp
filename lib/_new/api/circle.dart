import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


import '../cat_page_home/circles/model/circle.dart';
import '_api.dart';


class ApiCircle{

  static Future<Response> getAll({
    void Function(List<Circle>) onSuccess,
    Future<bool> Function() notAuthorized,
    void Function(Response response) onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/circle',
    ),
    onSuccess: (Response response) async {
      List<Circle> circleList = [];
      for(Map map in response.data)
        circleList.add(Circle.fromResponse(map));

      onSuccess?.call(circleList);
    },
    onError: (err) async => await onError?.call(err.response)
  );

  static Future<Response> get({
    @required String circleKey,
    void Function(Circle circle) onSuccess,
    void Function() onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/circle/$circleKey',
    ),
    onSuccess: (Response response) async {
      Circle circle = Circle.fromResponse(response.data);
      onSuccess?.call(circle);
    },
    onError: (_) async => await onError(),
  );

  static Future<Response> create({
    @required String name,
    String description,
    @required String coverImageUrl,
    @required String colorsKey,

    void Function(Circle circle) onSuccess,
    void Function() onError,
  }) async {

    Map<String, dynamic> reqMap = {};
    reqMap['name'] = name;
    reqMap['description'] = description;
    reqMap['cover_image_url'] = coverImageUrl;
    reqMap['colors_key'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
          API.SERVER_URL + 'api/circle',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response) async{
        Circle circle = Circle.fromResponse(response.data);
        await onSuccess?.call(circle);
      },
      onError: (_) async => await onError?.call()
    );

  }

  static Future<Response> delete({
    @required String circleKey,
    void Function() onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        API.SERVER_URL + 'api/circle/$circleKey'
      ),
      onSuccess: (Response response) async => await onSuccess?.call(),
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response> resetShareCode({
    @required String compKey,
    void Function(String) onSuccess,
    void Function(Map) onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/circle/$compKey/shareCode',
      ),
      onSuccess: (Response response) async => await onSuccess?.call(response.data),
      onError: (DioError err) async => await onError?.call(err.response.data)
  );

  static Future<Response> setShareCodeSearchable({
    @required String compKey,
    @required bool searchable,
    void Function(bool) onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
        API.SERVER_URL + 'api/circle/$compKey/shareCodeSearchable',
        data: FormData.fromMap({'searchable': searchable}),
      ),
      onSuccess: (Response response) async => await onSuccess?.call(response.data['shareCodeSearchable']),
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response> joinByShareCode({
    @required String searchCode,
    void Function(Circle) onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/circle/joinByShareCode/$searchCode',
      ),
      onSuccess: (Response response) async {
        Circle comp = Circle.fromResponse(response.data);
        onSuccess?.call(comp);
      },
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response> update({
    @required String key,
    String name,
    String description,
    String coverImageUrl,
    String colorsKey,
    void Function(Circle circle) onSuccess,
    void Function() onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(name != null) reqMap['name'] = name;
    if(description != null) reqMap['description'] = description;
    if(coverImageUrl != null) reqMap['cover_image_url'] = coverImageUrl;
    if(colorsKey != null) reqMap['colors_key'] = colorsKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        API.SERVER_URL + 'api/circle/$key',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response) async {
        if(onSuccess==null) return;
        Circle circle = Circle.fromResponse(response.data);
        onSuccess(circle);
      },
      onError: (_) async => await onError?.call()
    );

  }

  /*
  static Future<Response> addUsers({
    @required String id,
    @required List<ParticipBodyNick> users,
    void Function(List<IndivCompParticip>) onSuccess,
    void Function() onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(ParticipBodyNick user in users)
      body.add({
        'userNick': user.nick,
        'role': compRoleToStr[user.role],
        'active': user.active
      });

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
          API.SERVER_URL + 'api/circle/$id/user',
          data: jsonEncode(body)
      ),
      onSuccess: (Response response) async {
        if(onSuccess == null) return;

        List<IndivCompParticip> particips = [];
        Map _participsRespMap = response.data;
        for(MapEntry participEntry in _participsRespMap.entries)
          particips.add(IndivCompParticip.fromMap(participEntry.key, participEntry.value));

        onSuccess(particips);
      },
      onError: (err) async => await onError?.call()
    );

  }

  static Future<Response> updateUsers({
    @required String compId,
    @required List<ParticipBody> users,
    void Function(List<IndivCompParticip>) onSuccess,
    void Function() onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(ParticipBody user in users)
      body.add({
        'userKey': user.key,
        'role': compRoleToStr[user.role],
        'active': user.active
      });

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.post(
            API.SERVER_URL + 'api/circle/$compId/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response) async {
          if(onSuccess == null) return;

          List<IndivCompParticip> particips = [];
          Map _participsRespMap = response.data;
          for(MapEntry participEntry in _participsRespMap.entries)
            particips.add(IndivCompParticip.fromMap(participEntry.key, participEntry.value));

          onSuccess(particips);
        },
        onError: (err) async => await onError?.call()
    );

  }

  static Future<Response> removeUsers({
    @required String compId,
    @required List<String> userIds,
    void Function(List<String> removedKeys) onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          API.SERVER_URL + 'api/circle/$compId/user',
          data: jsonEncode(userIds)
      ),
      onSuccess: (Response response) async {
        onSuccess?.call((response.data as List).cast<String>());
      },
      onError: (err) async => await onError?.call()
  );

  static Future<Response> leave({
    @required String compKey,
    void Function() onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        API.SERVER_URL + 'api/circle/$compKey/leave',
      ),
      onSuccess: (Response response) async {
        onSuccess?.call();
      },
      onError: (err) async => await onError?.call()
  );
*/
}
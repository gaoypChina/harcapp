import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendace.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp_mode.dart';
import 'package:harcapp/_new/cat_page_home/community/community_role.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community_manager.dart';
import 'package:optional/optional_internal.dart';

import '../cat_page_home/community/model/community.dart';
import '_api.dart';

class ManagerRespBody{

  final String key;
  final CommunityRole role;
  final String? patrol;

  const ManagerRespBody(this.key, this.role, this.patrol);

}

class ManagerUpdateBody{

  final String key;
  final Optional<CommunityRole> role;
  final Optional<String?> patrol;

  const ManagerUpdateBody(
      this.key,
      { this.role = const Optional.empty(),
        this.patrol = const Optional.empty()
      });

}

class ManagerRespBodyNick extends ManagerRespBody{

  final String nick;

  const ManagerRespBodyNick(super.key, super.role, super.patrol, this.nick);

}

class ApiCommunity{

  static Future<Response?> getAll({
    FutureOr<void> Function(List<Community>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/community',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<Community> communityList = [];
      for(Map map in response.data)
        communityList.add(Community.fromResponse(map));

      onSuccess?.call(communityList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> get({
    required String communityKey,
    FutureOr<void> Function(Community circle)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(int?)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/community/$communityKey',
    ),
    onSuccess: (Response response, DateTime now) async {
      Community community = Community.fromResponse(response.data);
      onSuccess?.call(community);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (error) async => onError?.call(error.response?.statusCode),
  );

  static Future<Response?> create({
    required String name,
    required String iconKey,

    FutureOr<void> Function(Community community)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    Map<String, dynamic> reqMap = {};
    reqMap['name'] = name.trim();
    reqMap['iconKey'] = iconKey;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/community',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async{
        Community community = Community.fromResponse(response.data);
        onSuccess?.call(community);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
    );

  }

  static Future<Response?> delete({
    required String communityKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/community/$communityKey'
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => onError?.call()
  );

  static Future<Response?> update({
    required String circleKey,
    Optional<String> name = const Optional.empty(),
    Optional<String> iconKey = const Optional.empty(),

    FutureOr<void> Function(Community community)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    Map<String, dynamic> reqMap = {};
    if(name.isPresent) reqMap['name'] = name.value.trim();
    if(iconKey.isPresent) reqMap['iconKey'] = iconKey.value;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/community/$circleKey',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess==null) return;
        Community community = Community.fromResponse(response.data);
        onSuccess(community);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => onError?.call()
    );

  }
  
  static Future<Response?> addManagers({
    required String communityKey,
    required List<ManagerRespBodyNick> users,
    FutureOr<void> Function(List<CommunityManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(ManagerRespBodyNick user in users)
      body.add({
        'userNick': user.nick,
        'role': communityRoleToStr[user.role],
      });

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/community/$communityKey/user',
          data: jsonEncode(body)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<CommunityManager> managers = [];
        Map membersRespMap = response.data;
        for(MapEntry memEntry in membersRespMap.entries)
          managers.add(CommunityManager.fromMap(memEntry.value, key: memEntry.key));

        onSuccess(managers);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateManagers({
    required String communityKey,
    required List<ManagerUpdateBody> users,
    FutureOr<void> Function(List<CommunityManager>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(ManagerUpdateBody managerBody in users)
      body.add({
        'userKey': managerBody.key,
        if(managerBody.role.isPresent) 'role': communityRoleToStr[managerBody.role.value],
        if(managerBody.patrol.isPresent) 'patrol': managerBody.patrol.value
      });

    return API.sendRequest(
        withToken: true,
        sendRequest: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/community/$communityKey/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<CommunityManager> managers = [];
          Map managersRespMap = response.data;
          for(MapEntry managerEntry in managersRespMap.entries)
            managers.add(CommunityManager.fromMap(managerEntry.value, key: managerEntry.key));

          onSuccess(managers);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeUsers({
    required String communityKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/community/$communityKey/user',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) =>
          onSuccess?.call((response.data as List).cast<String>()),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> leave({
    required String communityKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/community/$communityKey/leave',
      ),
      onSuccess: (Response response, DateTime now) async => onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

}
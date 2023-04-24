import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';
import 'package:optional/optional_internal.dart';

import '../cat_page_guidebook_development/development/tropy/model/trop_user.dart';
import '_api.dart';

class TropUserBody{

  final String key;
  final TropRole role;

  const TropUserBody(this.key, this.role);

}

class TropUserUpdateBody{

  final String key;
  final Optional<TropRole> role;

  const TropUserUpdateBody(
      this.key,
      { this.role = const Optional.empty(),
      });

}

class TropUserBodyNick extends TropUserBody{

  final String nick;

  const TropUserBodyNick(super.key, super.role, this.nick);

}

class ApiTrop{

  static Future<Response?> getUsers({
    required String tropUniqName,
    required int? pageSize,
    required TropRole? lastRole,
    required String? lastUserName,
    required String? lastUserKey,
    FutureOr<void> Function(List<TropUser>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/trop/$tropUniqName/user',
          queryParameters: {
            if(pageSize != null) 'pageSize': pageSize,
            if(lastRole != null) 'lastRole': tropRoleToStr[lastRole],
            if(lastUserName != null) 'lastUserName': lastUserName,
            if(lastUserKey != null) 'lastUserKey': lastUserKey,
          }
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<TropUser> users = [];
        Map usersRespMap = response.data;
        for(MapEntry userEntry in usersRespMap.entries)
          users.add(TropUser.fromRespMap(userEntry.value, key: userEntry.key));

        onSuccess(users);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> addUsers({
    required String tropUniqName,
    required List<TropUserBodyNick> users,
    FutureOr<void> Function(List<TropUser>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(TropUserBodyNick userBody in users)
      body.add({
        'userNick': userBody.nick,
        'role': tropRoleToStr[userBody.role],
      });

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.post(
            '${API.SERVER_URL}api/trop/$tropUniqName/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<TropUser> users = [];
          Map membersRespMap = response.data;
          for(MapEntry memEntry in membersRespMap.entries)
            users.add(TropUser.fromRespMap(memEntry.value, key: memEntry.key));

          onSuccess(users);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateUsers({
    required String tropUniqName,
    required List<TropUserUpdateBody> users,
    FutureOr<void> Function(List<TropUser>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> body = [];
    for(TropUserUpdateBody userBody in users)
      body.add({
        'userKey': userBody.key,
        if(userBody.role.isPresent) 'role': tropRoleToStr[userBody.role.value],
      });

    return API.sendRequest(
        withToken: true,
        requestSender: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/trop/$tropUniqName/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<TropUser> users = [];
          Map usersRespMap = response.data;
          for(MapEntry managerEntry in usersRespMap.entries)
            users.add(TropUser.fromRespMap(managerEntry.value, key: managerEntry.key));

          onSuccess(users);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeUsers({
    required String tropUniqName,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/trop/$tropUniqName/user',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) async =>
      await onSuccess?.call((response.data as List).cast<String>()),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

  static Future<Response?> getAllSharedPreviews(
      { FutureOr<void> Function()? onError,
        FutureOr<void> Function(List<TropPreviewData>)? onSuccess,
      }) async => await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/trop/shared',
      ),
      onSuccess: (Response response, DateTime now) async {

        List<TropPreviewData> sharedTropPreviewDataList = [];

        Map<String, dynamic> rawData = response.data;
        for(String tropUniqName in rawData.keys)
          sharedTropPreviewDataList.add(
              TropPreviewData.fromRespMap(rawData[tropUniqName], tropUniqName)
          );

        await onSuccess?.call(sharedTropPreviewDataList);
      },
      onError: (DioError error) async => onError?.call()
  );

  static Future<Response?> getShared({
    required String tropUniqName,
    required DateTime lastUpdateTime,
    FutureOr<void> Function(Trop trop)? onSuccess,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.get(
      '${API.SERVER_URL}api/trop/shared/$tropUniqName',
    ),
    onSuccess: (Response response, DateTime now) async {

      Map<String, dynamic> tropRawData = response.data;

      try {
        Trop trop = Trop.fromRespMap(tropRawData, tropUniqName);
        await onSuccess?.call(trop);
      } catch(e) {
        await onError?.call(response);
      }

    },
    onError: (err) async => onError?.call(err.response),
  );

}
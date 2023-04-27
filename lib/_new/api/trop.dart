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

  static Future<Response?> getSharedTropPreviews({
    required int? pageSize,
    required String? lastStartTime,
    required String? lastName,
    required String? lastTropUniqName,
    FutureOr<void> Function(List<TropPreviewData>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/trop/shared',
          queryParameters: {
            if(pageSize != null) 'pageSize': pageSize,
            if(lastStartTime != null) 'lastStartTime': lastStartTime,
            if(lastName != null) 'lastName': lastName,
            if(lastTropUniqName != null) 'lastTropUniqName': lastTropUniqName,
          }
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<TropPreviewData> trops = [];
        Map tropPreviewsRespMap = response.data;
        for(String tropUniqName in tropPreviewsRespMap.keys)
          trops.add(TropPreviewData.fromRespMap(tropPreviewsRespMap[tropUniqName]!, tropUniqName));

        onSuccess(trops);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

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

  static Future<Response?> getTrop({
    required String tropUniqName,
    FutureOr<void> Function(Trop trop)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.get(
      '${API.SERVER_URL}api/trop/$tropUniqName',
    ),
    onSuccess: (Response response, DateTime now) async {

      Map<String, dynamic> tropRawData = response.data;

      try {
        Trop trop = Trop.fromRespMap(tropRawData, tropUniqName);
        await onSuccess?.call(trop);
      } catch(e) {
        await onError?.call(null);
      }

    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response),
  );

}
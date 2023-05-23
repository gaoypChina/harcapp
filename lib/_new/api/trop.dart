import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/date_format.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:optional/optional_internal.dart';
import 'package:webfeed/util/iterable.dart';

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
    required String? lastTropKey,
    FutureOr<void> Function(List<TropSharedPreviewData>)? onSuccess,
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
            if(lastTropKey != null) 'lastTropKey': lastTropKey,
          }
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<TropSharedPreviewData> trops = [];
        Map tropPreviewsRespMap = response.data;
        for(String tropUniqName in tropPreviewsRespMap.keys)
          trops.add(TropSharedPreviewData.fromRespMap(tropPreviewsRespMap[tropUniqName]!, tropUniqName));

        onSuccess(trops);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> getUsers({
    required String tropKey,
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
          '${API.SERVER_URL}api/trop/$tropKey/user',
          queryParameters: {
            if(pageSize != null) 'pageSize': pageSize,
            if(lastRole != null) 'lastRole': tropRoleToStr[lastRole],
            if(lastUserName != null) 'lastUserName': lastUserName,
            if(lastUserKey != null) 'lastUserKey': lastUserKey,
          }
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<TropUser> usersPage = [];
        Map usersRespMap = response.data;
        for(MapEntry userEntry in usersRespMap.entries)
          usersPage.add(TropUser.fromRespMap(userEntry.value, key: userEntry.key));

        onSuccess(usersPage);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> addUsers({
    required String tropKey,
    required List<TropUserBodyNick> users,
    FutureOr<void> Function(List<TropUser>, DateTime lastSyncTime)? onSuccess,
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
            '${API.SERVER_URL}api/trop/$tropKey/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<TropUser> addedUsers = [];
          Map usersRespMap = response.data;
          for(MapEntry memEntry in usersRespMap.entries)
            addedUsers.add(TropUser.fromRespMap(memEntry.value, key: memEntry.key));

          // on the backend side `now` is set to be same as trop's `lastSyncTime`
          onSuccess(addedUsers, now);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateUsers({
    required String tropKey,
    required List<TropUserUpdateBody> users,
    FutureOr<void> Function(List<TropUser>, DateTime lastSyncTime)? onSuccess,
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
            '${API.SERVER_URL}api/trop/$tropKey/user',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<TropUser> updatedUsers = [];
          Map usersRespMap = response.data;
          for(MapEntry managerEntry in usersRespMap.entries)
            updatedUsers.add(TropUser.fromRespMap(managerEntry.value, key: managerEntry.key));

          // on the backend side `now` is set to be same as trop's `lastSyncTime`
          onSuccess(updatedUsers, now);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeUsers({
    required String tropKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys, DateTime lastSyncTime)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/trop/$tropKey/user',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) async =>
      await onSuccess?.call((response.data as List).cast<String>(), now),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

  static Future<Response?> getTrop({
    required String tropKey,
    FutureOr<void> Function(Trop trop)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.get(
      '${API.SERVER_URL}api/trop/$tropKey',
    ),
    onSuccess: (Response response, DateTime now) async {

      Map<String, dynamic> tropRawData = response.data;

      try {
        Trop trop = Trop.fromRespMap(tropRawData, key: tropKey, isShared: true);
        await onSuccess?.call(trop);
      } catch(e) {
        await onError?.call(null);
      }

    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response),
  );

  static Future<Response?> updateTaskAssignee({
    required Trop trop,
    required String tropTaskLclId,
    required String userNick,
    FutureOr<void> Function(TropUser user, DateTime lastSyncTime)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.put(
      '${API.SERVER_URL}api/trop/${trop.key}/task/$tropTaskLclId/assignee',
      queryParameters: {
        'userNick': userNick
      }
    ),
    onSuccess: (Response response, DateTime now) async {

      Map<String, dynamic> userRawData = response.data;

      try {
        TropUser user = TropUser.fromRespMap(userRawData);
        trop.lastServerUpdateTime = now;
        trop.saveShared();
        // on the backend side `now` is set to be same as trop's `lastSyncTime`
        await onSuccess?.call(user, now);
      } catch(e) {
        await onError?.call(null);
      }

    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response),
  );

  static Future<Response?> updateTaskCompleted({
    required Trop trop,
    required String tropTaskLclId,
    required bool completed,
    FutureOr<void> Function(bool completed, DateTime lastSyncTime)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.put(
        '${API.SERVER_URL}api/trop/${trop.key}/task/$tropTaskLclId/completed',
        queryParameters: {
          'completed': completed
        }
    ),
    onSuccess: (Response response, DateTime now) async {
      bool completed = response.data;
      trop.lastServerUpdateTime = now;
      trop.saveShared();
      // on the backend side `now` is set to be same as trop's `lastSyncTime`
      await onSuccess?.call(completed, now);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response),
  );

  static Future<Response?> updateTaskSummary({
    required Trop trop,
    required String tropTaskLclId,
    required String summary,
    FutureOr<void> Function(String summary, DateTime lastSyncTime)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) async => await dio.put(
        '${API.SERVER_URL}api/trop/${trop.key}/task/$tropTaskLclId/summary',
        queryParameters: {
          'summary': summary
        }
    ),
    onSuccess: (Response response, DateTime now) async {
      String summary = response.data;
      trop.lastServerUpdateTime = now;
      trop.saveShared();
      // on the backend side `now` is set to be same as trop's `lastSyncTime`
      await onSuccess?.call(summary, now);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response),
  );

  static Future<Response?> create({
    required String name,
    required String? customIconTropName,
    required TropCategory category,
    required List<String> aims,
    required DateTime startDate,
    required DateTime endDate,
    required bool? completed,
    required DateTime? completionDate,
    required List<TropTaskData> tasks,

    FutureOr<void> Function(Trop trop)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async {

    Map tasksMap = {};
    for(TropTaskData task in tasks)
      tasksMap[task.lclId] = task.toCreateReqData(withLclId: false);

    await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => await dio.post(
          '${API.SERVER_URL}api/trop',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: {
            'name': name,
            if(customIconTropName != null) 'customIconTropName': customIconTropName,
            'category': tropCategoryToStr(category),
            'aims': aims,
            'startDate': formatDate(startDate),
            'endDate': formatDate(endDate),
            if(completed != null) 'completed': completed,
            if(completionDate != null) 'completionDate': formatDate(completionDate),
            'tasks': tasksMap
          }
      ),
      onSuccess: (Response response, DateTime now) async {

        Map<String, dynamic> tropData = response.data;

        try {
          Trop trop = Trop.fromRespMap(tropData, isShared: true);
          // on the backend side `now` is set to be same as trop's `lastSyncTime`
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

  static Future<Response?> delete({
    required String tropKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/trop/$tropKey'
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response?> update({
    required Trop trop,
    required String? name,
    required Optional<String>? customIconTropName,
    required TropCategory? category,
    required List<String>? aims,
    required DateTime? startDate,
    required DateTime? endDate,
    required bool? completed,
    required Optional<DateTime>? completionDate,
    required List<TropTaskData>? tasks,

    FutureOr<void> Function(Trop trop)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async {

    Map tasksMap = {};
    if(tasks != null) {
      for (TropTaskData task in tasks) {
        TropTask? currentTask = trop.tasks.where((t) => t.lclId == task.lclId).firstOrNull;

        if (currentTask == null) {
          Map taskReqData = task.toCreateReqData(withLclId: false);
          if(taskReqData.isNotEmpty) tasksMap[task.lclId] = taskReqData;
        }else {
          Map taskReqData = task.toUpdateData(currentTask: currentTask, withLclId: false);
          if(taskReqData.isNotEmpty) tasksMap[task.lclId] = taskReqData;
        }
      }

      for (TropTask currentTask in trop.tasks){
        TropTaskData? task = tasks.where((t) => t.lclId == currentTask.lclId).firstOrNull;
        if(task == null) tasksMap[currentTask.lclId] = {RemoveSyncItem.removeReqParam: true};
      }

    }
    await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => await dio.put(
          '${API.SERVER_URL}api/trop/${trop.key!}',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: {
            if(name != null) 'name': name,
            if(customIconTropName != null) 'customIconTropName': customIconTropName.orElseNull,
            if(category != null) 'category': tropCategoryToStr(category),
            if(aims != null) 'aims': aims,
            if(startDate != null) 'startDate': formatDate(startDate),
            if(endDate != null) 'endDate': formatDate(endDate),
            if(completed != null) 'completed': completed,
            if(completionDate != null) 'completionDate': completionDate.isPresent?
            formatDate(completionDate.value):null,
            'tasks': tasksMap
          }
      ),
      onSuccess: (Response response, DateTime now) async {

        Map<String, dynamic> tropData = response.data;

        try {
          Trop trop = Trop.fromRespMap(tropData, isShared: true);
          // on the backend side `now` is set to be same as trop's `lastSyncTime`
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


  static Future<Response?> leave({
    required String tropKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/trop/$tropKey/leave',
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

}
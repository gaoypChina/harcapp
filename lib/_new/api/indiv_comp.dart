import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/show_rank_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:intl/intl.dart';


import '_api.dart';

class ParticipBody{

  final String key;
  final CompRole role;
  final bool active;

  const ParticipBody(this.key, this.role, this.active);

}

class ParticipBodyNick extends ParticipBody{

  final String? nick;

  const ParticipBodyNick(super.key, super.role, super.active, this.nick);

}

enum TaskState{
  OPEN,
  CLOSED_RETAINING,
}

Map<TaskState, String> taskStateToStr = {
  TaskState.OPEN: 'OPEN',
  TaskState.CLOSED_RETAINING: 'CLOSED_RETAINING',
};

Map<String, TaskState> strToTaskState = {
  'OPEN': TaskState.OPEN,
  'CLOSED_RETAINING': TaskState.CLOSED_RETAINING,
};

class IndivTaskBody{

  final String? key;
  String? title;
  String? desc;
  int? points;
  int? position;
  TaskState? state;

  IndivTaskBody({
    this.key,
    required this.title,
    required this.desc,
    required this.points,
    required this.position,
    required this.state,
  });

  static IndivTaskBody empty(int position) => IndivTaskBody(
    title: '',
    desc: '',
    points: 1,
    position: position,
    state: null,
  );

  Map toCreateMap(){

    Map<String, dynamic> map = {};
    if(title != null) map['title'] = title;
    if(desc != null) map['description'] = desc;
    if(points != null) map['points'] = points;

    return map;

  }

  Map toUpdateMap(){

    Map<String, dynamic> map = {};
    if(key != null) map['key'] = key;
    if(title != null) map['title'] = title;
    if(desc != null) map['description'] = desc;
    if(points != null) map['points'] = points;
    if(position != null) map['position'] = position;
    if(state != null) map['state'] = taskStateToStr[state!];

    return map;

  }

}

class ApiIndivComp{

  static Future<Response?> getAll({
    FutureOr<void> Function(List<IndivComp>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/indivComp',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<IndivComp> compList = [];
      for(Map map in response.data)
        compList.add(IndivComp.fromRespMap(map));

      await onSuccess?.call(compList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => await onError?.call(err.response),
  );

  static Future<Response?> get({
    required String compKey,
    FutureOr<void> Function(IndivComp comp)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/indivComp/$compKey',
    ),
    onSuccess: (Response response, DateTime now) async {
      IndivComp comp = IndivComp.fromRespMap(response.data);
      await onSuccess?.call(comp);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (_) async => await onError?.call(),
  );

  static Future<Response?> create({
    required String name,
    required String? colorsKey,
    required String? iconKey,
    required DateTime startTime,
    DateTime? endTime,
    required List<IndivTaskBody> tasks,
    required RankDispType? rankDispType,
    required List<String?>? awards,

    FutureOr<void> Function(IndivComp comp)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,

  }) async {

    List<Map<String, dynamic>> tasksReqData = [];
    for(IndivTaskBody taskBody in tasks)
      tasksReqData.add(taskBody.toCreateMap() as Map<String, dynamic>);

    Map<String, dynamic> reqMap = {};
    reqMap['name'] = name;
    reqMap['colorsKey'] = colorsKey;
    reqMap['iconKey'] = iconKey;
    reqMap['startTime'] = DateFormat('yyyy-MM-dd').format(startTime);
    if(endTime != null)
      reqMap['endTime'] = DateFormat('yyyy-MM-dd').format(endTime);
    reqMap['tasks'] = tasksReqData;
    reqMap['rankDispType'] = rankDispTypeToStr[rankDispType!];
    reqMap['awards'] = awards;

    return API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/indivComp',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async{
        IndivComp comp = IndivComp.fromRespMap(response.data);
        await onSuccess?.call(comp);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) => onError?.call(),
    );

  }

  static Future<Response?> delete({
    required String compKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.delete(
      '${API.SERVER_URL}api/indivComp/$compKey',
    ),
    onSuccess: (Response response, DateTime now) async => await onSuccess?.call(),
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (DioError err) async => onError?.call(),
  );

  static Future<Response?> resetShareCode({
    required String compKey,
    FutureOr<void> Function(String?)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Map?)? onError,
  }) => API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
      '${API.SERVER_URL}api/indivComp/$compKey/shareCode',
    ),
    onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data),
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (DioError err) async => onError?.call(err.response!.data),
  );

  static Future<Response?> setShareCodeSearchable({
    required String compKey,
    required bool searchable,
    FutureOr<void> Function(bool)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.post(
      '${API.SERVER_URL}api/indivComp/$compKey/shareCodeSearchable',
      data: FormData.fromMap({'searchable': searchable}),
    ),
    onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data['shareCodeSearchable']??false),
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (DioError err) async => onError?.call(),
  );

  static Future<Response?> joinByShareCode({
    required String searchCode,
    FutureOr<void> Function(IndivComp)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
      '${API.SERVER_URL}api/indivComp/joinByShareCode/$searchCode',
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      }),
    ),
    onSuccess: (Response response, DateTime now) async {
      IndivComp comp = IndivComp.fromRespMap(response.data);
      await onSuccess?.call(comp);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (DioError err) async => await onError?.call(),
  );

  static Future<Response?> update({
    required String key,
    String? name,
    String? colorsKey,
    String? iconKey,
    DateTime? startTime,
    DateTime? endTime,
    required List<IndivTaskBody> createTasks,
    required List<IndivTaskBody> updateTasks,
    required List<String?> removeTasks,
    RankDispType? rankDispType,
    List<String?>? awards,

    FutureOr<void> Function(IndivComp comp)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async{

    List<Map<String, dynamic>> taskCreateReqData = [];
    for(IndivTaskBody taskBody in createTasks)
      taskCreateReqData.add(taskBody.toCreateMap() as Map<String, dynamic>);

    List<Map<String, dynamic>> taskUpdateReqData = [];
    for(IndivTaskBody taskBody in updateTasks)
      taskUpdateReqData.add(taskBody.toUpdateMap() as Map<String, dynamic>);

    Map<String, dynamic> reqMap = {};
    if(name != null) reqMap['name'] = name;
    if(colorsKey != null) reqMap['colorsKey'] = colorsKey;
    if(iconKey != null) reqMap['iconKey'] = iconKey;
    if(startTime != null) reqMap['startTime'] = DateFormat('yyyy-MM-dd').format(startTime);
    if(endTime != null) reqMap['endTime'] = DateFormat('yyyy-MM-dd').format(endTime);

    Map<String, dynamic> tasks = {};
    if(taskCreateReqData.isNotEmpty) tasks['create'] = taskCreateReqData;
    if(taskUpdateReqData.isNotEmpty) tasks['update'] = taskUpdateReqData;
    if(removeTasks.isNotEmpty) tasks['remove'] = removeTasks;

    if(tasks.isNotEmpty) reqMap['tasks'] = tasks;
    if(rankDispType != null) reqMap['rankDispType'] = rankDispTypeToStr[rankDispType];
    if(awards != null) reqMap['awards'] = awards;

    return API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.put(
          '${API.SERVER_URL}api/indivComp/$key',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess==null) return;
        IndivComp comp = IndivComp.fromRespMap(response.data);
        onSuccess(comp);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) => onError?.call()
    );

  }

  static Future<Response?> getParticipant({
    required IndivComp comp,
    required String? participKey,
    FutureOr<void> Function(IndivCompParticip)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/indivComp/${comp.key}/participant/$participKey',
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        Map participsRespMap = response.data;
        onSuccess(IndivCompParticip.fromRespMap(participsRespMap, comp));
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> getParticipants({
    required IndivComp comp,
    required int? pageSize,
    required CompRole? lastRole,
    required String? lastUserName,
    required String? lastUserKey,
    FutureOr<void> Function(List<IndivCompParticip>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/indivComp/${comp.key}/participant',
          queryParameters: {
            if(pageSize != null) 'pageSize': pageSize,
            if(lastRole != null) 'lastRole': compRoleToStr[lastRole],
            if(lastUserName != null) 'lastUserName': lastUserName,
            if(lastUserKey != null) 'lastUserKey': lastUserKey,
          }
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<IndivCompParticip> particips = [];
        Map participsRespMap = response.data;
        for(MapEntry memEntry in participsRespMap.entries)
          particips.add(IndivCompParticip.fromRespMap(memEntry.value, comp, key: memEntry.key));

        onSuccess(particips);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
  );

  static Future<Response?> addParticipants({
    required IndivComp comp,
    required List<ParticipBodyNick> users,

    FutureOr<void> Function(List<IndivCompParticip>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
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
      requestSender: (Dio dio) => dio.post(
          '${API.SERVER_URL}api/indivComp/${comp.key}/participant',
          data: jsonEncode(body)
      ),
      onSuccess: (Response response, DateTime now) async {
        if(onSuccess == null) return;

        List<IndivCompParticip> particips = [];
        Map participsRespMap = response.data;
        for(MapEntry participEntry in participsRespMap.entries)
          particips.add(IndivCompParticip.fromRespMap(participEntry.value, comp, key: participEntry.key));

        onSuccess(particips);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> updateParticipants({
    required IndivComp comp,
    required List<ParticipBody> users,
    FutureOr<void> Function(List<IndivCompParticip>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
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
        requestSender: (Dio dio) => dio.put(
            '${API.SERVER_URL}api/indivComp/${comp.key}/participant',
            data: jsonEncode(body)
        ),
        onSuccess: (Response response, DateTime now) async {
          if(onSuccess == null) return;

          List<IndivCompParticip> particips = [];
          Map participsRespMap = response.data;
          for(MapEntry participEntry in participsRespMap.entries)
            particips.add(IndivCompParticip.fromRespMap(participEntry.value, comp, key: participEntry.key));

          onSuccess(particips);
        },
        onForceLoggedOut: onForceLoggedOut,
        onServerMaybeWakingUp: onServerMaybeWakingUp,
        onError: (err) async => onError?.call()
    );

  }

  static Future<Response?> removeParticipants({
    required String compKey,
    required List<String> userKeys,
    FutureOr<void> Function(List<String> removedKeys)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
          '${API.SERVER_URL}api/indivComp/$compKey/participant',
          data: jsonEncode(userKeys)
      ),
      onSuccess: (Response response, DateTime now) async {
        await onSuccess?.call((response.data as List).cast<String>());
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

  static Future<Response?> leave({
    required String compKey,
    FutureOr<void> Function()? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/indivComp/$compKey/leave',
      ),
      onSuccess: (Response response, DateTime now) async {
        await onSuccess?.call();
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (err) async => await onError?.call()
  );

  static Future<Response?> getCompletedTasks({
    required IndivComp comp,
    String? taskKey,
    String? participKey,

    required int? pageSize,
    required DateTime? lastReqTime,
    TaskAcceptState? acceptState,

    FutureOr<void> Function(List<IndivCompCompletedTask>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) async {
    /**
     * If `participKey` is not passed, all completedTasks with the given
     * `acceptState` for the given competition will be returned. In such case
     * the `acceptState` must not be null.
     * **/

    assert(!(participKey == null && acceptState == null));
    return await API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.get(
          '${API.SERVER_URL}api/indivComp/${comp.key}/completedTask',
          queryParameters: {
            'pageSize': pageSize,
            if(lastReqTime != null) 'lastReqTime': lastReqTime.toIso8601String(),
            if(participKey != null) 'participKey': participKey,
            if(taskKey != null) 'taskKey': taskKey,
            if(acceptState != null) 'acceptState': taskAcceptStateToStr[acceptState]
          }
      ),
      onSuccess: (Response response, DateTime now) async {

        List<IndivCompCompletedTask> complTaskList = [];
        for(Map complTaskRespMap in response.data)
          complTaskList.add(IndivCompCompletedTask.fromRespMap(complTaskRespMap, comp));

        // Map<IndivCompParticip, List<IndivCompCompletedTask>> pendingComplTasks = {};
        // for(String userKey in (response.data as Map).keys as Iterable<String>) {
        //   List<IndivCompCompletedTask> indivCompTaskComplList = [];
        //   for (MapEntry complTaskEntry in (response.data[userKey] as Map).entries)
        //     indivCompTaskComplList.add(IndivCompCompletedTask.fromRespMap(complTaskEntry.value, key: complTaskEntry.key));
        //
        //   IndivCompParticip particip = allParticipants.firstWhere((participIter) => participIter.key == userKey);
        //   pendingComplTasks[particip] = indivCompTaskComplList;
        // }

        await onSuccess?.call(complTaskList);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => await onError?.call()
    );
  }

  static Future<Response?> createCompletedTask({
    required IndivComp comp,
    required String? taskKey,
    List<String>? userKeys,
    String? comment,

    FutureOr<void> Function(List<IndivCompCompletedTask>, Map<String, ShowRankData>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.post(
        '${API.SERVER_URL}api/indivComp/completedTask',
        data: FormData.fromMap({
          if(taskKey != null) 'taskKey': taskKey,
          if(userKeys != null) 'userKeys': userKeys,
          if(comment != null) 'comment': comment,
        })
    ),
    onSuccess: (Response response, DateTime now) async {

      List<IndivCompCompletedTask> complTasks = [];
      Map complTasksRespMap = response.data['complTasks'];
      for(MapEntry complTaskEntry in complTasksRespMap.entries)
        complTasks.add(IndivCompCompletedTask.fromRespMap(complTaskEntry.value, comp, key: complTaskEntry.key));

      Map<String, ShowRankData> idRankMap = {};

      Map rankResMap = response.data['ranks'];
      for(String userKey in rankResMap.keys)
        idRankMap[userKey] = ShowRankData.from(rankResMap[userKey]);

      await onSuccess?.call(
          complTasks,
          idRankMap
      );
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (_) async => await onError?.call()
  );

  static Future<Response?> reviewCompletedTask({
    required String complTaskKey,
    required TaskAcceptState acceptState,
    required String revComment,
    FutureOr<void> Function(String complTaskKey)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,

  }) => API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) => dio.put(
        '${API.SERVER_URL}api/indivComp/completedTask/$complTaskKey',
        data: FormData.fromMap({
          'acceptState': acceptState.name,
          'revComment': revComment
        }),
      ),
      onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data),
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onError: (_) async => await onError?.call()
  );

  static Future<Response?> removeCompletedTask({
    required String complTaskKey,

    FutureOr<void> Function(String removedId)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function()? onError,
  }) => API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.delete(
        '${API.SERVER_URL}api/indivComp/completedTask/$complTaskKey'
    ),
    onSuccess: (Response response, DateTime now) async => await onSuccess?.call(response.data),
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (_) => onError?.call(),
  );

}
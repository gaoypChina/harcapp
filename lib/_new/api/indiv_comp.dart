import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:tuple/tuple.dart';
import 'package:intl/intl.dart';


import '_api.dart';

class ParticipBody{

  final String key;
  final CompRole role;
  final bool active;

  const ParticipBody(this.key, this.role, this.active);

}

class ParticipBodyNick{

  final String key;
  final CompRole role;
  final bool active;
  final String nick;

  const ParticipBodyNick(this.key, this.role, this.active, this.nick);

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

  final String key;
  String title;
  String desc;
  int points;
  int position;
  TaskState state;

  IndivTaskBody({
    this.key,
    @required this.title,
    @required this.desc,
    @required this.points,
    @required this.position,
    @required this.state,
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
    if(state != null) map['state'] = taskStateToStr[state];

    return map;

  }

}

class ApiIndivComp{

  static Future<Response> getAll({
    void Function(List<IndivComp>) onSuccess,
    Future<bool> Function() notAuthorized,
    void Function(Response response) onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/indiv_comp',
    ),
    onSuccess: (Response response) async {
      List<IndivComp> compList = [];
      for(Map map in response.data)
        compList.add(IndivComp.fromResponse(map));

      onSuccess?.call(compList);
    },
    onError: (err) async => await onError?.call(err.response)
  );

  static Future<Response> get({
    @required String compKey,
    void Function(IndivComp comp) onSuccess,
    void Function() onError,
  }) async => await API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/indiv_comp/$compKey',
    ),
    onSuccess: (Response response) async {
      IndivComp comp = IndivComp.fromResponse(response.data);
      onSuccess?.call(comp);
    },
    onError: (_) async => await onError(),
  );

  static Future<Response> create({
    @required String name,
    @required String colorsKey,
    @required String iconKey,
    @required DateTime startTime,
    DateTime endTime,
    @required List<IndivTaskBody> tasks,
    @required bool overviewMode,
    @required List<String> awards,

    void Function(IndivComp comp) onSuccess,
  }) async {

    List<Map<String, dynamic>> tasksReqData = [];
    for(IndivTaskBody taskBody in tasks)
      tasksReqData.add(taskBody.toCreateMap());

    Map<String, dynamic> reqMap = {};
    reqMap['name'] = name;
    reqMap['colorsKey'] = colorsKey;
    reqMap['iconKey'] = iconKey;
    reqMap['startTime'] = DateFormat('yyyy-MM-dd').format(startTime);
    if(endTime != null)
      reqMap['endTime'] = DateFormat('yyyy-MM-dd').format(endTime);
    reqMap['tasks'] = tasksReqData;
    reqMap['overviewMode'] = overviewMode;
    reqMap['awards'] = awards;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
          API.SERVER_URL + 'api/indiv_comp',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response) async{
        IndivComp comp = IndivComp.fromResponse(response.data);
        await onSuccess?.call(comp);
      }
    );

  }

  static Future<Response> delete({
    @required String compKey,
    void Function() onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
        API.SERVER_URL + 'api/indiv_comp/$compKey',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
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
        API.SERVER_URL + 'api/indiv_comp/$compKey/shareCode',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
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
        API.SERVER_URL + 'api/indiv_comp/$compKey/shareCodeSearchable',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: FormData.fromMap({'searchable': searchable}),
      ),
      onSuccess: (Response response) async => await onSuccess?.call(response.data['share_code_searchable']),
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response> joinByShareCode({
    @required String searchCode,
    void Function(IndivComp) onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/indiv_comp/joinByShareCode/$searchCode',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
      ),
      onSuccess: (Response response) async {
        IndivComp comp = IndivComp.fromResponse(response.data);
        onSuccess?.call(comp);
      },
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response> update({
    @required String key,
    String name,
    String colorsKey,
    String iconKey,
    DateTime startTime,
    DateTime endTime,
    @required List<IndivTaskBody> createTasks,
    @required List<IndivTaskBody> updateTasks,
    @required List<String> removeTasks,
    bool overviewMode,
    List<String> awards,
    void Function(IndivComp comp) onSuccess,
  }) async{

    List<Map<String, dynamic>> taskCreateReqData = [];
    for(IndivTaskBody taskBody in createTasks)
      taskCreateReqData.add(taskBody.toCreateMap());

    List<Map<String, dynamic>> taskUpdateReqData = [];
    for(IndivTaskBody taskBody in updateTasks)
      taskUpdateReqData.add(taskBody.toUpdateMap());

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
    if(overviewMode != null) reqMap['overviewMode'] = overviewMode;
    if(awards != null) reqMap['awards'] = awards;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          API.SERVER_URL + 'api/indiv_comp/$key',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(reqMap)
      ),
      onSuccess: (Response response) async {
        if(onSuccess==null) return;
        IndivComp comp = IndivComp.fromResponse(response.data);
        onSuccess(comp);
      }
    );

  }

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
          API.SERVER_URL + 'api/indiv_comp/$id/user',
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
            API.SERVER_URL + 'api/indiv_comp/$compId/user',
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
          API.SERVER_URL + 'api/indiv_comp/$compId/user',
          data: jsonEncode(userIds)
      ),
      onSuccess: (Response response) async {
        onSuccess?.call(response.data as List);
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
        API.SERVER_URL + 'api/indiv_comp/$compKey/leave',
      ),
      onSuccess: (Response response) async {
        onSuccess?.call();
      },
      onError: (err) async => await onError?.call()
  );

  /*
  static Future<Response> addTasks({
    @required String compKey,
    @required List<IndivTaskBody> tasks,

    void Function(List<IndivCompTask> addedTasks) onSuccess,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
          API.SERVER_URL + 'api/indiv_comp/$compKey/task/',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(tasks.map((task) => task.toMap()).toList())
      ),
      onSuccess: (Response response) async {

        List<IndivCompTask> tasks = [];
        Map _tasksRespMap = response.data;
        for(MapEntry taskEntry in _tasksRespMap.entries)
          tasks.add(IndivCompTask.fromMap(taskEntry.key, taskEntry.value));

        await onSuccess?.call(tasks);
      }
  );

  static Future<Response> updateTasks({
    @required List<IndivTaskBody> tasks,

    void Function(List<IndivCompTask>) onSuccess,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          API.SERVER_URL + 'api/indiv_comp/task/',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }),
          data: jsonEncode(tasks.map((task) => task.toMap()).toList())
      ),
      onSuccess: (Response response) async {

        List<IndivCompTask> tasks = [];
        Map _tasksRespMap = response.data;
        for(MapEntry taskEntry in _tasksRespMap.entries)
          tasks.add(IndivCompTask.fromMap(taskEntry.key, taskEntry.value));

        await onSuccess?.call(tasks);
      }
  );

  static Future<Response> removeTasks({
    @required String compKey,
    @required List<String> taskKeys,

    void Function(List<String> remainingTaskIds) onSuccess,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.delete(
          API.SERVER_URL + 'api/indiv_comp/${compKey}/task/',
          data: FormData.fromMap({
            'taskKeys': taskKeys,
          })
      ),
      onSuccess: (Response response) async => onSuccess?.call((response.data as List).cast<String>())
  );
  */

  static Future<Response> sendTaskComplReq({
    @required List<IndivCompTask> allTasks,
    @required String taskKey,
    String comment,
    List<String> userKeys,

    void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) onSuccess,
    void Function() onError,
  }) => API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.post(
        API.SERVER_URL + 'api/indiv_comp/task/request',
        data: userKeys == null?
        FormData.fromMap({
          'taskKey': taskKey,
          'comment': comment,
        }):
        FormData.fromMap({
          'taskKey': taskKey,
          'userKeys': userKeys,
          'comment': comment,
        })
    ),
    onSuccess: (Response response) async {

      List<IndivCompTaskCompl> complTasks = [];
      Map _complTasksRespMap = response.data['compl_tasks'];
      for(MapEntry complTaskEntry in _complTasksRespMap.entries)
        complTasks.add(IndivCompTaskCompl.fromMap(complTaskEntry.key, complTaskEntry.value));

      Map<String, Tuple3<int, int, Tuple2<double, double>>> idRankMap = {};

      Map rankResMap = response.data['ranks'];
      for(String userKey in rankResMap.keys){
        int rank = rankResMap[userKey]['rank'];
        int rankPopularity = rankResMap[userKey]['rank_popularity'];
        Tuple2<double, double> rankRange =
          rankResMap[userKey]['rank_range'] == null?
          null:
          Tuple2.fromList(rankResMap[userKey]['rank_range']);

        idRankMap[userKey] = Tuple3(rank, rankPopularity, rankRange);
      }

      await onSuccess?.call(
          complTasks,
          idRankMap
      );
    },
    onError: (_) async => onError?.call()
  );

  static Future<Response> removeTaskComplReq({
    @required String taskComplKey,

    void Function(String removedId) onSuccess,
  }) => API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.delete(
        API.SERVER_URL + 'api/indiv_comp/task/request/${taskComplKey}'
    ),
    onSuccess: (Response response) async => await onSuccess?.call(response.data)
  );

  static Future<Response> getAllPendingTaskComplRevs({
    @required String compKey,

    @required List<IndivCompParticip> allParticipants,
    @required List<IndivCompTask> allTasks,

    void Function(Map<IndivCompParticip, List<IndivCompTaskCompl>> pendingComplTasks) onSuccess,
  }) => API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/indiv_comp/get_all_pending_compl_indiv_task_reviews',
        queryParameters: {
          'compKey': compKey,
        }
    ),
    onSuccess: (Response response) async {

      Map<IndivCompParticip, List<IndivCompTaskCompl>> pendingComplTasks = {};
      for(String userKey in (response.data as Map).keys) {
        List<IndivCompTaskCompl> indivCompTaskComplList = [];
        for (MapEntry complTaskEntry in (response.data[userKey] as Map).entries)
          indivCompTaskComplList.add(IndivCompTaskCompl.fromMap(complTaskEntry.key, complTaskEntry.value));

        IndivCompParticip particip = allParticipants.firstWhere((_particip) => _particip.key == userKey);
        pendingComplTasks[particip] = indivCompTaskComplList;
      }

      onSuccess?.call(pendingComplTasks);
    }
  );

  static Future<Response> reviewCompletedTasks({
    String taskReqKey,
    TaskAcceptState acceptState,
    String revComment,
    void Function(String complTaskKey) onSuccess,
    void Function() onError,

  }) => API.sendRequest(
    withToken: true,
    sendRequest: (Dio dio) => dio.post(
        API.SERVER_URL + 'api/indiv_comp/task/review',
        data: FormData.fromMap({
          'taskReqKey': taskReqKey,
          'acceptState': acceptState.name,
          'revComment': revComment
        }),
    ),
    onSuccess: (Response response) async => await onSuccess?.call(response.data),
    onError: (_) async => await onError?.call()
  );

}
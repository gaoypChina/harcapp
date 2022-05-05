import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
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
        API.SERVER_URL + 'api/indivComp',
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
        API.SERVER_URL + 'api/indivComp/$compKey',
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
    @required RankDispType rankDispType,
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
    reqMap['rankDispType'] = rankDispTypeToStr[rankDispType];
    reqMap['awards'] = awards;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.put(
          API.SERVER_URL + 'api/indivComp',
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
        API.SERVER_URL + 'api/indivComp/$compKey',
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
        API.SERVER_URL + 'api/indivComp/$compKey/shareCode',
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
        API.SERVER_URL + 'api/indivComp/$compKey/shareCodeSearchable',
        data: FormData.fromMap({'searchable': searchable}),
      ),
      onSuccess: (Response response) async => await onSuccess?.call(response.data['shareCodeSearchable']),
      onError: (DioError err) async => await onError?.call()
  );

  static Future<Response> joinByShareCode({
    @required String searchCode,
    void Function(IndivComp) onSuccess,
    void Function() onError,
  }) => API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.get(
        API.SERVER_URL + 'api/indivComp/joinByShareCode/$searchCode',
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
    RankDispType rankDispType,
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
    if(rankDispType != null) reqMap['rankDispType'] = rankDispTypeToStr[rankDispType];
    if(awards != null) reqMap['awards'] = awards;

    return API.sendRequest(
      withToken: true,
      sendRequest: (Dio dio) => dio.post(
          API.SERVER_URL + 'api/indivComp/$key',
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
          API.SERVER_URL + 'api/indivComp/$id/user',
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
            API.SERVER_URL + 'api/indivComp/$compId/user',
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
          API.SERVER_URL + 'api/indivComp/$compId/user',
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
        API.SERVER_URL + 'api/indivComp/$compKey/leave',
      ),
      onSuccess: (Response response) async {
        onSuccess?.call();
      },
      onError: (err) async => await onError?.call()
  );

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
        API.SERVER_URL + 'api/indivComp/task/request',
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
        API.SERVER_URL + 'api/indivComp/task/request/$taskComplKey'
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
        API.SERVER_URL + 'api/indivComp/task/request/pending',
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
        API.SERVER_URL + 'api/indivComp/task/review',
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
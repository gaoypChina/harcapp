import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';

import 'indiv_comp.dart';

class IndivCompCompletedTask{

  static const int pageSize = 10;

  static const int MAX_LEN_REQ_COMMENT = 240;
  static const int MAX_LEN_REV_COMMENT = 240;

  final String key;

  final String participKey;

  final String taskKey;

  TaskAcceptState? acceptState;
  final DateTime reqTime;
  final DateTime? revTime;
  final String? reqComment;
  final String? revComment;

  IndivCompCompletedTask({
    required this.key,

    required this.participKey,

    required this.taskKey,

    required this.acceptState,
    required this.reqTime,
    required this.revTime,
    this.reqComment,
    this.revComment,
  });

  String title(IndivComp comp) => comp.taskMap[taskKey]!.title;
  String? description(IndivComp comp) => comp.taskMap[taskKey]!.description;
  int points(IndivComp comp) => comp.taskMap[taskKey]!.points;

  static IndivCompCompletedTask from({
    required String key,

    required String participKey,
    required String taskKey,
    required TaskAcceptState? acceptState,
    required DateTime reqTime,
    DateTime? revTime,
    String? reqComment,
    String? revComment,
  }) => IndivCompCompletedTask(
    participKey: participKey,
    taskKey: taskKey,

    key: key,

    acceptState: acceptState,
    reqTime: reqTime,
    revTime: revTime,
    reqComment: reqComment,
    revComment: revComment
  );

  static IndivCompCompletedTask fromRespMap(Map respMap, {String? key}) => IndivCompCompletedTask.from(
      key: key??respMap['_key'],

      participKey: respMap['userKey']??(throw InvalidResponseError('userKey')),
      taskKey: respMap['taskKey']??(throw InvalidResponseError('taskKey')),

      acceptState: strToTaskAcceptState[respMap['acceptState']??(throw InvalidResponseError('accept_state'))],
      reqTime: DateTime.tryParse(respMap['reqTime']??'')??(throw InvalidResponseError('reqTime')),
      revTime: DateTime.tryParse(respMap['revTime']??''),
      reqComment: respMap['reqComment'],
      revComment: respMap['revComment']
  );

  IndivCompCompletedTask copyWith({
    String? key,
    String? participId,
    String? taskId,
    String? title,
    String? description,
    int? points,
    TaskAcceptState? acceptState,
    DateTime? time,
    String? reqComment,
    String? revComment
  }) => IndivCompCompletedTask(
    participKey: participId??participKey,
    taskKey: taskId??taskKey,

    key: key??this.key,

    acceptState: acceptState??this.acceptState,
    reqTime: time??reqTime,
    revTime: time??revTime,
    reqComment: reqComment??this.reqComment,
    revComment: revComment??this.revComment,
  );

}
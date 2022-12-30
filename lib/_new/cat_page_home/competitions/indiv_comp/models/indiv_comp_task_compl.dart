import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';

import 'indiv_comp.dart';
import 'indiv_comp_task.dart';

class IndivCompCompletedTask{

  static const int pageSize = 10;

  static const int MAX_LEN_REQ_COMMENT = 240;
  static const int MAX_LEN_REV_COMMENT = 240;

  final String key;

  final String participKey;

  final IndivCompTask task;

  TaskAcceptState? acceptState;
  final DateTime reqTime;
  final DateTime? revTime;
  final String? reqComment;
  final String? revComment;

  IndivCompCompletedTask({
    required this.key,

    required this.participKey,

    required this.task,

    required this.acceptState,
    required this.reqTime,
    required this.revTime,
    this.reqComment,
    this.revComment,
  });

  String get title => task.title;
  String? get description => task.description;
  int get points => task.points;

  static IndivCompCompletedTask from({
    required String key,

    required String participKey,
    required IndivCompTask task,
    required TaskAcceptState? acceptState,
    required DateTime reqTime,
    DateTime? revTime,
    String? reqComment,
    String? revComment,
  }) => IndivCompCompletedTask(
    participKey: participKey,
    task: task,

    key: key,

    acceptState: acceptState,
    reqTime: reqTime,
    revTime: revTime,
    reqComment: reqComment,
    revComment: revComment
  );

  static IndivCompCompletedTask fromRespMap(Map respMap, IndivComp comp, {String? key}) => IndivCompCompletedTask.from(
      key: key??respMap['_key'],

      participKey: respMap['userKey']??(throw InvalidResponseError('userKey')),
      task: (comp.taskMap[respMap['taskKey']??(throw InvalidResponseError('taskKey'))])??(throw InvalidResponseError('taskKey not in provided competition')),

      acceptState: strToTaskAcceptState[respMap['acceptState']??(throw InvalidResponseError('accept_state'))],
      reqTime: DateTime.tryParse(respMap['reqTime']??'')??(throw InvalidResponseError('reqTime')),
      revTime: DateTime.tryParse(respMap['revTime']??''),
      reqComment: respMap['reqComment'],
      revComment: respMap['revComment']
  );

  IndivCompCompletedTask copyWith({
    String? key,
    String? participKey,
    IndivCompTask? task,
    String? title,
    String? description,
    int? points,
    TaskAcceptState? acceptState,
    DateTime? time,
    String? reqComment,
    String? revComment
  }) => IndivCompCompletedTask(
    participKey: participKey??this.participKey,
    task: task??this.task,

    key: key??this.key,

    acceptState: acceptState??this.acceptState,
    reqTime: time??reqTime,
    revTime: time??revTime,
    reqComment: reqComment??this.reqComment,
    revComment: revComment??this.revComment,
  );

}
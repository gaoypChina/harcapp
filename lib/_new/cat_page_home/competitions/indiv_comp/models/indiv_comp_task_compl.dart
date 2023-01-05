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

  TaskAcceptState acceptState;
  final DateTime reqTime;
  final String? reqComment;
  final DateTime? revTime;
  final String? revComment;
  final String? revUserKey;

  final bool autoAccepted;

  IndivCompCompletedTask({
    required this.key,

    required this.participKey,

    required this.task,

    required this.acceptState,
    required this.reqTime,
    this.reqComment,
    this.revTime,
    this.revComment,
    this.revUserKey,

    required this.autoAccepted,
  });

  String get title => task.title;
  String? get description => task.description;
  int get points => task.points;

  static IndivCompCompletedTask from({
    required String key,

    required String participKey,
    required IndivCompTask task,
    required TaskAcceptState acceptState,
    required DateTime reqTime,
    String? reqComment,
    DateTime? revTime,
    String? revComment,
    String? revUserKey,

    required bool autoAccepted,

  }) => IndivCompCompletedTask(
    participKey: participKey,
    task: task,

    key: key,

    acceptState: acceptState,
    reqTime: reqTime,
    reqComment: reqComment,
    revTime: revTime,
    revComment: revComment,
    revUserKey: revUserKey,

    autoAccepted: autoAccepted,
  );

  static IndivCompCompletedTask fromRespMap(Map respMap, IndivComp comp, {String? key}) => IndivCompCompletedTask.from(
      key: key??respMap['_key'],

      participKey: respMap['userKey']??(throw InvalidResponseError('userKey')),
      task: (comp.taskMap[respMap['taskKey']??(throw InvalidResponseError('taskKey'))])??(throw InvalidResponseError('taskKey not in provided competition')),

      reqTime: DateTime.tryParse(respMap['reqTime']??'')??(throw InvalidResponseError('reqTime')),
      reqComment: respMap['reqComment'],
      revTime: DateTime.tryParse(respMap['revTime']??''),
      revComment: respMap['revComment'],
      revUserKey: respMap['revUserKey'],

      autoAccepted: respMap['autoAccepted']??(throw InvalidResponseError('autoAccepted')),

      acceptState: strToTaskAcceptState[respMap['acceptState']]??(throw InvalidResponseError('acceptState')),

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
    String? revComment,

    String? revUserKey,
    bool? autoAccepted,

  }) => IndivCompCompletedTask(
    participKey: participKey??this.participKey,
    task: task??this.task,

    key: key??this.key,

    acceptState: acceptState??this.acceptState,
    reqTime: time??reqTime,
    reqComment: reqComment??this.reqComment,
    revTime: time??revTime,
    revComment: revComment??this.revComment,

    revUserKey: revUserKey??this.revUserKey,
    autoAccepted: autoAccepted??this.autoAccepted,
  );

}
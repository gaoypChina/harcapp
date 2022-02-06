import 'package:flutter/cupertino.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';

import 'indiv_comp.dart';

class IndivCompTaskCompl{

  static const int MAX_LEN_REQ_COMMENT = 240;
  static const int MAX_LEN_REV_COMMENT = 240;

  final String key;

  final String participKey;

  final String taskKey;

  TaskAcceptState acceptState;
  final DateTime reqTime;
  final DateTime revTime;
  final String reqComment;
  final String revComment;

  IndivCompTaskCompl({
    @required this.key,

    @required this.participKey,

    @required this.taskKey,

    @required this.acceptState,
    @required this.reqTime,
    @required this.revTime,
    this.reqComment,
    this.revComment,
  });

  String title(IndivComp comp) => comp.taskMap[taskKey].title;
  String description(IndivComp comp) => comp.taskMap[taskKey].description;
  int points(IndivComp comp) => comp.taskMap[taskKey].points;

  static IndivCompTaskCompl from({
    @required String key,

    @required String participKey,
    @required String taskKey,
    @required TaskAcceptState acceptState,
    DateTime reqTime,
    DateTime revTime,
    String reqComment,
    String revComment,
  }) => IndivCompTaskCompl(
    participKey: participKey,
    taskKey: taskKey,

    key: key,

    acceptState: acceptState,
    reqTime: reqTime,
    revTime: revTime,
    reqComment: reqComment,
    revComment: revComment
  );

  static IndivCompTaskCompl fromMap(String key, Map map) => IndivCompTaskCompl.from(
      key: key,

      participKey: map['userKey']??(throw InvalidResponseError('userKey')),
      taskKey: map['taskKey']??(throw InvalidResponseError('taskKey')),

      acceptState: strToTaskAcceptState[map['accept_state']??(throw InvalidResponseError('accept_state'))],
      reqTime: DateTime.tryParse(map['req_time']??''),
      revTime: DateTime.tryParse(map['rev_time']??''),
      reqComment: map['req_comment'],
      revComment: map['rev_comment']
  );

  IndivCompTaskCompl copyWith({
    String key,
    String participId,
    String taskId,
    String title,
    String description,
    int points,
    TaskAcceptState acceptState,
    DateTime time,
    String reqComment,
    String revComment
  }) => IndivCompTaskCompl(
    participKey: participId??this.participKey,
    taskKey: taskId??this.taskKey,

    key: key??this.key,

    acceptState: acceptState??this.acceptState,
    reqTime: time??this.reqTime,
    revTime: time??this.revTime,
    reqComment: reqComment??this.reqComment,
    revComment: revComment??this.revComment,
  );

}
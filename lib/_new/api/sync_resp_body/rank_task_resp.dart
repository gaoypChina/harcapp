import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class RankTaskResp extends SyncEntityResp{

  static const String COLL_NAME = 'task';

  static const String PARAM_CAT_INDEX = 'catIndex';
  final int catIndex;

  static const String PARAM_GROUP_INDEX = 'groupIndex';
  final int groupIndex;

  static const String PARAM_TASK_INDEX = 'taskIndex';
  final int taskIndex;


  static const String PARAM_NOTE = 'note';
  final String note;

  static const String PARAM_COMPLETED = 'completed';
  final bool completed;

  static RankTaskResp from(Map respData) => RankTaskResp(
    catIndex: respData[PARAM_CAT_INDEX],
    groupIndex: respData[PARAM_GROUP_INDEX],
    taskIndex: respData[PARAM_TASK_INDEX],

    note: respData[PARAM_NOTE]??false,
    completed: respData[PARAM_COMPLETED]??false,
  );

  const RankTaskResp({
    @required this.catIndex,
    @required this.groupIndex,
    @required this.taskIndex,

    @required this.note,
    @required this.completed,
  });

}
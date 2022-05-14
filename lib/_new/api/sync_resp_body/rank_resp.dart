import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class RankResp extends SyncGetResp{

  static const String COLL_NAME = 'rank_def';

  static const String PARAM_IN_PROGRESS = 'inProgress';
  final bool? inProgress;

  static const String PARAM_COMPLETED = 'completed';
  final bool? completed;

  static const String PARAM_COMPLETION_DATE = 'completionDate';
  final DateTime? completionDate;

  static const String PARAM_TASK = 'tasks';
  final Map<String, RankTaskResp>? tasks;

  const RankResp({
    required this.inProgress,
    required this.completed,
    required this.completionDate,
    required this.tasks,
  });

  static RankResp from(Map respData){

    Map<String, dynamic>? sprawTasks = respData[PARAM_TASK];
    Map<String, RankTaskResp> tasks = {};
    if(sprawTasks != null)
      for(String uniqTaskRankName in sprawTasks.keys)
        tasks[uniqTaskRankName] = RankTaskResp.from(sprawTasks[uniqTaskRankName]);

    return RankResp(
        inProgress: respData[PARAM_IN_PROGRESS]??false,
        completionDate: respData[PARAM_COMPLETION_DATE]==null?null:DateTime.tryParse(respData[PARAM_COMPLETION_DATE]),
        completed: respData[PARAM_COMPLETED]??false,
        tasks: tasks
    );
  }

}
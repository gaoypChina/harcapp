import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_task_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

import '../_api.dart';

class SprawResp extends SyncGetResp{

  static const String COLL_NAME = 'spraw';

  static const String PARAM_IN_PROGRESS = 'inProgress';
  final bool inProgress;

  static const String PARAM_COMPLETED = 'completed';
  final bool completed;

  static const String PARAM_COMPLETION_DATE = 'completionDate';
  final DateTime completionDate;

  static const String PARAM_TASK = 'task';
  final Map<String, SprawTaskResp> task;

  const SprawResp({
    @required this.inProgress,
    @required this.completed,
    @required this.completionDate,
    @required this.task,
  });

  static SprawResp from(Map respData){

    Map<String, dynamic> sprawTasks = respData[PARAM_TASK];
    Map<String, SprawTaskResp> tasks = {};
    if(sprawTasks != null)
      for(String uniqTaskSprawName in sprawTasks.keys)
        tasks[uniqTaskSprawName] = SprawTaskResp.from(sprawTasks[uniqTaskSprawName]);

    return SprawResp(
        inProgress: respData[PARAM_IN_PROGRESS]??false,
        completionDate: respData[PARAM_COMPLETION_DATE]==null?null:DateTime.tryParse(respData[PARAM_COMPLETION_DATE]),
        completed: respData[PARAM_COMPLETED]??false,
        task: tasks
    );
  }

}
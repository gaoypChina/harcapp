import 'package:harcapp/_new/api/sync_resp_body/spraw_task_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class SprawGetResp extends SyncGetResp{

  static const String collName = 'spraw';

  static const String paramInProgress = 'inProgress';
  final bool inProgress;

  static const String paramCompleted = 'completed';
  final bool completed;

  static const String paramCompletionDate = 'completionDate';
  final DateTime? completionDate;

  static const String paramTask = 'task';
  final Map<String, SprawTaskGetResp> task;

  const SprawGetResp({
    required this.inProgress,
    required this.completed,
    required this.completionDate,
    required this.task,
  });

  static SprawGetResp from(Map respData){

    Map<String, dynamic>? sprawTasks = respData[paramTask];
    Map<String, SprawTaskGetResp> tasks = {};
    if(sprawTasks != null)
      for(String uniqTaskName in sprawTasks.keys)
        tasks[uniqTaskName] = SprawTaskGetResp.from(sprawTasks[uniqTaskName]);

    return SprawGetResp(
        inProgress: respData[paramInProgress]??false,
        completionDate: respData[paramCompletionDate]==null?null:DateTime.tryParse(respData[paramCompletionDate]),
        completed: respData[paramCompleted]??false,
        task: tasks
    );
  }

}
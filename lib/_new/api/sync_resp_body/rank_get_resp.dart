import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class RankGetResp extends SyncGetResp{

  static const String collName = 'rank_def';

  static const String paramInProgress = 'inProgress';
  final bool inProgress;

  static const String paramCompleted = 'completed';
  final bool completed;

  static const String paramCompletionDate = 'completionDate';
  final DateTime? completionDate;

  static const String paramTask = 'tasks';
  final Map<String, RankTaskResp>? tasks;

  const RankGetResp({
    required this.inProgress,
    required this.completed,
    required this.completionDate,
    required this.tasks,
  });

  static RankGetResp from(Map respData){

    Map<String, dynamic>? sprawTasks = respData[paramTask];
    Map<String, RankTaskResp> tasks = {};
    if(sprawTasks != null)
      for(String uniqTaskRankName in sprawTasks.keys)
        tasks[uniqTaskRankName] = RankTaskResp.from(sprawTasks[uniqTaskRankName]);

    return RankGetResp(
        inProgress: respData[paramInProgress]??false,
        completionDate: respData[paramCompletionDate]==null?null:DateTime.tryParse(respData[paramCompletionDate]),
        completed: respData[paramCompleted]??false,
        tasks: tasks
    );
  }

}
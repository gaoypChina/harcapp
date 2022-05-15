import 'package:harcapp/_new/api/sync_resp_body/rank_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';

class RankDefGetResp extends RankGetResp{

  static const String COLL_NAME = 'rank_def';

  const RankDefGetResp({
    required bool inProgress,
    required bool completed,
    required DateTime? completionDate,
    required Map<String, RankTaskResp>? tasks,
  }):super(
    inProgress: inProgress,
    completed: completed,
    completionDate: completionDate,
    tasks: tasks
  );

  static RankDefGetResp from(Map respData){
    RankGetResp resp = RankGetResp.from(respData);
    return RankDefGetResp(
        inProgress: resp.inProgress,
        completed: resp.completed,
        completionDate: resp.completionDate,
        tasks: resp.tasks
    );
  }

}
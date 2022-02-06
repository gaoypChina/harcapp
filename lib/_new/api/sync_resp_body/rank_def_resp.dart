import 'package:harcapp/_new/api/sync_resp_body/rank_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';

class RankDefResp extends RankResp{

  static const String COLL_NAME = 'rank_def';

  const RankDefResp({
    bool inProgress,
    bool completed,
    DateTime completionDate,
    Map<String, RankTaskResp> tasks,
  }):super(
    inProgress: inProgress,
    completed: completed,
    completionDate: completionDate,
    tasks: tasks
  );

  static RankDefResp from(Map respData){
    RankResp resp = RankResp.from(respData);
    return RankDefResp(
        inProgress: resp.inProgress,
        completed: resp.completed,
        completionDate: resp.completionDate,
        tasks: resp.tasks
    );
  }

}
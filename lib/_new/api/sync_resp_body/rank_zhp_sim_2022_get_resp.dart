import 'package:harcapp/_new/api/sync_resp_body/rank_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';

class RankZhpSim2022GetResp extends RankGetResp{

  static const String COLL_NAME = 'rank_zhp_sim_2022';

  const RankZhpSim2022GetResp({
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

  static RankZhpSim2022GetResp from(Map respData){
    RankGetResp resp = RankGetResp.from(respData);
    return RankZhpSim2022GetResp(
        inProgress: resp.inProgress,
        completed: resp.completed,
        completionDate: resp.completionDate,
        tasks: resp.tasks
    );
  }

}
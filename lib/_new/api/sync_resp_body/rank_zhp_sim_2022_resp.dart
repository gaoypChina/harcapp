import 'package:harcapp/_new/api/sync_resp_body/rank_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';

class RankZhpSim2022Resp extends RankResp{

  static const String COLL_NAME = 'rank_zhp_sim_2022';

  const RankZhpSim2022Resp({
    bool? inProgress,
    bool? completed,
    DateTime? completionDate,
    Map<String, RankTaskResp>? tasks,
  }):super(
      inProgress: inProgress,
      completed: completed,
      completionDate: completionDate,
      tasks: tasks
  );

  static RankZhpSim2022Resp from(Map respData){
    RankResp resp = RankResp.from(respData);
    return RankZhpSim2022Resp(
      inProgress: resp.inProgress,
      completed: resp.completed,
      completionDate: resp.completionDate,
      tasks: resp.tasks
    );
  }

}
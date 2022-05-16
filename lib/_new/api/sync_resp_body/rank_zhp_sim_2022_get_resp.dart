import 'package:harcapp/_new/api/sync_resp_body/rank_get_resp.dart';

class RankZhpSim2022GetResp extends RankGetResp{

  static const String COLL_NAME = 'rank_zhp_sim_2022';

  const RankZhpSim2022GetResp({
    required super.inProgress,
    required super.completed,
    required super.completionDate,
    required super. tasks,
  });

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
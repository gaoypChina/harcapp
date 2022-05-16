import 'package:harcapp/_new/api/sync_resp_body/rank_get_resp.dart';

class RankDefGetResp extends RankGetResp{

  static const String COLL_NAME = 'rank_def';

  const RankDefGetResp({
    required super.inProgress,
    required super.completed,
    required super.completionDate,
    required super.tasks,
  });

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
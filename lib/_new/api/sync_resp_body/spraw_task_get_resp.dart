import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class SprawTaskGetResp extends SyncGetResp{

  static const String COLL_NAME = 'task';

  static const String PARAM_NOTE = 'note';
  final String note;

  static const String PARAM_COMPLETED = 'completed';
  final bool completed;

  static SprawTaskGetResp from(Map respData) => SprawTaskGetResp(
      note: respData[PARAM_NOTE]??false as String,
      completed: respData[PARAM_COMPLETED]??false,
  );

  const SprawTaskGetResp({
    required this.note,
    required this.completed,
  });

}
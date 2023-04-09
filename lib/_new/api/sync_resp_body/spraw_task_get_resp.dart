import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class SprawTaskGetResp extends SyncGetResp{

  static const String collName = 'task';

  static const String paramNote = 'note';
  final String note;

  static const String paramCompleted = 'completed';
  final bool completed;

  static SprawTaskGetResp from(Map respData) => SprawTaskGetResp(
      note: respData[paramNote]??'',
      completed: respData[paramCompleted]??false,
  );

  const SprawTaskGetResp({
    required this.note,
    required this.completed,
  });

}
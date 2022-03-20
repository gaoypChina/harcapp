import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class SprawTaskResp extends SyncGetResp{

  static const String COLL_NAME = 'task';

  static const String PARAM_NOTE = 'note';
  final String note;

  static const String PARAM_COMPLETED = 'completed';
  final bool completed;

  static SprawTaskResp from(Map respData) => SprawTaskResp(
      note: respData[PARAM_NOTE]??false,
      completed: respData[PARAM_COMPLETED]??false,
  );

  const SprawTaskResp({
    @required this.note,
    @required this.completed,
  });

}
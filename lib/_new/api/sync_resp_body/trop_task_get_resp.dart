import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';

class TropTaskGetResp extends SyncGetResp{

  static const String collName = 'task';

  static const String paramContent = 'content';
  final String content;

  static const String paramSummary = 'summary';
  final String? summary;

  static const String paramDeadline = 'deadline';
  final DateTime deadline;

  static const String paramAssigneeKey = 'assigneeKey';
  final String? assigneeKey;

  static const String paramAssigneeCustomText = 'assigneeCustomText';
  final String? assigneeCustomText;

  static const String paramCompleted = 'completed';
  final bool completed;

  static TropTaskGetResp from(Map respMapData) => TropTaskGetResp(
      content: respMapData[paramContent]??(throw InvalidResponseError(paramContent)),
      summary: respMapData[paramSummary],
      deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw InvalidResponseError(paramDeadline)),
      assigneeKey: respMapData[paramAssigneeKey],
      assigneeCustomText: respMapData[paramAssigneeCustomText],
      completed: respMapData[paramCompleted]??false,
  );

  const TropTaskGetResp({
    required this.content,
    this.summary,
    required this.deadline,
    this.assigneeKey,
    this.assigneeCustomText,
    required this.completed,
  });

}
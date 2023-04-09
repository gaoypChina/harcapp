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

  static const String paramAssigneeText = 'assigneeText';
  final String? assigneeText;

  static const String paramCompleted = 'completed';
  final bool completed;

  static TropTaskGetResp from(Map respMapData) => TropTaskGetResp(
      content: respMapData[paramContent]??(throw InvalidResponseError(paramContent)),
      summary: respMapData[paramSummary],
      deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw InvalidResponseError(paramDeadline)),
      assigneeKey: respMapData[paramAssigneeKey],
      assigneeText: respMapData[paramAssigneeText],
      completed: respMapData[paramCompleted]??false,
  );

  const TropTaskGetResp({
    required this.content,
    this.summary,
    required this.deadline,
    this.assigneeKey,
    this.assigneeText,
    required this.completed,
  });

}
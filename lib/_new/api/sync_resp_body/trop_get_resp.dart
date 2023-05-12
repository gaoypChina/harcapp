import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_task_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_user.dart';

class TropGetResp extends SyncGetResp{

  static const String collName = 'trop';

  static String paramKey = '_key';
  final String key;

  static String paramName = 'name';
  final String name;

  static String paramCustomIconTropName = 'customIconTropName';
  final String? customIconTropName;

  static const String paramCategory = 'category';
  final TropCategory category;

  static const String paramAims = 'aims';
  final List<String> aims;

  static const String paramStartDate = 'startDate';
  final DateTime startDate;

  static const String paramEndDate = 'endDate';
  final DateTime endDate;

  static const String paramCompleted = 'completed';
  final bool completed;

  static const String paramCompletionDate = 'completionDate';
  final DateTime? completionDate;

  static const String paramTasks = 'tasks';
  final Map<String, TropTaskGetResp> tasks;

  static const String paramAssignedUsers = 'assignedUsers';
  final Map<String, TropUser> assignedUsers;

  static const String paramLoadedUsers = 'loadedUsers';
  final Map<String, TropUser> loadedUsers;

  static const String paramLastUpdateTime = 'lastUpdateTime';
  final DateTime lastUpdateTime;

  const TropGetResp({
    required this.key,
    required this.name,
    required this.customIconTropName,
    required this.category,
    required this.aims,
    required this.startDate,
    required this.endDate,

    required this.completed,
    required this.completionDate,
    required this.tasks,
    required this.lastUpdateTime,
    required this.assignedUsers,
    required this.loadedUsers,
  });

  static TropGetResp fromRespMap(Map respMapData){

    Map<String, dynamic>? tasksBody = respMapData[paramTasks];
    Map<String, TropTaskGetResp> tasks = {};
    if(tasksBody != null)
      for(String uniqTaskName in tasksBody.keys)
        tasks[uniqTaskName] = TropTaskGetResp.from(tasksBody[uniqTaskName]);

    Map<String, dynamic>? participantsBody = respMapData[paramAssignedUsers];
    Map<String, TropUser> participants = {};
    if(participantsBody != null)
      for(String participKey in participantsBody.keys)
        participants[participKey] = TropUser.fromRespMap(participantsBody[participKey], key: participKey);

    Map<String, dynamic>? observersBody = respMapData[paramLoadedUsers];
    Map<String, TropUser> observers = {};
    if(observersBody != null)
      for(String observerKey in observersBody.keys)
        observers[observerKey] = TropUser.fromRespMap(observersBody[observerKey], key: observerKey);


    return TropGetResp(
        key: respMapData[paramKey]??(throw InvalidResponseError(paramKey)),
        name: respMapData[paramName]??(throw InvalidResponseError(paramName)),
        customIconTropName: respMapData[paramCustomIconTropName],
        category: strToTropCategory(respMapData[paramCategory])??(throw InvalidResponseError(paramCategory)),
        aims: (respMapData[paramAims]??(throw InvalidResponseError(paramAims))).cast<String>(),
        startDate: DateTime.tryParse(respMapData[paramStartDate]??'')??(throw InvalidResponseError(paramStartDate)),
        endDate: DateTime.tryParse(respMapData[paramEndDate]??'')??(throw InvalidResponseError(paramEndDate)),

        completionDate: DateTime.tryParse(respMapData[paramCompletionDate]??''),
        completed: respMapData[paramCompleted]??false,
        tasks: tasks,
        lastUpdateTime: DateTime.tryParse(respMapData[paramLastUpdateTime]??'')??(throw InvalidResponseError(paramLastUpdateTime)),
        assignedUsers: participants,
        loadedUsers: observers
    );
  }

}
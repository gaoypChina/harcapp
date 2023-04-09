import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_task_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop.dart';

class TropGetResp extends SyncGetResp{

  static const String collName = 'trop';

  static String paramName = 'name';
  final String name;

  static String paramCustomIconTropName = 'customIconTropName';
  final String? customIconTropName;

  static const String paramCategory = 'category';
  final TropCategory category;

  static const String paramAims = 'aims';
  final List<String> aims;

  static const String paramStartTime = 'startTime';
  final DateTime startTime;

  static const String paramEndTime = 'endTime';
  final DateTime endTime;

  static const String paramCompleted = 'completed';
  final bool completed;

  static const String paramCompletionTime = 'completionTime';
  final DateTime? completionTime;

  static const String paramTasks = 'tasks';
  final Map<String, TropTaskGetResp> tasks;

  static const String paramUsers = 'users';
  final Map<String, UserData> users;


  const TropGetResp({
    required this.name,
    required this.customIconTropName,
    required this.category,
    required this.aims,
    required this.startTime,
    required this.endTime,

    required this.completed,
    required this.completionTime,
    required this.tasks,
    required this.users,
  });

  static TropGetResp fromRespMap(Map respMapData){

    Map<String, dynamic>? tasksBody = respMapData[paramTasks];
    Map<String, TropTaskGetResp> tasks = {};
    if(tasksBody != null)
      for(String uniqTaskName in tasksBody.keys)
        tasks[uniqTaskName] = TropTaskGetResp.from(tasksBody[uniqTaskName]);

    Map<String, dynamic>? usersBody = respMapData[paramUsers];
    Map<String, UserData> users = {};
    if(usersBody != null)
      for(String userKey in usersBody.keys)
        users[userKey] = UserData.fromRespMap(usersBody[userKey], key: userKey);

    return TropGetResp(
        name: respMapData[paramName]??(throw InvalidResponseError(paramName)),
        customIconTropName: respMapData[paramCustomIconTropName],
        category: strToTropCategory(respMapData[paramCategory])??(throw InvalidResponseError(paramCategory)),
        aims: respMapData[paramAims]??(throw InvalidResponseError(paramAims)),
        startTime: DateTime.tryParse(respMapData[paramStartTime])??(throw InvalidResponseError(paramStartTime)),
        endTime: DateTime.tryParse(respMapData[paramEndTime])??(throw InvalidResponseError(paramEndTime)),

        completionTime: respMapData[paramCompletionTime]==null?null:DateTime.tryParse(respMapData[paramCompletionTime]),
        completed: respMapData[paramCompleted]??false,
        tasks: tasks,
        users: users
    );
  }

}
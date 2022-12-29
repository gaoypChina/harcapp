import 'package:harcapp/_new/api/_api.dart';

import '../comp_role.dart';
import 'show_rank_data.dart';
import 'indiv_comp_task_compl.dart';

class IndivCompProfile{

  bool active;
  CompRole role;
  int? points;
  ShowRankData? rank;

  int? completedTasksAcceptedCount;
  int? completedTasksPendingCount;
  int? completedTasksRejectedCount;

  int? get completedTasksCount{
    if(completedTasksAcceptedCount == null || completedTasksPendingCount == null || completedTasksRejectedCount == null)
      return null;

    return completedTasksAcceptedCount! + completedTasksPendingCount! + completedTasksRejectedCount!;
  }

  final List<IndivCompCompletedTask> completedTasks;
  final Map<String, IndivCompCompletedTask> completedTaskMap;

  void addCompletedTask(IndivCompCompletedTask taskCompl){
    completedTasks.add(taskCompl);
    completedTaskMap[taskCompl.key] = taskCompl;
  }

  void removeCompletedTaskByKey(String taskComplKey){
    IndivCompCompletedTask? complTesk = completedTaskMap[taskComplKey];
    if(complTesk != null) {
      completedTasks.remove(complTesk);
      completedTaskMap.remove(taskComplKey);
    }
  }

  IndivCompProfile({
    required this.active,
    required this.role,
    this.points,
    this.rank,

    required this.completedTasksAcceptedCount,
    required this.completedTasksPendingCount,
    required this.completedTasksRejectedCount,

    required this.completedTasks,
  }): completedTaskMap = {for (var complTask in completedTasks) complTask.key: complTask};

  static IndivCompProfile fromRespMap(Map respMap){

    List<IndivCompCompletedTask> completedTasks = [];
    if(respMap['completedTasks'] == null)
      completedTasks = [];
    else {
      Map _complTasksRespMap = respMap['completedTasks'];
      for (String complTaskKey in _complTasksRespMap.keys as Iterable<String>)
        completedTasks.add(IndivCompCompletedTask.fromRespMap(_complTasksRespMap[complTaskKey], key: complTaskKey));
    }

    Map<String, int> completedTasksCount = (respMap['completedTasksCount']??{}).cast<String, int>();

    IndivCompProfile profile = IndivCompProfile(
      active: respMap['active']??(throw InvalidResponseError('active')),
      role: strToCompRole[respMap['role']??(throw InvalidResponseError('role'))]??(throw InvalidResponseError('role')),

      points: respMap['points'],
      rank: respMap['active']==true?ShowRankData.from(respMap):null,

      completedTasksAcceptedCount: completedTasksCount['accepted'],
      completedTasksPendingCount: completedTasksCount['pending'],
      completedTasksRejectedCount: completedTasksCount['rejected'],

      completedTasks: completedTasks,
    );

    return profile;

  }

}
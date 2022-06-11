import 'package:harcapp/_new/api/_api.dart';

import '../comp_role.dart';
import 'show_rank_data.dart';
import 'indiv_comp_task_compl.dart';

class IndivCompProfile{

  bool active;
  CompRole role;
  int? points;
  ShowRankData? rank;

  final List<IndivCompTaskCompl> completedTasks;
  final Map<String, IndivCompTaskCompl> completedTaskMap;

  void addCompletedTask(IndivCompTaskCompl taskCompl){
    // Tu kiedyś dodać opcję, by admini i moderatorzy mogli sobie podejrzeć jakie zadania i kiedy zrealizował kto.
    completedTasks.add(taskCompl);
    completedTaskMap[taskCompl.key] = taskCompl;
  }

  void removeCompletedTaskByKey(String taskComplKey){
    // Tu kiedyś dodać opcję, by admini i moderatorzy mogli sobie podejrzeć jakie zadania i kiedy zrealizował kto.
    IndivCompTaskCompl? complTesk = completedTaskMap[taskComplKey];
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
    required this.completedTasks,
  }): completedTaskMap = {for (var complTask in completedTasks) complTask.key: complTask};

  static IndivCompProfile fromResponse(Map resp){

    List<IndivCompTaskCompl> completedTasks = [];
    if(resp['completedTasks'] == null)
      completedTasks = [];
    else {
      Map _complTasksRespMap = resp['completedTasks'];
      for (String complTaskKey in _complTasksRespMap.keys as Iterable<String>)
        completedTasks.add(IndivCompTaskCompl.fromMap(complTaskKey, _complTasksRespMap[complTaskKey]));
    }

    IndivCompProfile profile = IndivCompProfile(
      active: resp['active']??(throw InvalidResponseError('active')),
      role: strToCompRole[resp['role']??(throw InvalidResponseError('role'))]??(throw InvalidResponseError('role')),

      points: resp['points'],
      rank: resp['active']==true?ShowRankData.from(resp):null,

      completedTasks: completedTasks,
    );

    return profile;

  }

}
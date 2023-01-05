import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/logger.dart';

import '../comp_role.dart';
import '../task_accept_state.dart';
import 'indiv_comp.dart';
import 'show_rank_data.dart';
import 'indiv_comp_task_compl.dart';

class IndivCompProfile{

  IndivComp comp;

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

  final List<IndivCompCompletedTask> loadedCompletedTasks;
  final Map<String, IndivCompCompletedTask> loadedCompletedTaskMap;

  void addLoadedCompletedTask(IndivCompCompletedTask completedTask){
    loadedCompletedTasks.add(completedTask);
    loadedCompletedTaskMap[completedTask.key] = completedTask;

    switch(completedTask.acceptState){
      case TaskAcceptState.ACCEPTED:
        completedTasksAcceptedCount = completedTasksAcceptedCount! + 1;
        break;
      case TaskAcceptState.PENDING:
        completedTasksPendingCount = completedTasksPendingCount! + 1;
        break;
      case TaskAcceptState.REJECTED:
        completedTasksRejectedCount = completedTasksRejectedCount! + 1;
        break;
    }
  }

  void setAllLoadedCompletedTasks(List<IndivCompCompletedTask> completedTasks){
    loadedCompletedTasks.clear();
    loadedCompletedTaskMap.clear();
    addLoadedCompletedTasks(completedTasks);
  }

  void addLoadedCompletedTasks(List<IndivCompCompletedTask> completedTasks){
    for(IndivCompCompletedTask completedTask in completedTasks)
      addLoadedCompletedTask(completedTask);
  }

  void removeCompletedTaskByKey(String complTaskKey, {bool shrinkTotalCount=true}){
    IndivCompCompletedTask? completedTask = loadedCompletedTaskMap[complTaskKey];
    if(completedTask == null){
      logger.d("Attempting to remove a completedTask which does not exist.");
      return;
    }

    bool success = loadedCompletedTasks.remove(completedTask);
    IndivCompCompletedTask? removed = loadedCompletedTaskMap.remove(complTaskKey);

    if(success != (removed != null))
      logger.e("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      switch(completedTask.acceptState){
        case TaskAcceptState.ACCEPTED:
          completedTasksAcceptedCount = completedTasksAcceptedCount! - 1;
          break;
        case TaskAcceptState.PENDING:
          completedTasksPendingCount = completedTasksPendingCount! - 1;
          break;
        case TaskAcceptState.REJECTED:
          completedTasksRejectedCount = completedTasksRejectedCount! - 1;
          break;
      }

  }

  // {taskKey: [completedTask]}
  final Map<String, List<IndivCompCompletedTask>> loadedPendingTasks;

  // {taskKey: {completedTask.key: completedTask}}
  final Map<String, Map<String, IndivCompCompletedTask>> loadedPendingTaskMap;

  Map<String, int> pendingTasksCount;


  void addLoadedPendingCompletedTask(IndivCompCompletedTask completedTask){

    String taskKey = completedTask.task.key;

    if(!loadedPendingTasks.containsKey(taskKey))
      loadedPendingTasks[taskKey] = [];
    loadedPendingTasks[taskKey]!.insert(0, completedTask);

    if(!loadedPendingTaskMap.containsKey(taskKey))
      loadedPendingTaskMap[taskKey] = {};
    loadedPendingTaskMap[taskKey]![completedTask.key] = completedTask;

    if(!pendingTasksCount.containsKey(taskKey))
      pendingTasksCount[taskKey] = 1;
    else
      pendingTasksCount[taskKey] = pendingTasksCount[taskKey]! + 1;
  }

  void addLoadedPendingCompletedTasks(List<IndivCompCompletedTask> completedTasks){
    for(IndivCompCompletedTask completedTask in completedTasks)
      addLoadedPendingCompletedTask(completedTask);
  }

  void setAllLoadedPendingCompletedTasks(List<IndivCompCompletedTask> completedTasks){
    loadedPendingTasks.clear();
    loadedPendingTaskMap.clear();
    addLoadedPendingCompletedTasks(completedTasks);
  }

  void removeLoadedPendingCompletedTaskByKey(String complTaskKey, {bool shrinkTotalCount=true}){
    IndivCompCompletedTask? completedTask = loadedCompletedTaskMap[complTaskKey];
    if(completedTask == null){
      logger.d("Attempting to remove a completedTask which does not exist.");
      return;
    }

    bool? success = loadedPendingTasks[completedTask.task.key]?.remove(completedTask);
    IndivCompCompletedTask? removed = loadedPendingTaskMap[completedTask.task.key]?.remove(completedTask.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success == true && removed != null && shrinkTotalCount)
      pendingTasksCount[completedTask.task.key] = pendingTasksCount[completedTask.task.key]! - 1;
  }

  IndivCompProfile({
    required this.comp,

    required this.active,
    required this.role,
    this.points,
    this.rank,

    required this.completedTasksAcceptedCount,
    required this.completedTasksPendingCount,
    required this.completedTasksRejectedCount,

    required this.pendingTasksCount,

  }): loadedCompletedTasks = [],
        loadedCompletedTaskMap = {},
        loadedPendingTasks = {},
        loadedPendingTaskMap = {};

  void update(IndivCompProfile updatedProfile){
    active = updatedProfile.active;
    role = updatedProfile.role;
    points = updatedProfile.points;
    rank = updatedProfile.rank;

    completedTasksAcceptedCount = updatedProfile.completedTasksAcceptedCount;
    completedTasksPendingCount = updatedProfile.completedTasksPendingCount;
    completedTasksRejectedCount = updatedProfile.completedTasksRejectedCount;

    pendingTasksCount = updatedProfile.pendingTasksCount;
  }

  static IndivCompProfile fromRespMap(Map respMap, IndivComp comp){

    // List<IndivCompCompletedTask> completedTasks = [];
    // if(respMap['completedTasks'] == null)
    //   completedTasks = [];
    // else {
    //   Map _complTasksRespMap = respMap['completedTasks'];
    //   for (String complTaskKey in _complTasksRespMap.keys as Iterable<String>)
    //     completedTasks.add(IndivCompCompletedTask.fromRespMap(_complTasksRespMap[complTaskKey], comp, key: complTaskKey));
    // }
    //
    // Map<String, List<IndivCompCompletedTask>> pendingTasks = {};
    // if(respMap['pendingTasks'] == null)
    //   pendingTasks = {};
    // else {
    //   Map _pendingComplTasksRespMap = respMap['pendingTasks'];
    //   for (String complTaskKey in _pendingComplTasksRespMap.keys as Iterable<String>) {
    //     IndivCompCompletedTask completedTask = IndivCompCompletedTask.fromRespMap(_pendingComplTasksRespMap[complTaskKey], comp, key: complTaskKey);
    //     if(!pendingTasks.containsKey(completedTask.task.key))
    //       pendingTasks[completedTask.task.key] = [];
    //     pendingTasks[completedTask.task.key]!.add(completedTask);
    //   }
    // }

    Map<String, int> completedTasksCount = (respMap['completedTasksCount']??{}).cast<String, int>();

    IndivCompProfile profile = IndivCompProfile(
      comp: comp,

      active: respMap['active']??(throw InvalidResponseError('active')),
      role: strToCompRole[respMap['role']??(throw InvalidResponseError('role'))]??(throw InvalidResponseError('role')),

      points: respMap['points'],
      rank: respMap['active']==true?ShowRankData.from(respMap):null,

      completedTasksAcceptedCount: completedTasksCount['accepted'],
      completedTasksPendingCount: completedTasksCount['pending'],
      completedTasksRejectedCount: completedTasksCount['rejected'],

      pendingTasksCount: ((respMap['pendingTasksCount']??{}) as Map).cast<String, int>(),
      // completedTasks: completedTasks,
      // pendingTasks: pendingTasks,
    );

    return profile;

  }

  static IndivCompProfile empty() => IndivCompProfile(
      comp: IndivComp.empty(),

      active: true,
      role: CompRole.OBSERVER,
      points: 0,
      rank: null,

      completedTasksAcceptedCount: 0,
      completedTasksPendingCount: 0,
      completedTasksRejectedCount: 0,

      pendingTasksCount: {}
  );

}
import 'package:harcapp/_common_classes/sorted_list.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/common.dart';

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

  final SortedList<IndivCompCompletedTask> loadedCompletedTasks;
  final Map<String, IndivCompCompletedTask> loadedCompletedTaskMap;

  static int completedTasksComparator(IndivCompCompletedTask t1, IndivCompCompletedTask t2){
    int dateResult = -compareText(t1.reqTime.toIso8601String(), t2.reqTime.toIso8601String());
    if(dateResult != 0) return dateResult;
    int keyResult = compareText(t1.key, t2.key);
    return keyResult;
  }

  void addLoadedCompletedTask(IndivCompCompletedTask complTask, {required bool onlyIfWithinLoaded, required bool increaseTotalCount}){
    if(isComplTaskWithinLoaded(complTask) || !onlyIfWithinLoaded) {
      loadedCompletedTasks.add(complTask);
      loadedCompletedTaskMap[complTask.key] = complTask;
    }

    if(!increaseTotalCount) return;

    switch(complTask.acceptState){
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
    addLoadedCompletedTasks(completedTasks, onlyIfWithinLoaded: false, increaseTotalCount: false);
  }

  void addLoadedCompletedTasks(List<IndivCompCompletedTask> completedTasks, {required bool onlyIfWithinLoaded, required bool increaseTotalCount}){
    for(IndivCompCompletedTask completedTask in completedTasks)
      addLoadedCompletedTask(completedTask, onlyIfWithinLoaded: onlyIfWithinLoaded, increaseTotalCount: increaseTotalCount);
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

  bool isComplTaskWithinLoaded(IndivCompCompletedTask complTask){
    if(loadedCompletedTasks.length == completedTasksCount) return true;
    if(loadedCompletedTasks.isEmpty) return false;
    IndivCompCompletedTask lastLoaded = loadedCompletedTasks.last;

    int result = completedTasksComparator(complTask, lastLoaded);

    return result < 0;
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

  }): loadedCompletedTasks = SortedList(completedTasksComparator),
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

  void adjustToOtherProfileChange(IndivCompProfile? otherProfileOld, IndivCompProfile? otherProfileNew){

    // This of this process in two steps:
    // 1. We take out the old other person from the ranking and adjust this rank accordingly.
    // 2. We put in the new other person into the ranking and adjust this rank accordingly.

    if(rank?.specificData?.showRank == null) return;
    int showRank = rank!.specificData!.showRank;

    if(otherProfileOld?.rank?.specificData?.showRank != null && otherProfileOld!.active){
      int otherShowRank = otherProfileOld.rank!.specificData!.showRank;
      // If smaller - self explanatory.
      if(otherShowRank < showRank) rank!.specificData!.showRank--;
      // If equal, it means the otherPersonsRank has disappeared, so this person's rank should go up with a smaller popularity.
      else if(otherShowRank == showRank){
        rank!.specificData!.showRank--;
        rank!.specificData!.popularity--;
      }
    }

    if(otherProfileNew?.rank?.specificData?.showRank != null && otherProfileNew!.active){
      int otherShowRank = otherProfileNew.rank!.specificData!.showRank;
      int? otherPoints = otherProfileNew.points;
      // If smaller - self explanatory.
      // If equal, it means the otherPersonsRank has gone up at the expense of this person's rank.
      if(otherShowRank <= showRank) rank!.specificData!.showRank++;
      // If smaller but points are equal, we must decrease this person's rank to match the other ones.
      else if(points != null && otherPoints == points){
        rank!.specificData!.showRank++;
        rank!.specificData!.popularity++;
      }
    }

  }

  IndivCompProfile copy() => IndivCompProfile(
    comp: comp,

    active: active,
    role: role,
    points: points,
    rank: rank?.copy(),

    completedTasksAcceptedCount: completedTasksAcceptedCount,
    completedTasksPendingCount: completedTasksPendingCount,
    completedTasksRejectedCount: completedTasksRejectedCount,

    pendingTasksCount: pendingTasksCount,
  );

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

  static IndivCompProfile empty({int? rank}) => IndivCompProfile(
      comp: IndivComp.empty(),

      active: true,
      role: CompRole.OBSERVER,
      points: 0,
      rank: rank==null?null:ShowRankData.fromShowRank(rank),

      completedTasksAcceptedCount: 0,
      completedTasksPendingCount: 0,
      completedTasksRejectedCount: 0,

      pendingTasksCount: {}
  );

}
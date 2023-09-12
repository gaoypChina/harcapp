import 'dart:async';

import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp_core/comm_classes/network.dart';

import 'models/indiv_comp.dart';

class IndivCompCompletedTasksLoaderListener extends SingleComputerApiListener<String>{

  final FutureOr<void> Function(List<IndivCompCompletedTask>, bool)? onCompletedTasksLoaded;

  const IndivCompCompletedTasksLoaderListener({
    super.onStart,
    super.onError,
    required super.onNoInternet,
    super.onForceLoggedOut,
    super.onServerMaybeWakingUp,
    super.onEnd,
    this.onCompletedTasksLoaded,
  });

}

class IndivCompCompletedTasksLoader extends SingleComputer<String?, IndivCompCompletedTasksLoaderListener>{

  @override
  String get computerName => 'IndivCompCompletedTasksLoader';

  late IndivComp _comp;
  String? taskKey;
  String? participKey;
  TaskAcceptState? acceptState;
  late int _pageSize;
  DateTime? _lastReqTime;


  IndivCompCompletedTasksLoader({
    required this.taskKey,
    required this.participKey,
    required this.acceptState
  });

  @override
  Future<bool> run({
    bool awaitFinish = false,
    IndivComp? comp,
    int pageSize = IndivCompCompletedTask.pageSize,
    DateTime? lastReqTime,
  }){
    assert(comp != null);
    _comp = comp!;
    _pageSize = pageSize;
    _lastReqTime = lastReqTime;
    return super.run(awaitFinish: awaitFinish);
  }

  @override
  Future<void> perform() async {
    if(!await isNetworkAvailable()) {
      for (IndivCompCompletedTasksLoaderListener listener in listeners)
        listener.onNoInternet?.call();
      return;
    }

    String? thisTaskKey = taskKey;
    String? thisParticipKey = participKey;
    TaskAcceptState? thisAcceptState = acceptState;

    await ApiIndivComp.getCompletedTasks(
        comp: _comp,
        taskKey: thisTaskKey,
        participKey: thisParticipKey,
        acceptState: thisAcceptState,
        pageSize: _pageSize,
        lastReqTime: _lastReqTime,
        onSuccess: (List<IndivCompCompletedTask> completedTasksPage){

          bool reloaded = _lastReqTime == null;

          if(thisParticipKey == null && thisAcceptState == TaskAcceptState.PENDING){
            if (reloaded)
              _comp.setAllLoadedPendingCompletedTasks(completedTasksPage);
            else
              _comp.addLoadedPendingCompletedTasks(completedTasksPage);
          }else if(thisParticipKey != null){
            if (reloaded)
              _comp.setAllLoadedCompletedTasksForParticip(thisParticipKey, completedTasksPage, increaseTotalCount: false);
            else
              _comp.addLoadedCompletedTasksForParticip(thisParticipKey, completedTasksPage, onlyIfWithinLoaded: false, increaseTotalCount: false);
          }

          for(IndivCompCompletedTasksLoaderListener listener in listeners)
            listener.onCompletedTasksLoaded?.call(completedTasksPage, reloaded);
        },
        onServerMaybeWakingUp: () async {
          for(IndivCompCompletedTasksLoaderListener listener in listeners)
            listener.onServerMaybeWakingUp?.call();

          return true;
        },
        onForceLoggedOut: () async {
          for(IndivCompCompletedTasksLoaderListener listener in listeners)
            listener.onForceLoggedOut?.call();

          return true;
        },
        onError: () => callError(null),
    );

  }

}
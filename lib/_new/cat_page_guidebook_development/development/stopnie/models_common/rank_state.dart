import 'package:flutter/material.dart';

abstract class RankTaskState{

  bool get completed;
  set completed(bool value);

  String? get note;
  set note(String? value);

  RankTaskState();

}

abstract class RankState<T extends RankTaskState>{

  bool get inProgress;
  set inProgress(bool value);

  bool get completed;
  set completed(bool value);

  DateTime? get completionDate;
  set completionDate(DateTime? value);

  @protected
  Map<String, T> get tasks;

  Iterable<T> get taskVals => tasks.values;

  T? task(String uid);

  RankState();

  bool get isReadyToComplete{
    for(T task in tasks.values)
      if(!task.completed) return false;

    return true;
  }

  int get completenessPercent{
    int complReqLen = 0;
    for(T task in tasks.values)
      complReqLen += task.completed?1:0;

    if(tasks.isEmpty) return -1;

    return (100*complReqLen/tasks.length).round();
  }

}
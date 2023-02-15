
import 'package:flutter/widgets.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_task.dart';


class RankGroupData{

  final String? title;
  final IconData? icon;
  final List<RankTaskData> taskData;

  const RankGroupData({this.title, this.icon, required this.taskData});

  RankGroup build(RankCat cat, int index){

    RankGroup group = RankGroup(this, cat, null, index);

    List<RankTask> tasks = [];
    for(int i=0; i<taskData.length; i++)
      tasks.add(taskData[i].build(group, i));

    group.tasks = tasks;

    return group;
  }

  RankGroup buildUnregistered(){

    List<RankTask> tasks = [];
    for(int i=0; i<taskData.length; i++)
      tasks.add(taskData[i].buildUnregistered());

    return RankGroup(this, null, tasks, null);
  }

}

class RankGroup{

  RankGroupData data;

  String? get title => data.title;
  IconData? get icon => data.icon;

  RankCat? cat;
  List<RankTask>? _tasks;
  List<RankTask>? get tasks => _tasks;
  set tasks(List<RankTask>? value){
    _tasks = value;
    _taskMap = {for (RankTask task in _tasks??[]) task.index: task};
  }
  Map<int?, RankTask> get taskMap => _taskMap;
  Map<int?, RankTask> _taskMap;
  int? index;

  RankGroup(this.data, this.cat, this._tasks, this.index)
      :_taskMap = {for (RankTask task in _tasks??[]) task.index: task};

}

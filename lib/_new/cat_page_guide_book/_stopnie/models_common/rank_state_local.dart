import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';

class RankTaskStateLocal extends RankTaskState{

  final RankStateLocal rankState;
  final String uid;

  RankTaskStateLocal(this.rankState, this.uid);

  String get taskComplMapKey => ShaPref.SHA_PREF_RANK_COMPLETED_REQ_MAP_(rankState.rank);
  String get taskNoteMapKey => ShaPref.SHA_PREF_RANK_REQ_NOTES_MAP_(rankState.rank);

  Map<String, bool?> get taskComplMap => shaPref!.getMap<String, bool?>(taskComplMapKey, {});
  Map<String, String?> get taskNoteMap => shaPref!.getMap<String, String?>(taskNoteMapKey, {});

  bool get completed{
    if(rankState.completed) return true;
    Map<String, bool?> reqComplMap = taskComplMap;
    return reqComplMap[uid]??false;
  }

  set completed(bool? value){
    Map<String, bool?> reqComplMap = taskComplMap;
    reqComplMap[uid] = value;
    shaPref!.setMap(taskComplMapKey, reqComplMap);
  }

  String get note{
    Map<String, String?> reqNoteMap = taskNoteMap;
    return reqNoteMap[uid]??'';
  }

  @override
  set note(String? value) {
    Map<String, String?> reqNoteMap = taskNoteMap;
    reqNoteMap[uid] = value;
    shaPref!.setMap(taskNoteMapKey, reqNoteMap);
  }

}

class RankStateLocal extends RankState<RankTaskStateLocal?>{

  final Rank rank;

  RankStateLocal(this.rank){

    Map<String, RankTaskStateLocal> _tasks = {};

    for(RankCat cat in rank.cats!)
      for(RankGroup group in cat.groups!)
        for(RankTask task in group.tasks!)
          _tasks[task.uid] = RankTaskStateLocal(this, task.uid);

    tasks = _tasks;

  }

  bool get inProgress => shaPref!.getBool(ShaPref.SHA_PREF_RANK_IN_PROGRESS_(rank), false);
  set inProgress(bool? value) => shaPref!.setBool(ShaPref.SHA_PREF_RANK_IN_PROGRESS_(rank), value!);

  DateTime? get completionDate => shaPref!.getDateTime(ShaPref.SHA_PREF_RANK_COMPLETED_DATE_(rank), null);
  set completionDate(DateTime? value) => shaPref!.setDateTime(ShaPref.SHA_PREF_RANK_COMPLETED_DATE_(rank), value);

  bool get completed => shaPref!.getBool(ShaPref.SHA_PREF_RANK_COMPLETED_(rank), false);
  set completed(bool? value) => shaPref!.setBool(ShaPref.SHA_PREF_RANK_COMPLETED_(rank), value!);

  @protected
  Map<String, RankTaskStateLocal>? tasks;

  int get taskCount => tasks!.length;

  RankTaskStateLocal? task(String uid) => tasks![uid];

}
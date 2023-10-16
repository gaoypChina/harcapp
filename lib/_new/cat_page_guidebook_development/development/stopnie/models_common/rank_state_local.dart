import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_task.dart';

class RankTaskStateLocal extends RankTaskState{

  final RankStateLocal rankState;
  final String uid;

  RankTaskStateLocal(this.rankState, this.uid);

  String get taskComplMapKey => ShaPref.SHA_PREF_RANK_COMPLETED_REQ_MAP_(rankState.rank);
  String get taskNoteMapKey => ShaPref.SHA_PREF_RANK_REQ_NOTES_MAP_(rankState.rank);

  Map<String, bool?> get taskComplMap => ShaPref.getMap<String, bool?>(taskComplMapKey, {});
  Map<String, String?> get taskNoteMap => ShaPref.getMap<String, String?>(taskNoteMapKey, {});

  @override
  bool get completed{
    if(rankState.completed) return true;
    Map<String, bool?> reqComplMap = taskComplMap;
    return reqComplMap[uid]??false;
  }

  @override
  set completed(bool? value){
    Map<String, bool?> reqComplMap = taskComplMap;
    reqComplMap[uid] = value;
    ShaPref.setMap(taskComplMapKey, reqComplMap);
  }

  @override
  String get note{
    Map<String, String?> reqNoteMap = taskNoteMap;
    return reqNoteMap[uid]??'';
  }

  @override
  set note(String? value) {
    Map<String, String?> reqNoteMap = taskNoteMap;
    reqNoteMap[uid] = value;
    ShaPref.setMap(taskNoteMapKey, reqNoteMap);
  }

}

class RankStateLocal extends RankState<RankTaskStateLocal>{

  final Rank rank;

  RankStateLocal(this.rank){

    Map<String, RankTaskStateLocal> tasks = {};

    for(RankCat cat in rank.cats!)
      for(RankGroup group in cat.groups!)
        for(RankTask task in group.tasks!)
          tasks[task.uid] = RankTaskStateLocal(this, task.uid);

    this.tasks = tasks;

  }

  @override
  bool get inProgress => ShaPref.getBool(ShaPref.SHA_PREF_RANK_IN_PROGRESS_(rank), false);
  @override
  set inProgress(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_RANK_IN_PROGRESS_(rank), value);

  @override
  DateTime? get completionDate => ShaPref.getDateTime(ShaPref.SHA_PREF_RANK_COMPLETED_DATE_(rank), null);
  @override
  set completionDate(DateTime? value) => ShaPref.setDateTime(ShaPref.SHA_PREF_RANK_COMPLETED_DATE_(rank), value);

  @override
  bool get completed => ShaPref.getBool(ShaPref.SHA_PREF_RANK_COMPLETED_(rank), false);
  @override
  set completed(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_RANK_COMPLETED_(rank), value);

  @override
  @protected
  late Map<String, RankTaskStateLocal> tasks;

  int get taskCount => tasks.length;

  @override
  RankTaskStateLocal? task(String uid) => tasks[uid];

}
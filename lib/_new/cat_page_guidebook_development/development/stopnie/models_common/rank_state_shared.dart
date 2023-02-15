import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state.dart';

class RankTaskStateShared extends RankTaskState {

  @override
  bool completed;
  @override
  String? note;

  RankTaskStateShared(this.completed, this.note);

  static RankTaskStateShared from(Map<String, dynamic> map) => RankTaskStateShared(
      map['completed'],
      map['note']
  );

}

class RankStateShared extends RankState<RankTaskStateShared>{

  String key;
  DateTime lastUpdateTime;

  @override
  bool inProgress;
  @override
  DateTime? completionDate;
  @override
  bool completed;

  @override
  @protected
  final Map<String, RankTaskStateShared> tasks;

  @override
  RankTaskStateShared task(String uid) => tasks[uid]??RankTaskStateShared(false, '');

  RankStateShared(this.key, this.lastUpdateTime, this.inProgress, this.completionDate, this.completed, this.tasks);

  static RankStateShared from(String key, DateTime lastUpdateTime, Map<String, dynamic> map){

    Map<String, RankTaskStateShared> tasks = {};
    Map<String, dynamic> taskRespMap = (map['tasks'] as Map) as Map<String, dynamic>;

    for(String taskMapKey in taskRespMap.keys)
      tasks[taskMapKey] = RankTaskStateShared.from(taskRespMap[taskMapKey]);

    return RankStateShared(
      key,
      lastUpdateTime,
      map['inProgress'],
      map['completionDate']==null?null:DateTime.tryParse(map['completionDate']),
      map['completed'],
      tasks,
    );

  }

  String serialize() => jsonEncode({
    'inProgress': inProgress,
    'completionDate': completionDate?.toIso8601String(),
    'completed': completed,
    'lastUpdateTime': lastUpdateTime.toIso8601String(),
    'tasks': tasks.map((key, value) => MapEntry(
        key,
        {'completed': value.completed, 'note': value.note}
    ))
  });

  static String _shaPrefSharedRankKey(String key) => ShaPref.SHA_PREF_SHARE_RANK_DUMP_(key);

  void dump() => ShaPref.setString(_shaPrefSharedRankKey(key), serialize());
  static bool dumpExists(String key) => ShaPref.exists(_shaPrefSharedRankKey(key));

  static RankStateShared? fromDump(String key){
    String? serialized = ShaPref.getStringOrNull(_shaPrefSharedRankKey(key));
    if(serialized == null) return null;
    Map map = jsonDecode(serialized);
    DateTime? dateTime = DateTime.tryParse(map['lastUpdateTime']);
    if(dateTime == null) return null;
    return RankStateShared.from(key, dateTime, jsonDecode(serialized));
  }

}
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_local.dart';

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
  String rankUniqName;
  DateTime lastUpdateTime;

  @override
  bool inProgress;
  @override
  DateTime? completionDate;
  @override
  bool completed;

  @override
  int get completenessPercent{
    // Q: Why can't the super.completenessPercent be used?
    // A: Because it only holds tasks that were edited, so the total task count
    // does not represent the true number of tasks in the rank.
    Rank rank = Rank.allMap[rankUniqName]!;
    int rankCompletedTasksCnt = 0;
    for(RankTaskStateShared task in tasks.values)
      rankCompletedTasksCnt += task.completed?1:0;
    return 100*rankCompletedTasksCnt~/(rank.state as RankStateLocal).taskCount;
  }

  @override
  @protected
  final Map<String, RankTaskStateShared> tasks;

  @override
  RankTaskStateShared task(String uid) => tasks[uid]??RankTaskStateShared(false, '');

  RankStateShared(this.key, this.rankUniqName, this.lastUpdateTime, this.inProgress, this.completionDate, this.completed, this.tasks);

  static RankStateShared fromRespMap(String key, String rankUniqName, DateTime lastUpdateTime, Map<String, dynamic> respMap){

    Map<String, RankTaskStateShared> tasks = {};
    Map<String, dynamic> taskRespMap = ((respMap['tasks']??(throw InvalidResponseError('tasks'))) as Map) as Map<String, dynamic>;

    for(String taskMapKey in taskRespMap.keys)
      tasks[taskMapKey] = RankTaskStateShared.from(taskRespMap[taskMapKey]);

    return RankStateShared(
      key,
      rankUniqName,
      lastUpdateTime,
      respMap['inProgress']??(throw InvalidResponseError('inProgress')),
      respMap['completionDate']==null?null:DateTime.tryParse(respMap['completionDate']),
      respMap['completed']??(throw InvalidResponseError('completed')),
      tasks,
    );

  }

  String serialize() => jsonEncode({
    'rankUniqName': rankUniqName,
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
    DateTime? dateTime = DateTime.tryParse(map['lastUpdateTime'])??(throw MissingDecodeParamError('lastUpdateTime'));;
    String rankUniqName = map['rankUniqName']??(throw MissingDecodeParamError('rankUniqName'));
    return RankStateShared.fromRespMap(key, rankUniqName, dateTime, jsonDecode(serialized));
  }

}
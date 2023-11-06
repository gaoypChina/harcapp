import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/date_format.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/data/all_spraw_books.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_task.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/common/rank_spraw_template.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/providers.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';


class SprawData{

  final String id;
  final String title;
  final int level;
  final String? comment;

  final List<String>? requirements;
  final List<String>? notesForLeaders;
  final bool tasksAreExamples;

  final List<SprawTaskData> taskData;

  SprawData({
    required this.id,
    required this.title,
    required this.level,
    this.comment,

    this.requirements,
    this.notesForLeaders,
    this.tasksAreExamples = false,

    required List<String> tasks,
  }): taskData = tasks.map((task) => SprawTaskData(task)).toList();

  Spraw build(SprawFamily group){

    Spraw spraw = Spraw(this, group, null);

    List<SprawTask> tasks = [];
    for(int i=0; i<taskData.length; i++)
      tasks.add(taskData[i].build(spraw, i));

    spraw.tasks = tasks;

    return spraw;
  }

}

class Spraw extends RankSprawTemplate<SprawGetResp>{

  static const String sepChar = '\$';

  static List<Spraw> get all{

    List<Spraw> spraws = [];
    for(SprawBook sprawBook in allSprawBooks)
      spraws.addAll(sprawBook.allSpraws);

    return spraws;
  }

  static Map<String, Spraw> allMap = {for (Spraw spraw in all) spraw.uniqName: spraw};

  static const String paramCompleted = 'completed';
  static const String paramCompletionDate = 'completionDate';
  static const String paramInProgress = 'inProgress';
  static const String paramTasks = 'task';

  String get uniqName =>
      sprawBook.id + Spraw.sepChar +
          group.id + Spraw.sepChar +
          family.id + Spraw.sepChar +
          id + Spraw.sepChar +
          level.toString();

  SprawData data;

  String get id => data.id;
  String get title => data.title;
  int get level => data.level;
  String? get comment => data.comment;

  List<String>? get requirements => data.requirements??family.requirements;
  List<String>? get notesForLeaders => data.notesForLeaders??family.notesForLeaders;
  bool get tasksAreExamples => data.tasksAreExamples;

  SprawBook get sprawBook => group.sprawBook;
  SprawGroup get group => family.group;
  SprawFamily family;

  List<SprawTask>? _tasks;
  List<SprawTask>? get tasks => _tasks;
  set tasks(List<SprawTask>? value){
    _tasks = value;
    _taskMap = {for (SprawTask task in _tasks??[]) task.uid: task};
  }

  Map<String, SprawTask> _taskMap;

  Spraw(this.data, this.family, _tasks): _taskMap = {for (SprawTask task in _tasks??[]) task.uid: task};

  bool get iconPathWithFailmyId => sprawBook.iconPathWithFamilyId;
  bool get iconPathWithLevel => sprawBook.iconPathWithLevel;
  bool get iconBlackAndWightOnly => sprawBook.iconBlackAndWightOnly;

  String get iconPath{

    String path = 'assets/spraw/${sprawBook.id}/${group.id}';

    if(iconPathWithFailmyId)
      path += '/${family.id}';

    if(iconPathWithLevel)
      path += '/${level}_$id.svg';
    else
      path += '/$id.svg';

    return path;
  }

  bool get savedInOmega => SavedSprawFolder().sprawUIDs.contains(uniqName);
  void changeSaved(BuildContext context, {bool? value, bool localOnly = false}){
    inProgress = value;

    setSingleState(paramInProgress, SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly) synchronizer.post();

    SprawSavedListProvider.notify_(context);
    SprawProvider.notify_(context);
  }

  set _savedInOmega(bool value) => SavedSprawFolder().changeSavedInOmega(uniqName, value: value);

  void changeSavedInOmega(BuildContext context, {bool? value}){
    value ??= !savedInOmega;
    _savedInOmega = value;
    SprawSavedListProvider.notify_(context);
    SprawProvider.notify_(context);
  }

  Map<String, bool?> get taskComplMap => ShaPref.getMap<String, bool?>(ShaPref.SHA_PREF_SPRAW_COMPLETED_REQ_MAP_(uniqName), {});
  static List<String> get inProgressList => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_LIST, []);
  static List<String> get completedList => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_COMPLETED_LIST, []);

  static set inProgressList(List<String> values) => ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_LIST, values);
  static set completedList(List<String> values) => ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_COMPLETED_LIST, values);

  @override
  bool get inProgress => ShaPref.getBool(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_(uniqName), false);
  @override
  @protected
  set inProgress(bool? value){
    List<String> items = inProgressList;

    value ??= !inProgress;

    if (value) {
      if (!items.contains(uniqName)) items.insert(0, uniqName);
    } else
      items.remove(uniqName);

    ShaPref.setBool(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_(uniqName), value);
    ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_LIST, items);
  }
  @override
  void changeInProgress(BuildContext context, {bool? value, bool localOnly = false}){
    inProgress = value;

    setSingleState(paramInProgress, SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly) synchronizer.post();

    SprawInProgressListProvider.notify_(context);
    SprawProvider.notify_(context);

  }

  @override
  DateTime? get completionDate => ShaPref.getDateTime(ShaPref.SHA_PREF_SPRAW_COMPLETED_DATE_(uniqName), null);
  @override
  @protected
  set completionDate(DateTime? value) => ShaPref.setDateTime(ShaPref.SHA_PREF_SPRAW_COMPLETED_DATE_(uniqName), value);
  @override
  void setCompletionDate(DateTime value, {localOnly = false}){
    completionDate = value;
    setSingleState(paramCompletionDate, SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly) synchronizer.post();
  }

  @override
  bool get completed => ShaPref.getBool(ShaPref.SHA_PREF_SPRAW_COMPLETED_(uniqName), false);
  @override
  @protected
  set completed(bool? value){
    List<String> items = completedList;

    value ??= !completed;

    if (value) {
      if (!items.contains(uniqName)) items.insert(0, uniqName);
    } else
      items.remove(uniqName);

    ShaPref.setBool(ShaPref.SHA_PREF_SPRAW_COMPLETED_(uniqName), value);
    ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_COMPLETED_LIST, items);
  }
  @override
  void changeCompleted(BuildContext context, {bool? value, localOnly = false}){
    completed = value;

    if(completed)
      changeInProgress(context, value: false, localOnly: true);

    setSingleState(paramCompleted, SyncableParamSingleMixin.stateNotSynced);
    if(!localOnly) synchronizer.post();

    SprawCompletedListProvider.notify_(context);
    SprawProvider.notify_(context);
  }

  @override
  bool get isReadyToComplete{
    int reqLen = tasks!.length;
    int complReqLen = 0;
    for(bool? value in taskComplMap.values)
      complReqLen += value!?1:0;

    return reqLen == complReqLen;
  }

  @override
  int get completenessPercent{
    int reqLen = tasks!.length;
    int complReqLen = 0;
    for(bool? value in taskComplMap.values)
      complReqLen += value!?1:0;

    return completed?100:(100*complReqLen/reqLen).round();
  }

  static Spraw? fromUID(String UID){

    List<String> parts = UID.split(Spraw.sepChar);

    if(parts.length < 5) return null;

    String sprawBookId = parts[0];
    String sprawGroupId = parts[1];
    String sprawFamilyId = parts[2];
    String sprawId = parts[3];
    int sprawLevel = int.tryParse(parts[4])??0;

    SprawBook? sprawBook = SprawBookData.getById(sprawBookId);

    if(sprawBook == null) return null;

    SprawGroup? group;

    for(SprawGroup _group in sprawBook.groups!)
      if(_group.id == sprawGroupId) {
        group = _group;
        break;
      }

    if(group == null)
      return null;

    for(SprawFamily family in group.families!)
      if(family.id == sprawFamilyId)
        for(Spraw spraw in family.spraws!)
          if(spraw.id == sprawId && spraw.level == sprawLevel)
            return spraw;

    return null;

  }

  static const String syncClassId = 'spraw';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => SyncGetRespNode.sprawNode;

  @override
  String get paramId => uniqName;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: paramInProgress,
      value: () => inProgress,
    ),

    SyncableParamSingle(
      this,
      paramId: paramCompleted,
      value: () => completed,
    ),

    SyncableParamSingle(
      this,
      paramId: paramCompletionDate,
      value: () => completionDate==null?null:formatDate(completionDate!),
    ),

    SyncableParamGroup(
      this,
      paramId: paramTasks,
      childParams: tasks!,
    ),

  ];

  @override
  void applySyncGetResp(SprawGetResp resp) {
    inProgress = resp.inProgress;
    completed = resp.completed;
    completionDate = resp.completionDate;
    for(String taskKey in resp.task.keys)
      _taskMap[taskKey]!.applySyncGetResp(resp.task[taskKey]!);
  }

}
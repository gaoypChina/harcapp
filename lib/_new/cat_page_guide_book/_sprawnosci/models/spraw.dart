import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_get_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/all_spraw_books.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhp_harc_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhp_wodne_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhr_harc_c.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhr_harc_d.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_task.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/rank_spraw_template.dart';
import 'package:harcapp/_new/cat_page_guide_book/providers.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../../sync/syncable_new.dart';

class SprawData{

  final String id;
  final String title;
  final String level;
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

  static const String PARAM_COMPLETED = 'completed';
  static const String PARAM_COMPLETION_DATE = 'completionDate';
  static const String PARAM_IN_PROGRESS = 'inProgress';
  static const String PARAM_TASKS = 'task';

  String get uniqName =>
      sprawBook.id + Spraw.sepChar +
      group.id! + Spraw.sepChar +
      family.id + Spraw.sepChar +
      id + Spraw.sepChar +
      level;

  SprawData data;

  String get id => data.id;
  String get title => data.title;
  String get level => data.level;
  String? get comment => data.comment;

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

  String get iconPath => 'assets/spraw/${sprawBook.id}/${group.id}/${family.id}/${level}_$id.svg';

  bool get savedInOmega => SprawFolder.omega.sprawUIDs.contains(uniqName);
  set _savedInOmega(bool value) {
    if (value)
      SprawFolder.omega.add(uniqName);
    else
      SprawFolder.omega.remove(uniqName);
  }

  void changeSavedInOmega(BuildContext context, String folderName, {bool? value}){
    List<String> sprawUIDs = SprawFolder.getSprawUIDs(folderName);

    value ??= !savedInOmega;

    if (value) {
      if (!sprawUIDs.contains(uniqName)) sprawUIDs.insert(0, uniqName);
    } else
      sprawUIDs.remove(uniqName);

    _savedInOmega = value;

    SprawFolder.setSprawUIDs(folderName, sprawUIDs);

    Provider.of<SprawSavedListProv>(context, listen: false).notify();
  }

  Map<String, bool?> get taskComplMap => ShaPref.getMap<String, bool?>(ShaPref.SHA_PREF_SPRAW_COMPLETED_REQ_MAP_(this), {});
  static List<String> get inProgressList => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_LIST, []);
  static List<String> get completedList => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_COMPLETED_LIST, []);

  @override
  bool get inProgress => ShaPref.getBool(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_(this), false);
  @override
  @protected
  set inProgress(bool? value){
    List<String> items = inProgressList;

    value ??= !inProgress;

    if (value) {
      if (!items.contains(uniqName)) items.insert(0, uniqName);
    } else
      items.remove(uniqName);

    ShaPref.setBool(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_(this), value);
    ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_LIST, items);
  }
  @override
  void changeInProgress(BuildContext context, {bool? value, bool localOnly = false}){
    inProgress = value;

    setSingleState(PARAM_IN_PROGRESS, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();

    Provider.of<SprawInProgressListProv>(context, listen: false).notify();

  }

  @override
  DateTime? get completionDate => ShaPref.getDateTime(ShaPref.SHA_PREF_SPRAW_COMPLETED_DATE_(this), null);
  @override
  @protected
  set completionDate(DateTime? value) => ShaPref.setDateTime(ShaPref.SHA_PREF_SPRAW_COMPLETED_DATE_(this), value);
  @override
  void setCompletionDate(DateTime value, {localOnly = false}){
    completionDate = value;
    setSingleState(PARAM_COMPLETION_DATE, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();
  }

  @override
  bool get completed => ShaPref.getBool(ShaPref.SHA_PREF_SPRAW_COMPLETED_(this), false);
  @override
  @protected
  set completed(bool? value){
    List<String> items = completedList;

    value ??= !completed;

    if (value) {
      if (!items.contains(uniqName)) items.insert(0, uniqName);
    } else
      items.remove(uniqName);

    ShaPref.setBool(ShaPref.SHA_PREF_SPRAW_COMPLETED_(this), value);
    ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_COMPLETED_LIST, items);
  }
  @override
  void changeCompleted(BuildContext context, {bool? value, localOnly = false}){
    completed = value;

    if(completed)
      changeInProgress(context, value: false, localOnly: true);

    setSingleState(PARAM_COMPLETED, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();

    Provider.of<SprawCompletedListProv>(context, listen: false).notify();

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
    String sprawBookId = parts[0];
    String sprawGroupId = parts[1];
    String sprawFamilyId = parts[2];
    String sprawId = parts[3];

    SprawBook sprawBook;

    switch(sprawBookId){
      case SprawBookData.ZHP_HARC_OLD_ID:
        sprawBook = sprawBookZHPOld;
        break;
      case SprawBookData.ZHP_HARC_OLD_WOD_ID:
        sprawBook = sprawBookZHPWodneOld;
        break;
      case SprawBookData.ZHR_HARC_C:
        sprawBook = sprawBookZHRC;
        break;
      case SprawBookData.ZHR_HARC_D:
        sprawBook = sprawBookZHRD;
        break;
      default:
        return null;
    }

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
          if(spraw.id == sprawId)
            return spraw;

    return null;

  }

  static const String syncClassId = 'spraw';

  //@override
  //SyncableParam get parentParam => RootSyncable(syncClassId);

  @override
  String get paramId => uniqName;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
        this,
        paramId: PARAM_IN_PROGRESS,
        value_: () => inProgress,
    ),

    SyncableParamSingle(
        this,
        paramId: PARAM_COMPLETED,
        value_: () => completed,
    ),

    SyncableParamSingle(
      this,
      paramId: PARAM_COMPLETION_DATE,
      value_: () => completionDate==null?null:DateFormat('yyyy-MM-dd').format(completionDate!),
    ),

    SyncableParamGroup(
        this,
        paramId: PARAM_TASKS,
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
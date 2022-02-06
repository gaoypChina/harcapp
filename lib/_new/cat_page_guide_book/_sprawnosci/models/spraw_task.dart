import 'package:flutter/src/widgets/framework.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/sync_resp_body/spraw_task_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/task_data.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:provider/provider.dart';

class SprawTaskData{

  final String text;

  const SprawTaskData(this.text);

  SprawTask build(Spraw spraw, int index){
    return SprawTask(this, spraw, index);
  }

}

class SprawTask extends SyncableItem<SprawTaskResp> implements TaskData{

  static const String SEP_CHAR = '%';

  static const String PARAM_COMPLETED = 'completed';
  static const String PARAM_NOTE = 'note';

  SprawBook get sprawBook => group.sprawBook;
  SprawGroup get group => family.group;
  SprawFamily get family => spraw.family;

  SprawTaskData data;

  String get text => data.text;

  Spraw spraw;
  int index;

  SprawTask(this.data, this.spraw, this.index);

  @override
  bool get completed{
    if(spraw.completed) return true;
    Map<String, bool> taskComplMap = spraw.taskComplMap;
    return taskComplMap[index.toString()]??false;
  }

  set _completed(bool value){
    Map<String, bool> reqComplMap = spraw.taskComplMap;
    reqComplMap[index.toString()] = value;
    shaPref.setMap(ShaPref.SHA_PREF_SPRAW_COMPLETED_REQ_MAP_(spraw), reqComplMap);
  }
  
  @override
  void setCompleted(BuildContext context, bool completed){
    _completed = completed;
    setSyncState({PARAM_COMPLETED: SyncableParamSingle.STATE_NOT_SYNCED});
    synchronizer.post();
    Provider.of<SprawInProgressListProv>(context, listen: false).notify();
  }

  @override
  String get note{
    Map<String, String> reqNoteMap = shaPref.getMap<String, String>(ShaPref.SHA_PREF_SPRAW_REQ_NOTES_MAP_(spraw), {});
    return reqNoteMap[index.toString()]??'';
  }

  set _note(String note){
    Map<String, String> reqNoteMap = shaPref.getMap<String, String>(ShaPref.SHA_PREF_SPRAW_REQ_NOTES_MAP_(spraw), {});
    reqNoteMap[index.toString()] = note;
    shaPref.setMap(ShaPref.SHA_PREF_SPRAW_REQ_NOTES_MAP_(spraw), reqNoteMap);
  }

  @override
  void setNote(BuildContext context, String note){
    _note = note;
    setSyncState({PARAM_NOTE: SyncableParamSingle.STATE_NOT_SYNCED});
    synchronizer.post(aggregateDelay: SynchronizerEngine.aggregateTextInputDuration);
  }

  String get uid =>
      spraw.uniqName + SEP_CHAR +
      index.toString();

  static const String REQ_GROUP = 'task';

  @override
  String get classId => REQ_GROUP;

  @override
  String get objectId => uid;

  @override
  List<SyncableParam> get syncParams => [

    SyncableParam.single(
        this,
        paramId: PARAM_COMPLETED,
        value: () async => await completed,
        notNone: () => false
    ),

    SyncableParam.single(
      this,
      paramId: PARAM_NOTE,
      value: () async => await note,
      notNone: () => false
    ),

  ];

  @override
  void applySyncResp(SprawTaskResp resp) {
    _completed = resp.completed;
    _note = resp.note;
  }

}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/task_data.dart';
import 'package:harcapp/_new/cat_page_home/providers.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:provider/provider.dart';

import '../../../../sync/syncable_new.dart';

class RankTaskData{

  final String text;
  final String? example;
  final String? description;
  final bool checkable;

  const RankTaskData({required this.text, this.example, this.description, this.checkable = true});

  RankTask build(RankGroup group, int index) => RankTask(this, group, index);

  RankTask buildUnregistered() => RankTask(this, null, null);

}

class RankTask extends SyncableParamGroup_ with SyncNode<RankTaskResp> implements TaskData{

  static const String PARAM_COMPLETED = 'completed';
  static const String PARAM_NOTE = 'note';

  RankTaskState? get taskState => rank!.state.task(uid);

  @override
  bool? get completed => taskState!.completed;

  @override
  void setCompleted(BuildContext context, bool? value){
    taskState!.completed = value;
    setSingleState(PARAM_COMPLETED, SyncableParamSingle_.STATE_NOT_SYNCED);
    synchronizer.post();
    Provider.of<RankProv>(context, listen: false).notify();
  }

  @override
  String? get note => taskState!.note;

  @override
  void setNote(BuildContext context, String value){
    taskState!.note = value;
    setSingleState(PARAM_NOTE, SyncableParamSingle_.STATE_NOT_SYNCED);
    synchronizer.post(aggregateDelay: SynchronizerEngine.aggregateTextInputDuration);
  }

  String get text => data.text;
  String? get example => data.example;
  String? get description => data.description;
  bool get checkable => data.checkable;

  Org get org => rank!.org;
  Rank? get rank => catExt!.rank;
  RankCat? get catExt => group!.cat;

  RankTaskData data;
  RankGroup? group;
  int? index;

  RankTask(this.data, this.group, this.index);

  String get old_uid =>
      rank!.version.toString() + '_' +
      rank!.org.toString() + '_' +
      rank!.id +
      catExt!.index.toString() + '_' +
      group!.index.toString() + '_' +
      index.toString();


  String get uid =>
      rank!.uniqRankName + uidSep +
      catExt!.index.toString() + uidSep +
      group!.index.toString() + uidSep +
      index.toString();

  static const String uidSep = '%';

  @override
  String get paramId => uid;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: PARAM_COMPLETED,
      value_: () => completed,
    ),

    SyncableParamSingle(
        this,
        paramId: PARAM_NOTE,
        value_: () => note,
    ),

  ];

  @override
  void applySyncGetResp(RankTaskResp resp) {
    taskState!.completed = resp.completed;
    taskState!.note = resp.note;
  }

}

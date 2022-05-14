import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/sync_resp_body/sync_entity_resp.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/syncable_new.dart';

abstract class RankSprawTemplate<T extends SyncGetResp?> extends SyncableParamGroup_ with SyncNode<T>{

  bool? get inProgress;
  @protected
  set inProgress(bool? value);
  void changeInProgress(BuildContext context, {bool? value, bool localOnly = false});

  DateTime? get completionDate;
  @protected
  set completionDate(DateTime? value);
  void setCompletionDate(DateTime value, {localOnly = false});

  bool? get completed;
  @protected
  set completed(bool? value);
  void changeCompleted(BuildContext context, {bool? value, bool localOnly = false});

  bool get isReadyToComplete;

  int get completenessPercent;

}
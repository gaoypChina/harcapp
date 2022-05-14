
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/task_widget.dart';
import 'package:harcapp_core/dimen.dart';

class RankTaskWidget extends TaskWidget<RankTask>{

  @override
  final RankTask task;

  @override
  Color get color => RankData.colors[rank!.data]!.avgColor(false);

  @override
  String get text => task.text;

  @override
  String? get initNote => task.note;

  @override
  String? get example => task.example;

  @override
  String? get description => task.description;

  @override
  bool? get inProgress => rank!.inProgress;

  @override
  bool? get completed => rank!.completed;

  @override
  bool get isReadyToComplete => rank!.isReadyToComplete;

  @override
  bool get editable => rank!.state is RankStateLocal;

  RankGroup? get group => task.group;
  RankCat? get cat => group!.cat;
  Rank? get rank => cat!.rank;

  final int? dispIndex;
  final bool hideIndex;

  @override
  final void Function(RankTask task, bool? selected)? onCompletedChanged;

  const RankTaskWidget(this.task, this.dispIndex, {this.hideIndex=false, required this.onCompletedChanged});

  static Widget separator(BuildContext context, int index) => SizedBox(height: 2*Dimen.ICON_MARG);

}
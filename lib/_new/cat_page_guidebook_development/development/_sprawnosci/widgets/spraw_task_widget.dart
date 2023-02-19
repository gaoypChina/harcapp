import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/common/task_widget.dart';

import '../models/spraw_book.dart';
import '../models/spraw_task.dart';

class SprawTaskWidget extends TaskWidget<SprawTask>{

  @override
  final SprawTask task;

  @override
  final bool isExample;

  @override
  Color get color => SprawBookData.mapIdColorMap[task.sprawBook.id]!.avgColor(false);

  @override
  bool get completed => task.spraw.completed;

  @override
  int get dispIndex => task.index + 1;

  @override
  bool get inProgress => task.spraw.inProgress;

  @override
  String get initNote => task.note;

  @override
  bool get isReadyToComplete => task.spraw.isReadyToComplete;

  @override
  String get text => task.text;

  @override
  String? get description => null;

  @override
  String? get example => null;

  @override
  final bool previewOnly;

  @override
  bool get hideIndex => false;

  @override
  bool get editable => true;

  @override
  final void Function(SprawTask task, bool completed)? onCompletedChanged;

  const SprawTaskWidget(this.task, {this.isExample = false, this.onCompletedChanged, this.previewOnly = false, super.key});

}
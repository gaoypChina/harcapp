import 'package:flutter/material.dart';

abstract class TaskData{

  String? get note;
  void setNote(BuildContext context, String note);

  bool? get completed;
  void setCompleted(BuildContext context, bool? completed);

}
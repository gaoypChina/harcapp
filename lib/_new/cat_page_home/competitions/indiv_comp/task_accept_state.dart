import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum TaskAcceptState{
  ACCEPTED, PENDING, REJECTED
}

Map<String, TaskAcceptState> strToTaskAcceptState = {
  'ACCEPTED': TaskAcceptState.ACCEPTED,
  'PENDING': TaskAcceptState.PENDING,
  'REJECTED': TaskAcceptState.REJECTED,
};

Map<TaskAcceptState, String> taskAcceptStateToStr = {
  TaskAcceptState.ACCEPTED: 'ACCEPTED',
  TaskAcceptState.PENDING: 'PENDING',
  TaskAcceptState.REJECTED: 'REJECTED',
};

String taskAcceptStateToName(TaskAcceptState state){
  if(state == TaskAcceptState.ACCEPTED) return 'Zatwierdzone';
  else if(state == TaskAcceptState.PENDING) return 'Oczekiwanie';
  else if(state == TaskAcceptState.REJECTED) return 'Odrzucone';
  else return null;
}

IconData taskAcceptStateIcon(TaskAcceptState state){
  if(state == TaskAcceptState.ACCEPTED) return MdiIcons.check;
  else if(state == TaskAcceptState.PENDING) return MdiIcons.clockOutline;
  else if(state == TaskAcceptState.REJECTED) return MdiIcons.close;
  else return null;
}

Color taskAcceptStateColor(TaskAcceptState state){
  if(state == TaskAcceptState.ACCEPTED) return Colors.teal;
  else if(state == TaskAcceptState.PENDING) return Colors.orangeAccent;
  else if(state == TaskAcceptState.REJECTED) return Colors.red;
  else return null;
}
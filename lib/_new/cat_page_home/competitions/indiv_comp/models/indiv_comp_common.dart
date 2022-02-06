import 'package:flutter/cupertino.dart';

import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';

import 'indiv_comp_task.dart';
/*
class IndivCompCommon{

  String name;
  final String group;
  IconData get icon => CommonIconData.ALL[iconKey];
  String iconKey;
  CommonColorData get colors => CommonColorData.ALL[colorsKey];
  String colorsKey;
  DateTime startTime;
  DateTime endTime;
  final List<IndivCompTask> tasks;
  final Map<String, IndivCompTask> taskMap;

  IndivCompCommon({
    @required this.name,
    this.group,
    @required this.iconKey,
    @required this.colorsKey,
    @required this.startTime,
    this.endTime,
    @required this.tasks,
  }): taskMap = {for (var task in tasks) task.key: task};

  static IndivCompCommon fromResponse(Map resp){

    List<IndivCompTask> tasks = List.filled((resp['tasks'] as List).length, null);

    Map<String, IndivCompTask> taskMap = {};
    for (Map map in resp['tasks']) {
      tasks[map['position']] = IndivCompTask.fromMap(map);
    }
    IndivCompCommon profile = IndivCompCommon(
        name: resp['name'],
        colorsKey: resp['colors_key'],
        iconKey: resp['icon_key'],
        startTime: DateTime.tryParse(resp['start_time']),
        endTime: DateTime.tryParse(resp['end_time'] ?? ''),
        tasks: tasks,
    );

    return profile;

  }

}

 */
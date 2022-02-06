import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';

import '../comp_role.dart';

class IndivCompDetails{

  /*
  final String key;
  final List<IndivCompParticipFull> particips;
  final Map<String, IndivCompParticipFull> participMap;
  bool overviewMode;
  final Map<IndivCompParticipFull, List<IndivCompTaskCompl>> completedTasks;

  IndivCompDetails({
    @required this.key,

    @required this.particips,
    @required this.overviewMode,
    @required this.completedTasks,
  }):participMap = {for (var particip in particips) particip.key: particip};

  static IndivCompDetails fromResponse(Map resp, List<IndivCompTask> allTasks){

    if(resp == null) return null;

    List<IndivCompParticipFull> particips = [];
    for (Map participMap in resp['users'])
      particips.add(IndivCompParticipFull.fromResponse(participMap));

    Map<IndivCompParticipFull, List<IndivCompTaskCompl>> _completedTasks = {};

    Map complTasksResp = resp['completed_tasks'];

    for(String participKey in complTasksResp.keys){
      List<IndivCompTaskCompl> tasks = [];

      List complTaskRespList = complTasksResp[participKey];
      for(Map complTaskResp in complTaskRespList)
        tasks.add(IndivCompTaskCompl.fromResponse(allTasks, complTaskResp));

      IndivCompParticipFull particip = particips.firstWhere((_particip) => _particip.key == participKey);
      _completedTasks[particip] = tasks;
    }


    IndivCompDetails competition = IndivCompDetails(
        key: resp['_key'],
        particips: particips,
        overviewMode: resp['overview_mode'],
        completedTasks: _completedTasks
        // tu zastannowić się jak zrobić, żeby tu była mapa z użytkownikami i faktycznymi complete taskami, a nie z ich ID.
    );

    return competition;

  }
  */
}
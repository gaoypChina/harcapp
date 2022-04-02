import 'package:flutter/cupertino.dart';

import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/account/account.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'indiv_comp_profile.dart';
import 'indiv_comp_task.dart';

/*
"key": "500129",
    "name": "Uroczysko",
    "iconKey": "deathStar",
    "colorsKey": "raspberry",
    "startTime": "2021-09-12T19:31:06",
    "endTime": null,
    "overviewMode": false,
 */

class IndivCompAward{
  int rangeFrom;
  int rangeTo;
  String award;

  String get place{
    String _place;
    if(rangeFrom == rangeTo) _place = '$rangeFrom';
    else _place = '$rangeFrom - $rangeTo';

    return _place;
  }

  IndivCompAward(this.rangeFrom, this.rangeTo, this.award);

}

class IndivComp{

  static List<IndivCompTask> previewTasks = [

    const IndivCompTask(
        key: null,
        title: 'Obecność',
        description: 'Obecność na zbiórce lub wyjeździe.',
        points: 1,
        position: 0,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: null,
        title: 'Punktualność',
        description: 'Stawienie się na zbiórce na czas.',
        points: 1,
        position: 1,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: null,
        title: 'Umundurowanie',
        description: 'Obecność w pełnym umundurowaniu.',
        points: 1,
        position: 2,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: null,
        title: 'Sprawność',
        description: 'Zdobycie sprawności.',
        points: 3,
        position: 3,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: null,
        title: 'Stopień',
        description: 'Zdobycie stopnia.',
        points: 10,
        position: 4,
        state: TaskState.OPEN
    ),
  ];

  static List<String> previewAwards = [
    'Nóż',
    'Hamak',
    'Menażka',
    'Krzesiwo',
    null,
    null
  ];

  static const int MAX_LEN_TITLE = 64;
  static const int MAX_LEN_COLORS_KEY = 42;
  static const int MAX_LEN_ICONS_KEY = 42;
  static const int MAX_LEN_AWARD = 64;

  static List<IndivComp> _all;
  static Map<String, IndivComp> _allMap;

  static List<IndivComp> get all => _all;

  static List<IndivComp> get allPinned{
    List<IndivComp> comps = [];
    for(IndivComp comp in _all)
      if(comp.pinned)
        comps.add(comp);

    return comps;
  }

  static silentInit(List<IndivComp> comps){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all.clear();
    _allMap.clear();

    _all.addAll(comps);
    _allMap = {for (IndivComp comp in comps) comp.key: comp};

  }

  static init(BuildContext context, List<IndivComp> comps){

    silentInit(comps);

    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  static addToAll(BuildContext context, IndivComp comp){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all.add(comp);
    _allMap[comp.key] = comp;

    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  static updateInAll(BuildContext context, IndivComp comp){
    IndivComp oldComp = _allMap[comp.key];
    if(oldComp == null){
      addToAll(context, comp);
      return;
    }

    int index = _all.indexOf(oldComp);
    _all.removeAt(index);
    _all.insert(index, comp);
    _allMap[comp.key] = comp;

    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  static removeFromAll(BuildContext context, IndivComp comp){
    if(_all == null)
      return;

    _all.remove(comp);
    _allMap.remove(comp.key);

    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  static clear(){
    if(_all == null)
      return;
    _all.clear();
    _allMap.clear();
  }

  String key;
  String name;

  IconData get icon => CommonIconData.ALL[iconKey];
  String iconKey;

  CommonColorData get colors => CommonColorData.ALL[colorsKey];
  String colorsKey;

  DateTime startTime;
  DateTime endTime;

  bool overviewMode;

  String shareCode;
  bool shareCodeSearchable;

  IndivCompProfile get profile => participMap[AccountData.key].profile;

  final List<IndivCompParticip> particips;
  final Map<String, IndivCompParticip> participMap;

  List<IndivCompTask> tasks;
  Map<String, IndivCompTask> taskMap;

  List<IndivCompAward> awards;

  bool get pinned => shaPref.getBool(ShaPref.SHA_PREF_INDIV_COMP_PINNED_(key), true);
  void setPinned(BuildContext context, bool value){
    shaPref.setBool(ShaPref.SHA_PREF_INDIV_COMP_PINNED_(key), value);
    Provider.of<IndivCompListProvider>(context).notify();
  }

  void reversePinned(BuildContext context){
    shaPref.setBool(ShaPref.SHA_PREF_INDIV_COMP_PINNED_(key), !pinned);
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  void handleRanks(Map<String, Tuple3<int, int, Tuple2<double, double>>> ranks){

    for(String participKey in ranks.keys) {
      participMap[participKey].profile.showRank = ranks[participKey].item1;
      participMap[participKey].profile.rankPopularity = ranks[participKey].item2;
      participMap[participKey].profile.showRankRange = ranks[participKey].item3;
    }

    particips.sort((p1, p2) => p1.profile.showRank - p2.profile.showRank);

    if(!profile.active) return;
    String thisParticipKey = AccountData.key;
    if(!ranks.containsKey(thisParticipKey)) return;

    profile.showRank = ranks[thisParticipKey].item1;
    profile.rankPopularity = ranks[thisParticipKey].item2;
    profile.showRankRange = ranks[thisParticipKey].item3;
  }

  void updateParticips(BuildContext context, List<IndivCompParticip> allParticips){

    for(IndivCompParticip particip in allParticips) {
      int index = particips.indexOf(participMap[particip.key]);
      particips.removeAt(index);
      particips.insert(index, particip);
      participMap[particip.key] = particip;
    }

    // String thisParticipKey = AccSecData.key;
    // if(participMap.containsKey(thisParticipKey))
    //  profile = participMap[thisParticipKey].profile;

    Provider.of<IndivCompParticipsProvider>(context, listen: false).notify();
    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  void addParticips(BuildContext context, List<IndivCompParticip> allParticips){

    for(IndivCompParticip particip in allParticips) {
      particips.add(particip);
      participMap[particip.key] = particip;
    }

    Provider.of<IndivCompParticipsProvider>(context, listen: false).notify();
    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  void removeParticipByKey(BuildContext context, List<String> participKeys){

    particips.removeWhere((particip) => participKeys.contains(particip.key));
    for(String participKey in participKeys) participMap.remove(participKey);

    Provider.of<IndivCompParticipsProvider>(context, listen: false).notify();
    Provider.of<IndivCompProvider>(context, listen: false).notify();
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  void removeComplTask(BuildContext context, String participKey, String complTaskKey){
    participMap[participKey].profile.removeCompletedTaskByKey(complTaskKey);

    Provider.of<ComplTasksProvider>(context, listen: false).notify();
  }

  void addPoints(String key, int points) => setPoints(key, participMap[key].profile.points + points);
  void setPoints(String key, int points){
    participMap[key].profile.points = points;
  }
  void _setRank(String key, int rank){
    participMap[key].profile.showRank = rank;
  }

  IndivComp({
    @required this.key,
    @required this.name,
    @required this.iconKey,
    @required this.colorsKey,
    @required this.startTime,
    this.endTime,
    @required this.overviewMode,

    // @required this.profile,

    @required this.particips,

    @required this.tasks,
    @required this.awards,

    @required this.shareCode,
    @required this.shareCodeSearchable,

  }): taskMap = {for (var task in tasks) task.key: task},
        participMap = {for (var particip in particips) particip.key: particip};

  static List<IndivCompAward> awardListFromRaw(List<String> awards){

    List<IndivCompAward> indivCompAward = [];

    for(int i=0; i<awards.length; i++)
      if(awards[i] == null) indivCompAward.last.rangeTo = i+1;
      else indivCompAward.add(IndivCompAward(i+1, i+1, awards[i]));

    return indivCompAward;

  }

  static IndivComp fromResponse(Map resp){

    List<IndivCompTask> tasks = [];
    Map _tasksRespMap = resp['tasks']??(throw InvalidResponseError('tasks'));
    for (String taskKey in _tasksRespMap.keys)
      tasks.add(IndivCompTask.fromMap(taskKey, _tasksRespMap[taskKey]));

    tasks.sort((task1, task2) => task1.key.compareTo(task2.key));

    List<IndivCompParticip> particips = [];
    Map _participsRespMap = resp['participants']??(throw InvalidResponseError('participants'));
    for (MapEntry participEntry in _participsRespMap.entries)
      particips.add(IndivCompParticip.fromMap(participEntry.key, participEntry.value));

    particips.sort((p1, p2) => (p1.profile.showRank??0) - (p2.profile.showRank??0));

    List<String> awards = (resp['awards'] as List).cast<String>()??(throw InvalidResponseError('awards'));

    List<IndivCompAward> indivCompAward = awardListFromRaw(awards);

    return IndivComp(
        key: resp['_key']??(throw InvalidResponseError('_key')),
        name: resp['name']??(throw InvalidResponseError('name')),
        colorsKey: resp['colorsKey']??(throw InvalidResponseError('colorsKey')),
        iconKey: resp['iconKey']??(throw InvalidResponseError('iconKey')),
        startTime: DateTime.tryParse(resp['startTime']??(throw InvalidResponseError('startTime'))),
        endTime: DateTime.tryParse(resp['endTime'] ?? ''),
        overviewMode: resp['overviewMode']??(throw InvalidResponseError('overviewMode')),

        //profile: IndivCompProfile.fromResponse(resp['profile']??(throw InvalidResponseError('profile'))),

        particips: particips,

        tasks: tasks,

        awards: indivCompAward,

        shareCode: resp["shareCode"],
        shareCodeSearchable: resp["shareCodeSearchable"]
    );

  }

}
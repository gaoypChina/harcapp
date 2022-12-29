import 'package:flutter/cupertino.dart';

import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:provider/provider.dart';

import '../../../community/circle/model/circle.dart';
import 'show_rank_data.dart';
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

class IndivCompProvider extends ChangeNotifier{

  static IndivCompProvider of(BuildContext context) => Provider.of<IndivCompProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class IndivCompListProvider extends ChangeNotifier{

  static IndivCompListProvider of(BuildContext context) => Provider.of<IndivCompListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class IndivCompAward{
  int rangeFrom;
  int rangeTo;
  String? award;

  String get place{
    String _place;
    if(rangeFrom == rangeTo) _place = '$rangeFrom';
    else _place = '$rangeFrom - $rangeTo';

    return _place;
  }

  IndivCompAward(this.rangeFrom, this.rangeTo, this.award);

}

class IndivCompBasicData{

  String key;
  String name;

  IconData get icon => CommonIconData.get(iconKey);
  String iconKey;

  CommonColorData get colors => CommonColorData.get(colorsKey);
  String colorsKey;

  IndivCompBasicData({
    required this.key,
    required this.name,
    required this.iconKey,
    required this.colorsKey,
  });

  static IndivCompBasicData fromIndivComp(IndivComp comp) => IndivCompBasicData(
    key: comp.key,
    name: comp.name,
    iconKey: comp.iconKey,
    colorsKey: comp.colorsKey,
  );

  static IndivCompBasicData fromRespMap(Map respMap) => IndivCompBasicData(
    key: respMap['_key']??(throw InvalidResponseError('_key')),
    name: respMap['name']??(throw InvalidResponseError('name')),
    iconKey: respMap['iconKey']??(throw InvalidResponseError('iconKey')),
    colorsKey: respMap['colorsKey']??(throw InvalidResponseError('colorsKey')),
  );

}

class IndivComp{

  static const int participsPageSize = 10;

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

  static List<String?> previewAwards = [
    'Nóż',
    'Hamak',
    'Menażka',
    'Krzesiwo',
    null,
    null
  ];

  static const int maxLenTitle = 64;
  static const int maxLenColorsKey = 42;
  static const int maxLenIconsKey = 42;
  static const int maxLenAward = 64;

  static List<IndivComp>? _all;
  static late Map<String, IndivComp>? _allMap;

  static List<IndivComp>? get all => _all;
  static Map<String, IndivComp>? get allMap => _allMap;

  static List<IndivComp> get allPinned{
    List<IndivComp> comps = [];
    for(IndivComp comp in _all!)
      if(comp.pinned)
        comps.add(comp);

    return comps;
  }

  static forget(){
    _all = null;
    _allMap = null;
  }

  static silentInit(List<IndivComp> comps){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all!.clear();
    _allMap!.clear();

    _all!.addAll(comps);
    _allMap = {for (IndivComp comp in comps) comp.key: comp};

  }

  static callProvidersOf(BuildContext context) =>
      callProviders(IndivCompProvider.of(context), IndivCompListProvider.of(context));

  static callProviders(IndivCompProvider indivCompProv, IndivCompListProvider indivCompListProv){
    indivCompProv.notify();
    indivCompListProv.notify();
  }

  static callProvidersWithParticipsOf(BuildContext context){
    callProvidersOf(context);
    IndivCompParticipsProvider.notify_(context);
  }

  static callProvidersWithParticips(IndivCompProvider indivCompProv, IndivCompListProvider indivCompListProv, IndivCompParticipsProvider indivCompParticipsProv){
    callProviders(indivCompProv, indivCompListProv);
    indivCompParticipsProv.notify();
  }

  static init(List<IndivComp> comps, {BuildContext? context}){

    silentInit(comps);

    if(context == null) return;
    callProvidersOf(context);
  }

  static addToAll(IndivComp comp, {BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all!.add(comp);
    _allMap![comp.key] = comp;

    if(context == null) return;
    callProvidersOf(context);
  }

  static updateInAll(IndivComp comp, {BuildContext? context}){
    IndivComp? oldComp = _allMap![comp.key];
    if(oldComp == null){
      addToAll(comp, context: context);
      return;
    }

    int index = _all!.indexOf(oldComp);
    _all!.removeAt(index);
    _all!.insert(index, comp);
    _allMap![comp.key] = comp;

    if(context == null) return;
    callProvidersOf(context);
  }

  static void removeFromAll(IndivComp? comp, {BuildContext? context}){
    if(_all == null)
      return;

    _all!.remove(comp);
    _allMap!.remove(comp!.key);

    if(context == null) return;

    callProvidersOf(context);
  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();
  }

  String key;
  String name;

  IconData get icon => CommonIconData.get(iconKey);
  String iconKey;

  CommonColorData get colors => CommonColorData.get(colorsKey);
  String colorsKey;

  DateTime? startTime;
  DateTime? endTime;

  RankDispType? rankDispType;

  String? shareCode;
  bool shareCodeSearchable;

  CircleBasicData? bindedCircle;

  IndivCompProfile? get myProfile{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    IndivCompParticip? me = participMap[accKey];

    if(me == null){
      AccountData.forgetAccount();
      AccountData.callOnForceLogout();
      return null;
    }

    return me.profile;
  }

  final List<IndivCompParticip> particips;
  final Map<String, IndivCompParticip> participMap;
  int participCount;
  int activeParticipCount;

  List<IndivCompTask> tasks;
  Map<String, IndivCompTask> taskMap;

  List<IndivCompAward> awards;
  List<String?> get awardsEncoded{
    List<String?> result = [];
    for(IndivCompAward award in awards)
      for(int i=0; i<award.rangeTo - award.rangeFrom + 1; i++)
        result.add(award.award);

    return result;
  }

  void update(IndivComp updatedComp){
    name = updatedComp.name;
    iconKey = updatedComp.iconKey;
    colorsKey = updatedComp.colorsKey;
    
    startTime = updatedComp.startTime;
    endTime = updatedComp.endTime;
    rankDispType = updatedComp.rankDispType;
    shareCode = updatedComp.shareCode;
    shareCodeSearchable = updatedComp.shareCodeSearchable;

    bindedCircle = updatedComp.bindedCircle;

    tasks = updatedComp.tasks;
    taskMap = updatedComp.taskMap;

    participCount = updatedComp.participCount;
    activeParticipCount = updatedComp.activeParticipCount;

    awards = updatedComp.awards;
  }
  
  bool get pinned => ShaPref.getBool(ShaPref.SHA_PREF_INDIV_COMP_PINNED_(key), true);
  void setPinned(BuildContext context, bool value){
    ShaPref.setBool(ShaPref.SHA_PREF_INDIV_COMP_PINNED_(key), value);
    Provider.of<IndivCompListProvider>(context).notify();
  }

  void reversePinned(BuildContext context){
    ShaPref.setBool(ShaPref.SHA_PREF_INDIV_COMP_PINNED_(key), !pinned);
    Provider.of<IndivCompListProvider>(context, listen: false).notify();
  }

  void handleRanks(Map<String, ShowRankData> ranks){

    for(String participKey in ranks.keys) {
      IndivCompParticip? particip = participMap[participKey];
      if(particip == null) continue;
      particip.profile.rank = ranks[participKey];
    }

    particips.sort((p1, p2) => (p1.profile.rank?.sortIndex??0).toInt() - (p2.profile.rank?.sortIndex??0).toInt());

    if(myProfile?.active == false) return;
    String? thisParticipKey = AccountData.key;
    if(!ranks.containsKey(thisParticipKey)) return;

  }

  void addParticips(List<IndivCompParticip> newParticips, {BuildContext? context}){

    for(IndivCompParticip particip in newParticips) {
      if(participMap[particip.key] != null) continue;
      particips.add(particip);
      participMap[particip.key] = particip;
    }

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  void setAllParticips(List<IndivCompParticip> allParticips, {BuildContext? context}){
    particips.clear();
    participMap.clear();
    particips.addAll(allParticips);
    participMap.addAll({for (IndivCompParticip mem in allParticips) mem.key: mem});

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  void updateParticips(List<IndivCompParticip> newParticips, {BuildContext? context}){

    for(IndivCompParticip particip in newParticips) {
      int index = particips.indexWhere((participIter) => participIter.key == particip.key);
      particips.removeAt(index);
      particips.insert(index, particip);
      participMap[particip.key] = particip;
    }

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  void removeParticipsByKey(List<String> participKeys, {BuildContext? context}){

    particips.removeWhere((particip) => participKeys.contains(particip.key));
    for(String participKey in participKeys) participMap.remove(participKey);

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  void removeComplTask(BuildContext context, String participKey, String complTaskKey){
    participMap[participKey]!.profile.removeCompletedTaskByKey(complTaskKey);

    Provider.of<ComplTasksProvider>(context, listen: false).notify();
  }

  bool addPoints(String participKey, int points){
    IndivCompParticip? particip = participMap[participKey];
    if(particip == null)
      return false;

    if(particip.profile.points == null)
      return false;

    return setPoints(participKey, particip.profile.points! + points);
  }
  bool setPoints(String participKey, int points){
    IndivCompParticip? particip = participMap[participKey];
    if(particip == null)
      return false;

    particip.profile.points = points;
    return true;
  }

  IndivComp({
    required this.key,
    required this.name,
    required this.iconKey,
    required this.colorsKey,
    required this.startTime,
    this.endTime,
    required this.rankDispType,

    required this.particips,
    required this.participCount,
    required this.activeParticipCount,

    required this.tasks,
    required this.awards,

    required this.shareCode,
    required this.shareCodeSearchable,

    required this.bindedCircle,

  }): taskMap = {for (var task in tasks) task.key!: task},
        participMap = {for (var particip in particips) particip.key: particip};

  static List<IndivCompAward> awardListFromRaw(List<String?> awards){

    List<IndivCompAward> indivCompAward = [];

    for(int i=0; i<awards.length; i++)
      if(awards[i] == null) indivCompAward.last.rangeTo = i+1;
      else indivCompAward.add(IndivCompAward(i+1, i+1, awards[i]));

    return indivCompAward;

  }

  static IndivComp fromRespMap(Map respMap){

    List<IndivCompTask> tasks = [];
    Map tasksRespMap = respMap['tasks']??(throw InvalidResponseError('tasks'));
    for (String taskKey in tasksRespMap.keys as Iterable<String>)
      tasks.add(IndivCompTask.fromRespMap(tasksRespMap[taskKey], key: taskKey));

    tasks.sort((task1, task2) => task1.key!.compareTo(task2.key!));

    List<String?> awards = ((respMap['awards']??(throw InvalidResponseError('awards'))) as List).cast<String?>();

    List<IndivCompAward> indivCompAward = awardListFromRaw(awards);

    return IndivComp(
        key: respMap['_key']??(throw InvalidResponseError('_key')),
        name: respMap['name']??(throw InvalidResponseError('name')),
        colorsKey: respMap['colorsKey']??(throw InvalidResponseError('colorsKey')),
        iconKey: respMap['iconKey']??(throw InvalidResponseError('iconKey')),
        startTime: DateTime.tryParse(respMap['startTime']??(throw InvalidResponseError('startTime'))),
        endTime: DateTime.tryParse(respMap['endTime'] ?? ''),
        rankDispType: strToRankDispType[respMap['rankDispType']??(throw InvalidResponseError('rankDispType'))],

        particips: (respMap['participants']??(throw InvalidResponseError('participants'))).map<IndivCompParticip>((data) => IndivCompParticip.fromRespMap(data)).toList(),
        participCount: respMap['participantCount'],
        activeParticipCount: respMap['activeParticipConut'],

        tasks: tasks,

        awards: indivCompAward,

        shareCode: respMap["shareCode"],
        shareCodeSearchable: respMap["shareCodeSearchable"],

        bindedCircle: respMap["bindedCircle"] == null?
        null:
        CircleBasicData.fromRespMap(respMap["bindedCircle"])
    );

  }

}
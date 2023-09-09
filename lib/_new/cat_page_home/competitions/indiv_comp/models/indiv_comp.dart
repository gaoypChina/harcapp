import 'package:flutter/cupertino.dart';

import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/indiv_comp_task_editable.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_participants_loader.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/compl_tasks_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/task_accept_state.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../community/circle/model/circle.dart';
import '../comp_role.dart';
import '../indiv_comp_completed_tasks_loader.dart';
import 'indiv_comp_task_compl.dart';
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
  static IconData pointsIcon = MdiIcons.plusCircleMultipleOutline;

  static List<IndivCompTask> previewTasks = [

    const IndivCompTask(
        key: IndivCompTaskEditable.emptyTaskKey,
        title: 'Obecność',
        description: 'Obecność na zbiórce lub wyjeździe.',
        points: 1,
        position: 0,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: IndivCompTaskEditable.emptyTaskKey,
        title: 'Punktualność',
        description: 'Stawienie się na zbiórce na czas.',
        points: 1,
        position: 1,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: IndivCompTaskEditable.emptyTaskKey,
        title: 'Umundurowanie',
        description: 'Obecność w pełnym umundurowaniu.',
        points: 1,
        position: 2,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: IndivCompTaskEditable.emptyTaskKey,
        title: 'Sprawność',
        description: 'Zdobycie sprawności.',
        points: 3,
        position: 3,
        state: TaskState.OPEN
    ),

    const IndivCompTask(
        key: IndivCompTaskEditable.emptyTaskKey,
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

    if(_allMap![comp] != null) return;

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

  DateTime startTime;
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
    IndivCompParticip? me = _loadedParticipMap[accKey];

    if(me == null){
      AccountData.forgetAccount();
      AccountData.callOnLogout(true);
      return null;
    }

    return me.profile;
  }

  final List<IndivCompParticip> loadedParticips;
  final Map<String, IndivCompParticip> _loadedParticipMap;

  final Map<String, IndivCompParticip> sideLoadedParticipMap;

  int participCount;
  int activeParticipCount;

  List<IndivCompTask> tasks;
  Map<String, IndivCompTask> taskMap;

  int get openTaskCount{
    int result = 0;
    for(IndivCompTask task in tasks)
      if(task.state == TaskState.OPEN)
        result++;

    return result;
  }

  List<IndivCompAward> awards;
  List<String?> get awardsEncoded{
    List<String?> result = [];
    for(IndivCompAward award in awards)
      for(int i=0; i<award.rangeTo - award.rangeFrom + 1; i++)
        result.add(award.award);

    return result;
  }

  int? completedTasksAcceptedCount;
  int? completedTasksPendingCount;
  int? completedTasksRejectedCount;

  List<IndivCompCompletedTask> loadedPendingCompletedTasks;

  late IndivCompParticipantsLoader _participantsLoader;
  late IndivCompCompletedTasksLoader _completedTasksPendingLoader;

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

    completedTasksAcceptedCount = updatedComp.completedTasksAcceptedCount;
    completedTasksPendingCount = updatedComp.completedTasksPendingCount;
    completedTasksRejectedCount = updatedComp.completedTasksRejectedCount;

    myProfile!.update(updatedComp.myProfile!);
  }

  void adjustToOtherParticipChange(IndivCompParticip? participOld, IndivCompParticip? participNew) {
    if(!(participOld == null || participNew == null || participOld.key == participNew.key))
      logger.e('adjustToOtherParticipChange: non-null `participOld.key` must equal non-null `participNew.key`');

    String? updatedParticipKey = participOld?.key??participNew?.key;

    for(IndivCompParticip particip in loadedParticips)
      if(particip.key != updatedParticipKey)
        particip.adjustToOtherParticipChange(participOld, participNew);
  }

  void adjustToOtherProfileChange(String updatedParticipKey, IndivCompProfile? profileOld, IndivCompProfile? profileNew) {
    for(IndivCompParticip particip in loadedParticips)
      if(particip.key != updatedParticipKey)
        particip.profile.adjustToOtherProfileChange(profileOld, profileNew);
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
      IndivCompParticip? particip = _loadedParticipMap[participKey];
      if(particip == null) continue;
      particip.profile.rank = ranks[participKey];
    }

    loadedParticips.sort((p1, p2) => (p1.profile.rank?.sortIndex??0).toInt() - (p2.profile.rank?.sortIndex??0).toInt());

    if(myProfile?.active == false) return;
    String? thisParticipKey = AccountData.key;
    if(!ranks.containsKey(thisParticipKey)) return;

  }

  IndivCompParticip? getParticip(String key){
    return _loadedParticipMap[key]??sideLoadedParticipMap[key];
  }

  void addSideloadedParticip(IndivCompParticip particip){
    sideLoadedParticipMap[particip.key] = particip;
  }

  void addLoadedParticips(List<IndivCompParticip> newParticips, {BuildContext? context}){

    for(IndivCompParticip particip in newParticips) {
      if(_loadedParticipMap[particip.key] != null) continue;
      loadedParticips.add(particip);
      _loadedParticipMap[particip.key] = particip;
    }

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  void setAllLoadedParticips(List<IndivCompParticip> allParticips, {BuildContext? context}){
    loadedParticips.clear();
    _loadedParticipMap.clear();
    addLoadedParticips(allParticips, context: context);
  }

  void updateLoadedParticip(IndivCompParticip newParticip, {BuildContext? context}){

    int index = loadedParticips.indexWhere((participIter) => participIter.key == newParticip.key);
    if(index == -1) return;
    loadedParticips.removeAt(index);
    loadedParticips.insert(index, newParticip);
    _loadedParticipMap[newParticip.key] = newParticip;

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }
  
  void updateLoadedParticips(List<IndivCompParticip> newParticips, {BuildContext? context}){

    for(IndivCompParticip particip in newParticips)
      updateLoadedParticip(particip, context: null);

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  void removeLoadedParticipsByKey(List<String> participKeys, {BuildContext? context, bool shrinkTotalCount=true}){

    loadedParticips.removeWhere((particip) => participKeys.contains(particip.key));
    for(String participKey in participKeys){
      IndivCompParticip? removed = _loadedParticipMap.remove(participKey);
      if(removed != null && shrinkTotalCount)
        participCount = participCount - 1;
    }

    if(context == null) return;
    callProvidersWithParticipsOf(context);
  }

  bool isParticipWithinLoaded(IndivCompParticip particip){
    if(loadedParticips.length == participCount) return true;
    if(loadedParticips.isEmpty) return false;
    IndivCompParticip lastLoaded = loadedParticips.last;
    return compRoleToLoadingOrder(particip.profile.role) < compRoleToLoadingOrder(lastLoaded.profile.role) ||
        compareText(particip.name, lastLoaded.name) < 0 ||
        compareText(particip.key, lastLoaded.key) < 0;
  }

  Future<bool> loadParticipsPage({
    bool awaitFinish = false,
    int pageSize = participsPageSize,
  }) => _participantsLoader.run(
    awaitFinish: awaitFinish,
    comp: this,
    pageSize: pageSize,
    lastRole: loadedParticips.length == 1 ? null : loadedParticips.last.profile.role,
    lastUserName: loadedParticips.length == 1 ? null : loadedParticips.last.name,
    lastUserKey: loadedParticips.length == 1 ? null : loadedParticips.last.key,
  );

  Future<bool> reloadParticipsPage({
    bool awaitFinish = false,
    int pageSize = participsPageSize,
  }) => _participantsLoader.run(
    awaitFinish: awaitFinish,
    comp: this,
    pageSize: pageSize,
  );

  bool isParticipsLoading() => _participantsLoader.running;

  void addParticipLoaderListener(IndivCompParticipantsLoaderListener listener) =>
      _participantsLoader.addListener(listener);

  void removeParticipLoaderListener(IndivCompParticipantsLoaderListener listener) =>
      _participantsLoader.removeListener(listener);

  void addLoadedCompletedTasksForParticip(String participKey, List<IndivCompCompletedTask> completedTasks, {required bool increaseTotalCount}){
    _loadedParticipMap[participKey]!.profile.addLoadedCompletedTasks(completedTasks, increaseTotalCount: increaseTotalCount);
  }

  void setAllLoadedCompletedTasksForParticip(String participKey, List<IndivCompCompletedTask> completedTasks, {required bool increaseTotalCount}){
    _loadedParticipMap[participKey]!.profile.setAllLoadedCompletedTasks(completedTasks);
  }
  
  void removeCompletedTaskForParticip(String participKey, String complTaskKey, {BuildContext? context, bool shrinkTotalCount=true}){
    _loadedParticipMap[participKey]!.profile.removeCompletedTaskByKey(complTaskKey, shrinkTotalCount: shrinkTotalCount);

    if(context != null)
    Provider.of<ComplTasksProvider>(context, listen: false).notify();
  }

  void addLoadedPendingCompletedTasks(List<IndivCompCompletedTask> completedTasks){
    loadedPendingCompletedTasks.addAll(completedTasks);
  }

  void setAllLoadedPendingCompletedTasks(List<IndivCompCompletedTask> completedTasks){
    loadedPendingCompletedTasks.clear();
    addLoadedPendingCompletedTasks(completedTasks);
  }

  void removeLoadedPendingCompletedTask(IndivCompCompletedTask complTask, {bool shrinkTotalCount=true}){
    bool success = loadedPendingCompletedTasks.remove(complTask);
    if(success && shrinkTotalCount)
      completedTasksPendingCount = completedTasksPendingCount! - 1;
  }


  Future<bool> loadPendingCompletedTasksPage({
    bool awaitFinish = false,
    int pageSize = IndivCompCompletedTask.pageSize,
  }) => _completedTasksPendingLoader.run(
    awaitFinish: awaitFinish,
    comp: this,
    pageSize: pageSize,
    lastReqTime: loadedPendingCompletedTasks.isEmpty ? null : loadedPendingCompletedTasks.last.reqTime,
  );

  Future<bool> reloadPendingCompletedTasksPage({
    bool awaitFinish = false,
    int pageSize = IndivCompCompletedTask.pageSize,
  }) => _completedTasksPendingLoader.run(
    awaitFinish: awaitFinish,
    comp: this,
    pageSize: pageSize,
  );

  bool isPendingCompletedTasksLoading() => _completedTasksPendingLoader.running;

  void addPendingCompletedTasksLoaderListener(IndivCompCompletedTasksLoaderListener listener) =>
      _completedTasksPendingLoader.addListener(listener);

  void removePendingCompletedTasksLoaderListener(IndivCompCompletedTasksLoaderListener listener) =>
      _completedTasksPendingLoader.removeListener(listener);
  
  
  bool addPoints(String participKey, int points){
    IndivCompParticip? particip = _loadedParticipMap[participKey];
    if(particip == null)
      return false;

    if(particip.profile.points == null)
      return false;

    particip.profile.points = particip.profile.points! + points;
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

    required this.loadedParticips,
    required this.participCount,
    required this.activeParticipCount,

    required this.tasks,
    required this.awards,

    required this.shareCode,
    required this.shareCodeSearchable,

    required this.bindedCircle,

    required this.completedTasksAcceptedCount,
    required this.completedTasksPendingCount,
    required this.completedTasksRejectedCount,

  }): taskMap = {for (var task in tasks) task.key: task},
        _loadedParticipMap = {for (var particip in loadedParticips) particip.key: particip},
        sideLoadedParticipMap = {},

        loadedPendingCompletedTasks = [],
        _participantsLoader = IndivCompParticipantsLoader(),
        _completedTasksPendingLoader = IndivCompCompletedTasksLoader(
          taskKey: null,
          participKey: null,
          acceptState: TaskAcceptState.PENDING
        );

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

    tasks.sort((task1, task2) => task1.key.compareTo(task2.key));



    List<String?> awards = ((respMap['awards']??(throw InvalidResponseError('awards'))) as List).cast<String?>();

    List<IndivCompAward> indivCompAward = awardListFromRaw(awards);

    Map<String, int> completedTasksCount = (respMap['completedTasksCount']??{}).cast<String, int>();

    IndivComp comp = IndivComp(
        key: respMap['_key']??(throw InvalidResponseError('_key')),
        name: respMap['name']??(throw InvalidResponseError('name')),
        colorsKey: respMap['colorsKey']??(throw InvalidResponseError('colorsKey')),
        iconKey: respMap['iconKey']??(throw InvalidResponseError('iconKey')),
        startTime: DateTime.tryParse(respMap['startTime']??(throw InvalidResponseError('startTime')))??(throw InvalidResponseError('startTime')),
        endTime: DateTime.tryParse(respMap['endTime'] ?? ''),
        rankDispType: strToRankDispType[respMap['rankDispType']??(throw InvalidResponseError('rankDispType'))],

        loadedParticips: [], // temporarly empty,
        participCount: respMap['participantCount'],
        activeParticipCount: respMap['activeParticipConut'],

        tasks: tasks,

        awards: indivCompAward,

        shareCode: respMap["shareCode"],
        shareCodeSearchable: respMap["shareCodeSearchable"],

        bindedCircle: respMap["bindedCircle"] == null?
        null:
        CircleBasicData.fromRespMap(respMap["bindedCircle"]),

        completedTasksAcceptedCount: completedTasksCount['accepted'],
        completedTasksPendingCount: completedTasksCount['pending'],
        completedTasksRejectedCount: completedTasksCount['rejected'],

    );

    List<IndivCompParticip> particips = (respMap['participants']??(throw InvalidResponseError('participants'))).map<IndivCompParticip>((data) => IndivCompParticip.fromRespMap(data, comp)).toList();
    comp.addLoadedParticips(particips);

    return comp;
  }

  static IndivComp empty() => IndivComp(
      key: '',
      name: '',
      iconKey: '',
      colorsKey: '',
      startTime: DateTime.now(),
      rankDispType: RankDispType.EXACT,
      loadedParticips: [],
      participCount: 0,
      activeParticipCount: 0,
      tasks: [],
      awards: [],
      shareCode: '',
      shareCodeSearchable: true,
      bindedCircle: null,
      completedTasksAcceptedCount: 0,
      completedTasksPendingCount: 0,
      completedTasksRejectedCount: 0
  );

}
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_task_get_resp.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:webfeed/util/iterable.dart';
import 'package:intl/intl.dart';

class TropProvider extends ChangeNotifier{
  static TropProvider of(BuildContext context) => Provider.of<TropProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class TropListProvider extends ChangeNotifier{
  static TropListProvider of(BuildContext context) => Provider.of<TropListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class TropTaskProvider extends ChangeNotifier{
  static TropTaskProvider of(BuildContext context) => Provider.of<TropTaskProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

enum TropCategory{
  harcZlotyTrop,
  harcZaradnosc,
  harcOjczyzna,
  harcOdkrywanie,
  harcNatura,
  harcInicjatywa,
  harcCzlowiek,
  harcBraterstwo,

  zuchArtystyczne,
  zuchBajkowe,
  zuchKulturoznawcze,
  zuchObywatelskie,
  zuchPrzyrodnicze,
  zuchSportoweITurystyczne,
  zuchZawodowe,
}

List<TropCategory> allHarcTropCategories = [
  TropCategory.harcZlotyTrop,
  TropCategory.harcZaradnosc,
  TropCategory.harcOjczyzna,
  TropCategory.harcOdkrywanie,
  TropCategory.harcNatura,
  TropCategory.harcInicjatywa,
  TropCategory.harcCzlowiek,
  TropCategory.harcBraterstwo,
];

List<TropCategory> allZuchTropCategories = [
  TropCategory.zuchArtystyczne,
  TropCategory.zuchBajkowe,
  TropCategory.zuchKulturoznawcze,
  TropCategory.zuchObywatelskie,
  TropCategory.zuchPrzyrodnicze,
  TropCategory.zuchSportoweITurystyczne,
  TropCategory.zuchZawodowe,
];

String tropCategoryToStr(TropCategory category){
  switch(category){
    case TropCategory.harcZlotyTrop: return 'HARC_ZLOTY_TROP';
    case TropCategory.harcZaradnosc: return 'HARC_ZARADNOSC';
    case TropCategory.harcOjczyzna: return 'HARC_OJCZYZNA';
    case TropCategory.harcOdkrywanie: return 'HARC_ODKRYWANIE';
    case TropCategory.harcNatura: return 'HARC_NATURA';
    case TropCategory.harcInicjatywa: return 'HARC_INICJATYWA';
    case TropCategory.harcCzlowiek: return 'HARC_CZLOWIEK';
    case TropCategory.harcBraterstwo: return 'HARC_BRATERSTWO';

    case TropCategory.zuchArtystyczne: return 'ZUCH_ARTYSTYCZNE';
    case TropCategory.zuchBajkowe: return 'ZUCH_BAJKOWE';
    case TropCategory.zuchKulturoznawcze: return 'ZUCH_KULTUROZNAWCZE';
    case TropCategory.zuchObywatelskie: return 'ZUCH_OBYWATELSKIE';
    case TropCategory.zuchPrzyrodnicze: return 'ZUCH_PRZYRODNICZE';
    case TropCategory.zuchSportoweITurystyczne: return 'ZUCH_SPORTOWE_I_TURYSTYCZNE';
    case TropCategory.zuchZawodowe: return 'ZUCH_ZAWODOWE';
  }
}

TropCategory? strToTropCategory(String value){
  switch(value){
    case 'HARC_ZLOTY_TROP': return TropCategory.harcZlotyTrop;
    case 'HARC_ZARADNOSC': return TropCategory.harcZaradnosc;
    case 'HARC_OJCZYZNA': return TropCategory.harcOjczyzna;
    case 'HARC_ODKRYWANIE': return TropCategory.harcOdkrywanie;
    case 'HARC_NATURA': return TropCategory.harcNatura;
    case 'HARC_INICJATYWA': return TropCategory.harcInicjatywa;
    case 'HARC_CZLOWIEK': return TropCategory.harcCzlowiek;
    case 'HARC_BRATERSTWO': return TropCategory.harcBraterstwo;

    case 'ZUCH_ARTYSTYCZNE': return TropCategory.zuchArtystyczne;
    case 'ZUCH_BAJKOWE': return TropCategory.zuchBajkowe;
    case 'ZUCH_KULTUROZNAWCZE': return TropCategory.zuchKulturoznawcze;
    case 'ZUCH_OBYWATELSKIE': return TropCategory.zuchObywatelskie;
    case 'ZUCH_PRZYRODNICZE': return TropCategory.zuchPrzyrodnicze;
    case 'ZUCH_SPORTOWE_I_TURYSTYCZNE': return TropCategory.zuchSportoweITurystyczne;
    case 'ZUCH_ZAWODOWE': return TropCategory.zuchZawodowe;

    default: return null;
  }
}

String tropCategoryToName(TropCategory category){
  switch(category){
    case TropCategory.harcZlotyTrop: return 'Złoty Trop';
    case TropCategory.harcZaradnosc: return 'Zaradność';
    case TropCategory.harcOjczyzna: return 'Ojczyzna';
    case TropCategory.harcOdkrywanie: return 'Odkrywanie';
    case TropCategory.harcNatura: return 'Natura';
    case TropCategory.harcInicjatywa: return 'Inicjatywa';
    case TropCategory.harcCzlowiek: return 'Czlowiek';
    case TropCategory.harcBraterstwo: return 'Braterstwo';

    case TropCategory.zuchArtystyczne: return 'Artystyczne';
    case TropCategory.zuchBajkowe: return 'Bajkowe';
    case TropCategory.zuchKulturoznawcze: return 'Kulturoznawcze';
    case TropCategory.zuchObywatelskie: return 'Obywatelskie';
    case TropCategory.zuchPrzyrodnicze: return 'Przyrodnicze';
    case TropCategory.zuchSportoweITurystyczne: return 'Sportowe i turystyczne';
    case TropCategory.zuchZawodowe: return 'Zawodowe';
  }
}

class TropBaseData<T extends TropTaskBaseData>{

  String name;
  TropCategory category;
  String? customIconTropName;
  List<String> aims;
  List<T> tasks;
  String? notesForLeaders;
  List<String>? exampleSpraws;

  TropBaseData({
    required this.name,
    required this.category,
    this.customIconTropName,
    required this.aims,
    required this.tasks,
    this.notesForLeaders,
    this.exampleSpraws,
  });

  bool get hasNotesForLeaders => notesForLeaders != null && notesForLeaders!.isNotEmpty;

}

class Trop extends TropBaseData<TropTask> with SyncableParamGroupMixin, SyncGetRespNode<TropGetResp>{

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static callProvidersOf(BuildContext context) =>
      callProviders(TropProvider.of(context), TropListProvider.of(context));

  static callProviders(TropProvider tropProvider, TropListProvider tropListProvider){
    tropProvider.notify();
    tropListProvider.notify();
  }

  static late List<Trop> all;
  static late Map<String, Trop> allMapByUniqName;

  static addToAll(Trop t, {BuildContext? context}){
    if(allMapByUniqName[t.uniqName] != null) return;

    all.add(t);
    allMapByUniqName[t.uniqName] = t;

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeFromAll(Trop t, {BuildContext? context}){
    if(allMapByUniqName[t.uniqName] == null) return;

    all.remove(t);
    allMapByUniqName.remove(t.uniqName);

    if(context == null) return;
    callProvidersOf(context);
  }

  static Future<void> init() async {
    
    all = [];
    allMapByUniqName = {};
    
    Directory ownTropyDir = Directory(getOwnTropFolderPath);
    await ownTropyDir.create(recursive: true);

    for (FileSystemEntity file in ownTropyDir.listSync(recursive: false)) {
      Trop? trop = Trop.readFromUniqName(basename(file.path));
      if(trop == null) continue;
      all.add(trop);
      allMapByUniqName[trop.uniqName] = trop;
    }

    // all.addAll([
    //   Trop(
    //       lclId: '1',
    //       name: 'Zajęcia dla dzieci z fundacji TaSzansa',
    //       category: TropCategory.harcBraterstwo,
    //       aims: [
    //         'Chcemy nawiązać kontakt z dzieciaczkami z lokalnej społeczności i pomóc im robić fajne rzeczy.',
    //         'Budowanie odpowiedzialności u harcerzy w zastępie',
    //       ],
    //       startTime: DateTime.now(),
    //       endTime: DateTime.now().add(const Duration(days: 60)),
    //       tasks: [
    //         TropTask.create(
    //             content: 'Zrobienie czegośtam - to jest zadanie numer jeden.',
    //             deadline: DateTime.now().add(const Duration(days: 7)),
    //             assigneeCustomText: 'Włodzimierz Koc'
    //         ),
    //         TropTask.create(
    //             content: 'Tu z kolei będziemy robić jakieś zadanie numer dwa.',
    //             deadline: DateTime.now().add(const Duration(days: 8))
    //         ),
    //         TropTask.create(
    //             content: 'Czas najwyższy, żeby zrobić zadanko numer trzy!',
    //             deadline: DateTime.now().add(const Duration(days: 9))
    //         ),
    //       ]
    //   ),
    //
    //   Trop(
    //     lclId: '1',
    //     name: 'Sadzenie drzew, bo to przecież takie potrzebne',
    //     category: TropCategory.harcNatura,
    //     aims: [],
    //     startTime: DateTime.now(),
    //     endTime: DateTime.now().add(const Duration(days: 70)),
    //     tasks: []
    //   ),
    //
    //   Trop(
    //       lclId: '1',
    //       name: 'No szczerze nie wiem co tu dać za nazwę.',
    //       category: TropCategory.harcInicjatywa,
    //       aims: [],
    //       startTime: DateTime.now(),
    //       endTime: DateTime.now().add(const Duration(days: 80)),
    //       tasks: []
    //   ),
    //
    //   Trop(
    //       lclId: '1',
    //       name: 'Odkrywanie Ameryki na nowo',
    //       category: TropCategory.harcOdkrywanie,
    //       aims: [],
    //       startTime: DateTime.now(),
    //       endTime: DateTime.now().add(const Duration(days: 90)),
    //       tasks: []
    //   ),
    //
    //   Trop(
    //       lclId: '1',
    //       name: 'Szycie biało-czerwonych flag',
    //       category: TropCategory.harcOjczyzna,
    //       aims: [],
    //       startTime: DateTime.now(),
    //       endTime: DateTime.now().add(const Duration(days: 100)),
    //       tasks: []
    //   ),
    //
    //   Trop(
    //       lclId: '1',
    //       name: 'Kopanie dołów na obozie w celach lodówkowych',
    //       category: TropCategory.harcZaradnosc,
    //       aims: [],
    //       startTime: DateTime.now(),
    //       endTime: DateTime.now().add(const Duration(days: 110)),
    //       tasks: []
    //   ),
    //
    //   Trop(
    //       lclId: '1',
    //       name: 'Złoty trop',
    //       category: TropCategory.harcZlotyTrop,
    //       aims: [],
    //       startTime: DateTime.now(),
    //       endTime: DateTime.now().add(const Duration(days: 120)),
    //       tasks: []
    //   )
    // ]);
    allMapByUniqName = { for(Trop t in all) t.uniqName: t};

    initialized = true;
  }

  static const IconData icon = MdiIcons.signDirectionPlus;

  static const String paramUniqName = 'uniqName';
  static const String paramName = 'name';
  static const String paramCustomIconTropName = 'customIconTropName';
  static const String paramCategory = 'category';
  static const String paramAims = 'aims';
  static const String paramStartDate = 'startDate';
  static const String paramEndDate = 'endDate';
  static const String paramCompleted = 'completed';
  static const String paramCompletionTime = 'completionDate';
  static const String paramTasks = 'tasks';
  static const String paramUsers = 'users';

  static const int maxLenName = 80;
  static const int maxAimCount = 50;
  static const int maxLenAim = 200;
  static const int maxTaskCount = 50;

  final String uniqName;

  DateTime startDate;
  DateTime endDate;

  bool completed;
  DateTime? completionDate;

  Map<String, UserData> users;

  bool get isCategoryHarc => allHarcTropCategories.contains(category);

  int get completenessPercent{
    int completedCount = 0;
    for(TropTask task in tasks)
      if(task.completed) completedCount++;

    int allCount = tasks.length;
    if(allCount == 0)
      allCount = 1;

    return (100*completedCount/allCount.toDouble()).round();
  }

  Trop({
    required this.uniqName,
    required super.name,
    super.customIconTropName,
    required super.category,
    required super.aims,

    required this.startDate,
    required this.endDate,

    required this.completed,
    required this.completionDate,

    required super.tasks,
    required this.users,

    super.notesForLeaders,
    super.exampleSpraws,
  });

  void update(Trop trop){
    name = trop.name;
    customIconTropName = trop.customIconTropName;
    category = trop.category;
    aims = trop.aims;
    startDate = trop.startDate;
    endDate = trop.endDate;
    completed = trop.completed;
    completionDate = trop.completionDate;
    tasks = trop.tasks;
    users = trop.users;
  }

  static Trop create({
    String? uniqName,
    required String name,
    String? customIconTropName,
    required TropCategory category,
    required List<String> aims,

    required DateTime startTime,
    required DateTime endTime,

    required bool completed,
    required DateTime? completionTime,

    required List<TropTaskData> tasks,
  }){

    Trop trop = Trop(
        uniqName: uniqName??const Uuid().v4(),
        name: name,
        customIconTropName: customIconTropName,
        category: category,
        aims: aims,

        startDate: startTime,
        endDate: endTime,

        completed: completed,
        completionDate: completionTime,

        tasks: [],
        users: {},
    );

    trop.tasks = tasks.map((t) => t.toTask(trop)).toList();
    return trop;
  }

  static Trop fromRespMap(Map respMapData, String uniqName){

    Trop trop = Trop(
      uniqName: uniqName,
      name: respMapData[paramName]??(throw MissingDecodeParamError(paramName)),
      customIconTropName: respMapData[paramCustomIconTropName],
      category: strToTropCategory(respMapData[paramCategory])??(throw MissingDecodeParamError(paramCategory)),
      aims: (respMapData[paramAims]??(throw MissingDecodeParamError(paramAims))).cast<String>(),

      startDate: DateTime.tryParse(respMapData[paramStartDate]??'')??(throw MissingDecodeParamError(paramStartDate)),
      endDate: DateTime.tryParse(respMapData[paramEndDate]??'')??(throw MissingDecodeParamError(paramEndDate)),

      completed: respMapData[paramCompleted]??false,
      completionDate: DateTime.tryParse(respMapData[paramCompletionTime]??''),

      tasks: [],
      users: {},
    );

    List<TropTask> tasks = [];
    for(String taskLclId in respMapData[paramTasks].keys)
      tasks.add(TropTask.fromRespMap(respMapData[paramTasks][taskLclId], taskLclId, trop));
    trop.tasks = tasks;

    Map<String, UserData> users = {};
    for(String userKey in respMapData[paramUsers].keys)
      users[userKey] = UserData.fromRespMap(respMapData[paramUsers][userKey], key: userKey);
    trop.users = users;

    return trop;
  }

  static Trop? readFromUniqName(String uniqName, {bool log = true}){
    try {
      String tropData = readFileAsString(getOwnTropFolderPath + uniqName);
      Map map = jsonDecode(tropData);

      // TMP TMP TMP
      bool needsUpdating = false;

      if(!map.containsKey("startTime")) {
        DateTime? startDate = DateTime.tryParse(map["startTime"]??'');
        if(startDate != null) {
          map[paramStartDate] = DateFormat('yyyy-MM-dd').format(startDate);
          needsUpdating = true;
        }
      }

      if(!map.containsKey("endTime")) {
        DateTime? endTime = DateTime.tryParse(map["endTime"]??'');
        if(endTime != null) {
          map[paramEndDate] = DateFormat('yyyy-MM-dd').format(endTime);
          needsUpdating = true;
        }
      }

      if(!map.containsKey(paramCompleted)) {
        map[paramCompleted] = false;
        needsUpdating = true;
      }

      if(map[paramTasks] is List) {
        Map convertedTasks = {};
        for(Map taskMap in map[paramTasks]){
          String taskLclId = taskMap[paramUniqName];
          taskMap.remove(paramUniqName);
          convertedTasks[taskLclId] = taskMap;
        }

        map[paramTasks] = convertedTasks;
        needsUpdating = true;
      }

      if(!map.containsKey(paramUsers)) {
        map[paramUsers] = {};
        needsUpdating = true;
      }

      if(needsUpdating)
        fromRespMap(map, uniqName).save();
      // TMP TMP TMP

      return fromRespMap(map, uniqName);
    } catch(e) {
      if(log) logger.e(e);
      return null;
    }
  }

  Map toJsonMap() => {
    paramName: name,
    paramCustomIconTropName: customIconTropName,
    paramCategory: tropCategoryToStr(category),
    paramAims: aims,

    paramStartDate: DateFormat('yyyy-MM-dd').format(startDate),
    paramEndDate: DateFormat('yyyy-MM-dd').format(endDate),

    paramCompleted: completed,
    paramCompletionTime: completionDate?.toIso8601String(),

    paramTasks: { for(TropTask task in tasks) task.lclId: task.toJsonMap() },
    paramUsers : users.map((key, value) => MapEntry(key, value.toJsonMap()))
  };

  void save({localOnly = false, bool synced = false}){

    // Mark removed tasks as removed.
    Trop? oldTrop = readFromUniqName(uniqName, log: false);
    if(oldTrop != null && !synced) {
      Set<String> oldTaskLclIds = Set.from(oldTrop.tasks.map((t) => t.lclId).toList());
      Set<String> taskLclIds = Set.from(tasks.map((t) => t.lclId).toList());

      for (String taskLclId in oldTaskLclIds.difference(taskLclIds)){
        TropTask task = oldTrop.tasks.firstWhere((t) => t.lclId == taskLclId);
        task.markSyncAsRemoved();
      }
    }

    saveStringAsFileToFolder(
      getMyTropFolderLocalPath,
      jsonEncode(toJsonMap()),
      fileName: uniqName,
    );

    // This can be more nuanced - specific params that have been changed can be
    // selectively unsynced.
    setAllSyncState(
        synced ? SyncableParamSingleMixin.stateSynced :
        SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();

  }

  bool delete({BuildContext? context}){
    try{
      File(getOwnTropFolderPath + uniqName).deleteSync();
      removeFromAll(this, context: context);
      return true;
    }catch(e){
      if(context != null) showAppToast(context, text: 'Wystąpił problem z usuwaniem tropu.');
      return false;
    }
  }

  static const String syncClassId = 'trop';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => SyncGetRespNode.tropNodes;

  @override
  String get paramId => uniqName;

  SyncableParamSingle get syncParamName => SyncableParamSingle(
    this,
    paramId: paramName,
    value: () => name,
  );

  SyncableParamSingle get syncParamCustomIconTropName => SyncableParamSingle(
    this,
    paramId: paramCustomIconTropName,
    value: () => customIconTropName
  );

  SyncableParamSingle get syncParamCategory => SyncableParamSingle(
    this,
    paramId: paramCategory,
    value: () => tropCategoryToStr(category),
  );

  SyncableParamSingle get syncParamAims => SyncableParamSingle(
    this,
    paramId: paramAims,
    value: () => aims,
  );

  SyncableParamSingle get syncParamStartDate => SyncableParamSingle(
    this,
    paramId: paramStartDate,
    value: () => DateFormat('yyyy-MM-dd').format(startDate)
  );

  SyncableParamSingle get syncParamEndDate => SyncableParamSingle(
    this,
    paramId: paramEndDate,
    value: () => DateFormat('yyyy-MM-dd').format(endDate),
  );

  SyncableParamSingle get syncParamCompleted => SyncableParamSingle(
    this,
    paramId: paramCompleted,
    value: () => completed,
  );

  SyncableParamSingle get syncParamCompletionTime => SyncableParamSingle(
    this,
    paramId: paramCompletionTime,
    value: () => completionDate?.toIso8601String(),
  );

  SyncableParamGroup get syncParamTasks => SyncableParamGroup(
    this,
    paramId: paramTasks,
    childParams: tasks,
  );

  @override
  List<SyncableParam> get childParams => [
    syncParamName,
    syncParamCustomIconTropName,
    syncParamCategory,
    syncParamAims,
    syncParamStartDate,
    syncParamEndDate,
    syncParamCompleted,
    syncParamCompletionTime,
    syncParamTasks,
  ];

  @override
  FutureOr<void> applySyncGetResp(TropGetResp resp) {
    name = resp.name;
    customIconTropName = resp.customIconTropName;
    category = resp.category;
    aims = resp.aims;
    startDate = resp.startDate;
    endDate = resp.endDate;

    completed = resp.completed;
    completionDate = resp.completionDate;

    users = resp.users;

    List<String> taskLclIds = resp.tasks.keys.toList();
    for(int i=0; i<taskLclIds.length; i++){
      String taskIclId = taskLclIds[i];
      TropTask? task = tasks.where((t) => t.lclId == taskIclId).firstOrNull;
      if(task == null) {
        TropTaskGetResp taskResp = resp.tasks[taskIclId]!;
        task = TropTask.create(
            lclId: taskIclId,
            content: taskResp.content,
            summary: taskResp.summary,
            deadline: taskResp.deadline,
            assignee: users[taskResp.assigneeKey],
            assigneeCustomText: taskResp.assigneeCustomText,
            completed: taskResp.completed,
            trop: this
        );
        tasks.insert(i, task);
      } else
        task.applySyncGetResp(resp.tasks[taskIclId]!);
    }

  }

}

class TropTaskBaseData{

  String content;

  TropTaskBaseData({required this.content});

}

class TropTaskData extends TropTaskBaseData{

  String? lclId;
  String? _summary;
  DateTime deadline;
  UserData? assignee;
  String? assigneeCustomText;
  bool completed;

  TropTaskData({
    this.lclId,
    required super.content,
    String? summary,
    required this.deadline,
    this.assignee,
    this.assigneeCustomText,
    this.completed = false,
  }):
    _summary = summary;

  String? get summary => _summary;
  set summary(String? value){
    if(value == null || value.isEmpty) _summary = null;
    else _summary = value;
  }

  TropTask toTask(Trop trop) => TropTask.create(
      lclId: lclId,
      content: content,
      deadline: deadline,
      assignee: assignee,
      assigneeCustomText: assigneeCustomText,
      completed: completed,
      trop: trop
  );

}

class TropTask extends TropTaskData with SyncableParamGroupMixin, SyncGetRespNode<TropTaskGetResp>, RemoveSyncItem{

  static const String paramLclId = 'lclId';
  static const String paramContent = 'content';
  static const String paramSummary = 'summary';
  static const String paramDeadline = 'deadline';
  static const String paramAssigneeKey = 'assigneeKey';
  static const String paramAssigneeCustomText = 'assigneeCustomText';
  static const String paramCompleted = 'completed';

  static const int maxLenContent = 320;
  static const int maxLenSummary = 640;

  final String lclId;

  final Trop trop;

  TropTask({
    required this.lclId,
    required super.content,
    super.summary,
    required super.deadline,
    super.assignee,
    super.assigneeCustomText,
    super.completed = false,

    required this.trop,
  });

  static TropTask create({
    String? lclId,
    required String content,
    String? summary,
    required DateTime deadline,
    UserData? assignee,
    String? assigneeCustomText,
    bool completed = false,

    required Trop trop,
  }) => TropTask(
    lclId: lclId??const Uuid().v4(),
    content: content,
    summary: summary,
    deadline: deadline,
    assignee: assignee,
    assigneeCustomText: assigneeCustomText,
    completed: completed,

    trop: trop,
  );

  Map toJsonMap({bool withLclId = false}) => {
    if(withLclId) paramLclId: lclId,
    paramContent: content,
    paramSummary: summary,
    paramDeadline: deadline.toIso8601String(),
    paramAssigneeKey: assignee?.key,
    paramAssigneeCustomText: assigneeCustomText,
    paramCompleted: completed,
  };

  static TropTask fromRespMap(Map respMapData, String lclId, Trop trop) => TropTask(
    lclId: lclId,
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary],
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
    assignee: trop.users[respMapData[paramAssigneeKey]],
    assigneeCustomText: respMapData[paramAssigneeCustomText],
    completed: respMapData[paramCompleted]??false,
    trop: trop,
  );

  @override
  FutureOr<void> applySyncGetResp(TropTaskGetResp resp){
    content = resp.content;
    summary = resp.summary;
    deadline = resp.deadline;
    assignee = trop.users[resp.assigneeKey];
    assigneeCustomText = resp.assigneeCustomText;
    completed = resp.completed;
  }

  static const String syncClassId = 'task';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => trop.syncParamTasks;

  @override
  String get paramId => lclId;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: paramContent,
      value: () => content,
    ),

    SyncableParamSingle(
      this,
      paramId: paramSummary,
      value: () => summary,
    ),

    SyncableParamSingle(
      this,
      paramId: paramDeadline,
      value: () => deadline.toIso8601String(),
    ),

    SyncableParamSingle(
      this,
      paramId: paramAssigneeKey,
      value: () => assignee?.key,
    ),

    SyncableParamSingle(
      this,
      paramId: paramAssigneeCustomText,
      value: () => assigneeCustomText,
    ),

    SyncableParamSingle(
      this,
      paramId: paramCompleted,
      value: () => completed,
    ),

  ];

}
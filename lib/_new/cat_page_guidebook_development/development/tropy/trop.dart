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
    case TropCategory.harcZlotyTrop: return 'harcZlotyTrop';
    case TropCategory.harcZaradnosc: return 'harcZaradnosc';
    case TropCategory.harcOjczyzna: return 'harcOjczyzna';
    case TropCategory.harcOdkrywanie: return 'harcOdkrywanie';
    case TropCategory.harcNatura: return 'harcNatura';
    case TropCategory.harcInicjatywa: return 'harcInicjatywa';
    case TropCategory.harcCzlowiek: return 'harcCzlowiek';
    case TropCategory.harcBraterstwo: return 'harcBraterstwo';

    case TropCategory.zuchArtystyczne: return 'zuchArtystyczne';
    case TropCategory.zuchBajkowe: return 'zuchBajkowe';
    case TropCategory.zuchKulturoznawcze: return 'zuchKulturoznawcze';
    case TropCategory.zuchObywatelskie: return 'zuchObywatelskie';
    case TropCategory.zuchPrzyrodnicze: return 'zuchPrzyrodnicze';
    case TropCategory.zuchSportoweITurystyczne: return 'zuchSportoweITurystyczne';
    case TropCategory.zuchZawodowe: return 'zuchZawodowe';
  }
}

TropCategory? strToTropCategory(String value){
  switch(value){
    case 'harcZlotyTrop': return TropCategory.harcZlotyTrop;
    case 'harcZaradnosc': return TropCategory.harcZaradnosc;
    case 'harcOjczyzna': return TropCategory.harcOjczyzna;
    case 'harcOdkrywanie': return TropCategory.harcOdkrywanie;
    case 'harcNatura': return TropCategory.harcNatura;
    case 'harcInicjatywa': return TropCategory.harcInicjatywa;
    case 'harcCzlowiek': return TropCategory.harcCzlowiek;
    case 'harcBraterstwo': return TropCategory.harcBraterstwo;

    case 'zuchArtystyczne': return TropCategory.zuchArtystyczne;
    case 'zuchBajkowe': return TropCategory.zuchBajkowe;
    case 'zuchKulturoznawcze': return TropCategory.zuchKulturoznawcze;
    case 'zuchObywatelskie': return TropCategory.zuchObywatelskie;
    case 'zuchPrzyrodnicze': return TropCategory.zuchPrzyrodnicze;
    case 'zuchSportoweITurystyczne': return TropCategory.zuchSportoweITurystyczne;
    case 'zuchZawodowe': return TropCategory.zuchZawodowe;

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

  static callProvidersOf(BuildContext context) =>
      callProviders(TropProvider.of(context), TropListProvider.of(context));

  static callProviders(TropProvider tropProvider, TropListProvider tropListProvider){
    tropProvider.notify();
    tropListProvider.notify();
  }

  static late List<Trop> all;
  static late Map<String, Trop> allMapByLclId;

  static addToAll(Trop t, {BuildContext? context}){
    if(allMapByLclId[t.lclId] != null) return;

    all.add(t);
    allMapByLclId[t.lclId] = t;

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeFromAll(Trop t, {BuildContext? context}){
    if(allMapByLclId[t.lclId] == null) return;

    all.remove(t);
    allMapByLclId.remove(t.lclId);

    if(context == null) return;
    callProvidersOf(context);
  }

  static Future<void> init() async {
    
    all = [];
    allMapByLclId = {};
    
    Directory ownTropyDir = Directory(getOwnTropFolderPath);
    await ownTropyDir.create(recursive: true);

    for (FileSystemEntity file in ownTropyDir.listSync(recursive: false)) {
      Trop? trop = Trop.readFromLclId(basename(file.path));
      if(trop == null) continue;
      all.add(trop);
      allMapByLclId[trop.lclId] = trop;
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
    //             assigneeText: 'Włodzimierz Koc'
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
    allMapByLclId = { for(Trop t in all) t.lclId: t};
  }

  static const IconData icon = MdiIcons.signDirectionPlus;

  static const String paramLclId = 'lclId';
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

  final String lclId;

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
    required this.lclId,
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
  }

  static Trop create({
    String? lclId,
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
        lclId: lclId??const Uuid().v4(),
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

  static Trop fromRespMap(Map respMapData, String lclId){

    Trop trop = Trop(
      lclId: lclId,
      name: respMapData[paramName]??(throw MissingDecodeParamError(paramName)),
      customIconTropName: respMapData[paramCustomIconTropName],
      category: strToTropCategory(respMapData[paramCategory])??(throw MissingDecodeParamError(paramCategory)),
      aims: respMapData[paramAims]??(throw MissingDecodeParamError(paramAims)),

      startDate: DateTime.tryParse(respMapData[paramStartDate])??(throw MissingDecodeParamError(paramStartDate)),
      endDate: DateTime.tryParse(respMapData[paramEndDate])??(throw MissingDecodeParamError(paramEndDate)),

      completed: respMapData[paramCompleted]??false,
      completionDate: DateTime.tryParse(respMapData[paramCompletionTime]),

      tasks: [],
      users: {},
    );

    List<TropTask> tasks = [];
    for(String taskLclId in respMapData[paramTasks].keys)
      tasks.add(TropTask.fromRespMap(respMapData[paramTasks][taskLclId], taskLclId, trop));
    trop.tasks = tasks;

    Map<String, UserData> users = {};
    for(String userKey in respMapData[paramUsers].key)
      users[userKey] = UserData.fromRespMap(respMapData[paramUsers][userKey], key: userKey);
    trop.users = users;

    return trop;
  }

  static Trop? readFromLclId(String lclId){
    try {
      String tropData = readFileAsString(getOwnTropFolderPath + lclId);
      Map map = jsonDecode(tropData);

      // TMP TMP TMP
      bool needsUpdating = false;

      if(!map.containsKey("startTime")) {
        map[paramStartDate] = DateFormat('yyyy-MM-dd').format(DateTime.parse(map["startTime"]));
        needsUpdating = true;
      }

      if(!map.containsKey("endTime")) {
        map[paramEndDate] = DateFormat('yyyy-MM-dd').format(DateTime.parse(map["endTime"]));
        needsUpdating = true;
      }

      if(!map.containsKey(paramCompleted)) {
        map[paramCompleted] = false;
        needsUpdating = true;
      }

      if(map[paramTasks] is List) {
        Map convertedTasks = {};
        for(Map taskMap in map[paramTasks]){
          String taskLclId = taskMap[paramLclId];
          taskMap.remove(paramLclId);
          convertedTasks[taskLclId] = taskMap;
        }

        map[paramTasks] = convertedTasks;
        needsUpdating = true;
      }

      if(needsUpdating)
        fromRespMap(map, lclId).save();
      // TMP TMP TMP

      return fromRespMap(map, lclId);
    } catch(e) {
      logger.e(e);
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

    paramTasks: { for(TropTask task in tasks) task.lclId: task.toJsonMap() }
  };

  void save({localOnly = false, bool synced = false}){

    saveStringAsFileToFolder(
      getMyTropFolderLocalPath,
      jsonEncode(toJsonMap()),
      fileName: lclId,
    );

    setAllSyncState(
        synced?SyncableParamSingleMixin.stateSynced:
        SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();

  }

  bool delete({BuildContext? context}){
    try{
      File(getOwnTropFolderPath + lclId).deleteSync();
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
  SyncableParam? get parentParam => null;

  @override
  String get paramId => lclId;

  @override
  List<SyncableParam> get childParams => [

    SyncableParamSingle(
      this,
      paramId: paramName,
      value: () => name,
    ),

    SyncableParamSingle(
        this,
        paramId: paramCustomIconTropName,
        value: () => customIconTropName
    ),

    SyncableParamSingle(
      this,
      paramId: paramCategory,
      value: () => tropCategoryToStr(category),
    ),

    SyncableParamSingle(
      this,
      paramId: paramAims,
      value: () => aims,
    ),

    SyncableParamSingle(
      this,
      paramId: paramStartDate,
      value: () => DateFormat('yyyy-MM-dd').format(startDate)
    ),

    SyncableParamSingle(
      this,
      paramId: paramEndDate,
      value: () => DateFormat('yyyy-MM-dd').format(endDate),
    ),

    SyncableParamSingle(
      this,
      paramId: paramCompleted,
      value: () => completed,
    ),

    SyncableParamSingle(
      this,
      paramId: paramCompletionTime,
      value: () => completionDate?.toIso8601String(),
    ),

    SyncableParamGroup(
      this,
      paramId: paramTasks,
      childParams: tasks,
    ),

  ];

  @override
  FutureOr<void> applySyncGetResp(TropGetResp resp) {
    name = resp.name;
    customIconTropName = resp.customIconTropName;
    category = resp.category;
    aims = resp.aims;
    startDate = resp.startTime;
    endDate = resp.endTime;

    completed = resp.completed;
    completionDate = resp.completionTime;
    for(String taskIclId in resp.tasks.keys){
      TropTask? task = tasks.where((t) => t.lclId == taskIclId).firstOrNull;
      if(task == null) {
        TropTaskGetResp taskResp = resp.tasks[taskIclId]!;
        task = TropTask.create(
            content: taskResp.content,
            summary: taskResp.summary,
            deadline: taskResp.deadline,
            assignee: users[taskResp.assigneeKey],
            assigneeText: taskResp.assigneeText,
            completed: taskResp.completed,
            trop: this
        );
        tasks.add(task);
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

  String? _summary;
  DateTime deadline;
  UserData? assignee;
  String? assigneeText;
  bool completed;

  TropTaskData({
    required super.content,
    String? summary,
    required this.deadline,
    this.assignee,
    this.assigneeText,
    this.completed = false,
  }):
    _summary = summary;

  String? get summary => _summary;
  set summary(String? value){
    if(value == null || value.isEmpty) _summary = null;
    else _summary = value;
  }

  TropTask toTask(Trop trop) => TropTask.create(
      content: content,
      deadline: deadline,
      assignee: assignee,
      assigneeText: assigneeText,
      completed: completed,
      trop: trop
  );

}

class TropTask extends TropTaskData with SyncableParamGroupMixin, SyncGetRespNode<TropTaskGetResp>{

  static const String paramLclId = 'lclId';
  static const String paramContent = 'content';
  static const String paramSummary = 'summary';
  static const String paramDeadline = 'deadline';
  static const String paramAssigneeKey = 'assigneeKey';
  static const String paramAssigneeText = 'assigneeText';
  static const String paramCompleted = 'completed';

  static const int maxLenContent = 320;
  static const int maxLenSummary = 640;

  final String lclId;

  Trop trop;

  TropTask({
    required this.lclId,
    required super.content,
    super.summary,
    required super.deadline,
    super.assignee,
    super.assigneeText,
    super.completed = false,

    required this.trop,
  });

  static TropTask create({
    required String content,
    String? summary,
    required DateTime deadline,
    UserData? assignee,
    String? assigneeText,
    bool completed = false,

    required Trop trop,
  }) => TropTask(
    lclId: const Uuid().v4(),
    content: content,
    summary: summary,
    deadline: deadline,
    assignee: assignee,
    assigneeText: assigneeText,
    completed: completed,

    trop: trop,
  );

  Map toJsonMap({bool withLclId = false}) => {
    if(withLclId) paramLclId: lclId,
    paramContent: content,
    paramSummary: summary,
    paramDeadline: deadline.toIso8601String(),
    paramAssigneeKey: assignee?.key,
    paramAssigneeText: assigneeText,
    paramCompleted: completed,
  };

  static TropTask fromRespMap(Map respMapData, String lclId, Trop trop) => TropTask(
    lclId: lclId,
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary],
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
    assignee: trop.users[respMapData[paramAssigneeKey]],
    assigneeText: respMapData[paramAssigneeText],
    completed: respMapData[paramCompleted]??false,
    trop: trop,
  );

  @override
  FutureOr<void> applySyncGetResp(TropTaskGetResp resp){
    content = resp.content;
    summary = resp.summary;
    deadline = resp.deadline;
    assignee = trop.users[resp.assigneeKey];
    assigneeText = resp.assigneeText;
    completed = resp.completed;
  }

  static const String syncClassId = 'task';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => trop;

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
      paramId: paramAssigneeText,
      value: () => assigneeText,
    ),

    SyncableParamSingle(
      this,
      paramId: paramCompleted,
      value: () => completed,
    ),

  ];

}
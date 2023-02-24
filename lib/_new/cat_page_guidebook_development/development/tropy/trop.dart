import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

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

class Trop extends TropBaseData<TropTask>{

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

  static const String paramName = 'name';
  static const String paramCustomIconTropName = 'customIconTropName';
  static const String paramCategory = 'category';
  static const String paramAim = 'aim';
  static const String paramStartTime = 'startTime';
  static const String paramEndTime = 'endTime';
  static const String paramTasks = 'tasks';

  static const int maxLenName = 80;
  static const int maxAimCount = 50;
  static const int maxLenAim = 200;
  static const int maxTaskCount = 50;

  final String lclId;

  DateTime startTime;
  DateTime endTime;

  bool get isCategoryHarc => allHarcTropCategories.contains(category);

  int get progress{
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

    required this.startTime,
    required this.endTime,

    required super.tasks,

    super.notesForLeaders,
    super.exampleSpraws,
  });

  void update(Trop trop){
    name = trop.name;
    customIconTropName = trop.customIconTropName;
    category = trop.category;
    aims = trop.aims;
    startTime = trop.startTime;
    endTime = trop.endTime;
    tasks = trop.tasks;
  }

  static Trop create({
    required String name,
    String? customIconTropName,
    required TropCategory category,
    required List<String> aims,

    required DateTime startTime,
    required DateTime endTime,

    required List<TropTask> tasks,
  }) => Trop(
    lclId: const Uuid().v4(),
    name: name,
    customIconTropName: customIconTropName,
    category: category,
    aims: aims,

    startTime: startTime,
    endTime: endTime,

    tasks: tasks
  );

  static Trop fromRespMap(Map respMapData, String lclId) => Trop(
    lclId: lclId,
    name: respMapData[paramName]??(throw MissingDecodeParamError(paramName)),
    customIconTropName: respMapData[paramCustomIconTropName],
    category: strToTropCategory(respMapData[paramCategory])??(throw MissingDecodeParamError(paramCategory)),
    aims: (respMapData[paramAim]??(throw MissingDecodeParamError(paramAim))).cast<String>(),

    startTime: DateTime.tryParse(respMapData[paramStartTime])??(throw MissingDecodeParamError(paramStartTime)),
    endTime: DateTime.tryParse(respMapData[paramEndTime])??(throw MissingDecodeParamError(paramEndTime)),

    tasks: (respMapData[paramTasks] as List).map((task) => TropTask.fromRespMap(task)).toList(),
  );

  static Trop? readFromLclId(String lclId){
    try {
      String tropData = readFileAsString(getOwnTropFolderPath + lclId);
      Map map = jsonDecode(tropData);
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
    paramAim: aims,

    paramStartTime: startTime.toIso8601String(),
    paramEndTime: endTime.toIso8601String(),

    paramTasks: tasks.map((task) => task.toJsonMap()).toList()
  };

  void save() => saveStringAsFileToFolder(
      getMyTropFolderLocalPath,
      jsonEncode(toJsonMap()),
      fileName: lclId,
  );

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

}

class TropTaskBaseData{

  String content;

  TropTaskBaseData({required this.content});

}

class TropTask extends TropTaskBaseData{

  static const String paramUUID = 'uuid';
  static const String paramContent = 'content';
  static const String paramSummary = 'summary';
  static const String paramDeadline = 'deadline';
  static const String paramAssignee = 'assignee';
  static const String paramAssigneeText = 'assigneeText';
  static const String paramCompleted = 'completed';

  static const int maxLenContent = 320;
  static const int maxLenSummary = 640;

  //final String uuid;
  String? _summary;
  DateTime deadline;
  UserData? assignee;
  String? assigneeText;
  bool completed;

  String? get summary => _summary;
  set summary(String? value){
    if(value == null || value.isEmpty) _summary = null;
    else _summary = value;
  }

  // bool get completed => ShaPref.getBool(ShaPref.SHA_PREF_TROP_TASK_COMPLETED_(this), false);
  // set completed(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_TROP_TASK_COMPLETED_(this), value);

  TropTask({
    //required this.uuid,
    required super.content,
    String? summary,
    required this.deadline,
    this.assignee,
    this.assigneeText,
    this.completed = false,
  }):
    _summary = summary;

  static TropTask create({
    required String content,
    String? summary,
    required DateTime deadline,
    UserData? assignee,
    String? assigneeText,
    bool completed = false,
  }) => TropTask(
    //uuid: const Uuid().v4(),
    content: content,
    summary: summary,
    deadline: deadline,
    assignee: assignee,
    assigneeText: assigneeText,
    completed: completed,
  );

  Map toJsonMap() => {
    //paramUUID: uuid,
    paramContent: content,
    paramSummary: summary,
    paramDeadline: deadline.toIso8601String(),
    paramAssignee: assignee,
    paramAssigneeText: assigneeText,
    paramCompleted: completed,
  };

  static TropTask fromRespMap(Map respMapData) => TropTask(
    //uuid: respMapData[paramUUID],
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary],
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
    assignee: respMapData[paramAssignee],
    assigneeText: respMapData[paramAssigneeText],
    completed: respMapData[paramCompleted]??false,
  );

}
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/logger.dart';
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
  TropCategory.harcBraterstwo,
];

String tropCategoryToStr(TropCategory category){
  switch(category){
    case TropCategory.harcZlotyTrop: return 'harcZlotyTrop';
    case TropCategory.harcZaradnosc: return 'harcZaradnosc';
    case TropCategory.harcOjczyzna: return 'harcOjczyzna';
    case TropCategory.harcOdkrywanie: return 'harcOdkrywanie';
    case TropCategory.harcNatura: return 'harcNatura';
    case TropCategory.harcInicjatywa: return 'harcInicjatywa';
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
    case TropCategory.harcBraterstwo: return 'Braterstwo';

    case TropCategory.zuchArtystyczne: return 'Artystyczne';
    case TropCategory.zuchBajkowe: return 'Bajkowe';
    case TropCategory.zuchKulturoznawcze: return 'Kulturoznawcze';
    case TropCategory.zuchObywatelskie: return 'Obywatelskie';
    case TropCategory.zuchPrzyrodnicze: return 'Przyrodnicze';
    case TropCategory.zuchSportoweITurystyczne: return 'SportoweITurystyczne';
    case TropCategory.zuchZawodowe: return 'Zawodowe';
  }
}

class Trop{

  static late List<Trop> all;
  static late Map<String, Trop> allMapByLclId;

  static addToAll(Trop t, {BuildContext? context}){
    if(allMapByLclId[t.lclId] != null) return;

    all.add(t);
    allMapByLclId[t.lclId] = t;

    if(context == null) return;

    Provider.of<TropProvider>(context, listen: false).notify();
    Provider.of<TropListProvider>(context, listen: false).notify();
  }

  static Future<void> init() async {
    
    all = [];
    allMapByLclId = {};
    
    Directory ownTropyDir = Directory(getOwnTropFolderPath);
    await ownTropyDir.create();

    for (FileSystemEntity file in ownTropyDir.listSync(recursive: false)) {
      Trop? trop = Trop.readFromLclId(basename(file.path));
      if(trop == null) continue;
      all.add(trop);
      allMapByLclId[trop.lclId] = trop;
    }

    all.addAll([
      Trop(
          lclId: '1',
          name: 'Zajęcia dla dzieci z fundacji TaSzansa',
          category: TropCategory.harcBraterstwo,
          aims: [
            'Chcemy nawiązać kontakt z dzieciaczkami z lokalnej społeczności i pomóc im robić fajne rzeczy.',
            'Budowanie odpowiedzialności u harcerzy w zastępie',
          ],
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 60)),
          tasks: [
            TropTask.create(
                content: 'Zrobienie czegośtam - to jest zadanie numer jeden.',
                deadline: DateTime.now().add(const Duration(days: 7)),
                assigneeText: 'Włodzimierz Koc'
            ),
            TropTask.create(
                content: 'Tu z kolei będziemy robić jakieś zadanie numer dwa.',
                deadline: DateTime.now().add(const Duration(days: 8))
            ),
            TropTask.create(
                content: 'Czas najwyższy, żeby zrobić zadanko numer trzy!',
                deadline: DateTime.now().add(const Duration(days: 9))
            ),
          ]
      ),

      Trop(
        lclId: '1',
        name: 'Sadzenie drzew, bo to przecież takie potrzebne',
        category: TropCategory.harcNatura,
        aims: [],
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(days: 70)),
        tasks: []
      ),

      Trop(
          lclId: '1',
          name: 'No szczerze nie wiem co tu dać za nazwę.',
          category: TropCategory.harcInicjatywa,
          aims: [],
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 80)),
          tasks: []
      ),

      Trop(
          lclId: '1',
          name: 'Odkrywanie Ameryki na nowo',
          category: TropCategory.harcOdkrywanie,
          aims: [],
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 90)),
          tasks: []
      ),

      Trop(
          lclId: '1',
          name: 'Szycie biało-czerwonych flag',
          category: TropCategory.harcOjczyzna,
          aims: [],
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 100)),
          tasks: []
      ),

      Trop(
          lclId: '1',
          name: 'Kopanie dołów na obozie w celach lodówkowych',
          category: TropCategory.harcZaradnosc,
          aims: [],
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 110)),
          tasks: []
      ),

      Trop(
          lclId: '1',
          name: 'Złoty trop',
          category: TropCategory.harcZlotyTrop,
          aims: [],
          startTime: DateTime.now(),
          endTime: DateTime.now().add(const Duration(days: 120)),
          tasks: []
      )
    ]);
    allMapByLclId = { for(Trop t in all) t.lclId: t};
  }

  static const String paramName = 'name';
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
  String name;
  TropCategory category;
  List<String> aims;

  DateTime startTime;
  DateTime endTime;

  List<TropTask> tasks;

  Trop({
    required this.lclId,
    required this.name,
    required this.category,
    required this.aims,

    required this.startTime,
    required this.endTime,

    required this.tasks,
  });

  void update(Trop trop){
    name = trop.name;
    category = trop.category;
    aims = trop.aims;
    startTime = trop.startTime;
    endTime = trop.endTime;
    tasks = trop.tasks;
  }

  static Trop create({
    required String name,
    required TropCategory category,
    required List<String> aims,

    required DateTime startTime,
    required DateTime endTime,

    required List<TropTask> tasks,
  }) => Trop(
    lclId: const Uuid().v4(),
    name: name,
    category: category,
    aims: aims,

    startTime: startTime,
    endTime: endTime,

    tasks: tasks
  );

  static Trop fromRespMap(Map respMapData, String lclId) => Trop(
    lclId: lclId,
    name: respMapData[paramName]??(throw MissingDecodeParamError(paramName)),
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

  void delete() => File(getOwnTropFolderPath + lclId).deleteSync();

}

class TropTask{

  static const String paramUUID = 'uuid';
  static const String paramContent = 'content';
  static const String paramSummary = 'summary';
  static const String paramDeadline = 'deadline';
  static const String paramAssignee = 'assignee';
  static const String paramCompleted = 'completed';

  static const int maxLenContent = 320;
  static const int maxLenSummary = 640;

  //final String uuid;
  String content;
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
    required this.content,
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
    paramCompleted: completed,
  };

  static TropTask fromRespMap(Map respMapData) => TropTask(
    //uuid: respMapData[paramUUID],
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary],
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
    completed: respMapData[paramCompleted]??false,
  );

}
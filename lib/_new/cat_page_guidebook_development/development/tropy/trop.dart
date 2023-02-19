import 'dart:convert';
import 'dart:io';

import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:uuid/uuid.dart';

enum TropCategory{
  harcZlotyTrop,
  harcZaradnosc,
  harcOjczyzna,
  harcOdkrywanie,
  harcNatura,
  harcInicjatywa,
  harcBraterstwo,
}

String tropCategoryToStr(TropCategory category){
  switch(category){
    case TropCategory.harcZlotyTrop: return 'harcZlotyTrop';
    case TropCategory.harcZaradnosc: return 'harcZaradnosc';
    case TropCategory.harcOjczyzna: return 'harcOjczyzna';
    case TropCategory.harcOdkrywanie: return 'harcOdkrywanie';
    case TropCategory.harcNatura: return 'harcNatura';
    case TropCategory.harcInicjatywa: return 'harcInicjatywa';
    case TropCategory.harcBraterstwo: return 'harcBraterstwo';
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
  }
}

class Trop{

  static late List<Trop> all;
  static late Map<String, Trop> allMap;

  static Future<void> init() async {
    all = [
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
            TropTask.create(content: 'Zrobienie czegośtam - to jest zadanie numer jeden.', deadline: DateTime.now().add(const Duration(days: 7))),
            TropTask.create(content: 'Tu z kolei będziemy robić jakieś zadanie numer dwa.', deadline: DateTime.now().add(const Duration(days: 8))),
            TropTask.create(content: 'Czas najwyższy, żeby zrobić zadanko numer trzy!', deadline: DateTime.now().add(const Duration(days: 9))),
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
    ];
    allMap = {};
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

  static Trop fromRespMap(Map respMapData, String lclId) => Trop(
    lclId: lclId,
    name: respMapData[paramName]??(throw MissingDecodeParamError(paramName)),
    category: strToTropCategory(respMapData[paramCategory])??(throw MissingDecodeParamError(paramCategory)),
    aims: respMapData[paramAim]??(throw MissingDecodeParamError(paramAim)),

    startTime: DateTime.tryParse(respMapData[paramStartTime])??(throw MissingDecodeParamError(paramStartTime)),
    endTime: DateTime.tryParse(respMapData[paramEndTime])??(throw MissingDecodeParamError(paramEndTime)),

    tasks: (respMapData[paramTasks] as List).map((task) => TropTask.fromRespMap(task)).toList(),
  );

  static Trop? fromLclId(String lclId){
    try {
      String tropData = readFileAsString(getMyTropFolderPath + lclId);
      Map map = jsonDecode(tropData);
      return fromRespMap(map, lclId);
    } catch(e) {
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

  void save() => File(getMyTropFolderPath + lclId).writeAsStringSync(jsonEncode(toJsonMap()));

  void delete() => File(getMyTropFolderPath + lclId).deleteSync();

}

class TropTask{

  static const String paramUUID = 'uuid';
  static const String paramContent = 'content';
  static const String paramSummary = 'summary';
  static const String paramDeadline = 'deadline';

  static const int maxLenContent = 320;
  static const int maxLenSummary = 640;

  final String uuid;
  String content;
  String? _summary;
  DateTime deadline;
  bool completed;

  String? get summary => _summary;
  set summary(String? value){
    if(value == null || value.isEmpty) _summary = null;
    else _summary = value;
  }

  // bool get completed => ShaPref.getBool(ShaPref.SHA_PREF_TROP_TASK_COMPLETED_(this), false);
  // set completed(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_TROP_TASK_COMPLETED_(this), value);

  TropTask({
    required this.uuid,
    required this.content,
    String? summary,
    required this.deadline,
    this.completed = false,
  }):
    _summary = summary;

  static TropTask create({
    required String content,
    String? summary,
    required DateTime deadline,
  }) => TropTask(
    uuid: const Uuid().v4(),
    content: content,
    summary: summary,
    deadline: deadline
  );

  Map toJsonMap() => {
    paramUUID: uuid,
    paramContent: content,
    paramSummary: summary,
    paramDeadline: deadline.toIso8601String()
  };

  static TropTask fromRespMap(Map respMapData) => TropTask(
    uuid: respMapData[paramUUID],
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary]??(throw MissingDecodeParamError(paramSummary)),
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
  );

}
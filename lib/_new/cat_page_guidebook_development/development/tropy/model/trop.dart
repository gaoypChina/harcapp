import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/date_format.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
import 'package:harcapp/_common_classes/sorted_list.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/trop_task_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_user.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

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

class TropAssignedUsersProvider extends ChangeNotifier{
  static TropAssignedUsersProvider of(BuildContext context) => Provider.of<TropAssignedUsersProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class TropLoadedUsersProvider extends ChangeNotifier{
  static TropLoadedUsersProvider of(BuildContext context) => Provider.of<TropLoadedUsersProvider>(context, listen: false);
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

abstract class TropBaseData{

  String? get key;
  String name;
  TropCategory category;
  String? customIconTropName;

  DateTime startDate;
  DateTime endDate;

  int get completenessPercent;

  DateTime? get lastUpdateTime;

  TropBaseData({
    required this.name,
    required this.category,
    this.customIconTropName,

    required this.startDate,
    required this.endDate,
  });

}

class TropSharedPreviewData extends TropBaseData{

  static const String paramCompletenessPercent = 'completenessPercent';
  
  static SortedList<TropSharedPreviewData>? all;
  static Map<String, TropSharedPreviewData>? allMapByKey;

  @override
  String key;
  
  @override
  int completenessPercent;

  @override
  DateTime lastUpdateTime;

  static bool moreToLoad = true;

  static bool get hasAny => all != null && all!.isNotEmpty;

  static int comparator(TropSharedPreviewData t1, TropSharedPreviewData t2){
    // This is called with a "minus" because we want this in descending order.
    int dateResult = -compareText(t1.startDate.toIso8601String(), t2.startDate.toIso8601String());
    if(dateResult != 0) return dateResult;
    int nameResult = compareText(t1.name, t2.name);
    if(nameResult != 0) return dateResult;
    int keyResult = compareText(t1.key, t2.key);
    return keyResult;
  }

  static void init(){
    all = SortedList(comparator);
    allMapByKey = {};
  }

  static bool? addToAll(TropSharedPreviewData trop){

    // Returns true if added, false if trop might be in unloaded values.

    if(all == null) init();
    if(allMapByKey![trop.key] != null) return null;

    if(comparator(all!.last, trop) < 0 || !moreToLoad) {
      all!.add(trop);
      allMapByKey![trop.key] = trop;
      return true;
    } else // if(moreToLoad)
      return false;

  }

  static addAllToAll(List<TropSharedPreviewData> tropPrevs){
    if(all == null) init();

    for(TropSharedPreviewData t in tropPrevs){
      if(allMapByKey![t.key] != null) continue;

      all!.add(t);
      allMapByKey![t.key] = t;
    }
  }

  static void setAll(List<TropSharedPreviewData> allTropPrevs) {
    if (all == null)
      init();
    else {
      all!.clear();
      allMapByKey!.clear();
    }
    addAllToAll(allTropPrevs);
  }

  static removeFromAllByKey(String lclId, {BuildContext? context}){
    if(all == null) init();

    TropSharedPreviewData? trop = allMapByKey![lclId];

    if(trop == null) return;

    all!.remove(trop);
    allMapByKey!.remove(trop.key);

    if(context == null) return;
  }

  static forget(){
    all = null;
    allMapByKey = null;
  }
  
  static removeAbsent(){
    if(allMapByKey == null) return;
    List<String> removed = [];
    Directory sharedTropyDir = Directory(getSharedTropPreviewDataFolderPath);
    sharedTropyDir.createSync(recursive: true);
    for (FileSystemEntity file in sharedTropyDir.listSync(recursive: false)) {
      String tropKey = basename(file.path);
      if (!allMapByKey!.containsKey(tropKey)) {
        file.deleteSync();
        removed.add(tropKey);
        removeFromAllByKey(tropKey);
      }
    }
    logger.i('Called: `TropSharedPreviewData.removeAbsent()` and removed following files: [${removed.join(', ')}]');

  }

  bool isWithinLoaded(TropSharedPreviewData trop){
    if(all == null || all!.isEmpty) return false;
    TropSharedPreviewData lastLoaded = all!.last;

    int dateResult = compareText(trop.startDate.toIso8601String(), lastLoaded.startDate.toIso8601String());
    int nameResult = compareText(trop.name, lastLoaded.name);
    int keyResult = compareText(trop.key, lastLoaded.key);

    return dateResult < 0 || (dateResult == 0 &&
        nameResult < 0 || (nameResult == 0 &&
        keyResult < 0));
  }

  // void dumpAsPreview(){
  //   saveStringAsFileToFolder(
  //     getSharedTropPreviewDataFolderLocalPath,
  //     jsonEncode(toJsonMap()),
  //     fileName: key,
  //   );
  //   logger.i('Dumped trop preview $key');
  // }

  Map toJsonMap() => {
    Trop.paramKey: key,
    Trop.paramName: name,
    Trop.paramCustomIconTropName: customIconTropName,
    Trop.paramCategory: tropCategoryToStr(category),

    Trop.paramStartDate: formatDate(startDate),
    Trop.paramEndDate: formatDate(endDate),

    Trop.paramLastUpdateTime: lastUpdateTime.toIso8601String(),
  };

  TropSharedPreviewData({
    required this.key,
    required super.name,
    required super.category,
    required super.customIconTropName,

    required super.startDate,
    required super.endDate,
    
    required this.completenessPercent,

    required this.lastUpdateTime,
  });

  static TropSharedPreviewData fromRespMap(Map respMapData, String key) => TropSharedPreviewData(
    key: key,
    name: respMapData[Trop.paramName]??(throw MissingDecodeParamError(Trop.paramName)),
    customIconTropName: respMapData[Trop.paramCustomIconTropName],
    category: strToTropCategory(respMapData[Trop.paramCategory])??(throw MissingDecodeParamError(Trop.paramCategory)),
    startDate: DateTime.parse(respMapData[Trop.paramStartDate]??(throw MissingDecodeParamError(Trop.paramStartDate))),
    endDate: DateTime.parse(respMapData[Trop.paramEndDate]??(throw MissingDecodeParamError(Trop.paramEndDate))),

    completenessPercent: respMapData[paramCompletenessPercent]??(throw MissingDecodeParamError(paramCompletenessPercent)),
    
    lastUpdateTime: DateTime.parse(respMapData[Trop.paramLastUpdateTime]??(throw MissingDecodeParamError(Trop.paramLastUpdateTime))),
  );
  
}

class TropExampleData{

  String name;
  TropCategory category;
  String? customIconTropName;
  List<String> aims;
  List<TropTaskExampleData> tasks;
  String? notesForLeaders;
  List<String>? exampleSpraws;

  TropExampleData({
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

class Trop extends TropBaseData with SyncableParamGroupMixin, SyncGetRespNode<TropGetResp>{

  static const int tropPageSize = 10;
  static const int userPageSize = 10;

  // Whether the all, allMap, etc. are initialized.
  static bool initialized = false;

  static callProvidersOf(BuildContext context) =>
      callProviders(TropProvider.of(context), TropListProvider.of(context));

  static callProviders(TropProvider tropProvider, TropListProvider tropListProvider){
    tropProvider.notify();
    tropListProvider.notify();
  }

  static callProvidersWithAssignedUsersOf(BuildContext context){
    callProvidersOf(context);
    TropAssignedUsersProvider.notify_(context);
  }

  static callProvidersWithAssignedUsers(TropProvider tropProvider, TropListProvider tropListProvider, TropAssignedUsersProvider tropAssignedUsersProv){
    callProviders(tropProvider, tropListProvider);
    tropAssignedUsersProv.notify();
  }

  static callProvidersWithLoadedUsersOf(BuildContext context){
    callProvidersOf(context);
    TropLoadedUsersProvider.notify_(context);
  }

  static callProvidersWithLoadedUsers(TropProvider tropProvider, TropListProvider tropListProvider, TropLoadedUsersProvider tropLoadedUsersProv){
    callProviders(tropProvider, tropListProvider);
    tropLoadedUsersProv.notify();
  }

  static late List<Trop> allOwn;
  static late Map<String, Trop> allOwnMapByLclId;

  static addOwnToAll(Trop t, {BuildContext? context}){
    if(allOwnMapByLclId[t.lclId] != null) return;

    allOwn.add(t);
    allOwnMapByLclId[t.lclId!] = t;

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeOwnFromAll(Trop t, {BuildContext? context}){
    if(allOwnMapByLclId[t.lclId] == null) return;

    allOwn.remove(t);
    allOwnMapByLclId.remove(t.lclId);

    if(context == null) return;
    callProvidersOf(context);
  }

  static late List<Trop> allShared;
  static late Map<String, Trop> allSharedMapByKey;

  static addSharedToAll(Trop t, {BuildContext? context}){
    if(allSharedMapByKey[t.key!] != null) return;

    allShared.add(t);
    allSharedMapByKey[t.key!] = t;

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeSharedFromAll(Trop t, {BuildContext? context}){
    if(allSharedMapByKey[t.key] == null) return;

    allShared.remove(t);
    allSharedMapByKey.remove(t.key);

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeSharedFromAllByKey(String key, {BuildContext? context}){
    Trop? trop = allSharedMapByKey[key];
    if(trop == null) return;

    allShared.remove(trop);
    allSharedMapByKey.remove(trop.key);

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeAbsentPreviewsFromShared(){
    Directory sharedTropyDir = Directory(getSharedTropPreviewDataFolderPath);
    List<String> removed = [];
    sharedTropyDir.createSync(recursive: true);
    for (FileSystemEntity file in sharedTropyDir.listSync(recursive: false)) {
      File tropFile = File(getSharedTropFolderPath + basename(file.path));
      if(!tropFile.existsSync()) return;
      if(!allSharedMapByKey.containsKey(basename(file.path))) {
        tropFile.deleteSync();
        removed.add(basename(file.path));
      }
    }
    logger.i('Called: `Trop.removeAbsentPreviewsFromShared` and removed following files: ${removed.join(', ')}');
  }
  
  static Future<void> init() async {
    
    allOwn = [];
    allOwnMapByLclId = {};
    
    allShared = [];
    allSharedMapByKey = {};
    
    // List<TropSharedPreviewData> allPreviewData = [];
    
    Directory ownTropDir = Directory(getOwnTropFolderPath);
    await ownTropDir.create(recursive: true);
    for (FileSystemEntity file in ownTropDir.listSync(recursive: false)) {
      Trop? trop = Trop.readOwnFromLclId(basename(file.path));
      if(trop == null) continue;
      allOwn.add(trop);
      allOwnMapByLclId[trop.lclId!] = trop;
    }

    Directory sharedTropDir = Directory(getSharedTropFolderPath);
    await sharedTropDir.create(recursive: true);
    for (FileSystemEntity file in sharedTropDir.listSync(recursive: false)) {
      Trop? trop = Trop.readSharedFromKey(basename(file.path));
      if(trop == null) continue;
      allShared.add(trop);
      allSharedMapByKey[trop.key!] = trop;
    }

    // Directory previewDataTropDir = Directory(getSharedTropPreviewDataFolderPath);
    // await previewDataTropDir.create(recursive: true);
    // for (FileSystemEntity file in previewDataTropDir.listSync(recursive: false)) {
    //   Map data = jsonDecode(readFileAsString(file.path));
    //   try {
    //     TropSharedPreviewData? tropPreviewData = TropSharedPreviewData.fromRespMap(data, basename(file.path));
    //     allPreviewData.add(tropPreviewData);
    //   } catch (e){
    //     logger.e(e);
    //     continue;
    //   }
    // }
    //
    // TropSharedPreviewData.setAll(allPreviewData);

    initialized = true;
  }

  static const IconData icon = MdiIcons.signDirectionPlus;

  static const String paramLclId = 'lclId';
  static const String paramKey = '_key';
  static const String paramName = 'name';
  static const String paramCustomIconTropName = 'customIconTropName';
  static const String paramCategory = 'category';
  static const String paramAims = 'aims';
  static const String paramStartDate = 'startDate';
  static const String paramEndDate = 'endDate';
  static const String paramCompleted = 'completed';
  static const String paramCompletionTime = 'completionDate';
  static const String paramTasks = 'tasks';
  static const String paramLastUpdateTime = 'lastUpdateTime';
  static const String paramAssignedUsers = 'assignedUsers';
  static const String paramLoadedUsers = 'loadedUsers';
  static const String paramUserCount = 'userCount';
  static const String paramUserOwnerCount = 'userOwnerCount';

  static const int maxLenName = 80;
  static const int maxAimCount = 50;
  static const int maxLenAim = 200;
  static const int maxTaskCount = 50;

  // TODO: split this into LocalTrop and SharedTrop
  final String? lclId;
  
  @override
  String? key;

  List<String> aims;
  List<TropTask> tasks;
  
  bool completed;
  DateTime? completionDate;

  @override
  DateTime? lastUpdateTime;

  final List<TropUser> _assignedUsers;
  final Map<String, TropUser> _assignedUsersMap;
  List<TropUser> get assignedUsers => _assignedUsers;
  Map<String, TropUser> get assignedUsersMap => _assignedUsersMap;

  // The users account should always be either in _loadedUsers if trop is shared.
  final List<TropUser> _loadedUsers;
  final Map<String, TropUser> _loadedUsersMap;
  List<TropUser> get loadedUsers => _loadedUsers;
  Map<String, TropUser> get loadedUsersMap => _loadedUsersMap;
  
  bool get isShared => _loadedUsers.isNotEmpty;

  int userCount;
  int userOwnerCount;

  bool get isCategoryHarc => allHarcTropCategories.contains(category);

  @override
  int get completenessPercent{
    int completedCount = 0;
    for(TropTask task in tasks)
      if(task.completed) completedCount++;

    int allCount = tasks.length;
    if(allCount == 0)
      allCount = 1;

    return (100*completedCount/allCount.toDouble()).round();
  }

  TropRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    return (_assignedUsersMap[accKey]??_loadedUsersMap[accKey])?.role;
  }

  Trop({
    this.lclId,
    required this.key,
    required super.name,
    super.customIconTropName,
    required super.category,
    required this.aims,

    required super.startDate,
    required super.endDate,

    required this.completed,
    required this.completionDate,

    required this.tasks,
    required this.lastUpdateTime, // last server update time
    required Map<String, TropUser> assignedUsersMap,
    required Map<String, TropUser> loadedUsersMap,

    required this.userCount,
    required this.userOwnerCount,

    // this.notesForLeaders,
    // this.exampleSpraws,
  }): assert(lclId != null || key != null),
      _assignedUsersMap = assignedUsersMap,
      _assignedUsers = assignedUsersMap.values.toList(),
      _loadedUsersMap = loadedUsersMap,
      _loadedUsers = loadedUsersMap.values.toList();

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
    userCount = trop.userCount;
    lastUpdateTime = trop.lastUpdateTime;
  }

  static Trop createOwn({
    String? uniqName,
    required String name,
    required String? customIconTropName,
    required TropCategory category,
    required List<String> aims,

    required DateTime startDate,
    required DateTime endDate,

    required bool completed,
    required DateTime? completionTime,

    required List<TropTaskData> tasks,
    required DateTime? lastUpdateTime,
  }){

    Trop trop = Trop(
        lclId: uniqName??const Uuid().v4(),
        key: null,
        name: name,
        customIconTropName: customIconTropName,
        category: category,
        aims: aims,

        startDate: startDate,
        endDate: endDate,

        completed: completed,
        completionDate: completionTime,

        tasks: [],
        lastUpdateTime: lastUpdateTime,
        assignedUsersMap: {},
        loadedUsersMap: {},

        userCount: 0,
        userOwnerCount: 0,
    );

    trop.tasks.addAll(tasks.map((t) => t.toTask(trop)).toList());
    return trop;
  }

  static Trop fromRespMap(Map respMapData, {String? lclId, String? key, required bool isShared}){

    DateTime? lastServerUpdateTime = DateTime.tryParse(respMapData[paramLastUpdateTime]??'');
    if(isShared && lastServerUpdateTime == null)
      throw MissingDecodeParamError(paramLastUpdateTime);

    String? validLclId = lclId??respMapData[paramLclId];
    if(!isShared && validLclId == null)
      throw MissingDecodeParamError(paramLclId);

    String? validKey = key??respMapData[paramKey];
    if(isShared && validKey == null)
      throw MissingDecodeParamError(paramKey);

    Trop trop = Trop(
      lclId: validLclId,
      key: validKey,
      name: respMapData[paramName]??(throw MissingDecodeParamError(paramName)),
      customIconTropName: respMapData[paramCustomIconTropName],
      category: strToTropCategory(respMapData[paramCategory])??(throw MissingDecodeParamError(paramCategory)),
      aims: (respMapData[paramAims]??(throw MissingDecodeParamError(paramAims))).cast<String>(),

      startDate: DateTime.tryParse(respMapData[paramStartDate]??'')??(throw MissingDecodeParamError(paramStartDate)),
      endDate: DateTime.tryParse(respMapData[paramEndDate]??'')??(throw MissingDecodeParamError(paramEndDate)),

      completed: respMapData[paramCompleted]??false,
      completionDate: DateTime.tryParse(respMapData[paramCompletionTime]??''),

      tasks: [],
      lastUpdateTime: lastServerUpdateTime,
      assignedUsersMap: {},
      loadedUsersMap: {},
      userCount: respMapData[paramUserCount]??(throw MissingDecodeParamError(paramUserCount)),
      userOwnerCount: respMapData[paramUserOwnerCount]??(throw MissingDecodeParamError(paramUserOwnerCount)),
    );

    Map<String, TropUser> assignedUsers = {};
    for(String userKey in (respMapData[paramAssignedUsers]??{}).keys)
      assignedUsers[userKey] = TropUser.fromRespMap(respMapData[paramAssignedUsers][userKey], key: userKey);
    trop.addAssignedUsers(assignedUsers.values.toList());

    Map<String, TropUser> loadedUsers = {};
    for(String userKey in (respMapData[paramLoadedUsers]??{}).keys)
      loadedUsers[userKey] = TropUser.fromRespMap(respMapData[paramLoadedUsers][userKey], key: userKey);
    trop.addLoadedUsers(loadedUsers.values.toList());

    // This has to be called after `assignedUsers` is set in trop, otherwise
    // `assigneeKey` will not be properly resolved.
    List<TropTask> tasks = [];
    for(String taskLclId in (respMapData[paramTasks]??{}).keys)
      tasks.add(TropTask.fromRespMap(respMapData[paramTasks][taskLclId], taskLclId, trop));
    trop.tasks = tasks;

    // It might happen that server has been restared, but users are still saved locally.
    // In such case we want to wipe out all users.
    if(AccountData.loggedIn && !loadedUsers.containsKey(AccountData.key)){
      trop._loadedUsers.clear();
      trop._loadedUsersMap.clear();
      trop._assignedUsers.clear();
      trop._assignedUsersMap.clear();
    }

    return trop;
  }

  static Trop? readOwnFromLclId(String lclId, {bool log = true}){
    try {
      String tropData = readFileAsString(getOwnTropFolderPath + lclId);
      Map map = jsonDecode(tropData);

      // TMP TMP TMP
      bool needsUpdating = false;

      if(!map.containsKey("startTime")) {
        DateTime? startDate = DateTime.tryParse(map["startTime"]??'');
        if(startDate != null) {
          map[paramStartDate] = formatDate(startDate);
          needsUpdating = true;
        }
      }

      if(!map.containsKey("endTime")) {
        DateTime? endTime = DateTime.tryParse(map["endTime"]??'');
        if(endTime != null) {
          map[paramEndDate] = formatDate(endTime);
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
          String taskLclId = taskMap[paramLclId];
          taskMap.remove(paramLclId);
          convertedTasks[taskLclId] = taskMap;
        }

        map[paramTasks] = convertedTasks;
        needsUpdating = true;
      }

      if(!map.containsKey(paramAssignedUsers)) {
        map[paramAssignedUsers] = {};
        needsUpdating = true;
      }

      if(!map.containsKey(paramLoadedUsers)) {
        map[paramLoadedUsers] = {};
        needsUpdating = true;
      }

      if(!map.containsKey(paramLastUpdateTime)) {
        map[paramLastUpdateTime] = null;
        needsUpdating = true;
      }

      if(!map.containsKey(paramUserCount)) {
        map[paramUserCount] = 0;
        needsUpdating = true;
      }

      if(!map.containsKey(paramUserOwnerCount)) {
        map[paramUserOwnerCount] = 0;
        needsUpdating = true;
      }

      Trop trop = fromRespMap(map, lclId: lclId, isShared: false);

      if(needsUpdating)
        saveStringAsFileToFolder(
          getMyTropFolderLocalPath,
          jsonEncode(trop.toJsonMap()),
          fileName: lclId,
        );
      // TMP TMP TMP

      return trop;
    } catch(e) {
      if(log) logger.e(e);
      return null;
    }
  }
  static Trop? readSharedFromKey(String key, {bool log = true}){
    try {
      String tropData = readFileAsString(getSharedTropFolderPath + key);
      Map map = jsonDecode(tropData);
      return fromRespMap(map, key: key, isShared: true);
    } catch(e) {
      if(log) logger.e(e);
      return null;
    }
  }

  void saveShared(){
    saveStringAsFileToFolder(
      getSharedTropFolderLocalPath,
      jsonEncode(toJsonMap()),
      fileName: key,
    );
  }

  TropSharedPreviewData toPreviewData() => TropSharedPreviewData(
    key: key!,
    name: name,
    customIconTropName: customIconTropName,
    category: category,
    startDate: startDate,
    endDate: endDate,
    completenessPercent: completenessPercent,
    lastUpdateTime: lastUpdateTime!
  );

  Map toJsonMap() => {
    paramKey: key,
    paramName: name,
    paramCustomIconTropName: customIconTropName,
    paramCategory: tropCategoryToStr(category),
    paramAims: aims,

    paramStartDate: formatDate(startDate),
    paramEndDate: formatDate(endDate),

    paramCompleted: completed,
    paramCompletionTime: completionDate?.toIso8601String(),

    paramTasks: { for(TropTask task in tasks) task.lclId: task.toJsonMap() },
    paramLastUpdateTime: lastUpdateTime?.toIso8601String(),
    paramAssignedUsers: _assignedUsersMap.map((key, value) => MapEntry(key, value.toJsonMap())),
    paramLoadedUsers: _loadedUsersMap.map((key, value) => MapEntry(key, value.toJsonMap())),

    paramUserCount: userCount,
    paramUserOwnerCount: userOwnerCount,
  };

  void saveOwn({localOnly = false, bool? synced = false}){

    // Mark removed tasks as removed.
    Trop? oldTrop = readOwnFromLclId(lclId!, log: false);
    if(oldTrop != null && synced == false) {
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
      fileName: lclId,
    );

    // This can be more nuanced - specific params that have been changed can be
    // selectively unsynced.
    if(synced != null)
      setAllSyncState(
          synced == true ? SyncableParamSingleMixin.stateSynced :
          SyncableParamSingleMixin.stateNotSynced);

    if(!localOnly)
      synchronizer.post();

  }

  bool deleteShared({BuildContext? context}){
    try{
      File(getSharedTropFolderPath + key!).deleteSync();
      removeSharedFromAll(this, context: context);
      TropSharedPreviewData.removeFromAllByKey(key!);
      return true;
    }catch(e){
      if(context != null) showAppToast(context, text: 'Wystąpił problem z usuwaniem tropu.');
      return false;
    }
  }
  
  bool deleteOwn({BuildContext? context}){
    try{
      File(getOwnTropFolderPath + lclId!).deleteSync();
      removeOwnFromAll(this, context: context);
      return true;
    }catch(e){
      if(context != null) showAppToast(context, text: 'Wystąpił problem z usuwaniem tropu.');
      return false;
    }
  }

  void changedToShared(DateTime lastUpdateTime, {BuildContext? context}){
    this.lastUpdateTime = lastUpdateTime;
    deleteOwn(); // This call also calls `removeOwnFromAll`;
    addSharedToAll(this);
    TropSharedPreviewData.addToAll(toPreviewData());
    saveShared();
    if(context != null) callProvidersOf(context);
  }

  // Assigned users

  void addAssignedUsers(List<TropUser> newUsers, {BuildContext? context}){

    for(TropUser participant in newUsers) {
      if(_assignedUsersMap.containsKey(participant.key)) continue;
      _assignedUsers.add(participant);
      _assignedUsersMap[participant.key] = participant;
    }

    if(context == null) return;
    callProvidersWithAssignedUsersOf(context);

  }

  void setAllAssignedUsers(List<TropUser> allUsers, {BuildContext? context}){
    _assignedUsers.clear();
    _assignedUsersMap.clear();
    _assignedUsers.addAll(allUsers);
    _assignedUsers.sort((p1, p2) => p1.name.compareTo(p2.name));
    _assignedUsersMap.addAll({for (TropUser? m in allUsers) m!.key: m});

    if(context == null) return;
    callProvidersWithAssignedUsersOf(context);
  }

  void updateAssignedUsers(List<TropUser> newUsers, {BuildContext? context}){

    for(TropUser user in newUsers) {
      int index = _assignedUsers.indexWhere((userIter) => userIter.key == user.key);
      if(index == -1) continue;
      _assignedUsers.removeAt(index);
      _assignedUsers.insert(index, user);
      _assignedUsersMap[user.key] = user;
    }

    if(context == null) return;
    callProvidersWithAssignedUsersOf(context);
  }

  void removeAssignedUsersByKey(List<String> userKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _assignedUsers.removeWhere((user) => userKeys.contains(user.key));
    for(String managerKey in userKeys)
      _assignedUsersMap.remove(managerKey);

    if(context == null) return;
    callProvidersWithAssignedUsersOf(context);
  }

  void removeAssignedUsers(TropUser user, {bool shrinkTotalCount=true}){
    bool success = _assignedUsers.remove(user);
    TropUser? removed = _assignedUsersMap.remove(user.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");
  }

  // Loaded users

  void addLoadedUsers(List<TropUser> newUsers, {BuildContext? context}){

    for(TropUser user in newUsers) {
      if(_loadedUsersMap.containsKey(user.key)) continue;
      _loadedUsers.add(user);
      _loadedUsersMap[user.key] = user;
    }

    if(context == null) return;
    callProvidersWithLoadedUsersOf(context);

  }

  void setAllLoadedUsers(List<TropUser> allUsers, {BuildContext? context}){
    _loadedUsers.clear();
    _loadedUsersMap.clear();
    _loadedUsers.addAll(allUsers);
    _loadedUsers.sort((o1, o2) => o1.name.compareTo(o2.name));
    _loadedUsersMap.addAll({for (TropUser u in allUsers) u.key: u});

    if(context == null) return;
    callProvidersWithLoadedUsersOf(context);
  }

  void updateLoadedUsers(List<TropUser> newUsers, {BuildContext? context}){

    for(TropUser user in newUsers) {
      int index = _loadedUsers.indexWhere((userIter) => userIter.key == user.key);
      if(index == -1) continue;
      _loadedUsers.removeAt(index);
      _loadedUsers.insert(index, user);
      _loadedUsersMap[user.key] = user;
    }

    if(context == null) return;
    callProvidersWithLoadedUsersOf(context);
  }

  void removeLoadedUsersByKey(List<String> userKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _loadedUsers.removeWhere((user) => userKeys.contains(user.key));
    for(String userKey in userKeys){
      TropUser? removed = _loadedUsersMap.remove(userKey);
      if(removed != null && shrinkTotalCount)
        userCount -= 1;
    }

    if(context == null) return;
    callProvidersWithLoadedUsersOf(context);
  }

  void removeLoadedUsers(TropUser user, {bool shrinkTotalCount=true}){
    bool success = _loadedUsers.remove(user);
    TropUser? removed = _loadedUsersMap.remove(user.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      userCount -= 1;
  }

  // static void fixNoUserInOwnTrops() {
  //   bool anyFixed = false;
  //   for(Trop trop in allOwn) {
  //     if (AccountData.loggedIn && trop.loadedUsers.isEmpty){
  //       trop.addLoadedUsers([
  //         TropUser(
  //             key: AccountData.key!,
  //             name: AccountData.name!,
  //             shadow: false,
  //             sex: Sex.male,
  //             role: TropRole.OWNER,
  //             tmpNick: null
  //         )
  //       ]);
  //       trop.save(localOnly: true, synced: false);
  //       anyFixed = true;
  //     }
  //   }
  //   if(anyFixed) synchronizer.post();
  // }

  bool isUserWithinLoaded(TropUser user){
    if(loadedUsers.isEmpty) return false;
    TropUser lastLoaded = loadedUsers.last;

    int roleResult = tropRoleToLoadingOrder(user.role) - tropRoleToLoadingOrder(lastLoaded.role);
    int nameResult = compareText(user.name, lastLoaded.name);
    int keyResult = compareText(user.key, lastLoaded.key);

    return roleResult < 0 || (roleResult == 0 &&
        nameResult < 0 && (nameResult == 0 ||
        keyResult < 0)
    );
  }


  static const String syncClassId = 'trop';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => SyncGetRespNode.tropNodes;

  @override
  String get paramId => lclId!;

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
    value: () => formatDate(startDate)
  );

  SyncableParamSingle get syncParamEndDate => SyncableParamSingle(
    this,
    paramId: paramEndDate,
    value: () => formatDate(endDate),
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
    key = resp.key;
    name = resp.name;
    customIconTropName = resp.customIconTropName;
    category = resp.category;
    aims = resp.aims;
    startDate = resp.startDate;
    endDate = resp.endDate;

    completed = resp.completed;
    completionDate = resp.completionDate;

    lastUpdateTime = resp.lastUpdateTime;

    setAllAssignedUsers(resp.assignedUsers.values.toList());

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
            assignee: _assignedUsersMap[taskResp.assigneeKey],
            assigneeCustomText: taskResp.assigneeCustomText,
            completed: taskResp.completed,
            trop: this
        );
        tasks.insert(i, task);
      } else
        task.applySyncGetResp(resp.tasks[taskIclId]!);
    }

  }

  static void handleExtrasAfterSync(Map extra){
    
    Map lclIdToKey = extra["lclIdToKey"];
    
    for(String lclId in lclIdToKey.keys){
      allOwnMapByLclId[lclId]!.key = lclIdToKey[lclId];
      allOwnMapByLclId[lclId]!.saveOwn(localOnly: true, synced: true);
    }
    
  }
  
}

class TropTaskExampleData{

  String content;

  TropTaskExampleData({required this.content});

}

abstract class TropTaskBaseData extends TropTaskExampleData{

  String? lclId;
  String? _summary;
  DateTime deadline;
  String? assigneeCustomText;
  bool completed;

  // TropUser? get assignee;

  TropTaskBaseData({
    this.lclId,
    required super.content,
    String? summary,
    required this.deadline,
    this.assigneeCustomText,
    this.completed = false,
  }):
        _summary = summary;

  String? get summary => _summary;
  set summary(String? value){
    if(value == null || value.isEmpty) _summary = null;
    else _summary = value;
  }

}

class TropTaskData extends TropTaskBaseData{

  TropUser? currentAssignee;
  TropUserNick? newAssigneeByNick;
  TropUser? newAssigneeByKey;

  TropTaskData({
    super.lclId,
    required super.content,
    super.summary,
    required super.deadline,
    this.currentAssignee,
    this.newAssigneeByNick,
    this.newAssigneeByKey,
    super.assigneeCustomText,
    super.completed = false,
  });

  TropTask toTask(Trop trop) => TropTask.create(
      lclId: lclId,
      content: content,
      deadline: deadline,
      assignee: newAssigneeByNick??newAssigneeByKey??currentAssignee,
      assigneeCustomText: assigneeCustomText,
      completed: completed,
      trop: trop
  );

  Map toCreateReqData({bool withLclId = false}) => {
    if(withLclId) 'lclId': lclId,
    'content': content,
    if(summary != null) 'summary': summary,
    'deadline': formatDate(deadline),
    if(assigneeCustomText != null) 'assigneeCustomText': assigneeCustomText,
    if(newAssigneeByNick != null) 'assigneeNick': newAssigneeByNick!.nick,
    if(newAssigneeByKey != null) 'assigneeKey': newAssigneeByKey!.key,
    'completed': completed,
  };

  Map toUpdateData({required TropTask currentTask, bool withLclId = false}) => {
    if(withLclId) 'lclId': lclId,
    if(currentTask.content != content) 'content': content,
    if(currentTask.summary != summary) 'summary': summary,
    if(currentTask.deadline != deadline) 'deadline': formatDate(deadline),
    if(currentTask.assigneeCustomText != assigneeCustomText) 'assigneeCustomText': assigneeCustomText,

    if(newAssigneeByNick != null) 'assigneeNick': newAssigneeByNick!.nick
    else if(currentTask.assignee != null && currentAssignee == null) 'assigneeNick': null,

    if(newAssigneeByKey != null) 'assigneeKey': newAssigneeByKey!.key
    else if(currentTask.assignee != null && currentAssignee == null) 'assigneeKey': null,

    if(currentTask.completed != completed) 'completed': completed,
  };

}

class TropTask extends TropTaskBaseData with SyncableParamGroupMixin, SyncGetRespNode<TropTaskGetResp>, RemoveSyncItem{

  static const String paramLclId = 'lclId';
  static const String paramContent = 'content';
  static const String paramSummary = 'summary';
  static const String paramDeadline = 'deadline';
  static const String paramAssigneeKey = 'assigneeKey';
  static const String paramAssigneeCustomText = 'assigneeCustomText';
  static const String paramCompleted = 'completed';

  static const int maxLenContent = 320;
  static const int maxLenSummary = 640;

  @override
  final String lclId;

  final Trop trop;

  TropUser? assignee;

  TropTask({
    required this.lclId,
    required super.content,
    super.summary,
    required super.deadline,
    this.assignee,
    super.assigneeCustomText,
    super.completed = false,

    required this.trop,
  });

  static TropTask create({
    String? lclId,
    required String content,
    String? summary,
    required DateTime deadline,
    TropUser? assignee,
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
    paramAssigneeCustomText: assigneeCustomText,
    paramCompleted: completed,
  };

  static TropTask fromRespMap(Map respMapData, String lclId, Trop trop) => TropTask(
    lclId: lclId,
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary],
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
    assignee: trop._assignedUsersMap[respMapData[paramAssigneeKey]],
    assigneeCustomText: respMapData[paramAssigneeCustomText],
    completed: respMapData[paramCompleted]??false,
    trop: trop,
  );

  @override
  FutureOr<void> applySyncGetResp(TropTaskGetResp resp){
    content = resp.content;
    summary = resp.summary;
    deadline = resp.deadline;
    assignee = trop._assignedUsersMap[resp.assigneeKey];
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
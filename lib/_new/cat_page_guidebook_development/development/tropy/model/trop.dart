import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/date_format.dart';
import 'package:harcapp/_common_classes/missing_decode_param_error.dart';
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
import 'package:webfeed/util/iterable.dart';

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

class TropPreviewData{

  static List<TropPreviewData>? all;
  static Map<String, TropPreviewData>? allMapByUniqName;

  static bool get hasAny => all != null && all!.isNotEmpty;

  static addToAll(TropPreviewData t){
    if(all == null){
      all = [];
      allMapByUniqName = {};
    }
    if(allMapByUniqName![t.uniqName] != null) return;

    all!.add(t);
    allMapByUniqName![t.uniqName] = t;
  }

  static addAllToAll(List<TropPreviewData> tropPrevs){
    if(all == null){
      all = [];
      allMapByUniqName = {};
    }
    for(TropPreviewData t in tropPrevs){
      if(allMapByUniqName![t.uniqName] != null) continue;

      all!.add(t);
      allMapByUniqName![t.uniqName] = t;
    }
  }

  static void setAll(List<TropPreviewData> allTropPrevs) {
    if (all == null) {
      all = [];
      allMapByUniqName = {};
    } else {
      all!.clear();
      allMapByUniqName!.clear();
    }
    addAllToAll(allTropPrevs);
  }

  static forget(){
    all = null;
    allMapByUniqName = null;
  }
  
  static removeAbsent(){
    if(allMapByUniqName == null) return;
    Directory sharedTropyDir = Directory(getSharedTropPreviewDataFolderPath);
    for (FileSystemEntity file in sharedTropyDir.listSync(recursive: false))
      if(!allMapByUniqName!.containsKey(basename(file.path)))
        file.deleteSync();
  }

  void dumpAsPreview(){
    saveStringAsFileToFolder(
      getSharedTropPreviewDataFolderLocalPath,
      jsonEncode(toJsonMap()),
      fileName: uniqName,
    );
    logger.i('Dumped trop preview $uniqName');
  }

  Map toJsonMap() => {
    Trop.paramName: name,
    Trop.paramCustomIconTropName: customIconTropName,
    Trop.paramCategory: tropCategoryToStr(category),

    Trop.paramStartDate: formatDate(startDate),
    Trop.paramEndDate: formatDate(endDate),

    Trop.paramLastUpdateTime: lastUpdateTime.toIso8601String(),
  };
  
  String uniqName;
  String name;
  TropCategory category;
  String? customIconTropName;

  DateTime startDate;
  DateTime endDate;

  DateTime lastUpdateTime;

  TropPreviewData({
    required this.uniqName,
    required this.name,
    required this.category,
    required this.customIconTropName,

    required this.startDate,
    required this.endDate,

    required this.lastUpdateTime,
  });

  static TropPreviewData fromRespMap(Map respMapData, String uniqName) => TropPreviewData(
    uniqName: uniqName,
    name: respMapData[Trop.paramName]??(throw MissingDecodeParamError(Trop.paramName)),
    customIconTropName: respMapData[Trop.paramCustomIconTropName],
    category: strToTropCategory(respMapData[Trop.paramCategory])??(throw MissingDecodeParamError(Trop.paramCategory)),
    startDate: DateTime.parse(respMapData[Trop.paramStartDate]??(throw MissingDecodeParamError(Trop.paramStartDate))),
    endDate: DateTime.parse(respMapData[Trop.paramEndDate]??(throw MissingDecodeParamError(Trop.paramEndDate))),
    lastUpdateTime: DateTime.parse(respMapData[Trop.paramLastUpdateTime]??(throw MissingDecodeParamError(Trop.paramLastUpdateTime))),
  );
  
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
  static late Map<String, Trop> allOwnMapByUniqName;

  static addOwnToAll(Trop t, {BuildContext? context}){
    if(allOwnMapByUniqName[t.uniqName] != null) return;

    allOwn.add(t);
    allOwnMapByUniqName[t.uniqName] = t;

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeOwnFromAll(Trop t, {BuildContext? context}){
    if(allOwnMapByUniqName[t.uniqName] == null) return;

    allOwn.remove(t);
    allOwnMapByUniqName.remove(t.uniqName);

    if(context == null) return;
    callProvidersOf(context);
  }

  static late List<Trop> allSharedWithMe;
  static late Map<String, Trop> allSharedWithMeMapByUniqName;

  static addSharedWithMeToAll(Trop t, {BuildContext? context}){
    if(allSharedWithMeMapByUniqName[t.uniqName] != null) return;

    allSharedWithMe.add(t);
    allSharedWithMeMapByUniqName[t.uniqName] = t;

    if(context == null) return;
    callProvidersOf(context);
  }

  static removeSharedWithMeFromAll(Trop t, {BuildContext? context}){
    if(allSharedWithMeMapByUniqName[t.uniqName] == null) return;

    allSharedWithMe.remove(t);
    allSharedWithMeMapByUniqName.remove(t.uniqName);

    if(context == null) return;
    callProvidersOf(context);
  }
  
  static removeAbsentPreviewsFromSharedWithMe(){
    Directory sharedTropyDir = Directory(getSharedTropPreviewDataFolderPath);
    for (FileSystemEntity file in sharedTropyDir.listSync(recursive: false)) {
      File tropFile = File(getSharedTropFolderPath + basename(file.path));
      if(!tropFile.existsSync()) return;
      if(!allSharedWithMeMapByUniqName.containsKey(basename(file.path)))
        tropFile.deleteSync();
    }
  }
  
  static Future<void> init() async {
    
    allOwn = [];
    allOwnMapByUniqName = {};
    
    allSharedWithMe = [];
    allSharedWithMeMapByUniqName = {};
    
    List<TropPreviewData> allPreviewData = [];
    
    Directory ownTropDir = Directory(getOwnTropFolderPath);
    await ownTropDir.create(recursive: true);
    for (FileSystemEntity file in ownTropDir.listSync(recursive: false)) {
      Trop? trop = Trop.readOwnFromUniqName(basename(file.path));
      if(trop == null) continue;
      allOwn.add(trop);
      allOwnMapByUniqName[trop.uniqName] = trop;
    }
    fixNoUserInOwnTrops();

    Directory sharedTropDir = Directory(getSharedTropFolderPath);
    await sharedTropDir.create(recursive: true);
    for (FileSystemEntity file in sharedTropDir.listSync(recursive: false)) {
      Trop? trop = Trop.readSharedFromUniqName(basename(file.path));
      if(trop == null) continue;
      allSharedWithMe.add(trop);
      allSharedWithMeMapByUniqName[trop.uniqName] = trop;
    }

    Directory previewDataTropDir = Directory(getSharedTropPreviewDataFolderPath);
    await previewDataTropDir.create(recursive: true);
    for (FileSystemEntity file in previewDataTropDir.listSync(recursive: false)) {
      Map data = jsonDecode(readFileAsString(file.path));
      try {
        TropPreviewData? tropPreviewData = TropPreviewData.fromRespMap(data, basename(file.path));
        allPreviewData.add(tropPreviewData);
      } catch (e){
        logger.e(e);
        continue;
      }
    }
    
    TropPreviewData.setAll(allPreviewData);

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
  static const String paramLastUpdateTime = 'lastUpdateTime';
  static const String paramAssignedUsers = 'assignedUsers';
  static const String paramLoadedUsers = 'loadedUsers';
  static const String paramUserCount = 'userCount';

  static const int maxLenName = 80;
  static const int maxAimCount = 50;
  static const int maxLenAim = 200;
  static const int maxTaskCount = 50;

  final String uniqName;
  // This can be null only when trop is not yet synced.
  final DateTime? lastServerUpdateTime;

  DateTime startDate;
  DateTime endDate;

  bool completed;
  DateTime? completionDate;

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

  TropRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    return (_assignedUsersMap[accKey]??_loadedUsersMap[accKey])?.role;
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
    required this.lastServerUpdateTime,
    required Map<String, TropUser> assignedUsersMap,
    required Map<String, TropUser> loadedUsersMap,

    required this.userCount,

    super.notesForLeaders,
    super.exampleSpraws,
  }): _assignedUsersMap = assignedUsersMap,
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
  }

  static Trop create({
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
    required DateTime? lastServerUpdateTime,
  }){

    Trop trop = Trop(
        uniqName: uniqName??const Uuid().v4(),
        name: name,
        customIconTropName: customIconTropName,
        category: category,
        aims: aims,

        startDate: startDate,
        endDate: endDate,

        completed: completed,
        completionDate: completionTime,

        tasks: [],
        lastServerUpdateTime: lastServerUpdateTime,
        assignedUsersMap: {},
        loadedUsersMap: {},

        userCount: 0
    );

    trop.tasks = tasks.map((t) => t.toTask(trop)).toList();
    return trop;
  }

  static Trop fromRespMap(Map respMapData, String uniqName, {bool fromServer = true}){

    DateTime? lastServerUpdateTime = DateTime.tryParse(respMapData[paramLastUpdateTime]??'');
    if(fromServer && lastServerUpdateTime == null)
      throw MissingDecodeParamError(paramLastUpdateTime);

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
      lastServerUpdateTime: lastServerUpdateTime,
      assignedUsersMap: {},
      loadedUsersMap: {},
      userCount: respMapData[paramUserCount]??(throw MissingDecodeParamError(paramUserCount))
    );

    List<TropTask> tasks = [];
    for(String taskLclId in (respMapData[paramTasks]??{}).keys)
      tasks.add(TropTask.fromRespMap(respMapData[paramTasks][taskLclId], taskLclId, trop));
    trop.tasks = tasks;

    Map<String, TropUser> assignedUsers = {};
    for(String userKey in (respMapData[paramAssignedUsers]??{}).keys)
      assignedUsers[userKey] = TropUser.fromRespMap(respMapData[paramAssignedUsers][userKey], key: userKey);
    trop.addAssignedUsers(assignedUsers.values.toList());

    Map<String, TropUser> loadedUsers = {};
    for(String userKey in (respMapData[paramLoadedUsers]??{}).keys)
      loadedUsers[userKey] = TropUser.fromRespMap(respMapData[paramLoadedUsers][userKey], key: userKey);
    trop.addLoadedUsers(loadedUsers.values.toList());

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

  static Trop? readOwnFromUniqName(String uniqName, {bool log = true}){
    try {
      String tropData = readFileAsString(getOwnTropFolderPath + uniqName);
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
          String taskLclId = taskMap[paramUniqName];
          taskMap.remove(paramUniqName);
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

      Trop trop = fromRespMap(map, uniqName, fromServer: false);

      if(needsUpdating)
        saveStringAsFileToFolder(
          getMyTropFolderLocalPath,
          jsonEncode(trop.toJsonMap()),
          fileName: uniqName,
        );
      // TMP TMP TMP

      return trop;
    } catch(e) {
      if(log) logger.e(e);
      return null;
    }
  }
  static Trop? readSharedFromUniqName(String uniqName, {bool log = true}){
    try {
      String tropData = readFileAsString(getSharedTropFolderPath + uniqName);
      Map map = jsonDecode(tropData);
      return fromRespMap(map, uniqName);
    } catch(e) {
      if(log) logger.e(e);
      return null;
    }
  }

  void dumpAsShared(){
    saveStringAsFileToFolder(
      getSharedTropFolderLocalPath,
      jsonEncode(toJsonMap()),
      fileName: uniqName,
    );
    logger.i('Dumped trop $uniqName');
  }

  TropPreviewData toPreviewData() => TropPreviewData(
    uniqName: uniqName,
    name: name,
    customIconTropName: customIconTropName,
    category: category,
    startDate: startDate,
    endDate: endDate,
    lastUpdateTime: lastServerUpdateTime!
  );

  Map toJsonMap() => {
    paramName: name,
    paramCustomIconTropName: customIconTropName,
    paramCategory: tropCategoryToStr(category),
    paramAims: aims,

    paramStartDate: formatDate(startDate),
    paramEndDate: formatDate(endDate),

    paramCompleted: completed,
    paramCompletionTime: completionDate?.toIso8601String(),

    paramTasks: { for(TropTask task in tasks) task.lclId: task.toJsonMap() },
    paramLastUpdateTime: lastServerUpdateTime?.toIso8601String(),
    paramAssignedUsers: _assignedUsersMap.map((key, value) => MapEntry(key, value.toJsonMap())),
    paramLoadedUsers: _loadedUsersMap.map((key, value) => MapEntry(key, value.toJsonMap())),

    paramUserCount: userCount
  };

  void save({localOnly = false, bool synced = false}){

    // Mark removed tasks as removed.
    Trop? oldTrop = readOwnFromUniqName(uniqName, log: false);
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
      removeOwnFromAll(this, context: context);
      return true;
    }catch(e){
      if(context != null) showAppToast(context, text: 'Wystąpił problem z usuwaniem tropu.');
      return false;
    }
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

  static void fixNoUserInOwnTrops() {
    bool anyFixed = false;
    for(Trop trop in allOwn) {
      if (AccountData.loggedIn && trop.loadedUsers.isEmpty){
        trop.addLoadedUsers([
          TropUser(
              key: AccountData.key!,
              name: AccountData.name!,
              shadow: false,
              sex: Sex.male,
              role: TropRole.OWNER,
              tmpNick: null
          )
        ]);
        trop.save(localOnly: true, synced: false);
        anyFixed = true;
      }
    }
    if(anyFixed) synchronizer.post();
  }

  bool isUserWithinLoaded(TropUser user){
    if(loadedUsers.isEmpty) return false;
    TropUser lastLoaded = loadedUsers.last;
    return tropRoleToLoadingOrder(user.role) < tropRoleToLoadingOrder(lastLoaded.role) ||
        compareText(user.name, lastLoaded.name) < 0 ||
        compareText(user.key, lastLoaded.key) < 0;
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
    name = resp.name;
    customIconTropName = resp.customIconTropName;
    category = resp.category;
    aims = resp.aims;
    startDate = resp.startDate;
    endDate = resp.endDate;

    completed = resp.completed;
    completionDate = resp.completionDate;

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

}

class TropTaskBaseData{

  String content;

  TropTaskBaseData({required this.content});

}

class TropTaskData extends TropTaskBaseData{

  String? lclId;
  String? _summary;
  DateTime deadline;
  TropUser? assignee;
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
  static const String paramAssigneeNick = 'assigneeNick';
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
    paramAssigneeNick: assignee?.tmpNick,
    paramAssigneeCustomText: assigneeCustomText,
    paramCompleted: completed,
  };

  static TropTask fromRespMap(Map respMapData, String lclId, Trop trop) => TropTask(
    lclId: lclId,
    content: respMapData[paramContent]??(throw MissingDecodeParamError(paramContent)),
    summary: respMapData[paramSummary],
    deadline: DateTime.tryParse(respMapData[paramDeadline])??(throw MissingDecodeParamError(paramDeadline)),
    assignee: trop._assignedUsersMap[respMapData[paramAssigneeNick]],
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
      paramId: paramAssigneeNick,
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
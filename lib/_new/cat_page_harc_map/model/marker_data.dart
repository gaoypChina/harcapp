import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_visibility.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import '../../api/_api.dart';
import '../../cat_page_home/community/model/community_category.dart';
import 'marker_manager.dart';
import 'marker_role.dart';


class MarkerProvider extends ChangeNotifier{
  static MarkerProvider of(BuildContext context) => Provider.of<MarkerProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class MarkerListProvider extends ChangeNotifier{
  static MarkerListProvider of(BuildContext context) => Provider.of<MarkerListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class MarkerManagersProvider extends ChangeNotifier{

  static MarkerManagersProvider of(BuildContext context) => Provider.of<MarkerManagersProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  static final List<void Function()> _listeners = [];

  static void addOnNotifyListener(void Function() listener){
    _listeners.add(listener);
  }

  static void removeOnNotifyListener(void Function() listener){
    _listeners.remove(listener);
  }

  void notify(){
    for(void Function() listener in _listeners)
      listener.call();
    notifyListeners();
  }

}

class MarkerData{

  static const int managerPageSize = 10;

  static callProvidersOf(BuildContext context) =>
      callProviders(MarkerProvider.of(context), MarkerListProvider.of(context));

  static callProviders(MarkerProvider markerProv, MarkerListProvider markerListProv){
    markerProv.notify();
    markerListProv.notify();
  }

  static callProvidersWithManagersOf(BuildContext context){
    callProvidersOf(context);
    CommunityManagersProvider.notify_(context);
  }

  static callProvidersWithManagers(MarkerProvider markerProv, MarkerListProvider markerListProv, MarkerManagersProvider markerManagersProv){
    callProviders(markerProv, markerListProv);
    markerManagersProv.notify();
  }

  final String key;
  String? name;
  CommonContactData? contact;
  double lat;
  double lng;
  MarkerType type;
  MarkerVisibility visibility;
  Map<CommunityCategory, int> communitiesBasicData;

  final List<MarkerManager> _managers;
  final Map<String, MarkerManager> _managersMap;
  List<MarkerManager> get managers => _managers;
  Map<String, MarkerManager> get managersMap => _managersMap;

  int managerCount;

  List<Tuple2<CommunityPreviewData, String?>>? communities;
  late bool anyDoubleCommunityCategories;

  MarkerRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    MarkerManager? me = _managersMap[accKey];

    if(me == null){
      AccountData.forgetAccount();
      AccountData.callOnForceLogout();
      return null;
    }

    return me.role;
  }

  MarkerData({
    required this.key,
    required this.name,
    required this.contact,
    required this.lat,
    required this.lng,
    required this.type,
    required this.visibility,
    required List<MarkerManager> managers,
    required this.managerCount,
    required this.communitiesBasicData,
  }):
        _managers = managers,
        _managersMap = {for (MarkerManager m in managers) m.key: m}
  {
    anyDoubleCommunityCategories = false;
    for(int counts in communitiesBasicData.values)
      if(counts > 1) {
        anyDoubleCommunityCategories = true;
        break;
      }
  }

  static MarkerData fromMap(Map map, {String? key}){

    Map<String, int> commBasicDataRaw = ((map['communitiesBasicData']??(throw InvalidResponseError('communitiesBasicData'))) as Map).cast<String, int>();
    Map<CommunityCategory, int> commBasicData = {};
    for(String commCatStr in commBasicDataRaw.keys){
      CommunityCategory? commCat = strToCommCat[commCatStr];
      if(commCat == null) continue;
      commBasicData[commCat] = commBasicDataRaw[commCatStr]!;
    }

    return MarkerData(
        key: key??map['_key']??(throw InvalidResponseError('_key')),
        name: map['name'],
        contact: map['contact'] == null?null:CommonContactData.fromMap(map['contact']),
        lat: map['lat']??(throw InvalidResponseError('lat')),
        lng: map['lng']??(throw InvalidResponseError('lng')),
        type: strToMarkerType[map['type']??(throw InvalidResponseError('type'))]??MarkerType.ERROR,
        visibility: strToMarkerVisibility[map['visibility']??(throw InvalidResponseError('visibility'))]??MarkerVisibility.ERROR,
        managers: (map['managers']??[]).map<MarkerManager>((data) => MarkerManager.fromMap(data)).toList(),
        managerCount: map['managerCount']??(throw InvalidResponseError('managerCount')),
        communitiesBasicData: commBasicData
    );

  }

  static MarkerData fromSimple({
    required double lat,
    required double lng,
    required MarkerType type,
    required MarkerVisibility visibility,
  }) => MarkerData(
    key: '',
    name: '',
    contact: null,
    lat: lat,
    lng: lng,
    type: type,
    visibility: visibility,
    managers: [],
    managerCount: 0,
    communitiesBasicData: {}
  );

  void update(MarkerData updatedMarker){

    name = updatedMarker.name;
    contact = updatedMarker.contact;

    lat = updatedMarker.lat;
    lng = updatedMarker.lng;
    type = updatedMarker.type;
    visibility = updatedMarker.visibility;
    communitiesBasicData = updatedMarker.communitiesBasicData;

    if(updatedMarker.communities != null)
      communities = updatedMarker.communities;

  }

  void addManagers(List<MarkerManager> newManagers, {BuildContext? context}){

    for(MarkerManager manager in newManagers) {
      if(_managersMap.containsKey(manager.key)) continue;
      _managers.add(manager);
      _managersMap[manager.key] = manager;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);

  }

  void setAllManagers(List<MarkerManager> allManagers, {BuildContext? context}){
    _managers.clear();
    _managersMap.clear();
    _managers.addAll(allManagers);
    _managers.sort((m1, m2) => m1.name.compareTo(m2.name));
    _managersMap.addAll({for (MarkerManager? m in allManagers) m!.key: m});

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }

  void updateManagers(List<MarkerManager> newManagers, {BuildContext? context}){

    for(MarkerManager manager in newManagers) {
      int index = _managers.indexWhere((managerIter) => managerIter.key == manager.key);
      _managers.removeAt(index);
      _managers.insert(index, manager);
      _managersMap[manager.key] = manager;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }

  void removeManagersByKey(List<String> managerKeys, {BuildContext? context}){

    _managers.removeWhere((manager) => managerKeys.contains(manager.key));
    for(String managerKey in managerKeys) _managersMap.remove(managerKey);

    if(context == null) return;
    Provider.of<MarkerManagersProvider>(context, listen: false).notify();
    Provider.of<MarkerProvider>(context, listen: false).notify();
  }

  void removeManager(MarkerManager manager){
    _managers.remove(manager);
    _managersMap.remove(manager.key);
  }

}
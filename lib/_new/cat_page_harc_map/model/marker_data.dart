import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_common_classes/sorted_list.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_visibility.dart';
import 'package:harcapp/_new/cat_page_harc_map/utils.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:latlong2/latlong.dart';
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

  static callProvidersOf(BuildContext context) =>
      callProviders(MarkerProvider.of(context), MarkerListProvider.of(context));

  static callProviders(MarkerProvider markerProv, MarkerListProvider markerListProv){
    markerProv.notify();
    markerListProv.notify();
  }

  static callProvidersWithManagersOf(BuildContext context){
    callProvidersOf(context);
    MarkerManagersProvider.notify_(context);
  }

  static callProvidersWithManagers(MarkerProvider markerProv, MarkerListProvider markerListProv, MarkerManagersProvider markerManagersProv){
    callProviders(markerProv, markerListProv);
    markerManagersProv.notify();
  }

  static const int managerPageSize = 10;

  static List<MarkerData>? _all;
  static Map<String, MarkerData>? _allMap;

  static List<MarkerData>? get all => _all;
  static Map<String, MarkerData>? get allMap => _allMap;

  static forget(){
    _all = null;
    _allMap = null;
  }

  // Ascending
  static SortedList<MarkerData> sortedLat = SortedList.from(elements: [], compare: (m1, m2) => (m1.lat - m2.lat).sign.toInt());
  // Ascending
  static SortedList<MarkerData> sortedLng = SortedList.from(elements: [], compare: (m1, m2) => (m1.lng - m2.lng).sign.toInt());

  // Ascending
  static SortedList<MarkerData> sortedMinZoomNorthBorder = SortedList.from(elements: [], compare: (m1, m2) => (m1.minZoomNorthLat - m2.minZoomNorthLat).sign.toInt());
  // Ascending
  static SortedList<MarkerData> sortedMinZoomSouthBorder = SortedList.from(elements: [], compare: (m1, m2) => (m1.minZoomSouthLat - m2.minZoomSouthLat).sign.toInt());
  // Ascending
  static SortedList<MarkerData> sortedMinZoomWestBorder = SortedList.from(elements: [], compare: (m1, m2) => (m1.minZoomWestLng - m2.minZoomWestLng).sign.toInt());
  // Ascending
  static SortedList<MarkerData> sortedMinZoomEastBorder = SortedList.from(elements: [], compare: (m1, m2) => (m1.minZoomEastLng - m2.minZoomEastLng).sign.toInt());
  // Ascending
  static SortedList<MarkerData> sortedZoom = SortedList.from(elements: [], compare: (m1, m2) => (m1.minZoomAppearance - m2.minZoomAppearance).sign.toInt());

  static Set<MarkerData> findMarkersInBounds({
    required double northLat,
    required double southLat,
    required double westLng,
    required double eastLng,
    double? zoom
  }){

    int maxLatIdx = _findClosestIndexFulfillingComp(sortedLat, (m) => m.lat < northLat, firstTrue: false);
    int minLatIdx = _findClosestIndexFulfillingComp(sortedLat, (m) => m.lat > southLat, firstTrue: true);

    int minLngIdx = _findClosestIndexFulfillingComp(sortedLng, (m) => m.lng > westLng, firstTrue: true);
    int maxLngIdx = _findClosestIndexFulfillingComp(sortedLng, (m) => m.lng < eastLng, firstTrue: false);

    Set<MarkerData> markersLat = sortedLat.sublist(minLatIdx, maxLatIdx).toSet();

    Set<MarkerData> markersLng = sortedLng.sublist(minLngIdx, maxLngIdx).toSet();

    Set<MarkerData> markers = markersLat.intersection(markersLng);

    if(zoom != null){
      int maxZoomIdx = _findClosestIndexFulfillingComp(sortedZoom, (m) => m.minZoomAppearance < zoom, firstTrue: false);
      Set<MarkerData> markersMinZoom = sortedZoom.sublist(0, maxZoomIdx).toSet();
      markers = markers.intersection(markersMinZoom);
    }

    return markers;

  }

  static int _findClosestIndexFulfillingComp(SortedList<MarkerData> list, bool Function(MarkerData) compare, {required firstTrue}) {
    if (list.isEmpty) return 0;
    var start = 0;
    var end = list.length;
    var index = 0;
    while (start < end) {
      final mid = start + ((end - start) >> 1);

      // The element at the middle of the list
      final MarkerData element = list[mid];

      // The result of the comparison of the objects
      final comp = compare(element);
      // if (comp == 0) return mid;
      // [value] is greater than [element]
      if (comp == !firstTrue) {
        start = mid + 1;
        index = start;
      }
      // [value] is smaller than [element]
      else {
        end = mid;
        index = end;
      }

    }
    return index;
  }

  static MarkerData findZoomSource(double lat, double lng){

    int maxLatIdx = _findClosestIndexFulfillingComp(sortedMinZoomNorthBorder, (m) => lat < m.minZoomNorthLat, firstTrue: false);
    int minLatIdx = _findClosestIndexFulfillingComp(sortedMinZoomSouthBorder, (m) => lat > m.minZoomSouthLat, firstTrue: true);

    int maxLngIdx = _findClosestIndexFulfillingComp(sortedMinZoomEastBorder, (m) => lng < m.minZoomEastLng, firstTrue: false);
    int minLngIdx = _findClosestIndexFulfillingComp(sortedMinZoomWestBorder, (m) => lng > m.minZoomWestLng, firstTrue: true);

    Set<MarkerData> markersNorthLat = sortedMinZoomNorthBorder.sublist(0, maxLatIdx).toSet();
    Set<MarkerData> markersSouthLat = sortedMinZoomSouthBorder.sublist(minLatIdx).toSet();

    Set<MarkerData> markersEastLat = sortedMinZoomEastBorder.sublist(0, maxLngIdx).toSet();
    Set<MarkerData> markersWestLat = sortedMinZoomWestBorder.sublist(minLngIdx).toSet();

    Set<MarkerData> possibleClosestMarkers = markersNorthLat
        .intersection(markersSouthLat)
        .intersection(markersEastLat)
        .intersection(markersWestLat);

    MarkerData zoomSource = possibleClosestMarkers.first;
    for(MarkerData m in possibleClosestMarkers)
      if(m.minZoomAppearance > zoomSource.minZoomAppearance)
        zoomSource = m;

    return zoomSource;
  }

  static removeAllByPublic(){
    _all!.removeWhere((marker) => marker.visibility != MarkerVisibility.PUBLIC);
    _allMap!.removeWhere((key, marker) => marker.visibility != MarkerVisibility.PUBLIC);
  }

  static addToAll(MarkerData marker, {BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    if(_allMap![marker.key] != null) return;

    _all!.add(marker);
    _allMap![marker.key] = marker;

    sortedLat.add(marker);
    sortedLng.add(marker);
    sortedMinZoomNorthBorder.add(marker);
    sortedMinZoomSouthBorder.add(marker);
    sortedMinZoomWestBorder.add(marker);
    sortedMinZoomEastBorder.add(marker);
    sortedZoom.add(marker);

    if(context == null) return;
    callProvidersOf(context);
  }

  static List<MarkerData> addAllToAll(List<MarkerData> markers, {BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    List<MarkerData> result = [];

    for(MarkerData marker in markers) {
      if(_allMap!.containsKey(marker.key)) {
        result.add(_allMap![marker.key]!);
        continue;
      }
      _allMap![marker.key] = marker;
      _all!.add(marker);

      sortedLat.add(marker);
      sortedLng.add(marker);
      sortedMinZoomNorthBorder.add(marker);
      sortedMinZoomSouthBorder.add(marker);
      sortedMinZoomWestBorder.add(marker);
      sortedMinZoomEastBorder.add(marker);
      sortedZoom.add(marker);
      result.add(marker);
    }

    if(context != null) callProvidersOf(context);

    return result;
  }

  static updateInAll(MarkerData marker, {BuildContext? context}){
    MarkerData? oldMarker = _allMap![marker.key];
    if(oldMarker == null){
      addToAll(marker, context: context);
      return;
    }

    int index = _all!.indexOf(oldMarker);
    _all!.removeAt(index);
    _all!.insert(index, marker);
    _allMap![marker.key] = marker;

    sortedLat.remove(oldMarker);
    sortedLng.remove(oldMarker);
    sortedMinZoomNorthBorder.remove(oldMarker);
    sortedMinZoomSouthBorder.remove(oldMarker);
    sortedMinZoomWestBorder.remove(oldMarker);
    sortedMinZoomEastBorder.remove(oldMarker);
    sortedZoom.remove(oldMarker);

    sortedLat.add(marker);
    sortedLng.add(marker);
    sortedMinZoomNorthBorder.add(marker);
    sortedMinZoomSouthBorder.add(marker);
    sortedMinZoomWestBorder.add(marker);
    sortedMinZoomEastBorder.add(marker);
    sortedZoom.add(marker);

    if(context == null) return;
    callProvidersOf(context);
  }

  static void removeFromAll(MarkerData marker, {BuildContext? context}){
    if(_all == null)
      return;

    _all!.remove(marker);
    _allMap!.remove(marker.key);

    sortedLat.remove(marker);
    sortedLng.remove(marker);
    sortedMinZoomNorthBorder.remove(marker);
    sortedMinZoomSouthBorder.remove(marker);
    sortedMinZoomWestBorder.remove(marker);
    sortedMinZoomEastBorder.remove(marker);
    sortedZoom.remove(marker);

    if(context == null) return;
    callProvidersOf(context);
  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();

    sortedLat.clear();
    sortedLng.clear();
    sortedMinZoomNorthBorder.clear();
    sortedMinZoomSouthBorder.clear();
    sortedMinZoomWestBorder.clear();
    sortedMinZoomEastBorder.clear();
    sortedZoom.clear();

  }

  final String key;
  String? name;
  CommonContactData? contact;
  double lat;
  late double latDist;
  double lng;
  late double lngDist;
  MarkerType type;
  MarkerVisibility visibility;
  double minZoomAppearance;
  double minZoomNorthLat;
  double minZoomSouthLat;
  double minZoomWestLng;
  double minZoomEastLng;
  Map<CommunityCategory, int> communitiesBasicData;

  int otherMarkersUncertaintyDist = HarcMapUtils.maxLngDistSpan.toInt();

  LatLng get latLng => LatLng(lat, lng);

  final List<MarkerManager> _loadedManagers;
  final Map<String, MarkerManager> _loadedManagersMap;
  List<MarkerManager> get loadedManagers => _loadedManagers;
  Map<String, MarkerManager> get loadedManagersMap => _loadedManagersMap;

  // Null if user is not logged in. In such case he does not see the managers.
  int? managerCount;

  List<Tuple2<CommunityPreviewData, String?>>? communities;
  late bool anyDoubleCommunityCategories;

  MarkerRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    MarkerManager? me = _loadedManagersMap[accKey];

    if(me == null)
      return null;

    return me.role;
  }

  MarkerRole? get myRoleOrLogout{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    MarkerManager? me = _loadedManagersMap[accKey];

    if(me == null){
      AccountData.forgetAccount();
      AccountData.callOnLogout(true);
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
    required this.minZoomAppearance,
    required this.minZoomNorthLat,
    required this.minZoomSouthLat,
    required this.minZoomWestLng,
    required this.minZoomEastLng,

    required List<MarkerManager> managers,
    required this.managerCount,
    required this.communitiesBasicData,
  }):
      _loadedManagers = managers,
      _loadedManagersMap = {for (MarkerManager m in managers) m.key: m}
  {
    CustomPoint latLngPoint = const SphericalMercator().project(LatLng(lat, lng));
    lngDist = latLngPoint.x.toDouble();
    latDist = latLngPoint.y.toDouble();

    anyDoubleCommunityCategories = false;
    for(int counts in communitiesBasicData.values)
      if(counts > 1) {
        anyDoubleCommunityCategories = true;
        break;
      }
  }

  static MarkerData fromRespMap(Map respMap, {String? key}){

    Map<String, int> commBasicDataRaw = ((respMap['communitiesBasicData']??(throw InvalidResponseError('communitiesBasicData'))) as Map).cast<String, int>();
    Map<CommunityCategory, int> commBasicData = {};
    for(String commCatStr in commBasicDataRaw.keys){
      CommunityCategory? commCat = strToCommCat[commCatStr];
      if(commCat == null) continue;
      commBasicData[commCat] = commBasicDataRaw[commCatStr]!;
    }

    MarkerVisibility visibility = strToMarkerVisibility[respMap['visibility']??(throw InvalidResponseError('visibility'))]??MarkerVisibility.ERROR;
    double lat = respMap['lat']??(throw InvalidResponseError('lat'));
    double lng = respMap['lng']??(throw InvalidResponseError('lng'));

    late double minZoomAppearance;
    late double minZoomNorthLat;
    late double minZoomSouthLat;
    late double minZoomWestLng;
    late double minZoomEastLng;

    if(visibility == MarkerVisibility.COMMUNITY_CIRCLE_MEMBERS_ONLY){
      MarkerData zoomSource = findZoomSource(lat, lng);
      (minZoomAppearance, (minZoomNorthLat, minZoomSouthLat, minZoomWestLng, minZoomEastLng)) = HarcMapUtils.getMinZoomData(lat, lng, zoomSource);
    }

    return MarkerData(
        key: key??respMap['_key']??(throw InvalidResponseError('_key')),
        name: respMap['name'],
        contact: respMap['contact'] == null?null:CommonContactData.fromRespMap(respMap['contact']),
        lat: lat,
        lng: lng,
        type: strToMarkerType[respMap['type']??(throw InvalidResponseError('type'))]??MarkerType.error,
        visibility: visibility,
        minZoomAppearance: respMap['minZoomAppearance'] ?? minZoomAppearance,
        minZoomNorthLat: respMap['minZoomNorthLat'] ?? minZoomNorthLat,
        minZoomSouthLat: respMap['minZoomSouthLat'] ?? minZoomSouthLat,
        minZoomWestLng: respMap['minZoomWestLng'] ?? minZoomWestLng,
        minZoomEastLng: respMap['minZoomEastLng'] ?? minZoomEastLng,
        managers: (respMap['managers']??[]).map<MarkerManager>((data) => MarkerManager.fromRespMap(data)).toList(),
        managerCount: respMap['managerCount'],
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
    minZoomAppearance: 0,
    minZoomNorthLat: 0,
    minZoomSouthLat: 0,
    minZoomWestLng: 0,
    minZoomEastLng: 0,
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

  void addLoadedManagers(List<MarkerManager> newManagers, {BuildContext? context}){

    for(MarkerManager manager in newManagers) {
      if(_loadedManagersMap.containsKey(manager.key)) continue;
      _loadedManagers.add(manager);
      _loadedManagersMap[manager.key] = manager;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);

  }

  void setAllLoadedManagers(List<MarkerManager> allManagers, {BuildContext? context}){
    _loadedManagers.clear();
    _loadedManagersMap.clear();
    _loadedManagers.addAll(allManagers);
    _loadedManagersMap.addAll({for (MarkerManager? m in allManagers) m!.key: m});

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }

  void updateLoadedManagers(List<MarkerManager> newManagers, {BuildContext? context}){

    for(MarkerManager manager in newManagers) {
      int index = _loadedManagers.indexWhere((managerIter) => managerIter.key == manager.key);
      if(index == -1) continue;
      _loadedManagers.removeAt(index);
      _loadedManagers.insert(index, manager);
      _loadedManagersMap[manager.key] = manager;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }

  void removeLoadedManagersByKey(List<String> managerKeys, {bool shrinkTotalCount = true, BuildContext? context}){

    _loadedManagers.removeWhere((manager) => managerKeys.contains(manager.key));
    for(String managerKey in managerKeys){
      MarkerManager? removed = _loadedManagersMap.remove(managerKey);
      if(removed != null && shrinkTotalCount)
        managerCount = managerCount! - 1;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }

  void removeLoadedManager(MarkerManager manager, {bool shrinkTotalCount=true}){
    bool success = _loadedManagers.remove(manager);
    MarkerManager? removed = _loadedManagersMap.remove(manager.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      managerCount = managerCount! - 1;
  }

  bool isManagerWithinLoaded(MarkerManager manager){
    if(_loadedManagers.isEmpty) return false;
    MarkerManager lastLoaded = _loadedManagers.last;
    return markerRoleToLoadingOrder(manager.role) < markerRoleToLoadingOrder(lastLoaded.role) ||
        compareText(manager.name, lastLoaded.name) < 0 ||
        compareText(manager.key, lastLoaded.key) < 0;
  }

}
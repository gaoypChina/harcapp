import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common_contact_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../circle/model/circle.dart';
import 'community_role.dart';
import '../forum/model/forum.dart';
import 'community_category.dart';
import 'community_manager.dart';

class CommunityProvider extends ChangeNotifier{
  static CommunityProvider of(BuildContext context) => Provider.of<CommunityProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class CommunityListProvider extends ChangeNotifier{
  static CommunityListProvider of(BuildContext context) => Provider.of<CommunityListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class CommunityManagersProvider extends ChangeNotifier{

  static CommunityManagersProvider of(BuildContext context) => Provider.of<CommunityManagersProvider>(context, listen: false);
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

class CommunityMarkersProvider extends ChangeNotifier{

  static CommunityMarkersProvider of(BuildContext context) => Provider.of<CommunityMarkersProvider>(context, listen: false);
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

class CommunityBasicData{

  final String key;
  String name;
  String iconKey;
  CommunityCategory category;
  CommonContactData? contact;
  List<MarkerData> markers;

  CommunityBasicData({
    required this.key,
    required this.name,
    required this.iconKey,
    required this.category,
    required this.contact,
    required this.markers,
  });

}

class CommunityPreviewData extends CommunityBasicData{

  static const int searchPageSize = 10;

  ForumBasicData? forum;
  CircleBasicData? circle;

  CommunityPreviewData({
    required super.key,
    required super.name,
    required super.iconKey,
    required super.category,
    required super.contact,
    required super.markers,

    required this.forum,
    required this.circle,
  });

  static CommunityPreviewData fromRespMap(Map respMap){

    List<MarkerData> markers = [];
    Map markerResps = respMap['markers']??{};
    for(String markerKey in markerResps.keys){
      Map markerResp = markerResps[markerKey];
      MarkerData m = MarkerData.fromRespMap(markerResp, key: markerKey);
      markers.add(m);
    }

    CommunityPreviewData community = CommunityPreviewData(
      key: respMap['_key']??(throw InvalidResponseError('_key')),
      name: respMap['name']??(throw InvalidResponseError('name')),
      iconKey: respMap['iconKey']??(throw InvalidResponseError('iconKey')),
      category: strToCommCat[respMap['category']??(throw InvalidResponseError('category'))]??CommunityCategory.error,
      contact: respMap['contact']==null?null:CommonContactData.fromRespMap(respMap['contact']),
      markers: markers,
      forum: null,
      circle: null,
    );

    if(respMap['forum'] != null)
      community.forum = ForumBasicData.fromRespMap(respMap['forum'], community);

    if(respMap['circle'] != null)
      community.circle = CircleBasicData.fromRespMap(respMap['circle'], name: respMap['name']);

    return community;
  }

  static CommunityPreviewData fromCommunity(Community community) => CommunityPreviewData(
    key: community.key,
    name: community.name,
    iconKey: community.iconKey,
    category: community.category,
    contact: community.contact,
    forum: community.forum,
    circle: community.circle,
    markers: community.markers
  );

}

class Community extends CommunityBasicData{

  static const int managerPageSize = 10;

  static IconData icon = MdiIcons.googleCirclesCommunities;

  static const int maxLenName = 64;
  static const int maxLenIconKey = 42;

  static Map<String, Circle>? _allCircleMap;
  static Map<String, Forum>? _allForumMap;

  static List<Community>? _all;
  static Map<String, Community>? _allMap;

  static List<Community>? get all => _all;
  static Map<String, Community>? get allMap => _allMap;
  static Map<String, Circle>? get allCircleMap => _allCircleMap;
  static Map<String, Forum>? get allForumMap => _allForumMap;

  static forget(){
    _all = null;
    _allMap = null;
    _allCircleMap = null;
    _allForumMap = null;
  }

  static silentInit(List<Community> communities){
    if(_all == null){
      _all = [];
      _allMap = {};
      _allCircleMap = {};
      _allForumMap = {};
    }

    _all!.clear();
    _allMap!.clear();
    _allCircleMap!.clear();
    _allForumMap!.clear();

    _all!.addAll(communities);

    for (Community community in communities){
      _allMap![community.key] = community;
      if(community.circle != null)
        _allCircleMap![community.circle!.key] = community.circle!;
      if(community.forum != null)
        _allForumMap![community.forum!.key] = community.forum!;
    }

  }

  static callProvidersOf(BuildContext context) =>
    callProviders(CommunityProvider.of(context), CommunityListProvider.of(context));

  static callProviders(CommunityProvider communityProv, CommunityListProvider communityListProv){
    communityProv.notify();
    communityListProv.notify();
  }

  static callProvidersWithManagersOf(BuildContext context){
    callProvidersOf(context);
    CommunityManagersProvider.notify_(context);
  }

  static callProvidersWithManagers(CommunityProvider communityProv, CommunityListProvider communityListProv, CommunityManagersProvider communityManagersProv){
    callProviders(communityProv, communityListProv);
    communityManagersProv.notify();
  }

  static callProvidersWithMarkersOf(BuildContext context){
    callProvidersOf(context);
    CommunityMarkersProvider.notify_(context);
  }

  static callProvidersWithMarkers(CommunityProvider communityProv, CommunityListProvider communityListProv, CommunityMarkersProvider communityMarkersProv){
    callProviders(communityProv, communityListProv);
    communityMarkersProv.notify();
  }

  static init(List<Community> communities, {BuildContext? context}){

    silentInit(communities);

    if(context == null) return;
    callProvidersOf(context);
  }


  static addToAll(Community community, {bool mapCircle = true, bool mapForum = true, BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
      _allCircleMap = {};
      _allForumMap = {};
    }

    if(_allMap![community] != null) return;

    _all!.add(community);
    _allMap![community.key] = community;
    if(mapCircle && community.circle != null)
      _allCircleMap![community.circle!.key] = community.circle!;
    if(mapForum && community.forum != null)
      _allForumMap![community.forum!.key] = community.forum!;

    if(context == null) return;
    callProvidersOf(context);
  }

  static addToAllByForum(Forum forum, {BuildContext? context}){

    if(_all == null){
      _all = [];
      _allMap = {};
    }

    if(allMap!.containsKey(forum.community.key))
      allMap![forum.community.key]!.setForum(forum);
    else
      addToAll(Community(
        key: forum.community.key,
        name: forum.community.name,
        iconKey: forum.community.iconKey,
        category: forum.community.category,
        contact: forum.community.contact,
        circle: null,
        forum: forum,
        managers: [],
        markers: [],
        managerCount: 0
      ), context: context);
  }

  static addToAllByCircle(Circle circle, {BuildContext? context}){

    if(_all == null){
      _all = [];
      _allMap = {};
    }

    if(allMap!.containsKey(circle.community.key))
      allMap![circle.community.key]!.setCircle(circle);
    else
      addToAll(Community(
          key: circle.community.key,
          name: circle.community.name,
          iconKey: circle.community.iconKey,
          category: circle.community.category,
          contact: circle.community.contact,
          circle: circle,
          forum: null,
          managers: [],
          markers: circle.community.markers,
          managerCount: 0
      ), context: context);
  }

  static updateInAll(Community community, {BuildContext? context}){
    Community? oldCommunity = _allMap![community.key];
    if(oldCommunity == null){
      addToAll(community, context: context);
      return;
    }

    int index = _all!.indexOf(oldCommunity);
    _all!.removeAt(index);
    _all!.insert(index, community);
    _allMap![community.key] = community;

    if(oldCommunity.circle != null)
      _allCircleMap!.remove(oldCommunity.circle!.key);
    if(community.circle != null)
      _allCircleMap![community.circle!.key] = community.circle!;

    if(oldCommunity.forum != null)
      _allForumMap!.remove(oldCommunity.forum!.key);
    if(community.forum != null)
      _allForumMap![community.forum!.key] = community.forum!;

    if(context == null) return;
    callProvidersOf(context);
  }

  static void removeFromAll(Community community, {BuildContext? context}){
    if(_all == null)
      return;

    _all!.remove(community);
    _allMap!.remove(community.key);
    if(community.circle != null)
      _allCircleMap!.remove(community.circle!.key);
    if(community.forum != null)
      _allForumMap!.remove(community.forum!.key);

    if(context == null) return;
    callProvidersOf(context);
  }

  static void removeForum(Forum forum, {BuildContext? context}){
    if(_all == null)
      return;

    Community community = allMap![forum.community.key]!;

    if(community.myRole == null && community.circle == null)
      removeFromAll(community);
    else
      community.setForum(null);

    if(context == null) return;
    callProvidersOf(context);

  }

  static void removeCircle(Circle circle, {BuildContext? context}){
    if(_all == null)
      return;

    Community community = allMap![circle.community.key]!;

    if(community.myRole == null && community.forum == null)
      removeFromAll(community);
    else
      community.setCircle(null);

    if(context == null) return;
    callProvidersOf(context);

  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();
  }

  Circle? _circle;
  Circle? get circle => _circle;
  Forum? _forum;
  Forum? get forum => _forum;

  final List<CommunityManager> _loadedManagers;
  final Map<String, CommunityManager> _loadedManagersMap;
  List<CommunityManager> get loadedManagers => _loadedManagers;
  Map<String, CommunityManager> get loadedManagersMap => _loadedManagersMap;

  // This is null if user is not a manager of this community.
  int? managerCount;

  final Map<String, MarkerData> markersMap;

  void update(Community updatedCommunity){
    name = updatedCommunity.name;
    iconKey = updatedCommunity.iconKey;
    category = updatedCommunity.category;
    contact = updatedCommunity.contact;
  }


  void addLoadedManagers(List<CommunityManager> newManagers, {BuildContext? context}){

    for(CommunityManager manager in newManagers) {
      if(_loadedManagersMap.containsKey(manager.key)) continue;
      _loadedManagers.add(manager);
      _loadedManagersMap[manager.key] = manager;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);
    
  }

  void setAllLoadedManagers(List<CommunityManager> allManagers, {BuildContext? context}){
    _loadedManagers.clear();
    _loadedManagersMap.clear();
    _loadedManagers.addAll(allManagers);
    _loadedManagers.sort((m1, m2) => m1.name.compareTo(m2.name));
    _loadedManagersMap.addAll({for (CommunityManager? m in allManagers) m!.key: m});

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }

  void updateLoadedManagers(List<CommunityManager> newManagers, {BuildContext? context}){

    for(CommunityManager manager in newManagers) {
      int index = _loadedManagers.indexWhere((managerIter) => managerIter.key == manager.key);
      if(index == -1) continue;
      _loadedManagers.removeAt(index);
      _loadedManagers.insert(index, manager);
      _loadedManagersMap[manager.key] = manager;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }
  


  void removeLoadedManagersByKey(List<String> managerKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _loadedManagers.removeWhere((manager) => managerKeys.contains(manager.key));
    for(String managerKey in managerKeys){
      CommunityManager? removed = _loadedManagersMap.remove(managerKey);
      if(removed != null && shrinkTotalCount)
        managerCount = managerCount! - 1;
    }

    if(context == null) return;
    callProvidersWithManagersOf(context);
  }
  
  void removeLoadedManager(CommunityManager manager, {bool shrinkTotalCount=true}){
    bool success = _loadedManagers.remove(manager);
    CommunityManager? removed = _loadedManagersMap.remove(manager.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      managerCount = managerCount! - 1;
  }

  bool isManagerWithinLoaded(CommunityManager manager){
    if(_loadedManagers.isEmpty) return false;
    CommunityManager lastLoaded = _loadedManagers.last;
    return communityRoleToLoadingOrder(manager.role) < communityRoleToLoadingOrder(lastLoaded.role) ||
        compareText(manager.name, lastLoaded.name) < 0 ||
        compareText(manager.key, lastLoaded.key) < 0;
  }


  void addMarker(List<MarkerData> newMarker, {BuildContext? context}){

    for(MarkerData marker in newMarker) {
      markers.add(marker);
      markersMap[marker.key] = marker;
    }

    if(context == null) return;
    callProvidersWithMarkersOf(context);

  }

  void setAllMarkers(List<MarkerData> allMarkers, {BuildContext? context}){
    markers.clear();
    markersMap.clear();
    markers.addAll(allMarkers);
    markers.sort((m1, m2) => (m1.name??markerTypeToName(m1.type)).compareTo(m2.name??markerTypeToName(m2.type)));
    markersMap.addAll({for (MarkerData? m in allMarkers) m!.key: m});

    if(context == null) return;
    callProvidersWithMarkersOf(context);
  }

  void updateMarkers(List<MarkerData> newMarkers, {BuildContext? context}){

    for(MarkerData marker in newMarkers) {
      int index = markers.indexWhere((markerIter) => markerIter.key == marker.key);
      markers.removeAt(index);
      markers.insert(index, marker);
      markersMap[marker.key] = marker;
    }

    if(context == null) return;
    callProvidersWithMarkersOf(context);
  }
  
  
  void setCircle(Circle? circle){
    if(_circle != null)
      _allCircleMap!.remove(_circle!.key);
    _circle = circle;
    if(circle != null)
      _allCircleMap![circle.key] = circle;
  }

  void setForum(Forum? forum){
    if(_forum != null)
      _allForumMap!.remove(_forum!.key);
    _forum = forum;
    if(forum != null)
      _allForumMap![forum.key] = forum;
  }

  CommunityRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    CommunityManager? me = _loadedManagersMap[accKey];

    return me?.role;
  }

  Community({
    required super.key,
    required super.name,
    required super.iconKey,
    required super.category,
    required super.contact,
    required super.markers,

    required Circle? circle,
    required Forum? forum,

    required List<CommunityManager> managers,
    this.managerCount,

  }): _circle = circle,
      _forum = forum,
      _loadedManagers = managers,
      _loadedManagersMap = {for (CommunityManager m in managers) m.key: m},
      markersMap = {for (MarkerData m in markers) m.key: m}
  {
    _loadedManagers.sort((m1, m2) => m1.name.compareTo(m2.name));
  }

  static Community fromRespMap(Map respMap){

    List<MarkerData> markers = [];
    Map markerResps = respMap['markers']??{};
    for(String markerKey in markerResps.keys){
      Map markerResp = markerResps[markerKey];
      MarkerData m = MarkerData.fromRespMap(markerResp, key: markerKey);
      markers.add(m);
    }

    Community community = Community(
      key: respMap['_key']??(throw InvalidResponseError('_key')),
      name: respMap['name']??(throw InvalidResponseError('name')),
      iconKey: respMap['iconKey']??(throw InvalidResponseError('iconKey')),
      category: strToCommCat[respMap['category']??(throw InvalidResponseError('category'))]??CommunityCategory.error,
      contact: respMap['contact']==null?null:CommonContactData.fromRespMap(respMap['contact']),
      circle: null,
      forum: null,
      managers: (respMap['managers']??[]).map<CommunityManager>((data) => CommunityManager.fromRespMap(data)).toList(),
      managerCount: respMap['managerCount'],
      markers: markers,
    );

    if(respMap['circle'] != null)
      community._circle = Circle.fromRespMap(respMap['circle'], community);

    if(respMap['forum'] != null)
      community._forum = Forum.fromRespMap(respMap['forum'], community);

    return community;
  }

}
import 'package:flutter/material.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../circle/model/circle.dart';
import '../community_role.dart';
import '../forum/model/forum.dart';
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

class CommunityBasicData{

  final String key;
  String name;
  String iconKey;

  CommunityBasicData({
    required this.key,
    required this.name,
    required this.iconKey,
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
    required this.forum,
    required this.circle,
  });

  static CommunityPreviewData fromResponse(Map resp){

    CommunityPreviewData community = CommunityPreviewData(
      key: resp['_key']??(throw InvalidResponseError('_key')),
      name: resp['name']??(throw InvalidResponseError('name')),
      iconKey: resp['iconKey']??(throw InvalidResponseError('iconKey')),

      forum: null,
      circle: null,
    );

    if(resp.containsKey('forum'))
      community.forum = ForumBasicData.fromResponse(resp['forum'], community);

    if(resp.containsKey('circle'))
      community.circle = CircleBasicData.fromResponse(resp['circle'], name: resp['name']);

    return community;
  }

}

class Community extends CommunityBasicData{

  static const IconData icon = MdiIcons.accountGroup;

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

  static init(List<Community> communities, {BuildContext? context}){

    silentInit(communities);

    if(context == null) return;
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
  }


  static addToAll(Community community, {bool mapCircle = true, bool mapForum = true, BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
      _allCircleMap = {};
      _allForumMap = {};
    }
    _all!.add(community);
    _allMap![community.key] = community;
    if(mapCircle && community.circle != null)
      _allCircleMap![community.circle!.key] = community.circle!;
    if(mapForum && community.forum != null)
      _allForumMap![community.forum!.key] = community.forum!;

    if(context == null) return;
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
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
        circle: null,
        forum: forum,
        managers: []
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
          circle: circle,
          forum: null,
          managers: []
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
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
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

    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
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

    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();

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

    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();

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

  final List<CommunityManager> _managers;
  final Map<String, CommunityManager> _managersMap;
  List<CommunityManager> get managers => _managers;
  Map<String, CommunityManager> get managersMap => _managersMap;
  
  void addManager(BuildContext context, List<CommunityManager> newManagers){

    for(CommunityManager manager in newManagers) {
      _managers.add(manager);
      _managersMap[manager.key] = manager;
    }
    
    Provider.of<CommunityManagersProvider>(context, listen: false).notify();
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
    
  }

  void setAllManagers(BuildContext context, List<CommunityManager> allManagers){
    _managers.clear();
    _managersMap.clear();
    _managers.addAll(allManagers);
    _managers.sort((m1, m2) => m1.name.compareTo(m2.name));
    _managersMap.addAll({for (CommunityManager? m in allManagers) m!.key: m});

    Provider.of<CommunityManagersProvider>(context, listen: false).notify();
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
  }

  void updateManagers(BuildContext context, List<CommunityManager> newManagers){

    for(CommunityManager manager in newManagers) {
      int index = _managers.indexWhere((managerIter) => managerIter.key == manager.key);
      _managers.removeAt(index);
      _managers.insert(index, manager);
      _managersMap[manager.key] = manager;
    }

    Provider.of<CommunityManagersProvider>(context, listen: false).notify();
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
  }

  void removeManagersByKey(BuildContext context, List<String> managerKeys){

    _managers.removeWhere((particip) => managerKeys.contains(particip.key));
    for(String managerKey in managerKeys) _managersMap.remove(managerKey);

    Provider.of<CommunityManagersProvider>(context, listen: false).notify();
    Provider.of<CommunityProvider>(context, listen: false).notify();
    Provider.of<CommunityListProvider>(context, listen: false).notify();
  }
  
  void removeManager(CommunityManager manager){
    _managers.remove(manager);
    _managersMap.remove(manager.key);
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
    CommunityManager? me = _managersMap[accKey];

    return me?.role;
  }

  Community({
    required super.key,
    required super.name,
    required super.iconKey,
    required Circle? circle,
    required Forum? forum,

    required List<CommunityManager> managers,

  }): _circle = circle,
      _forum = forum,
      _managers = managers,
      _managersMap = {for (CommunityManager m in managers) m.key: m}
  {
    _managers.sort((m1, m2) => m1.name.compareTo(m2.name));
  }

  static Community fromResponse(Map resp){

    List<CommunityManager> managers = [];
    Map managerResps = resp['managers']??{};
    for(String userKey in managerResps.keys){
      Map managerResp = managerResps[userKey];
      CommunityManager m = CommunityManager.fromMap(managerResp, key: userKey);
      managers.add(m);
    }

    Community community = Community(
      key: resp['_key']??(throw InvalidResponseError('_key')),
      name: resp['name']??(throw InvalidResponseError('name')),
      iconKey: resp['iconKey']??(throw InvalidResponseError('iconKey')),
      circle: null,
      forum: null,
      managers: managers,
    );

    if(resp['circle'] != null)
      community._circle = Circle.fromResponse(resp['circle'], community);

    if(resp['forum'] != null)
      community._forum = Forum.fromResponse(resp['forum'], community);

    return community;
  }

}
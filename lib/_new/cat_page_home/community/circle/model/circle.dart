import 'package:flutter/material.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../common/community_cover_image_data.dart';
import '../../model/community.dart';
import '../circle_role.dart';
import 'announcement.dart';
import 'member.dart';

class CircleProvider extends ChangeNotifier{

  static CircleProvider of(BuildContext context) => Provider.of<CircleProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class CircleListProvider extends ChangeNotifier{

  static CircleListProvider of(BuildContext context) => Provider.of<CircleListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();
}

class CircleMembersProvider extends ChangeNotifier{

  static CircleMembersProvider of(BuildContext context) => Provider.of<CircleMembersProvider>(context, listen: false);
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

class _AnnouncementLookup{
  final Announcement announcemnet;

  bool inAll;
  bool inPinned;
  bool inAwaiting;

  _AnnouncementLookup(
      this.announcemnet,
      { this.inAll = false,
        this.inPinned = false,
        this.inAwaiting = false
      });

}

class CircleBasicData{

  String key;
  String name;
  CommunityCoverImageData coverImage;
  int memberCount;

  CircleBasicData({
    required this.key,
    required this.name,
    required this.coverImage,
    required this.memberCount,
  });

  static CircleBasicData fromCircle(Circle circle) => CircleBasicData(
    key: circle.key,
    name: circle.name,
    coverImage: circle.coverImage,
    memberCount: circle.memberCount
  );

  static CircleBasicData fromRespMap(Map respMap, {String? name}) => CircleBasicData(
    key: respMap['_key']??(throw InvalidResponseError('_key')),
    name: name??respMap['name']??(throw InvalidResponseError('name')),
    coverImage: CommunityCoverImageData.fromRespMap(respMap['coverImage']??(throw InvalidResponseError('coverImage'))),
    memberCount: respMap['memberCount']??(throw InvalidResponseError('memberCount')),
  );

}

class Circle extends CircleBasicData{

  static callProvidersOf(BuildContext context) =>
      callProviders(CircleProvider.of(context), CircleListProvider.of(context));

  static callProviders(CircleProvider circleProv, CircleListProvider circleListProv){
    circleProv.notify();
    circleListProv.notify();
  }

  static callProvidersWithMembersOf(BuildContext context){
    callProvidersOf(context);
    CircleMembersProvider.notify_(context);
  }

  static callProvidersWithMembers(CircleProvider circleProv, CircleListProvider circleListProv, CircleMembersProvider circleMembersProv){
    callProviders(circleProv, circleListProv);
    circleMembersProv.notify();
  }

  static const int memberPageSize = 10;
  
  static const IconData icon = MdiIcons.googleCircles;

  static const int maxLenDescription = 320;
  static const int maxLenCoverImageUrl = 200;
  static const int maxLenColorsKey = 42;

  static const int announcementPageSize = 10;

  @override
  String get name => community.name;
  String? description;
  String? shareCode;
  bool shareCodeSearchable;
  String colorsKey;
  CommunityBasicData community;

  final List<Member> _loadedMembers;
  final Map<String, Member> _loadedMembersMap;
  List<Member> get loadedMembers => _loadedMembers;
  Map<String, Member> get loadedMembersMap => _loadedMembersMap;

  int memberAdminCount;

  List<IndivCompBasicData> bindedIndivComps;

  bool get hasDescription => description != null && description!.isNotEmpty;

  void addLoadedMembers(List<Member> newMembers, {BuildContext? context}){

    for(Member mem in newMembers) {
      if(_loadedMembersMap[mem.key] != null) continue;
      _loadedMembers.add(mem);
      _loadedMembersMap[mem.key] = mem;
    }

    if(context == null) return;
    callProvidersWithMembersOf(context);

  }

  void setAllLoadedMembers(List<Member> allMembers, {BuildContext? context}){
    _loadedMembers.clear();
    _loadedMembersMap.clear();
    _loadedMembers.addAll(allMembers);
    _loadedMembers.sort((mem1, mem2) => mem1.name.compareTo(mem2.name));
    _loadedMembersMap.addAll({for (Member? mem in allMembers) mem!.key: mem});

    if(context == null) return;
    callProvidersWithMembersOf(context);
  }

  void updateLoadedMembers(List<Member> newMembers, {BuildContext? context}){

    for(Member mem in newMembers) {
      int index = _loadedMembers.indexWhere((memIter) => memIter.key == mem.key);
      if(index == -1) continue;
      _loadedMembers.removeAt(index);
      _loadedMembers.insert(index, mem);
      _loadedMembersMap[mem.key] = mem;
    }

    if(context == null) return;
    callProvidersWithMembersOf(context);

  }

  void removeLoadedMembersByKey(List<String> memberKeys, {bool shrinkTotalCount=true, BuildContext? context}){

    _loadedMembers.removeWhere((particip) => memberKeys.contains(particip.key));
    for(String memKey in memberKeys){
      Member? removed = _loadedMembersMap.remove(memKey);
      if(removed != null && shrinkTotalCount)
        memberCount -= 1;
    }

    if(context == null) return;
    callProvidersWithMembersOf(context);

  }
  
  void removeLoadedMember(Member member, {bool shrinkTotalCount=true}){
    bool success = _loadedMembers.remove(member);
    Member? removed = _loadedMembersMap.remove(member.key);

    if(success != (removed != null))
      logger.d("A dangerous inconsistency between the objectList and the objectKeyMap occurred!");

    if(success && removed != null && shrinkTotalCount)
      memberCount -= - 1;
  }

  bool isMemberWithinLoaded(Member member){
    if(loadedMembers.isEmpty) return false;
    Member lastLoaded = loadedMembers.last;
    return circleRoleToLoadingOrder(member.role) < circleRoleToLoadingOrder(lastLoaded.role) ||
        compareText(member.name, lastLoaded.name) < 0 ||
        compareText(member.key, lastLoaded.key) < 0;
  }

  late Map<String, _AnnouncementLookup> _announcementsMap;
  Map<String, _AnnouncementLookup> get announcementsMap => _announcementsMap;

  void removeAnnouncement(Announcement announcement){
    Announcement.removeFromAll(announcement);
    _allAnnouncements.remove(announcement);

    if(_pinnedAnnouncements.remove(announcement)) pinnedCount -= 1;
    if(_awaitingAnnouncements.remove(announcement)) awaitingCount -= 1;

    _announcementsMap.remove(announcement.key);
  }

  List<Announcement> _allAnnouncements;
  List<Announcement> get allAnnouncements => _allAnnouncements;

  int pinnedCount;
  List<Announcement> _pinnedAnnouncements;
  List<Announcement> get pinnedAnnouncements => _pinnedAnnouncements;

  int awaitingCount;
  List<Announcement> _awaitingAnnouncements;
  List<Announcement> get awaitingAnnouncements => _awaitingAnnouncements;

  void resetAnnouncements(List<Announcement> allAnnouncements, List<Announcement> pinnedAnnouncements, List<Announcement> awaitingAnnouncements){
    _allAnnouncements.clear();
    _pinnedAnnouncements.clear();
    _awaitingAnnouncements.clear();

    _announcementsMap.clear();

    _allAnnouncements.addAll(allAnnouncements);
    _pinnedAnnouncements.addAll(pinnedAnnouncements);
    _awaitingAnnouncements.addAll(awaitingAnnouncements);

    _allAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    _pinnedAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    _awaitingAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));

    for (Announcement ann in _allAnnouncements)
      _addToAnnouncementsMap(ann);

    for (Announcement ann in _pinnedAnnouncements)
      _addToAnnouncementsMap(ann);

    for (Announcement ann in _awaitingAnnouncements)
      _addToAnnouncementsMap(ann);
  }

  void _addToAnnouncementsMap(Announcement announcement, {bool? inAll, bool? inPinned, bool? inAwaiting}){
    if(!_announcementsMap.containsKey(announcement.key))
      _announcementsMap[announcement.key] = _AnnouncementLookup(announcement, inAll: inAll??false, inPinned: inPinned??false, inAwaiting: inAwaiting??false);
    else{
      if(inAll != null) _announcementsMap[announcement.key]!.inAll = inAll;
      if(inPinned != null) _announcementsMap[announcement.key]!.inPinned = inPinned;
      if(inAwaiting != null) _announcementsMap[announcement.key]!.inAwaiting = inAwaiting;
    }

  }

  void addAllAnnouncement(Announcement announcement, {bool sort = true}){
    Announcement.addToAll(announcement);
    _allAnnouncements.add(announcement);
    if(sort) _allAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    _addToAnnouncementsMap(announcement, inAll: true);
  }

  void addAllAnnouncements(List<Announcement> announcements, {bool sort = true}){
    Announcement.addListToAll(announcements);
    _allAnnouncements.addAll(announcements);
    if(sort) _allAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    for(Announcement announcement in announcements)
      _addToAnnouncementsMap(announcement, inAll: true);
  }

  void addPinnedAnnouncement(Announcement announcement, {bool sort = true}){
    Announcement.addToAll(announcement);
    _pinnedAnnouncements.add(announcement);
    if(sort) _pinnedAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    _addToAnnouncementsMap(announcement, inPinned: true);
  }

  void addPinnedAnnouncements(List<Announcement> announcements, {bool sort = true}){
    Announcement.addListToAll(announcements);
    _pinnedAnnouncements.addAll(announcements);
    if(sort) _pinnedAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    for(Announcement announcement in announcements)
      _addToAnnouncementsMap(announcement, inPinned: true);
  }

  void changePinnedAnnouncement(Announcement announcement, bool pinned){

    if(!_announcementsMap.containsKey(announcement.key)){
      logger.e("Registered an attempt to change pinned state of announcement ${announcement.key} not present in the circle $key!");
      return;
    }

    if(_announcementsMap[announcement.key]!.inPinned == pinned){
      logger.w("Announcement ${announcement.key} pinned state not changed.");
      return;
    }

    _announcementsMap[announcement.key]!.inPinned = pinned;

    if(pinned) {
      _pinnedAnnouncements.add(announcement);
      _pinnedAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
      pinnedCount += 1;
    }else{
      _pinnedAnnouncements.remove(announcement);
      pinnedCount -= 1;
    }

  }

  void addAwaitingAnnouncement(Announcement announcement, {bool sort = true}){
    Announcement.addToAll(announcement);
    _awaitingAnnouncements.add(announcement);
    if(sort) _awaitingAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    _addToAnnouncementsMap(announcement, inAwaiting: true);
  }

  void addAwaitingAnnouncements(List<Announcement> announcements, {bool sort = true}){
    Announcement.addListToAll(announcements);
    _awaitingAnnouncements.addAll(announcements);
    if(sort) _awaitingAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    for(Announcement announcement in announcements)
      _addToAnnouncementsMap(announcement, inAwaiting: true);
  }

  void changeAwaitingAnnouncement(Announcement announcement, bool isAwaiting) {
    if (!_announcementsMap.containsKey(announcement.key)) {
      logger.e(
          "Registered an attempt to change awaiting state of announcement ${announcement.key} not present in the circle $key!");
      return;
    }

    if (_announcementsMap[announcement.key]!.inAwaiting == isAwaiting) {
      logger.w("Announcement ${announcement.key} await state not changed.");
      return;
    }

    _announcementsMap[announcement.key]!.inAwaiting = isAwaiting;

    if(isAwaiting) {
      _awaitingAnnouncements.add(announcement);
      _awaitingAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
      awaitingCount += 1;
    }else{
      _awaitingAnnouncements.remove(announcement);
      awaitingCount -= 1;
    }

  }

  CircleRole? get myRole{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }
    Member? me = _loadedMembersMap[accKey];

    if(me == null){
      AccountData.forgetAccount();
      AccountData.callOnForceLogout();
      return null;
    }

    return me.role;
  }

  Circle({
    required super.key,
    this.description,
    required super.coverImage,
    this.shareCode,
    required this.shareCodeSearchable,
    required this.colorsKey,

    required List<Member> members,
    required super.memberCount,
    required this.memberAdminCount,

    required List<Announcement> allAnnouncements,
    required this.pinnedCount,
    required List<Announcement> pinnedAnnouncements,
    required this.awaitingCount,
    required List<Announcement> awaitingAnnouncements,

    required this.bindedIndivComps,
    required this.community,

  }): _loadedMembers = members,
      _loadedMembersMap = {for (Member mem in members) mem.key: mem},
      _allAnnouncements = allAnnouncements,
      _pinnedAnnouncements = pinnedAnnouncements,
      _awaitingAnnouncements = awaitingAnnouncements,
      super(name: community.name)
  {
    _loadedMembers.sort((mem1, mem2) => mem1.name.compareTo(mem2.name));
    _announcementsMap = {for (Announcement ann in _allAnnouncements) ann.key: _AnnouncementLookup(ann, inAll: true)};
    _announcementsMap.addAll({for (Announcement ann in _pinnedAnnouncements) ann.key: _AnnouncementLookup(ann, inPinned: true)});
    _announcementsMap.addAll({for (Announcement ann in _awaitingAnnouncements) ann.key: _AnnouncementLookup(ann, inAwaiting: true)});

    for (Announcement ann in _allAnnouncements)
      _addToAnnouncementsMap(ann, inAll: true);

    for (Announcement ann in _pinnedAnnouncements)
      _addToAnnouncementsMap(ann, inPinned: true);

    for (Announcement ann in _awaitingAnnouncements)
      _addToAnnouncementsMap(ann, inAwaiting: true);

    _allAnnouncements.sort((ann1, ann2) => ann1.publishTime.compareTo(ann2.publishTime));
  }

  static Circle fromRespMap(Map respMap, CommunityBasicData community){
    
    Map announcementsResps = respMap['announcements']??(throw InvalidResponseError('announcements'));
    int pinnedCount = announcementsResps['pinnedCount']??(throw InvalidResponseError('announcements, pinnedCount'));
    int awaitingCount = announcementsResps['awaitingCount']??(throw InvalidResponseError('announcements, awaitingCount'));

    List<dynamic> bindedIndivCompsResp = respMap['bindedIndivComps']??(throw InvalidResponseError('bindedIndivComps'));
    List<IndivCompBasicData> indivCompBasicData = [];

    for(dynamic resp in bindedIndivCompsResp)
      indivCompBasicData.add(IndivCompBasicData.fromRespMap(resp));

    Circle circle = Circle(
      key: respMap['_key']??(throw InvalidResponseError('_key')),
      description: respMap['description'],
      coverImage: CommunityCoverImageData.fromRespMap(respMap['coverImage']),
      colorsKey: respMap['colorsKey']??(throw InvalidResponseError('colorsKey')),
      shareCode: respMap["shareCode"],
      shareCodeSearchable: respMap["shareCodeSearchable"],
      members: (respMap['members']??(throw InvalidResponseError('members'))).map<Member>((data) => Member.fromRespMap(data)).toList(),
      memberCount: respMap['memberCount']??(throw InvalidResponseError('memberCount')),
      memberAdminCount: respMap['memberAdminCount']??(throw InvalidResponseError('memberAdminCount')),
      allAnnouncements: [],
      pinnedCount: pinnedCount,
      pinnedAnnouncements: [],
      awaitingCount: awaitingCount,
      awaitingAnnouncements: [],
      bindedIndivComps: indivCompBasicData,
      community: community
    );

    Map allAnnResps = announcementsResps['all']??(throw InvalidResponseError('announcements, all'));
    Map pinnedAnnResps = announcementsResps['pinned']??(throw InvalidResponseError('announcements, pinned'));
    Map awaitingAnnResps = announcementsResps['awaiting']??(throw InvalidResponseError('announcements, awaiting'));

    for(String annKey in allAnnResps.keys as Iterable<String>){
      Map annRespMap = allAnnResps[annKey];

      Announcement? savedAnnouncement = circle.announcementsMap[annKey]?.announcemnet;
      savedAnnouncement ??= Announcement.fromRespMap(annRespMap, circle, key: annKey);

      circle.addAllAnnouncement(savedAnnouncement, sort: false);
      circle._allAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    }

    for(String annKey in pinnedAnnResps.keys as Iterable<String>){
      Map annRespMap = pinnedAnnResps[annKey];

      Announcement? savedAnnouncement = circle.announcementsMap[annKey]?.announcemnet;
      savedAnnouncement ??= Announcement.fromRespMap(annRespMap, circle, key: annKey);

      circle.addPinnedAnnouncement(savedAnnouncement, sort: false);
      circle._pinnedAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    }

    for(String annKey in awaitingAnnResps.keys as Iterable<String>){
      Map annRespMap = awaitingAnnResps[annKey];

      Announcement? savedAnnouncement = circle.announcementsMap[annKey]?.announcemnet;
      savedAnnouncement ??= Announcement.fromRespMap(annRespMap, circle, key: annKey);

      circle.addAwaitingAnnouncement(savedAnnouncement, sort: false);
      circle._awaitingAnnouncements.sort((ann1, ann2) => ann2.publishTime.compareTo(ann1.publishTime));
    }

    return circle;
  }

}
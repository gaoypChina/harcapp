import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../circle_cover_image_data.dart';
import '../circle_role.dart';
import 'announcement.dart';
import 'member.dart';

class CircleProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class CircleListProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class CircleMembersProvider extends ChangeNotifier{

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
  CircleCoverImageData coverImage;
  int memberCount;

  CircleBasicData({
    required this.key,
    required this.name,
    required this.coverImage,
    required this.memberCount,
  });

  static CircleBasicData fromResponse(Map resp) => CircleBasicData(
    key: resp['_key']??(throw InvalidResponseError('_key')),
    name: resp['name']??(throw InvalidResponseError('name')),
    coverImage: CircleCoverImageData.from(resp['coverImageUrl']??(throw InvalidResponseError('coverImageUrl'))),
    memberCount: resp['memberCount']??(throw InvalidResponseError('memberCount')),
  );

}

class Circle{

  static const int maxLenName = 64;
  static const int maxLenDescription = 320;
  static const int maxLenCoverImageUrl = 200;
  static const int maxLenColorsKey = 42;

  static const int announcementPageSize = 10;

  static List<Circle>? _all;
  static Map<String, Circle>? _allMap;

  static List<Circle>? get all => _all;
  static Map<String, Circle>? get allMap => _allMap;

  static silentInit(List<Circle> circles){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all!.clear();
    _allMap!.clear();

    _all!.addAll(circles);
    _allMap = {for (Circle circle in circles) circle.key: circle};

  }

  static init(List<Circle> circles, {BuildContext? context}){

    silentInit(circles);

    if(context == null) return;
    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }


  static addToAll(BuildContext context, Circle circle){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all!.add(circle);
    _allMap![circle.key] = circle;

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  static updateInAll(BuildContext context, Circle circle){
    Circle? oldCircle = _allMap![circle.key];
    if(oldCircle == null){
      addToAll(context, circle);
      return;
    }

    int index = _all!.indexOf(oldCircle);
    _all!.removeAt(index);
    _all!.insert(index, circle);
    _allMap![circle.key] = circle;

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  static void removeFromAll(Circle? circle, {BuildContext? context}){
    if(_all == null)
      return;

    _all!.remove(circle);
    _allMap!.remove(circle!.key);

    if(context == null) return;

    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();
  }

  final String key;
  String name;
  String? description;
  CircleCoverImageData coverImage;
  String? shareCode;
  bool shareCodeSearchable;
  String colorsKey;

  final List<Member> _members;
  final Map<String, Member> _membersMap;
  List<Member> get members => _members;
  Map<String, Member> get membersMap => _membersMap;

  List<IndivCompBasicData> bindedIndivComps;

  bool get hasDescription => description != null && description!.isNotEmpty;

  void addMember(BuildContext context, List<Member> newMembers){

    for(Member mem in newMembers) {
      _members.add(mem);
      _membersMap[mem.key] = mem;
    }
    
    Provider.of<CircleMembersProvider>(context, listen: false).notify();
    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
    
  }

  void setAllMembers(BuildContext context, List<Member> allMembers){
    _members.clear();
    _membersMap.clear();
    _members.addAll(allMembers);
    _members.sort((mem1, mem2) => mem1.name.compareTo(mem2.name));
    _membersMap.addAll({for (Member? mem in allMembers) mem!.key: mem});

    Provider.of<CircleMembersProvider>(context, listen: false).notify();
    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  void updateMembers(BuildContext context, List<Member> newMembers){

    for(Member mem in newMembers) {
      int index = _members.indexWhere((memIter) => memIter.key == mem.key);
      _members.removeAt(index);
      _members.insert(index, mem);
      _membersMap[mem.key] = mem;
    }

    Provider.of<CircleMembersProvider>(context, listen: false).notify();
    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }

  void removeMembersByKey(BuildContext context, List<String> memberKeys){

    _members.removeWhere((particip) => memberKeys.contains(particip.key));
    for(String memKey in memberKeys) _membersMap.remove(memKey);

    Provider.of<CircleMembersProvider>(context, listen: false).notify();
    Provider.of<CircleProvider>(context, listen: false).notify();
    Provider.of<CircleListProvider>(context, listen: false).notify();
  }
  
  void removeMember(Member member){
    _members.remove(member);
    _membersMap.remove(member.key);
  }

  late Map<String, _AnnouncementLookup> _announcementsMap;
  Map<String, _AnnouncementLookup> get announcementsMap => _announcementsMap;

  void removeAnnouncement(Announcement announcement){
    _allAnnouncements.remove(announcement);
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

    _allAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    _pinnedAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    _awaitingAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));

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
    _allAnnouncements.add(announcement);
    if(sort) _allAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    _addToAnnouncementsMap(announcement, inAll: true);
  }

  void addAllAnnouncements(List<Announcement> announcements, {bool sort = true}){
    _allAnnouncements.addAll(announcements);
    if(sort) _allAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    for(Announcement announcement in announcements)
      _addToAnnouncementsMap(announcement, inAll: true);
  }

  void addPinnedAnnouncement(Announcement announcement, {bool sort = true}){
    _pinnedAnnouncements.add(announcement);
    if(sort) _pinnedAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    _addToAnnouncementsMap(announcement, inPinned: true);
  }

  void addPinnedAnnouncements(List<Announcement> announcements, {bool sort = true}){
    _pinnedAnnouncements.addAll(announcements);
    if(sort) _pinnedAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
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
      _pinnedAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
      pinnedCount += 1;
    }else{
      _pinnedAnnouncements.remove(announcement);
      pinnedCount -= 1;
    }

  }

  void addAwaitingAnnouncement(Announcement announcement, {bool sort = true}){
    _awaitingAnnouncements.add(announcement);
    if(sort) _awaitingAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    _addToAnnouncementsMap(announcement, inAwaiting: true);
  }

  void addAwaitingAnnouncements(List<Announcement> announcements, {bool sort = true}){
    _awaitingAnnouncements.addAll(announcements);
    if(sort) _awaitingAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
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
      _awaitingAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
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
    Member? me = _membersMap[accKey];

    if(me == null){
      AccountData.forgetAccount();
      AccountData.callOnForceLogout();
      return null;
    }

    return me.role;
  }

  Circle({
    required this.key,
    required this.name,
    this.description,
    required this.coverImage,
    this.shareCode,
    required this.shareCodeSearchable,
    required this.colorsKey,

    required List<Member> members,
    required List<Announcement> allAnnouncements,
    required this.pinnedCount,
    required List<Announcement> pinnedAnnouncements,
    required this.awaitingCount,
    required List<Announcement> awaitingAnnouncements,

    required this.bindedIndivComps,

  }): _members = members,
      _membersMap = {for (Member mem in members) mem.key: mem},
      _allAnnouncements = allAnnouncements,
      _pinnedAnnouncements = pinnedAnnouncements,
      _awaitingAnnouncements = awaitingAnnouncements
  {
    _members.sort((mem1, mem2) => mem1.name.compareTo(mem2.name));
    _announcementsMap = {for (Announcement ann in _allAnnouncements) ann.key: _AnnouncementLookup(ann, inAll: true)};
    _announcementsMap.addAll({for (Announcement ann in _pinnedAnnouncements) ann.key: _AnnouncementLookup(ann, inPinned: true)});
    _announcementsMap.addAll({for (Announcement ann in _awaitingAnnouncements) ann.key: _AnnouncementLookup(ann, inAwaiting: true)});

    for (Announcement ann in _allAnnouncements)
      _addToAnnouncementsMap(ann, inAll: true);

    for (Announcement ann in _pinnedAnnouncements)
      _addToAnnouncementsMap(ann, inPinned: true);

    for (Announcement ann in _awaitingAnnouncements)
      _addToAnnouncementsMap(ann, inAwaiting: true);

    _allAnnouncements.sort((ann1, ann2) => ann1.postTime.compareTo(ann2.postTime));
  }

  static Circle fromResponse(Map resp){

    List<Member> members = [];
    Map memResps = resp['members']??(throw InvalidResponseError('_key'));
    for(String userKey in memResps.keys as Iterable<String>){
      Map memResp = memResps[userKey];
      Member memData = Member.fromMap(memResp, key: userKey);
      members.add(memData);
    }

    Map announcementsResps = resp['announcements']??(throw InvalidResponseError('announcements'));
    int pinnedCount = announcementsResps['pinnedCount']??(throw InvalidResponseError('announcements, pinnedCount'));
    int awaitingCount = announcementsResps['awaitingCount']??(throw InvalidResponseError('announcements, awaitingCount'));

    List<dynamic> bindedIndivCompsResp = resp['bindedIndivComps']??(throw InvalidResponseError('bindedIndivComps'));
    List<IndivCompBasicData> indivCompBasicData = [];

    for(dynamic resp in bindedIndivCompsResp)
      indivCompBasicData.add(IndivCompBasicData.fromResponse(resp));

    Circle circle = Circle(
      key: resp['_key']??(throw InvalidResponseError('_key')),
      name: resp['name']??(throw InvalidResponseError('name')),
      description: resp['description'],
      coverImage: CircleCoverImageData.from(resp['coverImageUrl']),
      colorsKey: resp['colorsKey']??(throw InvalidResponseError('colorsKey')),
      shareCode: resp["shareCode"],
      shareCodeSearchable: resp["shareCodeSearchable"],
      members: members,
      allAnnouncements: [],
      pinnedCount: pinnedCount,
      pinnedAnnouncements: [],
      awaitingCount: awaitingCount,
      awaitingAnnouncements: [],
      bindedIndivComps: indivCompBasicData,
    );

    Map allAnnResps = announcementsResps['all']??(throw InvalidResponseError('announcements, all'));
    Map pinnedAnnResps = announcementsResps['pinned']??(throw InvalidResponseError('announcements, pinned'));
    Map awaitingAnnResps = announcementsResps['awaiting']??(throw InvalidResponseError('announcements, awaiting'));

    for(String annKey in allAnnResps.keys as Iterable<String>){
      Map annRespData = allAnnResps[annKey];

      Announcement? savedAnnouncement = circle.announcementsMap[annKey]?.announcemnet;
      savedAnnouncement ??= Announcement.fromMap(annRespData, circle, key: annKey);

      circle.addAllAnnouncement(savedAnnouncement, sort: false);
      circle._allAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    }

    for(String annKey in pinnedAnnResps.keys as Iterable<String>){
      Map annRespData = pinnedAnnResps[annKey];

      Announcement? savedAnnouncement = circle.announcementsMap[annKey]?.announcemnet;
      savedAnnouncement ??= Announcement.fromMap(annRespData, circle, key: annKey);

      circle.addPinnedAnnouncement(savedAnnouncement, sort: false);
      circle._pinnedAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    }

    for(String annKey in awaitingAnnResps.keys as Iterable<String>){
      Map annRespData = awaitingAnnResps[annKey];

      Announcement? savedAnnouncement = circle.announcementsMap[annKey]?.announcemnet;
      savedAnnouncement ??= Announcement.fromMap(annRespData, circle, key: annKey);

      circle.addAwaitingAnnouncement(savedAnnouncement, sort: false);
      circle._awaitingAnnouncements.sort((ann1, ann2) => ann2.postTime.compareTo(ann1.postTime));
    }

    return circle;
  }

}
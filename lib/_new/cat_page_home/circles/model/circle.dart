import 'package:flutter/material.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../circle_cover_image_data.dart';
import '../circle_role.dart';
import 'announcement.dart';
import 'announcement_attendance_resp_mode.dart';
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

  static init(BuildContext context, List<Circle> circles){

    silentInit(circles);

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

  static void removeFromAll(BuildContext context, Circle? circle){
    if(_all == null)
      return;

    _all!.remove(circle);
    _allMap!.remove(circle!.key);

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
  CircleCoverImageData? coverImage;
  final String? shareCode;
  final bool? shareCodeSearchable;
  String colorsKey;

  final List<Member> _members;
  final Map<String, Member> _membersMap;
  List<Member> get members => _members;
  Map<String, Member> get membersMap => _membersMap;

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
  
  List<Announcement> _announcements;
  Map<String, Announcement> _announcementsMap;
  List<Announcement> get announcements => _announcements;
  Map<String, Announcement>? get announcementsMap => _announcementsMap;

  List<Announcement> get pinnedAnnouncements => _announcements.where((ann) => ann.pinned).toList();

  List<Announcement> get awaitingAnnouncements => announcements.where(
          (ann) =>
      ann.respMode == AnnouncementAttendanceRespMode.OBLIGATORY &&
          ann.myAttendance == null
  ).toList();

  void addAnnouncement(Announcement announcement){
    _announcements.add(announcement);
    _announcements.sort((ann1, ann2) => ann1.postTime.compareTo(ann2.postTime));
    _announcementsMap[announcement.key] = announcement;
  }

  void addAnnouncements(List<Announcement> announcements){
    _announcements.addAll(announcements);
    _announcements.sort((ann1, ann2) => ann1.postTime.compareTo(ann2.postTime));
    for(Announcement announcement in announcements)
      _announcementsMap[announcement.key] = announcement;

    // Assert
    if(_announcements.length != _announcementsMap.length) {
      logger.w('Tried to add announcements which where already in the list!');
      _announcementsMap = {for (Announcement announcement in _announcements) announcement.key: announcement};
    }}

  void removeAnnouncement(Announcement announcement){
    _announcements.remove(announcement);
    _announcementsMap.remove(announcement.key);
  }

  /*
  void updateAnnouncement(Announcement announcement){
    int index = _announcements.indexWhere((ann) => ann.key == announcement.key);
    _announcements.removeAt(index);
    _announcements.insert(index, announcement);
    _announcements.sort((ann1, ann2) => ann1.postTime.compareTo(ann2.postTime));
    _announcementsMap[announcement.key] = announcement;
  }
  */
  void setAllAnnouncement(List<Announcement> allAnnouncement){
    _announcements.clear();
    _announcementsMap.clear();
    _announcements.addAll(allAnnouncement);
    _announcements.sort((ann1, ann2) => ann1.postTime.compareTo(ann2.postTime));
    _announcementsMap = {for (Announcement ann in allAnnouncement) ann.key: ann};
  }
  
  CircleRole get myRole => _membersMap[AccountData.key!]!.role;

  Circle({
    required this.key,
    required this.name,
    this.description,
    this.coverImage,
    this.shareCode,
    this.shareCodeSearchable,
    required this.colorsKey,

    required List<Member> members,
    required List<Announcement> announcements,
  }): _members = members,
      _membersMap = {for (Member mem in members) mem.key: mem},
      _announcements = announcements,
      _announcementsMap = {for (Announcement ann in announcements) ann.key: ann}
  {
    _members.sort((mem1, mem2) => mem1.name.compareTo(mem2.name));
    _announcements.sort((ann1, ann2) => ann1.postTime.compareTo(ann2.postTime));
  }

  static Circle fromResponse(Map resp){

    List<Member> members = [];
    Map memResps = resp['members']??(throw InvalidResponseError('_key'));
    for(String userKey in memResps.keys as Iterable<String>){
      Map memResp = memResps[userKey];
      Member memData = Member.fromMap(memResp, key: userKey);
      members.add(memData);
    }

    Circle circle = Circle(
      key: resp['_key']??(throw InvalidResponseError('_key')),
      name: resp['name']??(throw InvalidResponseError('name')),
      description: resp['description'],
      coverImage: CircleCoverImageData.from(resp['cover_image_url']),
      colorsKey: resp['colors_key']??(throw InvalidResponseError('colors_key')),
      shareCode: resp["share_code"],
      shareCodeSearchable: resp["share_code_searchable"],
      members: members,
      announcements: [],
    );

    Map annResps = resp['announcements']??(throw InvalidResponseError('_key'));
    for(String annKey in annResps.keys as Iterable<String>){
      Map annRespData = annResps[annKey];
      Announcement ann = Announcement.fromMap(annRespData, circle, key: annKey);
      circle.addAnnouncement(ann);
    }

    return circle;
  }

}
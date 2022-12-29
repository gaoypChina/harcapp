import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:provider/provider.dart';

import '../../common/community_cover_image_data.dart';
import 'announcement_attendace.dart';
import 'announcement_attendance_resp.dart';
import 'announcement_attendance_resp_mode.dart';
import 'circle.dart';

class AnnouncementProvider extends ChangeNotifier{
  static AnnouncementProvider of(BuildContext context) => Provider.of<AnnouncementProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();
  void notify() => notifyListeners();
}

class AnnouncementListProvider extends ChangeNotifier{
  static AnnouncementListProvider of(BuildContext context) => Provider.of<AnnouncementListProvider>(context, listen: false);
  static void notify_(BuildContext context) => of(context).notify();
  void notify() => notifyListeners();
}

class Announcement extends CommunityPublishable{

  static const int feedPageSize = 10;

  static Map<String, Announcement>? _allMap;

  static Map<String, Announcement>? get allMap => _allMap;

  static forget(){
    _allMap = null;
  }

  static silentInit(List<Announcement> announcements){
    _allMap ??= {};
    _allMap!.clear();
    _allMap = {for (Announcement ann in announcements) ann.key: ann};
  }

  static init(List<Announcement> announcements, {BuildContext? context}){

    silentInit(announcements);

    if(context == null) return;
    AnnouncementProvider.notify_(context);
    AnnouncementListProvider.notify_(context);
  }

  static addToAll(Announcement ann, {BuildContext? context}){
    _allMap ??= {};
    _allMap![ann.key] = ann;

    if(context == null) return;

    AnnouncementProvider.notify_(context);
    AnnouncementListProvider.notify_(context);
  }

  static addListToAll(List<Announcement> anns, {BuildContext? context}){
    _allMap ??= {};
    for(Announcement ann in anns)
      _allMap![ann.key] = ann;

    if(context == null) return;

    AnnouncementProvider.notify_(context);
    AnnouncementListProvider.notify_(context);
  }

  static updateInAll(Announcement ann, {BuildContext? context}){
    Announcement? oldAnn = _allMap![ann.key];
    if(oldAnn == null){
      addToAll(ann, context: context);
      return;
    }

    _allMap![ann.key] = ann;

    if(context == null) return;

    AnnouncementProvider.notify_(context);
    AnnouncementListProvider.notify_(context);
  }

  static void removeFromAll(Announcement ann, {BuildContext? context}){
    if(_allMap == null)
      return;

    _allMap!.remove(ann.key);

    if(context == null) return;

    AnnouncementProvider.notify_(context);
    AnnouncementListProvider.notify_(context);
  }

  static clear(){
    if(_allMap == null)
      return;
    _allMap!.clear();
  }

  @override
  UserData get author => super.author!;

  DateTime? startTime;
  DateTime? endTime;
  String? place;
  bool pinned;
  AnnouncementAttendanceRespMode respMode;
  Map<String, AnnouncementAttendanceResp> attendance;
  List<String> waivedAttRespMembers;

  final Circle circle;

  @override
  CommunityBasicData get community => circle.community;

  bool get isEvent =>
      respMode != AnnouncementAttendanceRespMode.NONE ||
      startTime != null ||
      place != null;

  bool get isAwaitingMyResponse{

    // If the event has taken place already
    if(endTime != null && endTime!.isBefore(AccountData.lastServerTime??DateTime.now()))
      return false;

    // If the event has taken place already
    if(endTime == null && startTime != null && startTime!.isBefore(AccountData.lastServerTime??DateTime.now()))
      return false;

    // If I said I'll respond later
    if(myAttendance != null && myAttendance!.response == AnnouncementAttendance.POSTPONE_RESP &&
        myAttendance!.postponeTime!.isBefore(AccountData.lastServerTime??DateTime.now()))
      return true;

    // If I'm waived from responding
    if(waivedAttRespMembers.contains(AccountData.key))
      return false;

    // If I haven't responded
    if(respMode == AnnouncementAttendanceRespMode.OBLIGATORY && myAttendance == null)
      return true;

    return false;
  }

  AnnouncementAttendanceResp? get myAttendance{
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return null;
    }

    return attendance[accKey];
  }

  set myAttendance(AnnouncementAttendanceResp? resp){
    String? accKey = AccountData.key;
    if(accKey == null){
      logger.w('Value of saved account data key is null. Are you logged in?');
      return;
    }
    if(resp == null) return;
    attendance[accKey] = resp;
  }

  Announcement({
    required super.key,
    required super.title,
    required super.publishTime,
    super.lastUpdateTime,
    required this.startTime,
    required this.endTime,
    required this.place,
    required super.urlToPreview,
    required super.author,
    super.coverImage,
    required super.text,
    required this.pinned,

    required this.circle,
    required this.respMode,
    required this.attendance,
    required this.waivedAttRespMembers,
  });

  void update(Announcement other){
    title = other.title;
    publishTime = other.publishTime;
    lastUpdateTime = other.lastUpdateTime;
    startTime = other.startTime;
    endTime = other.endTime;
    place = other.place;
    urlToPreview = other.urlToPreview;
    author = other.author;
    coverImage = other.coverImage;
    text = other.text;
    pinned = other.pinned;

    respMode = other.respMode;
    attendance = other.attendance;
    waivedAttRespMembers = other.waivedAttRespMembers;
  }

  static Announcement fromRespMap(Map respMap, Circle circle, {String? key}) => Announcement(
    key: key??respMap['_key']??(throw InvalidResponseError('_key')),
    title: respMap['title'],
    publishTime: DateTime.tryParse(respMap['publishTimeStr']??(throw InvalidResponseError('publishTimeStr')))??(throw InvalidResponseError('publishTimeStr')),
    lastUpdateTime: DateTime.tryParse(respMap['lastUpdateTimeStr']??''),
    startTime: DateTime.tryParse(respMap['startTimeStr']??''),
    endTime: DateTime.tryParse(respMap['endTimeStr']??''),
    coverImage: respMap['coverImage'] == null? null: CommunityCoverImageData.fromRespMap(respMap['coverImage']),
    place: respMap['place'],
    urlToPreview: respMap['urlToPreview'],
    author: UserData.fromRespMap(respMap['author']??(throw InvalidResponseError('author'))),
    text: respMap['text']??(throw InvalidResponseError('text')),
    pinned: respMap['pinned']??false,
    respMode: strToAnnouncementAttendanceRespMode[respMap['attendanceRespMode']]??(throw InvalidResponseError('attendanceRespMode')),
    attendance: ((respMap['attendanceResponses']??{}) as Map).map((key, value) => MapEntry(key, AnnouncementAttendanceResp.fromRespMap(value))),
    waivedAttRespMembers: (respMap['waivedAttRespMembers'] as List?)?.cast<String>()??(throw InvalidResponseError('waivedAttRespMembers')),

    circle: circle,
  );

}
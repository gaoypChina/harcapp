import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendace.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../../community/common/community_cover_image_data.dart';
import 'announcement_attendance_resp.dart';
import 'announcement_attendance_resp_mode.dart';
import 'circle.dart';

class AnnouncementProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class AnnouncementListProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class Announcement extends CommunityPublishable{

  static const int feedPageSize = 10;

  static List<Announcement>? _all;
  static Map<String, Announcement>? _allMap;

  static List<Announcement>? get all => _all;
  static Map<String, Announcement>? get allMap => _allMap;

  static forget(){
    _all = null;
    _allMap = null;
  }

  static silentInit(List<Announcement> announcements){
    if(_all == null){
      _all = [];
      _allMap = {};
    }

    _all!.clear();
    _allMap!.clear();

    _all!.addAll(announcements);
    _allMap = {for (Announcement ann in announcements) ann.key: ann};

  }

  static init(List<Announcement> announcements, {BuildContext? context}){

    silentInit(announcements);

    if(context == null) return;
    Provider.of<AnnouncementProvider>(context, listen: false).notify();
    Provider.of<AnnouncementListProvider>(context, listen: false).notify();
  }

  static addToAll(BuildContext context, Announcement ann){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    _all!.add(ann);
    _allMap![ann.key] = ann;

    Provider.of<AnnouncementProvider>(context, listen: false).notify();
    Provider.of<AnnouncementListProvider>(context, listen: false).notify();
  }

  static addListToAll(List<Announcement> anns, {BuildContext? context}){
    if(_all == null){
      _all = [];
      _allMap = {};
    }
    for(Announcement ann in anns) {
      _all!.add(ann);
      _allMap![ann.key] = ann;
    }

    if(context == null) return;

    Provider.of<AnnouncementProvider>(context, listen: false).notify();
    Provider.of<AnnouncementListProvider>(context, listen: false).notify();
  }

  static updateInAll(BuildContext context, Announcement ann){
    Announcement? oldAnn = _allMap![ann.key];
    if(oldAnn == null){
      addToAll(context, ann);
      return;
    }

    int index = _all!.indexOf(oldAnn);
    _all!.removeAt(index);
    _all!.insert(index, ann);
    _allMap![ann.key] = ann;

    Provider.of<AnnouncementProvider>(context, listen: false).notify();
    Provider.of<AnnouncementListProvider>(context, listen: false).notify();
  }

  static void removeFromAll(BuildContext context, Announcement ann){
    if(_all == null)
      return;

    _all!.remove(ann);
    _allMap!.remove(ann.key);

    Provider.of<AnnouncementProvider>(context, listen: false).notify();
    Provider.of<AnnouncementListProvider>(context, listen: false).notify();
  }

  static clear(){
    if(_all == null)
      return;
    _all!.clear();
    _allMap!.clear();
  }

  String title;
  DateTime postTime;
  DateTime? lastUpdateTime;
  DateTime? startTime;
  DateTime? endTime;
  String? place;
  String? urlToPreview;
  UserData author;
  CommunityCoverImageData? coverImage;
  String text;
  bool pinned;
  AnnouncementAttendanceRespMode respMode;
  Map<String, AnnouncementAttendanceResp> attendance;
  List<String> waivedAttRespMembers;

  final Circle? circle;

  bool get isEvent =>
      respMode != AnnouncementAttendanceRespMode.NONE ||
      startTime != null ||
      place != null;

  bool get isAwaitingMyResponse{

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

    // If the event has taken place already
    if(endTime != null && endTime!.isBefore(AccountData.lastServerTime??DateTime.now()))
      return false;

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
    required this.title,
    required this.postTime,
    this.lastUpdateTime,
    required this.startTime,
    required this.endTime,
    required this.place,
    required this.urlToPreview,
    required this.author,
    this.coverImage,
    required this.text,
    required this.pinned,

    this.circle,
    required this.respMode,
    required this.attendance,
    required this.waivedAttRespMembers,
  });

  void update(Announcement other){
    title = other.title;
    postTime = other.postTime;
    lastUpdateTime = other.lastUpdateTime;
    startTime = other.startTime;
    endTime = other.endTime;
    place = other.place;
    author = other.author;
    coverImage = other.coverImage;
    text = other.text;
    pinned = other.pinned;

    respMode = other.respMode;
    attendance = other.attendance;
  }

  static Announcement fromMap(Map resp, Circle circle, {String? key}) => Announcement(
    key: key??resp['_key']??(throw InvalidResponseError('_key')),
    title: resp['title']??(throw InvalidResponseError('title')),
    postTime: DateTime.tryParse(resp['publishTimeStr']??(throw InvalidResponseError('publishTimeStr')))??(throw InvalidResponseError('post_time_str')),
    lastUpdateTime: resp['lastUpdateTimeStr'] == null? null: DateTime.tryParse(resp['lastUpdateTimeStr']),
    startTime: resp['startTimeStr'] == null? null: DateTime.tryParse(resp['startTimeStr']),
    endTime: resp['endTimeStr'] == null? null: DateTime.tryParse(resp['endTimeStr']),
    coverImage: resp['coverImageUrl'] == null? null: CommunityCoverImageData.from(resp['coverImageUrl']),
    place: resp['place'],
    urlToPreview: resp['urlToPreview'],
    author: UserData.fromMap(resp['author']),
    text: resp['text'],
    pinned: resp['pinned'],
    respMode: strToAnnouncementAttendanceRespMode[resp['attendanceRespMode']]??(throw InvalidResponseError('attendanceRespMode')),
    attendance: ((resp['attendanceResponses']??{}) as Map).map((key, value) => MapEntry(key, AnnouncementAttendanceResp.fromResponse(value))),
    waivedAttRespMembers: (resp['waivedAttRespMembers'] as List?)?.cast<String>()??(throw InvalidResponseError('waivedAttRespMembers')),

    circle: circle,
  );

}
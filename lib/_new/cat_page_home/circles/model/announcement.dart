import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/account/account.dart';
import 'package:provider/provider.dart';

import '../../../api/_api.dart';
import '../circle_cover_image_data.dart';
import 'announcement_attendance_resp.dart';
import 'announcement_attendance_resp_mode.dart';
import 'circle.dart';

class AnnouncementProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class AnnouncementListProvider extends ChangeNotifier{
  void notify() => notifyListeners();
}

class Announcement{

  static List<Announcement>? _all;
  static Map<String?, Announcement>? _allMap;

  static List<Announcement>? get all => _all;
  static Map<String?, Announcement>? get allMap => _allMap;

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

  static init(BuildContext context, List<Announcement> circles){

    silentInit(circles);

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

  final String key;
  String title;
  DateTime postTime;
  DateTime? lastUpdateTime;
  DateTime? startTime;
  DateTime? endTime;
  String? place;
  UserData author;
  CircleCoverImageData? coverImage;
  String text;
  bool pinned;
  AnnouncementAttendanceRespMode respMode;
  Map<String, AnnouncementAttendanceResp> attendance;

  final Circle? circle;

  AnnouncementAttendanceResp? get myAttendance{
    if(AccountData.key == null) return null;
    return attendance[AccountData.key];
  }

  Announcement({
    required this.key,
    required this.title,
    required this.postTime,
    this.lastUpdateTime,
    required this.startTime,
    required this.endTime,
    required this.place,
    required this.author,
    this.coverImage,
    required this.text,
    required this.pinned,

    this.circle,
    required this.respMode,
    required this.attendance,
  });

  static Announcement fromMap(Map resp, {String? key}) => Announcement(
    key: key??resp['_key']??(throw InvalidResponseError('_key')),
    title: resp['title']??(throw InvalidResponseError('title')),
    postTime: DateTime.tryParse(resp['post_time_str']??(throw InvalidResponseError('post_time_str')))??(throw InvalidResponseError('post_time_str')),
    startTime: resp['start_time_str'] == null? null: DateTime.tryParse(resp['start_time_str']),
    endTime: resp['end_time_str'] == null? null: DateTime.tryParse(resp['end_time_str']),
    lastUpdateTime: resp['last_update_time_str'] == null? null: DateTime.tryParse(resp['last_update_time_str']),
    coverImage: resp['cover_image_url'] == null? null: CircleCoverImageData.from(resp['cover_image_url']),
    place: resp['place'],
    author: UserData.fromMap(resp['author']),
    text: resp['text'],
    pinned: resp['pinned'],
    respMode: strToAnnouncementAttendanceRespMode[resp['attendance_resp_mode']]??(throw InvalidResponseError('attendance_resp_mode')),
    attendance: ((resp['attendance_responses']??{}) as Map).map((key, value) => MapEntry(key, AnnouncementAttendanceResp.fromResponse(value)))
  );

}
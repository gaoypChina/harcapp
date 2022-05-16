import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendace.dart';

class AnnouncementAttendanceResp{

  final AnnouncementAttendance response;
  final String? rejectionReason;
  final DateTime? postponeTime;

  const AnnouncementAttendanceResp(this.response, {this.rejectionReason, this.postponeTime});

  static AnnouncementAttendanceResp fromResponse(Map map) => AnnouncementAttendanceResp(
    strToAnnouncementAttendance[map['response']??(throw InvalidResponseError('response'))]??(throw InvalidResponseError('response')),
    rejectionReason: map['rejection_reason'],
    postponeTime: DateTime.tryParse(map['postpone_response_time']??''),
  );

}
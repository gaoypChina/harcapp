import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendace.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

IconData announcementAttendanceRespToIcon(AnnouncementAttendanceResp annAttResp){

  if(annAttResp.response == AnnouncementAttendance.POSTPONE_RESP &&
      annAttResp.postponeTime != null &&
      DateTime.now().isAfter(annAttResp.postponeTime!)
  ) return MdiIcons.clockAlertOutline;

  switch(annAttResp.response){
    case AnnouncementAttendance.ATTENDING: return MdiIcons.check;
    case AnnouncementAttendance.POSTPONE_RESP: return MdiIcons.clockOutline;
    case AnnouncementAttendance.NOT_ATTENDING: return MdiIcons.close;
  }
}
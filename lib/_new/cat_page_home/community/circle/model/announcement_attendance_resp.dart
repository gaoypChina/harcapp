import 'dart:core';

import 'package:flutter/widgets.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'announcement_attendace.dart';

class AnnouncementAttendanceResp{

  final AnnouncementAttendance response;
  final String? responseReason;
  final DateTime? postponeTime;

  const AnnouncementAttendanceResp(this.response, {this.responseReason, this.postponeTime});

  static AnnouncementAttendanceResp fromResponse(Map map) => AnnouncementAttendanceResp(
    strToAnnouncementAttendance[map['response']??(throw InvalidResponseError('response'))]??(throw InvalidResponseError('response')),
    responseReason: map['responseReason'],
    postponeTime: DateTime.tryParse(map['postponeResponseTime']??''),
  );

}

IconData announcementAttendanceRespToIcon(AnnouncementAttendanceResp annAttResp){

  if(annAttResp.response == AnnouncementAttendance.POSTPONE_RESP &&
      annAttResp.postponeTime != null &&
      DateTime.now().isAfter(annAttResp.postponeTime!)
  ) return MdiIcons.clockAlertOutline;

  return announcementAttendanceDropdownIcon[annAttResp.response]!;

}
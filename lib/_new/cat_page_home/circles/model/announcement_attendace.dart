import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

enum AnnouncementAttendance{
  ATTENDING, POSTPONE_RESP, NOT_ATTENDING
}

Map<String, AnnouncementAttendance> strToAnnouncementAttendance = {
  'ATTENDING': AnnouncementAttendance.ATTENDING,
  'POSTPONE_RESP': AnnouncementAttendance.POSTPONE_RESP,
  'NOT_ATTENDING': AnnouncementAttendance.NOT_ATTENDING,
};

Map<AnnouncementAttendance, String> announcementAttendanceToStr = {
  AnnouncementAttendance.ATTENDING: 'ATTENDING',
  AnnouncementAttendance.POSTPONE_RESP: 'POSTPONE_RESP',
  AnnouncementAttendance.NOT_ATTENDING: 'NOT_ATTENDING',
};

Map<AnnouncementAttendance?, String> announcementAttendanceDropdownText = {
  null: 'Będziesz?',
  AnnouncementAttendance.ATTENDING: 'Będę!',
  AnnouncementAttendance.POSTPONE_RESP: 'Nie wiem',
  AnnouncementAttendance.NOT_ATTENDING: 'Nie będę',
};

Map<AnnouncementAttendance?, IconData> announcementAttendanceDropdownIcon = {
  null: MdiIcons.hiking,
  AnnouncementAttendance.ATTENDING: MdiIcons.check,
  AnnouncementAttendance.POSTPONE_RESP: MdiIcons.clockOutline,
  AnnouncementAttendance.NOT_ATTENDING: MdiIcons.close,
};

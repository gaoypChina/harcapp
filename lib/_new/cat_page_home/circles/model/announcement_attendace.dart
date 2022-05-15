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
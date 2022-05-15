enum AnnouncementAttendanceRespMode{
  NONE, OPTIONAL, OBLIGATORY
}

Map<String, AnnouncementAttendanceRespMode> strToAnnouncementAttendanceRespMode = {
  'NONE': AnnouncementAttendanceRespMode.NONE,
  'OPTIONAL': AnnouncementAttendanceRespMode.OPTIONAL,
  'OBLIGATORY': AnnouncementAttendanceRespMode.OBLIGATORY,
};

Map<AnnouncementAttendanceRespMode, String> announcementAttendanceRespModeToStr = {
  AnnouncementAttendanceRespMode.NONE: 'NONE',
  AnnouncementAttendanceRespMode.OPTIONAL: 'OPTIONAL',
  AnnouncementAttendanceRespMode.OBLIGATORY: 'OBLIGATORY',
};
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget_template.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'announcement_edit_page/_main.dart';
import 'announcement_extended_page.dart';
import 'model/announcement.dart';
import 'model/announcement_attendace.dart';
import 'model/announcement_attendance_resp_mode.dart';
import 'model/circle.dart';

class AnnouncementWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final bool shrinkText;
  final bool pinnable;
  final bool editable;
  final bool showOnTap;
  final void Function()? onAnnouncementUpdated;
  final bool showCircleButton;
  final void Function()? onCircleButtonTap;

  Circle get circle => announcement.circle!;

  const AnnouncementWidget(
      this.announcement,
      this.palette,
      { this.shrinkText = true,
        this.pinnable = true,
        this.editable = true,
        this.showOnTap = true,
        this.onAnnouncementUpdated,
        this.showCircleButton = false,
        this.onCircleButtonTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => Hero(
      tag: announcement,
      child: Consumer<AnnouncementProvider>(
        builder: (context, prov, child) => AnnouncementWidgetTemplate(
            announcement,
            palette: palette,
            shrinkText: shrinkText,
            onUpdateTap: editable ? () => pushPage(
                context,
                builder: (context) => AnnouncementEditorPage(
                  circle: circle,
                  initAnnouncement: announcement,
                  palette: palette,
                  onSaved: (updatedAnnouncement){
                    // circle.updateAnnouncement(updatedAnnouncement);
                    announcement.update(updatedAnnouncement);
                    onAnnouncementUpdated?.call();
                    prov.notify();
                  },
                  onRemoved: (){
                    circle.removeAnnouncement(announcement);
                    onAnnouncementUpdated?.call();
                    prov.notify();
                  },
                )
            ):null,
            onPinChanged: pinnable ? (pinned){
              circle.changePinnedAnnouncement(announcement, pinned);
              onAnnouncementUpdated?.call();
              prov.notify();
            }:null,
            onAttendanceChanged: (resp, now){
              bool hasResponse = announcement.respMode == AnnouncementAttendanceRespMode.OBLIGATORY && resp.response != null;
              bool isPostpone = resp.response == AnnouncementAttendance.POSTPONE_RESP && resp.postponeTime!.isAfter(now);

              circle.changeAwaitingAnnouncement(announcement, hasResponse && isPostpone);
              onAnnouncementUpdated?.call();
              prov.notify();
            },
            onAttendanceIndicatorTap: showOnTap?() => pushPage(
              context,
              builder: (context) => AnnouncementExpandedPage(
                announcement,
                palette: palette,
                displayAttendacePage: true,
                onAnnouncementsUpdated: onAnnouncementUpdated,
              ),
            ):null,
            onTap: showOnTap?() => pushPage(
              context,
              builder: (context) => AnnouncementExpandedPage(
                announcement,
                palette: palette,
                onAnnouncementsUpdated: onAnnouncementUpdated,
              ),
            ):null,
            showCircleButton: showCircleButton,
            onCircleButtonTap: onCircleButtonTap,
        ),
      )
  );

}
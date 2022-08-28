import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'announcement_editor/_main.dart';
import 'announcement_extended_page.dart';
import 'announcement_widget_template.dart';
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
  final bool showCommunityInfo;
  final void Function()? onCircleButtonTap;
  final bool showPinShortcutButton;

  Circle get circle => announcement.circle;

  const AnnouncementWidget(
      this.announcement,
      this.palette,
      { this.shrinkText = true,
        this.pinnable = true,
        this.editable = true,
        this.showOnTap = true,
        this.onAnnouncementUpdated,
        this.showCommunityInfo = false,
        this.onCircleButtonTap,
        this.showPinShortcutButton = false,
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
              onAnnouncementUpdated?.call();
              prov.notify();
            }:null,
            onAttendanceChanged: (resp, now){
              bool hasResponse = announcement.respMode == AnnouncementAttendanceRespMode.OBLIGATORY && resp.response != null;
              bool isOverdue = resp.response == AnnouncementAttendance.POSTPONE_RESP && resp.postponeTime!.isAfter(now);

              bool isNewAwaiting = !hasResponse || (hasResponse && isOverdue);
              if(announcement.isAwaitingMyResponse && !isNewAwaiting)
                circle.pinnedCount -= 1;
              else if(!announcement.isAwaitingMyResponse && isNewAwaiting)
                circle.pinnedCount += 1;

              circle.changeAwaitingAnnouncement(announcement, isNewAwaiting);
              onAnnouncementUpdated?.call();
              prov.notify();
              CircleProvider.notify_(context);
            },
            onAttendanceIndicatorTap: showOnTap?() => pushPage(
              context,
              builder: (context) => AnnouncementExpandedPage(
                announcement,
                palette: palette,
                displayAttendancePage: true,
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCommunityInfo: showCommunityInfo,
              ),
            ):null,
            onTap: showOnTap?() => pushPage(
              context,
              builder: (context) => AnnouncementExpandedPage(
                announcement,
                palette: palette,
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCommunityInfo: showCommunityInfo,
                showPinShortcutButton: showPinShortcutButton,
              ),
            ):null,
            showCommunityInfo: showCommunityInfo,
            onCircleButtonTap: onCircleButtonTap,
            showPinShortcutButton: showPinShortcutButton,
        ),
      )
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/account/account.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../community_publishable_widget_template.dart';
import 'announcement_editor/_main.dart';
import 'announcement_extended_page.dart';
import 'announcement_widget_template.dart';
import 'attending_members_dialog.dart';
import 'circle_role.dart';
import 'model/announcement.dart';
import 'model/circle.dart';

class AnnouncementWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final bool shrinkText;
  final bool disableTap;
  final void Function()? onAnnouncementUpdated;
  final bool showCommunityInfo;
  final void Function()? onCircleButtonTap;
  final bool showPinShortcutButton;

  Circle get circle => announcement.circle;

  const AnnouncementWidget(
      this.announcement,
      this.palette,
      { this.shrinkText = true,
        this.disableTap = false,
        this.onAnnouncementUpdated,
        this.showCommunityInfo = false,
        this.onCircleButtonTap,
        this.showPinShortcutButton = false,
        super.key
      });

  @override
  Widget build(BuildContext context){

    bool editable = announcement.author.key == AccountData.key && announcement.circle.myRole != CircleRole.OBSERVER;
    bool pinnable = announcement.author.key == AccountData.key && announcement.circle.myRole != CircleRole.OBSERVER;

    return Hero(
        tag: announcement,
        child: Consumer<AnnouncementProvider>(
          builder: (context, announcementProv, child) => AnnouncementWidgetTemplate(
            announcement,
            palette: palette,
            shrinkText: shrinkText,
            onUpdateTap: editable ? () => pushPage(
                context,
                builder: (context) => AnnouncementEditorPage(
                  circle: circle,
                  initAnnouncement: announcement,
                  isEvent: announcement.isEvent,
                  palette: palette,
                  onSaved: (updatedAnnouncement){
                    announcement.update(updatedAnnouncement);
                    onAnnouncementUpdated?.call();
                    announcementProv.notify();
                  },
                  onRemoved: (){
                    circle.removeAnnouncement(announcement);
                    onAnnouncementUpdated?.call();
                    announcementProv.notify();
                  },
                )
            ):null,
            onPinChanged: pinnable ? (pinned){
              onAnnouncementUpdated?.call();
              announcementProv.notify();
            }:null,
            onAttendanceChanged: (resp, now){
              AttendanceWidget.defaultOnAttendanceChanged(context, announcement, resp, now);
              onAnnouncementUpdated?.call();
              announcementProv.notify();
              AnnouncementListProvider.notify_(context);
              CircleProvider.notify_(context);
            },
            onAttendanceIndicatorTap: () => openDialog(
                context: context,
                builder: (context) => AttendingMembersDialog(announcement, palette: palette)
            ),
            onTap:
            !disableTap &&
                CommunityPublishableWidgetTemplate.isTextExpandable(announcement.text, context: context) ?
            () => pushPage(
              context,
              builder: (context) => AnnouncementExpandedPage(
                announcement,
                palette: palette,
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCommunityInfo: showCommunityInfo,
                onCircleButtonTap: onCircleButtonTap,
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

}
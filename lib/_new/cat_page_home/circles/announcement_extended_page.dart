import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'announcement_widget.dart';
import 'model/announcement_attendace.dart';
import 'model/announcement_attendance_resp.dart';
import 'model/announcement_attendance_resp_mode.dart';
import 'model/member.dart';

class AnnouncementExpandedPage extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function()? onAnnouncementsUpdated;

  bool get enablesResp => announcement.respMode != AnnouncementAttendanceRespMode.NONE;

  const AnnouncementExpandedPage(
      this.announcement,
      { this.palette,
        this.onAnnouncementsUpdated,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CirclePage.backgroundColor(context, palette),
    appBottomNavColor: CirclePage.backgroundColor(context, palette),
    body: DefaultTabController(
      length: enablesResp?2:1,
      child: ExtendedNestedScrollView(
        floatHeaderSlivers: true,
        pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

          SliverAppBar(
            title: Text(announcement.title),
            centerTitle: true,
            floating: true,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            backgroundColor: CirclePage.backgroundColor(context, palette),
            bottom: enablesResp?TabBar(
              tabs: const [
                Tab(text: 'Ogłoszenie'),
                Tab(text: 'Obecności'),
              ],
              indicator: AppTabBarIncdicator(
                color: CirclePage.strongColor(context, palette)
              ),
            ):null,
          ),

        ],
        body: TabBarView(
            children: [

              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Consumer<AnnouncementProvider>(
                  builder: (context, prov, child) => AnnouncementWidget(
                      announcement,
                      palette,
                      shrinkText: false,
                      showOnTap: false,
                      onAnnouncementUpdated: onAnnouncementsUpdated
                  ),
                )
              ),

             if(enablesResp)
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: announcement.circle?.members.length??0,
                  itemBuilder: (context, index){

                    Member member = announcement.circle!.members[index];
                    AnnouncementAttendanceResp? resp = announcement.attendance[member.key];

                    return AccountTile(
                      member.name,

                      subtitle:
                      resp?.response == null || resp?.response == AnnouncementAttendance.ATTENDING?
                      null:
                      Text(
                        resp?.response == AnnouncementAttendance.NOT_ATTENDING?
                        resp!.rejectionReason??'-':
                        resp?.response == AnnouncementAttendance.POSTPONE_RESP?
                        dateToString(resp!.postponeTime):'-',
                        style: AppTextStyle(color: hintEnab_(context)),
                      ),

                      trailing:
                      resp != null?
                      Icon(announcementAttendanceRespToIcon(resp)):
                      Icon(MdiIcons.circleMedium, color: hintEnab_(context)),
                      onTap: () => openParticipantDetails(context, member),
                    );
                  }
                )

            ]
        ),
      ),
    ),
  );

  void openParticipantDetails(BuildContext context, Member member) => showScrollBottomSheet(
      context: context,
      builder: (context){

        AnnouncementAttendanceResp? resp = announcement.attendance[member.key];

        String commentTitle;
        if(resp == null)
          commentTitle = '';
        else if(resp.response == AnnouncementAttendance.NOT_ATTENDING)
          commentTitle = 'Powód nieobecności';
        else if(resp.response == AnnouncementAttendance.POSTPONE_RESP)
          commentTitle = 'Data deklaracji obecności:';
        else
          commentTitle = '';

        String comment;
        if(resp == null)
          comment = '';
        else if(resp.response == AnnouncementAttendance.NOT_ATTENDING)
          comment = resp.rejectionReason??'';
        else if(resp.response == AnnouncementAttendance.POSTPONE_RESP)
          comment = dateToString(resp.postponeTime);
        else
          comment = '';

        return BottomSheetDef(
          color: CirclePage.backgroundColor(context, palette),
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              AccountHeaderWidget(member.name),

              const SizedBox(height: 2*24.0),

              Padding(
                padding: const EdgeInsets.only(
                    left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                ),
                child: Text(
                  'Deklaracja obecności',
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    color: hintEnab_(context)
                  ),
                ),
              ),

              ListTile(
                leading: Icon(
                  resp != null?
                  announcementAttendanceRespToIcon(resp):
                  MdiIcons.cancel
                ),
                title: Text(
                  resp != null?
                  announcementAttendanceDropdownText[resp.response]??'':
                  'Brak odpowiedzi',
                  style: AppTextStyle(),
                ),
              ),

              if(resp != null && resp.response != AnnouncementAttendance.ATTENDING)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                  ),
                  child: Text(
                    commentTitle,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_NORMAL,
                      color: hintEnab_(context),
                      fontWeight: weight.halfBold
                    ),
                  ),
                ),

              if(resp != null && resp.response != AnnouncementAttendance.ATTENDING)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                  ),
                  child: Text(
                    comment,
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                  ),
                ),

              const SizedBox(height: 2*24.0),

              ListTile(
                  leading: const Icon(
                    MdiIcons.pauseCircleOutline,
                  ),
                  title: Text(
                      'Nie wymagaj deklaracji obecności',
                      style: AppTextStyle()
                  ),
                  onTap: (){}
              ),

              const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ],
          ),
        );
      }
  );

}


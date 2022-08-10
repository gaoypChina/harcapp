import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../common/community_cover_colors.dart';
import 'announcement_widget.dart';
import 'model/announcement.dart';
import 'model/announcement_attendace.dart';
import 'model/announcement_attendance_resp.dart';
import 'model/announcement_attendance_resp_mode.dart';
import 'model/member.dart';

class AnnouncementExpandedPage extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final bool displayAttendancePage;
  final void Function()? onAnnouncementUpdated;

  bool get enablesResp => announcement.respMode != AnnouncementAttendanceRespMode.NONE;

  const AnnouncementExpandedPage(
      this.announcement,
      { this.palette,
        this.displayAttendancePage = false,
        this.onAnnouncementUpdated,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) =>   Consumer<AnnouncementProvider>(
    builder: (context, prov, child) => BottomNavScaffold(
      backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
      appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
      body: DefaultTabController(
        length: enablesResp?2:1,
        initialIndex: enablesResp && displayAttendancePage?1:0,
        child: ExtendedNestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

            SliverAppBar(
              title: Text(announcement.title),
              centerTitle: true,
              floating: true,
              pinned: true,
              forceElevated: innerBoxIsScrolled,
              backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
              bottom: enablesResp?TabBar(
                tabs: const [
                  Tab(text: 'Ogłoszenie'),
                  Tab(text: 'Obecności'),
                ],
                indicator: AppTabBarIncdicator(
                    color: CommunityCoverColors.strongColor(context, palette)
                ),
              ):null,
            ),

          ],
          body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [

                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  child: AnnouncementWidget(
                      announcement,
                      palette,
                      shrinkText: false,
                      showOnTap: false,
                      onAnnouncementUpdated: onAnnouncementUpdated
                  ),
                ),

                if(enablesResp)
                  ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: announcement.circle?.members.length??0,
                      itemBuilder: (context, index) => MemberTile(
                        announcement,
                        announcement.circle!.members[index],
                        palette,
                        thumbnailColor: CommunityCoverColors.backgroundColor(context, palette),
                        thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
                      )
                  )

              ]
          ),
        ),
      ),
    )
  );

}

class MemberTile extends StatefulWidget{

  final Announcement announcement;
  final Member member;
  final PaletteGenerator? palette;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;

  const MemberTile(this.announcement, this.member, this.palette, {this.thumbnailColor, this.thumbnailBorderColor, super.key});

  @override
  State<StatefulWidget> createState() => MemberTileState();

}

class MemberTileState extends State<MemberTile>{

  Announcement get announcement => widget.announcement;
  Member get member => widget.member;
  PaletteGenerator? get palette => widget.palette;

  Color? get thumbnailColor => widget.thumbnailColor;
  Color? get thumbnailBorderColor => widget.thumbnailBorderColor;

  @override
  Widget build(BuildContext context){

    AnnouncementAttendanceResp? resp = announcement.attendance[member.key];
    bool waived = announcement.waivedAttRespMembers.contains(member.key);

    return AccountTile(
      member.name,

      subtitle:
      resp?.response == null || resp?.response == AnnouncementAttendance.ATTENDING?
      null:
      Text(
        resp?.response == AnnouncementAttendance.NOT_ATTENDING?
        resp!.responseReason??'-':
        resp?.response == AnnouncementAttendance.POSTPONE_RESP?
        dateToString(resp!.postponeTime):'-',
        style: AppTextStyle(color: hintEnab_(context)),
      ),

      trailing:
      resp != null?
      Icon(announcementAttendanceRespToIcon(resp)):
      waived?
      null:
      Icon(MdiIcons.circleMedium, color: hintEnab_(context)),
      onTap: () => openParticipantDetails(context, member),
      
      thumbnailColor: thumbnailColor,
      thumbnailBorderColor: thumbnailBorderColor,
      
    );

  }

  void openParticipantDetails(BuildContext context, Member member) => showScrollBottomSheet(
      context: context,
      builder: (context){

        AnnouncementAttendanceResp? resp = announcement.attendance[member.key];

        bool waived = announcement.waivedAttRespMembers.contains(member.key);

        String responseReasonTitle;
        if(resp == null)
          responseReasonTitle = '';
        else if(resp.response == AnnouncementAttendance.NOT_ATTENDING)
          responseReasonTitle = 'Powód nieobecności';
        else if(resp.response == AnnouncementAttendance.POSTPONE_RESP)
          responseReasonTitle = 'Powód opóźnienia deklaracji';
        else
          responseReasonTitle = '';

        String responseReason;
        if(resp == null)
          responseReason = '';
        else if(resp.response == AnnouncementAttendance.NOT_ATTENDING || resp.response == AnnouncementAttendance.POSTPONE_RESP)
          responseReason = resp.responseReason??'';
        else
          responseReason = '';

        return BottomSheetDef(
          color: CommunityCoverColors.backgroundColor(context, palette),
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

              if(resp != null && resp.response == AnnouncementAttendance.POSTPONE_RESP)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                  ),
                  child: Text(
                    'Data deklaracji obecności',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_NORMAL,
                        color: hintEnab_(context),
                        fontWeight: weight.halfBold
                    ),
                  ),
                ),

              if(resp != null && resp.response == AnnouncementAttendance.POSTPONE_RESP)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                  ),
                  child: Text(
                    dateToString(resp.postponeTime),
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                  ),
                ),

              if(resp != null && resp.response == AnnouncementAttendance.POSTPONE_RESP && responseReason.isNotEmpty)
                const SizedBox(height: 2*24.0),

              if(resp != null && (resp.response == AnnouncementAttendance.NOT_ATTENDING ||
                  resp.response == AnnouncementAttendance.POSTPONE_RESP && responseReason.isNotEmpty))
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                  ),
                  child: Text(
                    responseReasonTitle,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_NORMAL,
                        color: hintEnab_(context),
                        fontWeight: weight.halfBold
                    ),
                  ),
                ),

              if(resp != null && (resp.response == AnnouncementAttendance.NOT_ATTENDING ||
                  resp.response == AnnouncementAttendance.POSTPONE_RESP && responseReason.isNotEmpty))
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2*Dimen.LIST_TILE_LEADING_MARGIN_VAL + Dimen.ICON_SIZE + 2*8
                  ),
                  child: Text(
                    responseReason,
                    style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                  ),
                ),

              const SizedBox(height: 2*24.0),

              ListTile(
                  leading: Icon(
                    waived?
                    MdiIcons.playCircleOutline:
                    MdiIcons.pauseCircleOutline,
                  ),
                  title: Text(
                      waived?
                      'Wymagaj deklaracji obecności':
                      'Nie wymagaj deklaracji obecności',
                      style: AppTextStyle()
                  ),
                  onTap: (){

                    showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Chwileczkę...');

                    ApiCircle.waiveResponse(
                        annKey: announcement.key,
                        memberKey: member.key,
                        waive: !waived,
                        onSuccess: (success, now) async {

                          if(waived && success)
                            announcement.waivedAttRespMembers.remove(member.key);
                          else if(!waived && success)
                            announcement.waivedAttRespMembers.add(member.key);

                          Provider.of<AnnouncementProvider>(context, listen: false).notify();
                          Provider.of<AnnouncementListProvider>(context, listen: false).notify();
                          setState((){});
                          await popPage(context); // Close loading widget.
                          Navigator.pop(context);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) showAppToast(context, text: simpleErrorMessage);
                          await popPage(context); // Close loading widget.
                        }
                    );
                  }
              ),

              const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ],
          ),
        );
      }
  );

}
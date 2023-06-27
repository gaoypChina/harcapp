import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable_widget_template.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
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
import 'announcement_widget_template.dart';
import 'model/announcement.dart';
import 'model/announcement_attendace.dart';
import 'model/announcement_attendance_resp.dart';
import 'model/announcement_attendance_resp_mode.dart';
import 'model/circle.dart';
import 'model/member.dart';

class AnnouncementExpandedPage extends StatefulWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final bool displayAttendancePage;
  final void Function()? onAnnouncementUpdated;
  final bool showCommunityInfo;
  final void Function()? onCircleButtonTap;
  final bool showPinShortcutButton;

  const AnnouncementExpandedPage(
      this.announcement,
      { this.palette,
        this.displayAttendancePage = false,
        this.onAnnouncementUpdated,
        required this.showCommunityInfo,
        this.onCircleButtonTap,
        this.showPinShortcutButton = false,
        Key? key
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnnouncementExpandedPageState();

}

class AnnouncementExpandedPageState extends State<AnnouncementExpandedPage> with TickerProviderStateMixin{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  bool get displayAttendancePage => widget.displayAttendancePage;
  void Function()? get onAnnouncementUpdated => widget.onAnnouncementUpdated;
  bool get showCommunityInfo => widget.showCommunityInfo;
  void Function()? get onCircleButtonTap => widget.onCircleButtonTap;
  bool get showPinShortcutButton => widget.showPinShortcutButton;

  bool get enablesResp => announcement.respMode != AnnouncementAttendanceRespMode.NONE;

  @override
  Widget build(BuildContext context) => Consumer<AnnouncementProvider>(
      builder: (context, prov, child) => BottomNavScaffold(
        backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
        appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              title: Text(
                announcement.hasTitle?announcement.title!:announcement.text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: true,
              floating: true,
              pinned: true,
              backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(CommunityPublishableWidgetTemplate.borderHorizontalMarg),
              sliver: SliverList(delegate: SliverChildListDelegate([
                AnnouncementWidget(
                  announcement,
                  palette,
                  shrinkText: false,
                  disableTap: true,
                  onAnnouncementUpdated: onAnnouncementUpdated,
                  showCommunityInfo: showCommunityInfo,
                  onCircleButtonTap: onCircleButtonTap,
                  showPinShortcutButton: showPinShortcutButton,
                  constrainImage: false,
                ),
              ])),
            )


          ],
        )
      )
  );

}

class MemberAttendanceTile extends StatefulWidget{

  final Announcement announcement;
  final Member member;
  final PaletteGenerator? palette;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;

  const MemberAttendanceTile(this.announcement, this.member, this.palette, {this.thumbnailColor, this.thumbnailBorderColor, super.key});

  @override
  State<StatefulWidget> createState() => MemberAttendanceTileState();

}

class MemberAttendanceTileState extends State<MemberAttendanceTile>{

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
        dateToString(resp!.postponeTime, shortMonth: true):'-',
        style: AppTextStyle(color: hintEnab_(context)),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),

      trailing:
      member.key == AccountData.key?
      AttendanceWidget(
        announcement,
        palette: palette,
        onAttendanceChanged: (resp, now){
          AttendanceWidget.defaultOnAttendanceChanged(context, announcement, resp, now);
          AnnouncementProvider.notify_(context);
          AnnouncementListProvider.notify_(context);
          CircleProvider.notify_(context);
        },
      ):
      resp != null?
      Icon(announcementAttendanceRespToIcon(resp)):
      waived?
      null:
      Icon(MdiIcons.dotsHorizontal, color: hintEnab_(context)),
      onTap: () => openDetails(context, member),
      
      thumbnailColor: thumbnailColor,
      thumbnailBorderColor: thumbnailBorderColor,
      
    );

  }

  void openDetails(BuildContext context, Member member) => showScrollBottomSheet(
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

              AccountHeaderWidget(member.name, verified: member.verified),

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

              if(announcement.author.key == AccountData.key)
                const SizedBox(height: 2*24.0),

              if(announcement.author.key == AccountData.key)
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

                            AnnouncementProvider.notify_(context);
                            AnnouncementListProvider.notify_(context);
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
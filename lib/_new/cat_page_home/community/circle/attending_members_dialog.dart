import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement_attendace.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../common/community_cover_colors.dart';
import 'model/announcement_attendance_resp.dart';
import 'model/member.dart';

class AttendingMembersDialog extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;

  const AttendingMembersDialog(this.announcement, {this.palette, super.key});

  @override
  Widget build(BuildContext context) {

    List<Member> attending = [];
    List<Member> postponed = [];
    List<Member> rejected = [];
    List<Member> noAnswer = [];

    for(Member member in announcement.circle.members)
      switch(announcement.attendance[member.key]?.response){
        case AnnouncementAttendance.ATTENDING:
          attending.add(member);
          break;
        case AnnouncementAttendance.POSTPONE_RESP:
          postponed.add(member);
          break;
        case AnnouncementAttendance.NOT_ATTENDING:
          rejected.add(member);
          break;
        case null:
          noAnswer.add(member);
          break;
      }

    attending.sort((m1, m2) => m1.name.compareTo(m2.name));
    postponed.sort((m1, m2) => m1.name.compareTo(m2.name));
    rejected.sort((m1, m2) => m1.name.compareTo(m2.name));
    noAnswer.sort((m1, m2) => m1.name.compareTo(m2.name));

    return Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        clipBehavior: Clip.hardEdge,
        color: CommunityCoverColors.cardColor(context, palette),
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

              SliverAppBar(
                floating: true,
                pinned: true,
                title: Text(
                  announcement.hasTitle?announcement.title!:announcement.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                centerTitle: true,
                backgroundColor: CommunityCoverColors.cardColor(context, palette),
                bottom: TabBar(
                    physics: const BouncingScrollPhysics(),
                    indicator: AppTabBarIncdicator(color: CommunityCoverColors.strongColor(context, palette)),
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Będę [${attending.length}]'),
                      Tab(text: 'Nie wiem [${postponed.length}]'),
                      Tab(text: 'Nie będę [${rejected.length}]'),
                      Tab(text: 'Brak odpowiedzi [${noAnswer.length}]'),
                    ]
                ),
              )

            ],
            body: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [

                  MemberResponseWidget(
                      announcement,
                      attending,
                      announcementAttendanceDropdownIcon[AnnouncementAttendance.ATTENDING]!,
                      'Brak odób, które\nzadeklarowały obecność\n',
                      palette: palette
                  ),

                  MemberResponseWidget(
                      announcement,
                      postponed,
                      announcementAttendanceDropdownIcon[AnnouncementAttendance.POSTPONE_RESP]!,
                      'Brak odób, które\njeszcze nie wiedzą\n',
                      palette: palette
                  ),

                  MemberResponseWidget(
                      announcement,
                      rejected,
                      announcementAttendanceDropdownIcon[AnnouncementAttendance.NOT_ATTENDING]!,
                      'Brak odób, które\nnie dadzą rady\nsię pojawić',
                      palette: palette
                  ),

                  MemberResponseWidget(
                      announcement,
                      noAnswer,
                      MdiIcons.partyPopper,
                      'Wszyscy udzielili odpowiedzi!\n\n',
                      palette: palette
                  ),

                ]
            ),
          )
        ),
      ),
    );

  }

}

class MemberResponseWidget extends StatelessWidget{

  final Announcement announcement;
  final List<Member> members;
  final PaletteGenerator? palette;
  final IconData emptyIcon;
  final String emptyMessage;

  const MemberResponseWidget(this.announcement, this.members, this.emptyIcon, this.emptyMessage, {this.palette, super.key});

  @override
  Widget build(BuildContext context){

    if(members.isEmpty)
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Icon(
            emptyIcon,
            size: 120,
            color: hintEnab_(context),
          ),

          const SizedBox(height: 40),

          Text(
            emptyMessage,
            style: AppTextStyle(
              fontSize: 24.0,
              color: hintEnab_(context),
              fontWeight: weight.halfBold,
            ),
            textAlign: TextAlign.center,
          )
          
        ],
      );

    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: members.length,
        itemBuilder: (context, index) => MemberAttendanceTile(
          announcement,
          members[index],
          palette,
          color: CommunityCoverColors.backgroundColor(context, palette),
        )
    );
  }

}

class MemberAttendanceTile extends StatefulWidget{

  final Announcement announcement;
  final Member member;
  final PaletteGenerator? palette;
  final Color? color;

  const MemberAttendanceTile(this.announcement, this.member, this.palette, {this.color, super.key});

  @override
  State<StatefulWidget> createState() => MemberAttendanceTileState();

}

class MemberAttendanceTileState extends State<MemberAttendanceTile>{

  Announcement get announcement => widget.announcement;
  Member get member => widget.member;
  PaletteGenerator? get palette => widget.palette;

  Color? get color => widget.color;

  @override
  Widget build(BuildContext context){

    AnnouncementAttendanceResp? resp = announcement.attendance[member.key];
    bool waived = announcement.waivedAttRespMembers.contains(member.key);

    return AccountTile(
      member.name,

      subtitle:
      announcement.waivedAttRespMembers.contains(member.key)?
      Text('Zwolniony z odpowiedzi', style: AppTextStyle()):
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
      resp != null?
      Icon(announcementAttendanceRespToIcon(resp)):
      waived?
      null:
      Icon(MdiIcons.dotsHorizontal, color: hintEnab_(context)),
      onTap: () => openDetails(context, member),

      thumbnailColor: color,
      thumbnailBorderColor: color,

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
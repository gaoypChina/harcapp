import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../common/community_cover_colors.dart';
import '../community_publishable_widget_template.dart';
import 'circle_page.dart';
import 'circle_role.dart';
import 'model/announcement.dart';
import 'model/announcement_attendace.dart';
import 'model/announcement_attendance_resp.dart';
import 'model/announcement_attendance_resp_mode.dart';
import 'model/circle.dart';

class AnnouncementWidgetTemplate extends StatelessWidget{

  final Announcement announcement;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final void Function(Announcement)? onDeleted;
  final void Function(bool)? onPinChanged;
  final void Function(AnnouncementAttendanceResp, DateTime now)? onAttendanceChanged;
  final void Function()? onAttendanceIndicatorTap;
  final bool showCommunityInfo;
  final void Function()? onCircleButtonTap;
  final bool showPinShortcutButton;
  final bool constrainImage;

  const AnnouncementWidgetTemplate(
      this.announcement,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.onDeleted,

        this.onPinChanged,
        this.onAttendanceChanged,
        this.onAttendanceIndicatorTap,
        this.showCommunityInfo = false,
        this.onCircleButtonTap,
        this.showPinShortcutButton = false,
        this.constrainImage = true,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context){

    bool amIAuthor = AccountData.key == announcement.author.key;

    return CommunityPublishableWidgetTemplate(
        announcement,
        palette,

        shrinkText: shrinkText,
        onTap: onTap,
        onUpdateTap: onUpdateTap,
        showCommunityInfo: showCommunityInfo,
        contentBottom:
        announcement.isEvent?
        EventInfoWidget(
            announcement,
            palette: palette,
            onAttendanceChanged: onAttendanceChanged,
            onAttendanceIndicatorTap: onAttendanceIndicatorTap
        ):null,

        onCommunityButtonTap: onCircleButtonTap,

        onMoreTap:
        amIAuthor && announcement.circle.myRole != CircleRole.OBSERVER?
            () => showScrollBottomSheet(
            context: context,
            builder: (_) => BottomSheetDef(
              color: CommunityCoverColors.backgroundColor(context, palette),
              builder: (_) => Column(
                children: [

                  if(amIAuthor && announcement.circle.myRole != CircleRole.OBSERVER)
                    ListTile(
                      leading: Icon(MdiIcons.pencilOutline),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(communityRadius),
                      ),
                      title: Text('Edytuj ogłoszenie', style: AppTextStyle()),
                      onTap: (){
                        Navigator.pop(context);
                        onUpdateTap?.call();
                      },
                    ),

                  if(amIAuthor && announcement.circle.myRole != CircleRole.OBSERVER)
                    _PinTile(
                        announcement,
                        onPinChanged: onPinChanged,
                        showShortcutButton: showPinShortcutButton
                    ),

                  if(amIAuthor && announcement.circle.myRole != CircleRole.OBSERVER)
                    ListTile(
                      leading: Icon(MdiIcons.trashCanOutline),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(communityRadius),
                      ),
                      title: Text('Usuń ogłoszenie', style: AppTextStyle()),
                      onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),
                      onLongPress: (){

                        Navigator.pop(context); // Hide bottom sheet

                        showAlertDialog(
                            context,
                            title: 'Ostrożnie...',
                            content: 'Czy na pewno chcesz usunąć to ogłoszenie?',
                            actionBuilder: (context) => [
                              AlertDialogButton(
                                  text: 'Nie',
                                  onTap: () => Navigator.pop(context)
                              ),
                              AlertDialogButton(
                                  text: 'Tak',
                                  onTap: (){
                                    Navigator.pop(context);

                                    showLoadingWidget(
                                      context,
                                      'Usuwanie...',
                                      color: CommunityCoverColors.strongColor(context, palette),
                                    );

                                    AnnouncementListProvider announcementListProv = AnnouncementListProvider.of(context);
                                    CommunityPublishableListProvider communityPublishableListProv = CommunityPublishableListProvider.of(context);

                                    ApiCircle.deleteAnnouncement(
                                        annKey: announcement.key,
                                        onSuccess: () async {
                                          announcement.circle.removeAnnouncement(announcement);
                                          CommunityPublishable.removeFromAll(announcement);
                                          announcementListProv.notify();
                                          communityPublishableListProv.notify();
                                          await popPage(context); // Close loading widget.
                                          onDeleted?.call(announcement);
                                        },
                                        onForceLoggedOut: (){
                                          popPage(context); // Close loading widget.
                                          return true;
                                        },
                                        onServerMaybeWakingUp: () {
                                          showServerWakingUpToast(context);
                                          popPage(context); // Close loading widget.
                                          return true;
                                        },
                                        onError: () async {
                                          showAppToast(context, text: simpleErrorMessage);
                                          await popPage(context); // Close loading widget.
                                        }
                                    );

                                  }
                              )
                            ]
                        );

                      },
                    ),
                ],
              ),
            )
        ):null,
        constrainImage: constrainImage
    );
  }

}

class EventInfoWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function(AnnouncementAttendanceResp, DateTime)? onAttendanceChanged;
  final void Function()? onAttendanceIndicatorTap;

  const EventInfoWidget(
      this.announcement,
      { this.palette,
        this.onAttendanceChanged,
        this.onAttendanceIndicatorTap,
        super.key
      });

  @override
  Widget build(BuildContext context) {

    bool hasStartTime = announcement.startTime != null;
    bool hasEndTime = announcement.endTime != null;
    bool hasPlace = announcement.place != null && announcement.place!.isNotEmpty;

    return Container(
      color: CommunityCoverColors.backgroundColor(context, palette).withOpacity(.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          if(hasPlace || hasStartTime)
            const SizedBox(height: Dimen.ICON_MARG),

          if(hasStartTime && hasEndTime)
            Row(
              children: [

                const SizedBox(width: Dimen.ICON_MARG),

                Icon(MdiIcons.calendarOutline),

                const SizedBox(width: Dimen.ICON_MARG),

                Text(
                  dateRangeToString(
                      announcement.startTime!,
                      announcement.endTime!,
                      shortMonth: true,
                      showYear: announcement.startTime!.year != DateTime.now().year,
                      withTime: true,
                      dateTimeSep: ' '
                  ),
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          else if(hasStartTime)
            Row(
              children: [

                const SizedBox(width: Dimen.ICON_MARG),

                Icon(MdiIcons.calendarOutline),

                const SizedBox(width: Dimen.ICON_MARG),

                Text(
                  dateToString(
                      announcement.startTime,
                      shortMonth: true,
                      showYear: announcement.startTime!.year != DateTime.now().year,
                      withTime: true,
                      dateTimeSep: ' '
                  ),
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),

          if(hasStartTime || hasEndTime)
            const SizedBox(height: Dimen.ICON_MARG),

          if(hasPlace)
            Row(
              children: [

                const SizedBox(width: Dimen.ICON_MARG),

                Icon(MdiIcons.mapMarkerOutline),

                const SizedBox(width: Dimen.ICON_MARG),

                Text(
                  announcement.place!,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_NORMAL,
                      color: textEnab_(context)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),

          Padding(
            padding: announcement.isAwaitingMyResponse?
            const EdgeInsets.symmetric(vertical: Dimen.defMarg):
            const EdgeInsets.only(top: 2*Dimen.defMarg, bottom: Dimen.defMarg),
            child: Row(
              children: [

                const SizedBox(width: Dimen.defMarg),

                AttendanceWidget(
                  announcement,
                  palette: palette,
                  onAttendanceChanged: onAttendanceChanged,
                ),

                Expanded(child: Container()),

                AttendanceIndicatorWidget(announcement, onTap: onAttendanceIndicatorTap),

              ],
            ),
          ),

          AwaitingAlertWidget(announcement, palette),

        ],
      ),
    );

  }

}

class AwaitingAlertWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;

  const AwaitingAlertWidget(this.announcement, this.palette, {super.key});

  @override
  Widget build(BuildContext context) {

    Duration timeSincePosted = AccountData.lastServerTime!.difference(announcement.publishTime);
    String timeDurStr;
    if(timeSincePosted.inMinutes < 60) {
      timeDurStr = '';
    } else if(timeSincePosted.inDays < 2) {
      timeDurStr = '${timeSincePosted.inHours}.';
      if(timeSincePosted.inHours == 0 || timeSincePosted.inHours >= 5) timeDurStr += ' godzin';
      else if(timeSincePosted.inHours == 1) timeDurStr += ' godzina';
      else if(timeSincePosted.inHours >= 2 && timeSincePosted.inHours <= 4) timeDurStr += ' godzina';
    } else {
      timeDurStr = '${timeSincePosted.inDays}.';
      if(timeSincePosted.inDays == 0 || timeSincePosted.inDays >= 2) timeDurStr += ' dzień';
      else if(timeSincePosted.inDays == 1) timeDurStr += ' dzień';
    }

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child:
      announcement.isAwaitingMyResponse?
      Padding(
        padding: const EdgeInsets.only(
            top: Dimen.ICON_MARG,
            bottom: Dimen.ICON_MARG
        ),
        child: AppText(
          timeDurStr.isEmpty?
          'Ogłoszenie czeka na <b>Twoją</b> reakcję':
          'Mija już <b>$timeDurStr</b> bez <b>Twojej</b> reakcji',
          color: CommunityCoverColors.strongColor(context, palette),
          textAlign: TextAlign.center,
          size: Dimen.TEXT_SIZE_BIG,
        ),
      ):
      Container(),
    );
  }

}

class AttendanceWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function(AnnouncementAttendanceResp, DateTime)? onAttendanceChanged;

  const AttendanceWidget(this.announcement, {this.palette, this.onAttendanceChanged, Key? key}) : super(key: key);

  Widget getQuasiButton(BuildContext context, {required IconData icon, required String text}) => Material(
      color: CommunityCoverColors.cardColor(context, palette),
      borderRadius: BorderRadius.circular(AppCard.defRadius),
      elevation: 3,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: Dimen.ICON_FOOTPRINT),
          const SizedBox(width: Dimen.ICON_MARG),
          Icon(icon),
          // AccountThumbnailWidget(name: AccountData.name, size: 30.0, elevated: false),
          const SizedBox(width: Dimen.ICON_MARG),
          Text(
            text,
            style: AppTextStyle(
                fontWeight: weight.halfBold,
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: iconEnab_(context)
            ),
          ),
          const SizedBox(width: Dimen.ICON_MARG),
          Icon(MdiIcons.chevronDown),
          const SizedBox(width: Dimen.ICON_MARG),
        ],
      )
  );

  @override
  Widget build(BuildContext context) {

    bool isEventCompleted = announcement.endTime != null && announcement.endTime!.isBefore(DateTime.now());

    if(announcement.respMode == AnnouncementAttendanceRespMode.NONE)
      return Container();

    if(announcement.startTime == null || (announcement.startTime != null && announcement.startTime!.isAfter(DateTime.now())))
      return Builder(builder: (context){

        AnnouncementAttendance? myResp = announcement.myAttendance?.response;

        return DropdownButtonHideUnderline(
            child: DropdownButton2(
              buttonStyleData: ButtonStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppCard.defRadius),
                ),
                width: 169,
                padding: EdgeInsets.zero,
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.zero,
              ),
              dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppCard.defRadius),
                    color: CommunityCoverColors.cardColor(context, palette),
                  ),
                  isOverButton: true
              ),
              customButton:
              myResp == null?
              getQuasiButton(
                  context,
                  icon: announcementAttendanceDropdownIcon[myResp]!,
                  text: announcementAttendanceDropdownText[myResp]!
              ):
              getQuasiButton(
                  context,
                  icon: announcementAttendanceRespToIcon(announcement.attendance[AccountData.key]!),
                  text: announcementAttendanceDropdownText[myResp]!
              ),
              items: [
                DropdownMenuItem<AnnouncementAttendance>(
                    value: AnnouncementAttendance.ATTENDING,
                    child: SimpleButton.from(
                        margin: EdgeInsets.zero,
                        radius: AppCard.defRadius,
                        context: context,
                        icon: announcementAttendanceDropdownIcon[AnnouncementAttendance.ATTENDING],
                        text: announcementAttendanceDropdownText[AnnouncementAttendance.ATTENDING],
                        onTap: null
                    )
                ),
                DropdownMenuItem<AnnouncementAttendance>(
                  value: AnnouncementAttendance.POSTPONE_RESP,
                  enabled: ((announcement.startTime?.day??0) - DateTime.now().day).abs() > 1,
                  child: SimpleButton.from(
                      margin: EdgeInsets.zero,
                      radius: AppCard.defRadius,

                      textColor:
                      ((announcement.startTime?.day??0) - DateTime.now().day).abs() > 1?
                      iconEnab_(context):
                      iconDisab_(context),

                      icon: announcementAttendanceDropdownIcon[AnnouncementAttendance.POSTPONE_RESP],
                      text: announcementAttendanceDropdownText[AnnouncementAttendance.POSTPONE_RESP],
                      onTap: null
                  ),
                ),
                DropdownMenuItem<AnnouncementAttendance>(
                    value: AnnouncementAttendance.NOT_ATTENDING,
                    child: SimpleButton.from(
                        margin: EdgeInsets.zero,
                        radius: AppCard.defRadius,

                        context: context,
                        icon: announcementAttendanceDropdownIcon[AnnouncementAttendance.NOT_ATTENDING],
                        text: announcementAttendanceDropdownText[AnnouncementAttendance.NOT_ATTENDING],
                        onTap: null
                    )
                ),
              ],
              value: announcement.myAttendance?.response,
              onChanged: (value){
                value = value as AnnouncementAttendance;

                switch(value){
                  case AnnouncementAttendance.ATTENDING:
                    openDialog(
                        context: context,
                        builder: (_) => AttendingDialog(
                          announcement,
                          palette,
                          getContext: () => context,
                          onSuccess: onAttendanceChanged,
                        )
                    );
                    break;
                  case AnnouncementAttendance.POSTPONE_RESP:
                    if(((announcement.startTime?.day??0) - DateTime.now().day).abs() > 1)
                      openDialog(
                          context: context,
                          builder: (_) => PostponeRespDialog(
                            announcement,
                            palette,
                            getContext: () => context,
                            onSuccess: onAttendanceChanged,
                          )
                      );
                    else
                      showAppToast(context, text: 'Dzień przed to za późno, by wciąż nie wiedzieć :)');
                    break;
                  case AnnouncementAttendance.NOT_ATTENDING:
                    openDialog(
                        context: context,
                        builder: (_) => NotAttendingDialog(
                          announcement,
                          palette,
                          getContext: () => context,
                          onSuccess: onAttendanceChanged,
                        )
                    );
                    break;
                }

              },
            )
        );

      });

    if(announcement.startTime != null && announcement.startTime!.isBefore(DateTime.now()) && announcement.endTime != null)
      return Padding(
        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
        child: Text(
          'Właśnie trwa...',
          style: AppTextStyle(
              color: hintEnab_(context),
              fontWeight: weight.halfBold,
              fontSize: Dimen.TEXT_SIZE_BIG
          ),
        ),
      );

    if(announcement.endTime == null || announcement.endTime != null && announcement.endTime!.isBefore(DateTime.now()))
      return Padding(
        padding: const EdgeInsets.only(left: Dimen.SIDE_MARG),
        child: Text(
          'Ale to już było...',
          style: AppTextStyle(
              color: hintEnab_(context),
              fontWeight: weight.halfBold,
              fontSize: Dimen.TEXT_SIZE_BIG
          ),
        ),
      );


    return Container();
  }

  static void defaultOnAttendanceChanged(BuildContext context, Announcement announcement, AnnouncementAttendanceResp resp, DateTime now){
    Circle circle = announcement.circle;

    bool hasResponse = announcement.respMode == AnnouncementAttendanceRespMode.OBLIGATORY;
    bool isOverdue = resp.response == AnnouncementAttendance.POSTPONE_RESP && resp.postponeTime!.isAfter(now);

    bool isNewAwaiting = !hasResponse || (hasResponse && isOverdue);
    if(announcement.isAwaitingMyResponse && !isNewAwaiting)
      circle.pinnedCount -= 1;
    else if(!announcement.isAwaitingMyResponse && isNewAwaiting)
      circle.pinnedCount += 1;

    circle.changeAwaitingAnnouncement(announcement, isNewAwaiting);

  }

}

class AttendingDialog extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final BuildContext Function() getContext;
  final void Function(AnnouncementAttendanceResp, DateTime)? onSuccess;
  final void Function()? onError;
  const AttendingDialog(this.announcement, this.palette, {required this.getContext, this.onSuccess, this.onError, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
          clipBehavior: Clip.hardEdge,
          color: CommunityCoverColors.backgroundColor(context, palette),
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              AppBar(
                title: const Text('Potwierdź obecność'),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Text(
                  'Czy potwierdzasz swoje uczestnicwto?',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                ),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              SimpleButton.from(
                  context: context,
                  text: 'Oczywiście!',
                  icon: MdiIcons.check,
                  margin: EdgeInsets.zero,
                  onTap: () async {

                    Navigator.pop(context);

                    showLoadingWidget(
                      getContext(),
                      'Chwileczkę...',
                      color: CommunityCoverColors.strongColor(context, palette),
                    );

                    await ApiCircle.updateAnnouncementAttendanceResponse(
                        annKey: announcement.key,
                        response: AnnouncementAttendance.ATTENDING,
                        onSuccess: (announcementAttendanceResp, now) async {
                          announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                          await popPage(getContext()); // Close loading widget.
                          onSuccess?.call(announcementAttendanceResp, now);
                        },
                        onServerMaybeWakingUp: () {
                          showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          showAppToast(getContext(), text: simpleErrorMessage);
                          await popPage(getContext()); // Close loading widget.
                          onError?.call();
                        }
                    );

                  }
              ),

            ],
          )
      ),
    ),
  );

}

class PostponeRespDialog extends StatefulWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final BuildContext Function() getContext;
  final void Function(AnnouncementAttendanceResp, DateTime)? onSuccess;
  final void Function()? onError;

  const PostponeRespDialog(this.announcement, this.palette, {required this.getContext, this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => PostponeRespDialogState();

}

class PostponeRespDialogState extends State<PostponeRespDialog>{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  BuildContext Function() get getContext => widget.getContext;
  void Function(AnnouncementAttendanceResp, DateTime)? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late DateTime? postponeDate;
  late TextEditingController controller;

  @override
  void initState() {
    postponeDate = announcement.myAttendance?.postponeTime;//null; //DateTime.now();
    controller = TextEditingController(text: announcement.myAttendance?.responseReason??'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
      )),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: CommunityCoverColors.backgroundColor(context, palette),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            AppBar(
              title: const Text('Jeszcze nie wiem'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),

            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: Text(
                'Daj znać, że jeszcze nie wiesz, czy weźmiesz udział i podaj termin, gdy podasz odpowiedź.',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            DatePicker(
              DateTime.now(),
              initialSelectedDate: postponeDate,
              selectionColor: CommunityCoverColors.strongColor(context, palette),
              selectedTextColor: background_(context),
              monthTextStyle: AppTextStyle(),
              dateTextStyle: AppTextStyle(),
              dayTextStyle: AppTextStyle(),
              locale: 'pl_PL',
              daysCount: announcement.startTime?.difference(DateTime.now()).abs().inDays??365,
              onDateChange: (date) => setState(() => postponeDate = date),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Opcjonalne wyjaśnienie:',
                  hintTop: 'Wyjaśnienie',
                  controller: controller,
                  maxLines: null,
                ),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            SimpleButton.from(
                context: context,
                icon: MdiIcons.clockOutline,
                text: 'Potwierdzam',
                textColor: postponeDate == null?
                iconDisab_(context):
                iconEnab_(context),

                margin: EdgeInsets.zero,

                onTap: postponeDate == null?null:() async {

                  popPage(context);

                  showLoadingWidget(
                      getContext(),
                      'Chwileczkę...',
                    color: CommunityCoverColors.strongColor(context, palette),
                  );

                  await ApiCircle.updateAnnouncementAttendanceResponse(
                      annKey: announcement.key,
                      response: AnnouncementAttendance.POSTPONE_RESP,
                      postponeResponseTime: postponeDate,
                      responseReason: controller.text,
                      onSuccess: (announcementAttendanceResp, now) async {
                        announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                        await popPage(getContext()); // Close loading widget.
                        onSuccess?.call(announcementAttendanceResp, now);
                      },
                      onServerMaybeWakingUp: () {
                        if(mounted) showServerWakingUpToast(context);
                        return true;
                      },
                      onError: () async {
                        if(mounted) showAppToast(getContext(), text: 'Coś nie tak...');
                        await popPage(getContext()); // Close loading widget.
                        onError?.call();
                      }
                  );

                }
            ),

          ],
        ),
      ),
    ),
  );

}

class NotAttendingDialog extends StatefulWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final BuildContext Function() getContext;
  final void Function(AnnouncementAttendanceResp, DateTime)? onSuccess;
  final void Function()? onError;

  const NotAttendingDialog(this.announcement, this.palette, {required this.getContext, this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => NotAttendingDialogState();

}

class NotAttendingDialogState extends State<NotAttendingDialog>{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  BuildContext Function() get getContext => widget.getContext;
  void Function(AnnouncementAttendanceResp, DateTime)? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: announcement.myAttendance?.responseReason??'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(
          MediaQuery.of(context).viewInsets
      ),
      child: Material(
          clipBehavior: Clip.hardEdge,
          color: CommunityCoverColors.backgroundColor(context, palette),
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              AppBar(
                title: const Text('Zgłoś nieobecność'),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Text(
                  'Zadeklaruj swoją niedyspozycyjność.'
                      '\n\nZ szacunku dla organizatora poinformuj go o przyczynie.',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                ),
              ),

              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  child: AppTextFieldHint(
                    hint: 'Powód:',
                    hintTop: 'Powód',
                    controller: controller,
                    onAnyChanged: (_) => setState((){}),
                    maxLines: null,
                  ),
                ),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              SimpleButton.from(
                  context: context,
                  text: 'Potwierdzam',
                  icon: MdiIcons.close,
                  textColor: controller.text.isEmpty?
                  iconDisab_(context):
                  iconEnab_(context),

                  margin: EdgeInsets.zero,

                  onTap: controller.text.isEmpty?null:() async {

                    popPage(context);

                    showLoadingWidget(
                        getContext(),
                        'Chwileczkę...',
                      color: CommunityCoverColors.strongColor(context, palette),
                    );

                    await ApiCircle.updateAnnouncementAttendanceResponse(
                        annKey: announcement.key,
                        response: AnnouncementAttendance.NOT_ATTENDING,
                        responseReason: controller.text,
                        onSuccess: (announcementAttendanceResp, now) async {
                          announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                          await popPage(getContext()); // Close loading widget.
                          onSuccess?.call(announcementAttendanceResp, now);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) showAppToast(getContext(), text: simpleErrorMessage);
                          await popPage(getContext()); // Close loading widget.
                          onError?.call();
                        }
                    );

                  }
              ),

            ],
          )
      ),
    ),
  );

}

class _PinTile extends StatefulWidget{

  final Announcement announcement;
  final void Function(bool)? onPinChanged;
  final bool showShortcutButton;

  const _PinTile(this.announcement, {this.onPinChanged, this.showShortcutButton = false});

  @override
  State<StatefulWidget> createState() => _PinTileState();

}

class _PinTileState extends State<_PinTile>{

  bool get showShortcutButton => widget.showShortcutButton;

  late bool _processing;

  Announcement get announcement => widget.announcement;
  void Function(bool)? get onPinChanged => widget.onPinChanged;

  @override
  void initState(){
    _processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(
        announcement.pinned?
        'Ogłoszenie przypięte':
        'Przypnij ogłoszenie',
        style: AppTextStyle(),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(communityRadius),
      ),
      leading: Icon(
        announcement.pinned?
        MdiIcons.pin:
        MdiIcons.pinOutline,
        color:
        _processing?
        iconDisab_(context):
        null,
      ),
      onTap: _processing?null:() async {

        setState(() => _processing = true);
        await ApiCircle.pinAnnouncement(
            annKey: announcement.key,
            pin: !announcement.pinned,
            onSuccess: (pinned) async {
              announcement.circle.changePinnedAnnouncement(announcement, pinned);

              announcement.pinned = pinned;
              onPinChanged?.call(pinned);

              if(!mounted) return;

              setState((){});

              if(pinned) showAppToast(
                  context,
                  text: 'Przypięto ogłoszenie',
                  buttonText: showShortcutButton?'Zobacz przypięte':null,
                  onButtonPressed: showShortcutButton?() async {

                    popPage(context); // Close bottom sheet
                    CatPageHomeState.openCirclePage(
                        context,
                        announcement.circle,
                        initTab: AnnouncementCategories.pinned
                    );

                  }: null
              );
              else showAppToast(context, text: 'Odpięto ogłoszenie');

              Provider.of<AnnouncementProvider>(context, listen: false).notify();

            },
            onServerMaybeWakingUp: () {
              if(mounted) showServerWakingUpToast(context);
              return true;
            },
            onError: () async {
              if(mounted) showAppToast(context, text: simpleErrorMessage);
            }
        );

        setState(() => _processing = false);

      }
  );


}

class AttendanceIndicatorWidget extends StatelessWidget{

  static const double height = 20;

  final Announcement announcement;
  final void Function()? onTap;

  const AttendanceIndicatorWidget(this.announcement, {this.onTap, super.key});

  @override
  Widget build(BuildContext context){

    int attendingCount = 0;
    int postponedCount = 0;
    int rejectedCount = 0;

    bool postponedOverdue = false;

    for(String userKey in announcement.attendance.keys){
      AnnouncementAttendanceResp resp = announcement.attendance[userKey]!;
      if(resp.response == AnnouncementAttendance.ATTENDING) attendingCount++;
      if(resp.response == AnnouncementAttendance.POSTPONE_RESP){
        postponedCount++;
        if(resp.postponeTime != null && resp.postponeTime!.isBefore(DateTime.now()))
          postponedOverdue = true;
      }
      if(resp.response == AnnouncementAttendance.NOT_ATTENDING) rejectedCount++;
    }

    return SimpleButton(
      radius: AppCard.defRadius,
      onTap: onTap,
      child: Row(
        children: [

          const SizedBox(height: Dimen.ICON_FOOTPRINT),
          const SizedBox(width: Dimen.ICON_MARG),

          Icon(
            announcementAttendanceRespToIcon(const AnnouncementAttendanceResp(AnnouncementAttendance.ATTENDING)),
            size: height,
            color: iconDisab_(context),
          ),
          Text(' $attendingCount', style: AppTextStyle(fontWeight: weight.halfBold, color: iconDisab_(context))),
          const SizedBox(width: Dimen.ICON_MARG + 2),
          Icon(
            announcementAttendanceRespToIcon(AnnouncementAttendanceResp(AnnouncementAttendance.POSTPONE_RESP, postponeTime: postponedOverdue?DateTime(0):null)),
            size: height,
            color: iconDisab_(context),
          ),
          Text(' $postponedCount', style: AppTextStyle(fontWeight: weight.halfBold, color: iconDisab_(context))),
          const SizedBox(width: Dimen.ICON_MARG),
          Icon(
            announcementAttendanceRespToIcon(const AnnouncementAttendanceResp(AnnouncementAttendance.NOT_ATTENDING)),
            size: height,
            color: iconDisab_(context),
          ),
          Text(' $rejectedCount', style: AppTextStyle(fontWeight: weight.halfBold, color: iconDisab_(context))),

          const SizedBox(width: Dimen.ICON_MARG),

        ],
      ),
    );

  }

}

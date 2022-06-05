import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp_mode.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'cover_image.dart';
import 'model/announcement_attendace.dart';
import 'model/announcement_attendance_resp.dart';

class AnnouncementWidgetTemplate extends StatelessWidget{

  final Announcement announcement;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final void Function()? onPinChanged;
  final void Function(AnnouncementAttendanceResp)? onAttendanceChanged;

  const AnnouncementWidgetTemplate(
      this.announcement,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.onPinChanged,
        this.onAttendanceChanged,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    color: CirclePage.cardColor(context, palette),
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
    elevation: AppCard.defElevation,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        if(announcement.coverImage != null)
          CoverImage(announcement.coverImage),

        Container(
            color: backgroundIcon_(context),
            child: Row(
              children: [

                const SizedBox(height: Dimen.ICON_FOOTPRINT),

                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: Dimen.ICON_MARG,
                          left: Dimen.SIDE_MARG,
                          bottom: Dimen.ICON_MARG
                      ),
                      child: PostingInfoWidget(announcement)
                  ),
                ),

                AttendanceWidget(
                  announcement,
                  palette: palette,
                  onAttendanceChanged: onAttendanceChanged,
                )

              ],
            )
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                announcement.title,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 12),

              if(announcement.startTime != null && announcement.endTime != null)
                Row(
                  children: [

                    Icon(MdiIcons.calendarOutline, size: 20, color: textEnab_(context)),

                    const SizedBox(width: 6.0),

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
              else if(announcement.startTime != null)
                Row(
                  children: [

                    Icon(MdiIcons.calendarOutline, size: 20, color: textEnab_(context)),

                    const SizedBox(width: 6.0),

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

              if(announcement.startTime != null || announcement.endTime != null)
                const SizedBox(height: 10),

              if(announcement.place != null)
                Row(
                  children: [

                    Icon(MdiIcons.mapMarkerOutline, size: 20, color: textEnab_(context)),

                    const SizedBox(width: 6.0),

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

              if(announcement.place != null)
                const SizedBox(height: 1.5*Dimen.SIDE_MARG),

              if(shrinkText)
                Text(
                  announcement.text,
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis
                )
              else
                SelectableText(
                  announcement.text,
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                )

            ],
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

            if(AccountData.key == announcement.author.key)
              _PinWidget(
                announcement,
                onPinChanged: onPinChanged,
              ),

            if(AccountData.key == announcement.author.key)
              IconButton(
                  icon: const Icon(MdiIcons.pencilOutline),
                  onPressed: onUpdateTap
              ),

            Expanded(child: Container()),

            if(onTap != null)
              IconButton(
                  icon: const Icon(MdiIcons.dotsHorizontal),
                  onPressed: onTap
              ),

            const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

          ],
        ),

        const SizedBox(height: Dimen.SIDE_MARG - Dimen.ICON_MARG),

      ],
    ),
  );

}

class PostingInfoWidget extends StatelessWidget{

  final Announcement announcement;
  const PostingInfoWidget(this.announcement, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(announcement.author.name, style: AppTextStyle()),
      Text(
        dateToString(announcement.postTime),
        style: AppTextStyle(color: hintEnab_(context)),
      ),

    ],
  );

}

class AttendanceWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function(AnnouncementAttendanceResp)? onAttendanceChanged;

  const AttendanceWidget(this.announcement, {this.palette, this.onAttendanceChanged, Key? key}) : super(key: key);

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
              customButton:
              myResp == null?
              SimpleButton.from(
                margin: EdgeInsets.zero,
                context: context,
                icon: announcementAttendanceDropdownIcon[myResp],
                text: announcementAttendanceDropdownText[myResp],
                onTap: null
              ):
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: Dimen.ICON_FOOTPRINT),
                  const SizedBox(width: Dimen.ICON_MARG),
                  Icon(announcementAttendanceRespToIcon(announcement.attendance[AccountData.key]!)),
                  // AccountThumbnailWidget(name: AccountData.name, size: 30.0, elevated: false),
                  const SizedBox(width: Dimen.ICON_MARG),
                  Text(
                    announcementAttendanceDropdownText[myResp]!,
                    style: AppTextStyle(
                      fontWeight: weight.halfBold,
                      color: iconEnab_(context)
                    ),
                  ),
                  const SizedBox(width: Dimen.ICON_MARG),
                  const Icon(MdiIcons.chevronDown),
                  const SizedBox(width: Dimen.ICON_MARG),
                ],
              ),
              dropdownWidth: 141,
              dropdownPadding: EdgeInsets.zero,
              itemPadding: EdgeInsets.zero,
              items: [
                DropdownMenuItem<AnnouncementAttendance>(
                    value: AnnouncementAttendance.ATTENDING,
                    child: SimpleButton.from(
                        margin: EdgeInsets.zero,
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
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              ),
            )
        );

      });

    if(announcement.startTime != null && announcement.startTime!.isBefore(DateTime.now()) && announcement.endTime != null)
      return Padding(
        padding: const EdgeInsets.only(right: Dimen.SIDE_MARG),
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
        padding: const EdgeInsets.only(right: Dimen.SIDE_MARG),
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

}

class AttendingDialog extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final BuildContext Function() getContext;
  final void Function(AnnouncementAttendanceResp)? onSuccess;
  final void Function()? onError;
  const AttendingDialog(this.announcement, this.palette, {required this.getContext, this.onSuccess, this.onError, super.key});
  
  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: CirclePage.backgroundColor(context, palette),
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
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
                      CirclePage.strongColor(context, palette),
                      'Chwileczkę...'
                  );

                  await ApiCircle.updateAnnouncementAttendanceResponse(
                      annKey: announcement.key,
                      response: AnnouncementAttendance.ATTENDING,
                      onSuccess: (announcementAttendanceResp) async {
                        announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                        await popPage(getContext()); // Close loading widget.
                        onSuccess?.call(announcementAttendanceResp);
                      },
                      onError: () async {
                        showAppToast(getContext(), text: 'Coś nie tak...');
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
  final void Function(AnnouncementAttendanceResp)? onSuccess;
  final void Function()? onError;

  const PostponeRespDialog(this.announcement, this.palette, {required this.getContext, this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => PostponeRespDialogState();

}

class PostponeRespDialogState extends State<PostponeRespDialog>{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  BuildContext Function() get getContext => widget.getContext;
  void Function(AnnouncementAttendanceResp)? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late DateTime? postponeDate;
  late TextEditingController controller;

  @override
  void initState() {
    postponeDate = announcement.myAttendance?.postponeTime;//null; //DateTime.now();
    controller = TextEditingController();
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
        color: CirclePage.backgroundColor(context, palette),
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
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
              selectionColor: CirclePage.strongColor(context, palette),
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
                  hint: 'Opcjonalny komentarz:',
                  hintTop: 'Komentarz',
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
                      CirclePage.strongColor(context, palette),
                      'Chwileczkę...'
                  );

                  await ApiCircle.updateAnnouncementAttendanceResponse(
                      annKey: announcement.key,
                      response: AnnouncementAttendance.POSTPONE_RESP,
                      postponeResponseTime: postponeDate,
                      rejectionReason: controller.text,
                      onSuccess: (announcementAttendanceResp) async {
                        announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                        await popPage(getContext()); // Close loading widget.
                        onSuccess?.call(announcementAttendanceResp);
                      },
                      onError: () async {
                        showAppToast(getContext(), text: 'Coś nie tak...');
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
  final void Function(AnnouncementAttendanceResp)? onSuccess;
  final void Function()? onError;

  const NotAttendingDialog(this.announcement, this.palette, {required this.getContext, this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => NotAttendingDialogState();

}

class NotAttendingDialogState extends State<NotAttendingDialog>{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  BuildContext Function() get getContext => widget.getContext;
  void Function(AnnouncementAttendanceResp)? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: announcement.myAttendance?.rejectionReason??'');
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
          color: CirclePage.backgroundColor(context, palette),
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
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
                        CirclePage.strongColor(context, palette),
                        'Chwileczkę...'
                    );

                    await ApiCircle.updateAnnouncementAttendanceResponse(
                        annKey: announcement.key,
                        response: AnnouncementAttendance.NOT_ATTENDING,
                        rejectionReason: controller.text,
                        onSuccess: (announcementAttendanceResp) async {
                          announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                          await popPage(getContext()); // Close loading widget.
                          onSuccess?.call(announcementAttendanceResp);
                        },
                        onError: () async {
                          showAppToast(getContext(), text: 'Coś nie tak...');
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

class _PinWidget extends StatefulWidget{

  final Announcement announcement;
  final void Function()? onPinChanged;

  const _PinWidget(this.announcement, {this.onPinChanged});

  @override
  State<StatefulWidget> createState() => _PinWidgetState();

}

class _PinWidgetState extends State<_PinWidget>{

  late bool _processing;

  Announcement get announcement => widget.announcement;
  void Function()? get onPinChanged => widget.onPinChanged;

  @override
  void initState(){
    _processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => IconButton(
      icon: Icon(
        announcement.pinned?
        MdiIcons.pin:
        MdiIcons.pinOutline,
        color:
        _processing?
        iconDisab_(context):
        iconEnab_(context),
      ),
      onPressed: _processing?null:() async {

        setState(() => _processing = true);
        await ApiCircle.pinAnnouncement(
            annKey: announcement.key,
            pin: !announcement.pinned,
            onSuccess: (pinned) async {
              setState(() => announcement.pinned = pinned);

              if(pinned) showAppToast(context, text: 'Przypięto ogłoszenie');
              else showAppToast(context, text: 'Odpięto ogłoszenie');

              Provider.of<AnnouncementProvider>(context, listen: false).notify();
              onPinChanged?.call();
            },
            onError: () async {
              showAppToast(context, text: 'Coś poszło nie tak');
            }
        );

        setState(() => _processing = false);

      }
  );


}
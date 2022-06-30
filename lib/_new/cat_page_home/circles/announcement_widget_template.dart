import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart' hide Size;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp_mode.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
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

  static const double radius = 8.0;
  static const double elevation = 0;
  static const int shrinkedTextMaxLines = 5;
  static TextStyle textStyle = AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL);

  final Announcement announcement;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final void Function(bool)? onPinChanged;
  final void Function(AnnouncementAttendanceResp, DateTime now)? onAttendanceChanged;
  final void Function()? onAttendanceIndicatorTap;
  final bool showCircleButton;
  final void Function()? onCircleButtonTap;

  const AnnouncementWidgetTemplate(
      this.announcement,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.onPinChanged,
        this.onAttendanceChanged,
        this.onAttendanceIndicatorTap,
        this.showCircleButton = false,
        this.onCircleButtonTap,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context){

    bool showPin = AccountData.key == announcement.author.key && onPinChanged != null;
    bool showEdit = AccountData.key == announcement.author.key && onUpdateTap != null;

    bool hasTitle = announcement.title.isNotEmpty;
    bool hasStartTime = announcement.startTime != null;
    bool hasEndTime = announcement.endTime != null;
    bool hasPlace = announcement.place != null && announcement.place!.isNotEmpty;

    Duration timeSincePosted = AccountData.lastServerTime!.difference(announcement.postTime);
    String timeDurStr;
    if(timeSincePosted.inMinutes < 60) {
      timeDurStr = '';
    } else if(timeSincePosted.inDays < 2) {
      timeDurStr = '${timeSincePosted.inHours}';
      if(timeSincePosted.inHours == 0 || timeSincePosted.inHours >= 5) timeDurStr += ' godzin';
      else if(timeSincePosted.inHours == 1) timeDurStr += ' godzinę';
      else if(timeSincePosted.inHours >= 2 && timeSincePosted.inHours <= 4) timeDurStr += ' godziny';
    } else {
      timeDurStr = '${timeSincePosted.inDays}';
      if(timeSincePosted.inDays == 0 || timeSincePosted.inDays >= 2) timeDurStr += ' dni';
      else if(timeSincePosted.inDays == 1) timeDurStr += ' dzień';
    }

    Size? textSize;
    if(shrinkText) {
      TextPainter textPainter = TextPainter(
          text: TextSpan(text: announcement.text, style: textStyle),
          textDirection: TextDirection.ltr
      )..layout(minWidth: 0, maxWidth: double.infinity);
      textSize = textPainter.size;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        if(showCircleButton)
          Stack(
            clipBehavior: Clip.none,
            children: [

              Positioned.fill(child: Material(
                color: CirclePage.cardColor(context, palette),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AnnouncementWidgetTemplate.radius),
                    topRight: Radius.circular(AnnouncementWidgetTemplate.radius)
                ),
              )),
              
              SimpleButton(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AnnouncementWidgetTemplate.radius),
                      topRight: Radius.circular(AnnouncementWidgetTemplate.radius)
                  ),
                  color: backgroundIcon_(context),
                  onTap: onCircleButtonTap,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(MdiIcons.googleCircles, size: 20),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text(announcement.circle!.name, style: AppTextStyle(fontWeight: weight.halfBold, color: iconEnab_(context)))
                      ],
                    ),
                  )
              )
              
            ],
          ),

        SimpleButton(
          onTap: onTap,
          color: CirclePage.cardColor(context, palette),
          clipBehavior: Clip.antiAlias,
          borderRadius: showCircleButton?
          const BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius)
          ):
          BorderRadius.circular(radius),
          elevation: elevation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              if(announcement.coverImage != null)
                CoverImage(announcement.coverImage!),

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


              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child:
                announcement.isAwaitingMyResponse?
                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.DEF_MARG,
                    left: Dimen.DEF_MARG,
                    right: Dimen.DEF_MARG,
                  ),
                  child: GradientWidget(
                    colorStart: Colors.red,
                    colorEnd: Colors.amber,
                    radius: radius,
                    child: Padding(
                        padding: const EdgeInsets.all(Dimen.DEF_MARG/2),
                        child: Container(
                          decoration: BoxDecoration(
                              color: CirclePage.backgroundColor(context, palette),
                              borderRadius: BorderRadius.circular(radius - 3)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(Dimen.DEF_MARG),
                            child: Row(
                              children: [

                                const SizedBox(width: Dimen.ICON_MARG),

                                Icon(MdiIcons.alertCircleOutline, color: textEnab_(context)),

                                const SizedBox(width: Dimen.ICON_MARG),

                                Expanded(
                                  child: AppText(
                                    timeDurStr.isEmpty?
                                    'Ogłoszenie czeka na reakcję':
                                    'Ogłoszenie czeka już <b>$timeDurStr</b> na reakcję',
                                    color: textEnab_(context),
                                  ),
                                ),

                                Icon(MdiIcons.arrowUp, color: textEnab_(context)),

                                const SizedBox(width: Dimen.ICON_MARG),

                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                ):
                Container(),
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    if(hasTitle)
                      Text(
                        announcement.title,
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    if(hasTitle)
                      const SizedBox(height: 12),

                    if(hasStartTime && hasEndTime)
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
                    else if(hasStartTime)
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

                    if(hasStartTime || hasEndTime)
                      const SizedBox(height: 10),

                    if(hasPlace)
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

                    if(hasPlace)
                      const SizedBox(height: 1.5*Dimen.SIDE_MARG),

                    if(shrinkText)
                      Text(
                          announcement.text,
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
                          maxLines: shrinkedTextMaxLines,
                          overflow: TextOverflow.ellipsis
                      )
                    else
                      SelectableText(
                        announcement.text,
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
                      ),

                    if(shrinkText && textSize!.height > shrinkedTextMaxLines*(textStyle.fontSize! * (textStyle.height??1).toDouble()))
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2*Dimen.DEF_MARG),
                          child: Text('...czytaj dalej', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_NORMAL)),
                        ),
                      )

                  ],
                ),
              ),

              if(showPin || showEdit || announcement.isEvent)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    const SizedBox(height: Dimen.ICON_FOOTPRINT),

                    const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                    if(showPin)
                      _PinWidget(
                        announcement,
                        onPinChanged: onPinChanged,
                      ),

                    if(showEdit)
                      IconButton(
                          icon: const Icon(MdiIcons.pencilOutline),
                          onPressed: onUpdateTap
                      ),

                    Expanded(child: Container()),

                    if(announcement.isEvent)
                      AttendaceIndicatorWidget(announcement, onTap: onAttendanceIndicatorTap),

                    const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                  ],
                ),

              if(showPin || showEdit || announcement.isEvent)
                const SizedBox(height: Dimen.SIDE_MARG - Dimen.ICON_MARG),

              if(announcement.urlToPreview != null)
                LinkPreviewer(announcement.urlToPreview!, palette),

            ],
          ),
        )

      ],
    );

  }

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
        dateToString(announcement.postTime, shortMonth: true, withTime: true),
        style: AppTextStyle(color: hintEnab_(context)),
      ),

    ],
  );

}

class AttendanceWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function(AnnouncementAttendanceResp, DateTime)? onAttendanceChanged;

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
  final void Function(AnnouncementAttendanceResp, DateTime)? onSuccess;
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
                      onSuccess: (announcementAttendanceResp, now) async {
                        announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                        await popPage(getContext()); // Close loading widget.
                        onSuccess?.call(announcementAttendanceResp, now);
                      },
                      onServerMaybeWakingUp: () {
                        showAppToast(context, text: serverWakingUpMessage);
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
                      CirclePage.strongColor(context, palette),
                      'Chwileczkę...'
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
                        if(mounted) showAppToast(context, text: serverWakingUpMessage);
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
                        responseReason: controller.text,
                        onSuccess: (announcementAttendanceResp, now) async {
                          announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                          await popPage(getContext()); // Close loading widget.
                          onSuccess?.call(announcementAttendanceResp, now);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showAppToast(context, text: serverWakingUpMessage);
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

class _PinWidget extends StatefulWidget{

  final Announcement announcement;
  final void Function(bool)? onPinChanged;

  const _PinWidget(this.announcement, {this.onPinChanged});

  @override
  State<StatefulWidget> createState() => _PinWidgetState();

}

class _PinWidgetState extends State<_PinWidget>{

  late bool _processing;

  Announcement get announcement => widget.announcement;
  void Function(bool)? get onPinChanged => widget.onPinChanged;

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
              onPinChanged?.call(pinned);
            },
            onServerMaybeWakingUp: () {
              if(mounted) showAppToast(context, text: serverWakingUpMessage);
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

class AttendaceIndicatorWidget extends StatelessWidget{

  static const double height = 20;

  final Announcement announcement;
  final void Function()? onTap;

  const AttendaceIndicatorWidget(this.announcement, {this.onTap, super.key});

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
      radius: AppCard.BIG_RADIUS,
      onTap: onTap,
      child: Row(
        children: [

          const SizedBox(height: Dimen.ICON_FOOTPRINT),
          const SizedBox(width: Dimen.ICON_MARG),

          Icon(
            announcementAttendanceRespToIcon(const AnnouncementAttendanceResp(AnnouncementAttendance.ATTENDING)),
            size: height,
            color: hintEnab_(context),
          ),
          Text(' $attendingCount', style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context))),
          const SizedBox(width: Dimen.ICON_MARG),
          Icon(
            announcementAttendanceRespToIcon(AnnouncementAttendanceResp(AnnouncementAttendance.POSTPONE_RESP, postponeTime: postponedOverdue?DateTime(0):null)),
            size: height,
            color: hintEnab_(context),
          ),
          Text(' $postponedCount', style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context))),
          const SizedBox(width: Dimen.ICON_MARG),
          Icon(
            announcementAttendanceRespToIcon(const AnnouncementAttendanceResp(AnnouncementAttendance.NOT_ATTENDING)),
            size: height,
            color: hintEnab_(context),
          ),
          Text(' $rejectedCount', style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context))),

          const SizedBox(width: Dimen.ICON_MARG),

        ],
      ),
    );

  }

}

class LinkPreviewer extends StatefulWidget{

  final String urlToPreview;
  final PaletteGenerator? palette;
  const LinkPreviewer(this.urlToPreview, this.palette, {super.key});

  @override
  State<StatefulWidget> createState() => LinkPreviewerState();

}

class LinkPreviewerState extends State<LinkPreviewer>{

  String get urlToPreview => widget.urlToPreview;
  PaletteGenerator? get palette => widget.palette;

  dynamic data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SimpleButton(
    margin: const EdgeInsets.only(
        left: Dimen.DEF_MARG,
        right: Dimen.DEF_MARG,
        bottom: Dimen.DEF_MARG
    ),
    elevation: 3,
    color: CirclePage.backgroundColor(context, palette),
    clipBehavior: Clip.hardEdge,
    borderRadius: BorderRadius.circular(AnnouncementWidgetTemplate.radius),
    onTap: () => launchURL(urlToPreview),
    onLongPress: (){
      Clipboard.setData(ClipboardData(text: urlToPreview));
      showAppToast(context, text: 'Link skopiowany');
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinkPreview(
          enableAnimation: true,
          onPreviewDataFetched: (data) {
            setState(() => this.data = data);
          },
          previewData: data,
          text: urlToPreview,
          textWidget: Text(urlToPreview, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyle()),
          width: MediaQuery.of(context).size.width,
          openOnPreviewTitleTap: true,
          openOnPreviewImageTap: true,
        ),

        if(data == null)
          Padding(
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            child: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: CirclePage.strongColor(context, palette)),
          )
      ],
    ),
  );

}
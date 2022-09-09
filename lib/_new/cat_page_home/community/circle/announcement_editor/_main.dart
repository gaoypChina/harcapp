import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:optional/optional.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../community_publishable_widget_template.dart';
import '../announcement_widget_template.dart';
import '../../common/cover_image_selectable_widget.dart';
import '../model/announcement.dart';
import '../model/announcement_attendance_resp_mode.dart';
import '../model/circle.dart';

class AnnouncementEditorPage extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final bool isEvent;
  final Announcement? initAnnouncement;

  final void Function(Announcement)? onSaved;
  final void Function()? onRemoved;
  final void Function()? onError;

  const AnnouncementEditorPage(
      { required this.circle,
        required this.palette,
        required this.isEvent,
        this.initAnnouncement,
        this.onSaved,
        this.onRemoved,
        this.onError,
        Key? key
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnnouncementEditorPageState();


}

class AnnouncementEditorPageState extends State<AnnouncementEditorPage>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;
  bool get isEvent => widget.isEvent;
  Announcement? get initAnnouncement => widget.initAnnouncement;

  void Function(Announcement)? get onSaved => widget.onSaved;
  void Function()? get onRemoved => widget.onRemoved;
  void Function()? get onError => widget.onError;

  CommunityCoverImageData? coverImage;

  late TextEditingController titleController;
  late TextEditingController textController;
  late TextEditingController urlToPreviewController;
  late TextEditingController placeController;
  bool get placeEnabled => placeController.text.isNotEmpty;

  DateTime? startTime;
  DateTime? endTime;

  dynamic previewData;

  late AnnouncementAttendanceRespMode attRespMode;

  dynamic heroTag;

  @override
  void initState() {
    coverImage = initAnnouncement?.coverImage;
    titleController = TextEditingController(text: initAnnouncement?.title??'');
    textController = TextEditingController(text: initAnnouncement?.text??'');
    urlToPreviewController = TextEditingController(text: initAnnouncement?.urlToPreview??'');
    placeController = TextEditingController(text: initAnnouncement?.place??'');

    startTime = initAnnouncement?.startTime;
    endTime = initAnnouncement?.endTime;

    attRespMode = initAnnouncement?.respMode??AnnouncementAttendanceRespMode.NONE;

    heroTag = initAnnouncement??UniqueKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CommunityCoverColors.cardColor(context, palette),
    appBottomNavColor: CommunityCoverColors.cardColor(context, palette),
    body: CustomScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(
            initAnnouncement==null?'Dodaj ogłoszenie':'Edytuj ogłoszenie',
            style: AppTextStyle(),
          ),
          backgroundColor: CommunityCoverColors.cardColor(context, palette),
          centerTitle: true,
          floating: true,
          actions: [
            IconButton(
              icon: const Icon(MdiIcons.eyeOutline),
              onPressed: (){

                Announcement announcement = Announcement(
                  key: '',
                  title: titleController.text,
                  publishTime: DateTime.now(),
                  lastUpdateTime: DateTime.now(),
                  startTime: startTime,
                  endTime: endTime,
                  place: placeController.text,
                  urlToPreview: urlToPreviewController.text,
                  author: UserData(
                    key: AccountData.key!,
                    name: AccountData.name!,
                    shadow: false,
                    sex: AccountData.sex!,
                  ),
                  coverImage: coverImage,
                  text: textController.text,
                  pinned: false,
                  circle: circle,
                  respMode: attRespMode,
                  attendance: {},
                  waivedAttRespMembers: [],
                );

                openDialog(
                  context: context,
                  builder: (context) => IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Expanded(child: Center(
                              child: SingleChildScrollView(
                                child: Hero(
                                  tag: heroTag,
                                  child: AnnouncementWidgetTemplate(
                                    announcement,
                                    palette: palette,
                                  ),
                                ),
                              ),
                            )),

                            const SizedBox(height: Dimen.SIDE_MARG),

                            SimpleButton.from(
                              elevation: AppCard.bigElevation,
                              margin: EdgeInsets.zero,
                              textColor: iconEnab_(context),
                              color: CommunityCoverColors.cardColor(context, palette),
                              icon: MdiIcons.arrowLeft,
                              text: 'Wróć',
                              onTap: () => Navigator.pop(context),
                            ),

                          ]
                      )
                    )
                  )
                );

              }
            )
          ],
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            Material(
              borderRadius: BorderRadius.circular(AppCard.defRadius),
              color: CommunityCoverColors.backgroundColor(context, palette),
              child: Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                child: Text(
                  'To ${isEvent?'wydarzenie':'ogłoszenie'} zobaczą tylko członkowie kręgu ${circle.name}',
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    color: CommunityCoverColors.strongColor(context, palette),
                    fontWeight: weight.halfBold
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            AppTextFieldHint(
              hint: 'Tytuł:',
              hintTop: 'Tytuł',
              controller: titleController,
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences
            ),

            const SizedBox(height: 10),

            AppTextFieldHint(
              hint: 'Treść:',
              hintTop: '',
              controller: textController,
              style: CommunityPublishableWidgetTemplate.textStyle,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences
            ),

          ])),
        ),

        if(isEvent)
          SliverList(delegate: SliverChildListDelegate([

            Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG - Dimen.ICON_MARG),
                    child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          dropdownPadding: EdgeInsets.zero,
                          itemPadding: EdgeInsets.zero,
                          icon: const SizedBox(
                            width: Dimen.ICON_FOOTPRINT,
                            child: Icon(MdiIcons.chevronDown),
                          ),
                          items: [
                            DropdownMenuItem<AnnouncementAttendanceRespMode>(
                                value: AnnouncementAttendanceRespMode.NONE,
                                child: SimpleButton.from(
                                    margin: EdgeInsets.zero,
                                    context: context,
                                    icon: MdiIcons.accountCancelOutline,
                                    text: 'Brak deklaracji obecności',
                                    fontWeight: weight.normal,
                                    onTap: null
                                )
                            ),
                            DropdownMenuItem<AnnouncementAttendanceRespMode>(
                                value: AnnouncementAttendanceRespMode.OPTIONAL,
                                child: SimpleButton.from(
                                    margin: EdgeInsets.zero,
                                    context: context,
                                    icon: MdiIcons.accountQuestionOutline,
                                    text: 'Dobrowolna deklaracja obecności',
                                    fontWeight: weight.normal,
                                    onTap: null
                                )
                            ),
                            DropdownMenuItem<AnnouncementAttendanceRespMode>(
                                value: AnnouncementAttendanceRespMode.OBLIGATORY,
                                child: SimpleButton.from(
                                    margin: EdgeInsets.zero,
                                    context: context,
                                    icon: MdiIcons.accountAlertOutline,
                                    text: 'Wymagana deklaracja obecności',
                                    fontWeight: weight.normal,
                                    onTap: null
                                )
                            ),
                          ],
                          value: attRespMode,
                          onChanged: (value) => setState(() => attRespMode = value as AnnouncementAttendanceRespMode),
                          dropdownDecoration: BoxDecoration(
                            color: CommunityCoverColors.backgroundColor(context, palette),
                            borderRadius: BorderRadius.circular(communityRadius),
                          ),
                        )
                    ),
                  ),

                  Row(
                    children: [

                      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                      SimpleButton.from(
                          margin: EdgeInsets.zero,

                          iconColor: iconEnab_(context),

                          textColor:
                          startTime==null?
                          hintEnab_(context):
                          iconEnab_(context),

                          icon: MdiIcons.calendarBlankOutline,
                          text: startTime==null?
                          'Czas rozpoczęcia:':
                          'Początek: ${dateToString(startTime, shortMonth: true, withTime: true)}',
                          fontWeight: weight.normal,
                          onTap: startTime == null?null:() => showScrollBottomSheet(
                              context: context,
                              builder: (context) => BottomSheetDateTimePicker(
                                startTime,
                                backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                                start: true,
                                onSelected: (dateTime) => setState(() => startTime = dateTime),
                              )
                          )
                      ),
                      Expanded(child: Container()),
                      if(startTime != null)
                        IconButton(
                          icon: const Icon(MdiIcons.close),
                          onPressed: () => setState(() => startTime = null),
                        )
                      else
                        IconButton(
                            icon: const Icon(MdiIcons.plus),
                            onPressed: (){
                              DateTime now = DateTime.now();
                              setState(() => startTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day + 7,
                                  now.hour,
                                  0,
                                  0
                              ));
                            }
                        ),

                      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                    ],
                  ),

                  Row(
                    children: [

                      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                      SimpleButton.from(
                          margin: EdgeInsets.zero,

                          iconColor: iconEnab_(context),

                          textColor:
                          startTime != null && endTime != null && endTime!.isBefore(startTime!)?
                          Colors.red:

                          startTime==null?
                          hintEnab_(context):
                          iconEnab_(context),

                          icon: MdiIcons.calendarCheckOutline,
                          text: endTime==null?
                          'Czas zakończenia:':
                          'Zakończ.:  ${dateToString(endTime, shortMonth: true, withTime: true)}',
                          fontWeight: weight.normal,
                          onTap: endTime == null?null:() => showScrollBottomSheet(
                              context: context,
                              builder: (context) => BottomSheetDateTimePicker(
                                endTime,
                                backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                                start: false,
                                onSelected: (dateTime) => setState(() => endTime = dateTime),
                              )
                          )
                      ),

                      Expanded(child: Container()),

                      if(endTime != null)
                        IconButton(
                          icon: const Icon(MdiIcons.close),
                          onPressed: () => setState(() => endTime = null),
                        )
                      else
                        IconButton(
                            icon: Icon(
                              MdiIcons.plus,
                              color: startTime == null?iconDisab_(context):iconEnab_(context),
                            ),
                            onPressed: startTime == null?null: (){
                              DateTime now = DateTime.now();
                              setState(() => endTime = DateTime(
                                  now.year,
                                  now.month,
                                  now.day + 7,
                                  now.hour + 3,
                                  0,
                                  0
                              ));
                            }
                        ),

                      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                    ],
                  ),

                  Row(
                    children: [

                      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                      Expanded(
                        child: AppTextFieldHint(
                          hint: 'Miejsce:',
                          hintTop: '',
                          controller: placeController,
                          style: AppTextStyle(color: iconEnab_(context)),
                          textCapitalization: TextCapitalization.sentences,
                          leading: const Padding(
                            padding: EdgeInsets.only(
                              left: Dimen.ICON_MARG,
                              right: Dimen.ICON_MARG,
                            ),
                            child: Icon(MdiIcons.mapMarkerOutline),
                          ),
                        ),
                      ),

                      if(placeEnabled)
                        IconButton(
                          icon: const Icon(MdiIcons.close),
                          onPressed: () => placeController.text = '',
                        )

                    ],
                  ),

                ]
            )

          ])),

        if(!isEvent)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              if(coverImage == null)
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius),
                        color: backgroundIcon_(context)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [

                        const SizedBox(width: Dimen.SIDE_MARG),

                        Expanded(
                          child: AppTextFieldHint(
                              hint: 'Link z podglądem:',
                              hintTop: '',
                              controller: urlToPreviewController,
                              onAnyChanged: (_){
                                previewData = null;
                                setState(() {});
                              },
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                              hintStyle: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  fontWeight: weight.halfBold,
                                  color: hintEnab_(context)
                              ),
                              maxLines: 1,
                              textCapitalization: TextCapitalization.sentences
                          ),
                        ),

                        if(urlToPreviewController.text.isNotEmpty)
                          IconButton(
                            icon: const Icon(MdiIcons.close),
                            onPressed: (){
                              previewData = null;
                              setState(() => urlToPreviewController.clear());
                            },
                          )

                      ],
                    )
                ),

              if(coverImage == null && urlToPreviewController.text.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: Dimen.SIDE_MARG),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius),
                    color: CommunityCoverColors.cardColor(context, palette),
                    clipBehavior: Clip.hardEdge,
                    child: LinkPreview(
                      enableAnimation: true,
                      onPreviewDataFetched: (data) {
                        setState(() => previewData = data);
                      },
                      previewData: previewData,
                      text: urlToPreviewController.text,
                      width: MediaQuery.of(context).size.width,

                      openOnPreviewTitleTap: true,
                      openOnPreviewImageTap: true,
                      //key: ValueKey(urlToPreviewController.text),
                    ),
                  ),
                ),

              const SizedBox(height: Dimen.SIDE_MARG),

              if(urlToPreviewController.text.isEmpty)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child:
                  CoverImageSelectableWidget(
                    palette,
                    initCoverImage: coverImage,
                    showAdaptiveImages: false,
                    separateAdaptiveImages: true,
                    removable: true,
                    onSelected: (newCoverImage) => setState(() => coverImage = newCoverImage),
                    emptyBuilder: (context) => SizedBox(
                      height: Dimen.ICON_FOOTPRINT,
                      child: Container(
                        color: backgroundIcon_(context),
                        child: Row(
                          children: [

                            const SizedBox(width: Dimen.SIDE_MARG),

                            Expanded(
                              child: Text(
                                'Dodaj grafikę',
                                style: AppTextStyle(
                                    color: hintEnab_(context),
                                    fontWeight: weight.halfBold,
                                    fontSize: Dimen.TEXT_SIZE_BIG
                                ),
                              ),
                            ),

                            Icon(MdiIcons.imagePlus, color: hintEnab_(context)),

                            const SizedBox(width: Dimen.SIDE_MARG),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

            ])),
          ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            SimpleButton.from(
                elevation: AppCard.bigElevation,
                margin: EdgeInsets.zero,
                radius: AppCard.defRadius,
                textColor: CommunityCoverColors.backgroundColor(context, palette),
                color: CommunityCoverColors.strongColor(context, palette),
                icon: MdiIcons.earthArrowRight,
                text: initAnnouncement==null?'Dodaj ogłoszenie':'Edytuj ogłoszenie',
                onTap: () => showAppToast(
                    context,
                    text: 'Przytrzymaj, aby opublikować'
                ),
                onLongPress: () async {

                  if(textController.text.isEmpty){
                    showAppToast(context, text: 'Podaj treść ogłoszenia');
                    return;
                  }

                  if(startTime != null && endTime != null && startTime!.isAfter(endTime!)){
                    showAppToast(context, text: 'Początek wydarzenia musi być wcześniej niż koniec');
                    return;
                  }

                  showLoadingWidget(
                      context, CommunityCoverColors.strongColor(context, palette),
                      initAnnouncement == null?'Publikowanie...':'Uaktualnianie...'
                  );

                  if(initAnnouncement == null)
                    await ApiCircle.publishAnnouncement(
                        circleKey: circle.key,
                        title: titleController.text,
                        startTime: isEvent?startTime:null,
                        endTime: isEvent?endTime:null,
                        place: isEvent?placeController.text:null,

                        urlToPreview: urlToPreviewController.text.isEmpty?
                        null:
                        urlToPreviewController.text,

                        coverImage: coverImage,
                        text: textController.text,
                        respMode: isEvent?attRespMode:AnnouncementAttendanceRespMode.NONE,
                        onSuccess: (announcement) async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) popPage(context);
                          onSaved?.call(announcement);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) popPage(context); // Close loading widget.
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) showAppToast(context, text: 'Błąd w publikowaniu');
                          onError?.call();
                        }
                    );
                  else
                    await ApiCircle.updateAnnouncement(
                        announcement: initAnnouncement!,

                        title:
                        initAnnouncement!.title == titleController.text?
                        null:
                        Optional.of(titleController.text),

                        startTime:
                        initAnnouncement!.startTime == startTime?
                        null:
                        isEvent?
                        Optional.ofNullable(startTime):
                        Optional.ofNullable(null),

                        endTime:
                        initAnnouncement!.endTime == endTime?
                        null:
                        isEvent?
                        Optional.ofNullable(endTime):
                        Optional.ofNullable(null),

                        place:
                        initAnnouncement!.place == placeController.text?
                        null:
                        isEvent?
                        Optional.ofNullable(placeEnabled?placeController.text:null):
                        Optional.ofNullable(null),

                        urlToPreview:
                        initAnnouncement!.urlToPreview == urlToPreviewController.text?
                        null:
                        Optional.ofNullable(
                            urlToPreviewController.text.isEmpty?
                            null:
                            urlToPreviewController.text
                        ),

                        coverImage:
                        initAnnouncement!.coverImage?.uniqueID == coverImage?.uniqueID?
                        null:
                        Optional.ofNullable(coverImage),

                        text:
                        initAnnouncement!.text == textController.text?
                        null:
                        textController.text,

                        respMode:
                        initAnnouncement!.respMode == attRespMode?
                        null:
                        isEvent?
                        attRespMode:
                        AnnouncementAttendanceRespMode.NONE,

                        onSuccess: (announcement) async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) popPage(context); // Close loading widget.
                          onSaved?.call(announcement);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) popPage(context); // Close loading widget.
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) showAppToast(context, text: 'Błąd w publikowaniu');
                          onError?.call();
                        }
                    );

                }
            ),

          ])),
        )

      ],
    ),
  );



}

class BottomSheetDateTimePicker extends StatelessWidget{

  final DateTime? initDateTime;
  final Color? backgroundColor;
  final bool start;
  final void Function(DateTime)? onSelected;

  const BottomSheetDateTimePicker(this.initDateTime, {this.backgroundColor, required this.start, this.onSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    DateTime currentDateTime = initDateTime??DateTime.now();

    return BottomSheetDef(
      color: backgroundColor??background_(context),
      builder: (context) => Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  start?'Rozpoczęcie':'Zakończenie',
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  dateToString(currentDateTime, withTime: true),
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                  ),
                ),
              ],
            )
          ),

          ListTile(
            leading: const Icon(MdiIcons.calendarOutline),
            title: const Text('Edytuj dzień'),
            onTap: () async {
              Navigator.pop(context);

              DateTime? dateTime = await showDatePicker(
                  context: context,
                  initialDate: currentDateTime,
                  firstDate: DateTime(966),
                  lastDate: currentDateTime.add(const Duration(days: 100*365))
              );

              if(dateTime != null)
                onSelected?.call(DateTime(
                    dateTime.year,
                    dateTime.month,
                    dateTime.day,
                    currentDateTime.hour,
                    currentDateTime.minute
                ));

            },
          ),

          ListTile(
            leading: const Icon(MdiIcons.clockOutline),
            title: const Text('Edytuj godzinę'),
            onTap: () async {
              Navigator.pop(context);

              TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(initDateTime??DateTime.now()),
              );

              if(timeOfDay != null)
                onSelected?.call(DateTime(
                    currentDateTime.year,
                    currentDateTime.month,
                    currentDateTime.day,
                    timeOfDay.hour,
                    timeOfDay.minute
                ));

            },
          )

        ],
      ),
    );
  }

}
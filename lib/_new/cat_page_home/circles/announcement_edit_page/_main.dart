import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
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

import '../circle_page.dart';
import '../common/cover_image_selectable_widget.dart';
import '../model/announcement_attendance_resp_mode.dart';
import '../model/circle.dart';

class AnnouncementEditorPage extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  final Announcement? initAnnouncement;

  final void Function(Announcement)? onSaved;
  final void Function()? onRemoved;
  final void Function()? onError;

  const AnnouncementEditorPage(
      { required this.circle,
        required this.palette,
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
  Announcement? get initAnnouncement => widget.initAnnouncement;

  void Function(Announcement)? get onSaved => widget.onSaved;
  void Function()? get onRemoved => widget.onRemoved;
  void Function()? get onError => widget.onError;

  CircleCoverImageData? coverImage;

  late TextEditingController titleController;
  late TextEditingController textController;
  late TextEditingController urlToPreviewController;
  late TextEditingController placeController;
  bool get placeEnabled => placeController.text.isNotEmpty;

  DateTime? startTime;
  DateTime? endTime;

  dynamic previewData;

  late AnnouncementAttendanceRespMode attRespMode;

  late bool eventMode;

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

    eventMode = initAnnouncement?.isEvent??false;

    heroTag = initAnnouncement??UniqueKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CirclePage.backgroundColor(context, palette),
    appBottomNavColor: CirclePage.backgroundColor(context, palette),
    body: CustomScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(
            initAnnouncement==null?'Dodaj ogłoszenie':'Edytuj ogłoszenie',
            style: AppTextStyle(),
          ),
          backgroundColor: CirclePage.backgroundColor(context, palette),
          centerTitle: true,
          floating: true,
          actions: [
            IconButton(
              icon: const Icon(MdiIcons.eyeOutline),
              onPressed: (){

                Announcement announcement = Announcement(
                  key: '',
                  title: titleController.text,
                  postTime: DateTime.now(),
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
                              color: CirclePage.backgroundColor(context, palette),
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

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AnnouncementWidgetTemplate.radius)
              ),
              clipBehavior: Clip.hardEdge,
              child:
              CoverImageSelectableWidget(
                palette,
                initCoverImage: coverImage,
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
                            'Dodaj grafikę w tle',
                            style: AppTextStyle(
                                color: hintEnab_(context),
                                fontWeight: weight.halfBold
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
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
              maxLines: null,
              textCapitalization: TextCapitalization.sentences
            ),

          ])),
        ),

        SliverList(delegate: SliverChildListDelegate([

          SwitchListTile(
              title: Text('Wydarzenie', style: AppTextStyle()),
              subtitle: Text('Służba, zbiórka, biwak, rajd, obóz...!', style: AppTextStyle(color: hintEnab_(context))),
              value: eventMode,
              onChanged: (value) => setState(() => eventMode = value),
              activeColor: CirclePage.strongColor(context, palette),
              contentPadding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          ),

          AnimatedSize(
              alignment: Alignment.topCenter,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutQuart,
              child:
              eventMode?
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
                              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
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
                                  backgroundColor: CirclePage.backgroundColor(context, palette),
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
                                  backgroundColor: CirclePage.backgroundColor(context, palette),
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
                              icon: const Icon(MdiIcons.plus),
                              onPressed: (){
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
              ):
              Container()
          ),

        ])),

        SliverList(delegate: SliverChildListDelegate([

          const SizedBox(height: Dimen.SIDE_MARG),

          Padding(
              padding: const EdgeInsets.only(
                  left: Dimen.SIDE_MARG,
                  right: Dimen.SIDE_MARG - Dimen.ICON_MARG
              ),
              child: Row(
                children: [

                  Expanded(
                    child: AppTextFieldHint(
                        hint: 'Link z podglądem:',
                        hintTop: 'Link z podglądem',
                        controller: urlToPreviewController,
                        onAnyChanged: (_){
                          previewData = null;
                          setState(() {});
                        },
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
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

          if(urlToPreviewController.text.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(AnnouncementWidgetTemplate.radius),
                color: CirclePage.cardColor(context, palette),
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
            )

        ])),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            const SizedBox(height: Dimen.SIDE_MARG),

            SimpleButton.from(
                elevation: AppCard.bigElevation,
                margin: EdgeInsets.zero,
                textColor: CirclePage.backgroundColor(context, palette),
                color: CirclePage.strongColor(context, palette),
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
                      context, CirclePage.strongColor(context, palette),
                      initAnnouncement == null?'Publikowanie...':'Uaktualnianie...'
                  );

                  if(initAnnouncement == null)
                    await ApiCircle.postAnnouncement(
                        circleKey: circle.key,
                        title: titleController.text,
                        startTime: eventMode?startTime:null,
                        endTime: eventMode?endTime:null,
                        place: eventMode?placeController.text:null,

                        urlToPreview: urlToPreviewController.text.isEmpty?
                        null:
                        urlToPreviewController.text,

                        coverImageUrl: coverImage?.code,
                        text: textController.text,
                        respMode: eventMode?attRespMode:AnnouncementAttendanceRespMode.NONE,
                        onSuccess: (announcement) async {
                          if(mounted) await popPage(context); // Close loading widget.
                          onSaved?.call(announcement);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showAppToast(context, text: serverWakingUpMessage);
                          return true;
                        },
                        onError: () async {
                          if(mounted) await popPage(context); // Close loading widget.
                          onError?.call();
                        }
                    );
                  else
                    await ApiCircle.updateAnnouncement(
                        announcement: initAnnouncement!,

                        title:
                        initAnnouncement!.title == titleController.text?
                        const Optional.empty():
                        Optional.of(titleController.text),

                        startTime:
                        initAnnouncement!.startTime == startTime?
                        const Optional.empty():
                        eventMode?
                        Optional.ofNullable(startTime):
                        Optional.ofNullable(null),

                        endTime:
                        initAnnouncement!.endTime == endTime?
                        const Optional.empty():
                        eventMode?
                        Optional.ofNullable(endTime):
                        Optional.ofNullable(null),

                        place:
                        initAnnouncement!.place == placeController.text?
                        const Optional.empty():
                        eventMode?
                        Optional.ofNullable(placeEnabled?placeController.text:null):
                        Optional.ofNullable(null),

                        urlToPreview:
                        initAnnouncement!.urlToPreview == urlToPreviewController.text?
                        const Optional.empty():
                        Optional.ofNullable(
                          urlToPreviewController.text.isEmpty?
                          null:
                          urlToPreviewController.text
                        ),

                        coverImageUrl:
                        initAnnouncement!.coverImage?.code == coverImage?.code?
                        const Optional.empty():
                        Optional.ofNullable(coverImage?.code),

                        text:
                        initAnnouncement!.text == textController.text?
                        const Optional.empty():
                        Optional.of(textController.text),

                        respMode:
                        initAnnouncement!.respMode == attRespMode?
                        const Optional.empty():
                        eventMode?
                        Optional.of(attRespMode):
                        Optional.of(AnnouncementAttendanceRespMode.NONE),

                        onSuccess: (announcement) async {
                          await popPage(context); // Close loading widget.
                          onSaved?.call(announcement);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showAppToast(context, text: serverWakingUpMessage);
                          return true;
                        },
                        onError: () async {
                          await popPage(context); // Close loading widget.
                          onError?.call();
                        }
                    );

                  Navigator.pop(context);

                }
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            if(initAnnouncement != null)
              SimpleButton.from(
                  elevation: AppCard.bigElevation,
                  margin: EdgeInsets.zero,
                  textColor: CirclePage.backgroundColor(context, palette),
                  color: Colors.red,
                  icon: MdiIcons.trashCanOutline,
                  text: 'Usuń ogłoszenie',
                  onTap: () => showAppToast(context, text: 'Przytrzymaj, aby usunąć ogłoszenie'),
                  onLongPress: (){

                    showLoadingWidget(
                        context,
                        CirclePage.strongColor(context, palette),
                        'Usuwanie...'
                    );

                    ApiCircle.deleteAnnouncement(
                        annKey: initAnnouncement!.key,
                        onSuccess: () async {
                          await popPage(context); // Close loading widget.
                          await popPage(context);
                          onRemoved?.call();
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showAppToast(context, text: serverWakingUpMessage);
                          return true;
                        },
                        onError: () async {
                          if(!mounted) return;
                          showAppToast(context, text: simpleErrorMessage);
                          await popPage(context); // Close loading widget.
                        }
                    );

                  }
              ),

            if(initAnnouncement != null)
              const SizedBox(height: Dimen.SIDE_MARG),

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
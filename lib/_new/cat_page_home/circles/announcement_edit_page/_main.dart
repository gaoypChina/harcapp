import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_page.dart';
import '../common/cover_image_pickable_widget.dart';
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

  TextEditingController? titleController;
  TextEditingController? textController;

  DateTime? startTime;
  DateTime? endTime;

  String? place;

  bool? pinned;

  @override
  void initState() {
    coverImage = initAnnouncement?.coverImage;
    titleController = TextEditingController(text: initAnnouncement?.title??'');
    textController = TextEditingController(text: initAnnouncement?.text??'');
    pinned = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CirclePage.backgroundColor(context, palette),
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
              icon: const Icon(MdiIcons.earthArrowRight),
              onPressed: () async {

                if(titleController!.text.isEmpty){
                  showAppToast(context, text: 'Podaj tytuł ogłoszenia');
                  return;
                }

                if(textController!.text.isEmpty){
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
                    title: titleController!.text,
                    coverImageUrl: coverImage?.code,
                    text: textController!.text,
                    pinned: pinned,
                    onSuccess: (announcement) async {
                      await popPage(context); // Close loading widget.
                      onSaved?.call(announcement);
                    },
                    onError: () async {
                      await popPage(context); // Close loading widget.
                      onError?.call();
                    }
                  );
                else
                  await ApiCircle.updateAnnouncement(
                      annKey: initAnnouncement!.key,
                      title: titleController!.text,
                      coverImageUrl: coverImage?.code,
                      text: textController!.text,
                      pinned: pinned,
                      onSuccess: (announcement) async {
                        await popPage(context); // Close loading widget.
                        onSaved?.call(announcement);
                      },
                      onError: () async {
                        await popPage(context); // Close loading widget.
                        onError?.call();
                      }
                  );

                Navigator.pop(context);

              },
            )
          ],
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([
            Material(
              color: CirclePage.cardColor(context, palette),
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              elevation: AppCard.bigElevation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  CoverImagePickableWidget(
                    palette,
                    initCoverImage: coverImage,
                    removable: true,
                    onSelected: (newCoverImage) => setState(() => coverImage = newCoverImage),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        Text(
                          dateToString(DateTime.now()),
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),
                        ),

                        AppTextFieldHint(
                          hint: 'Tytuł:',
                          hintTop: '',
                          controller: titleController,
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold),
                          maxLines: 1,
                        ),

                        AppTextFieldHint(
                          hint: 'Treść:',
                          hintTop: '',
                          controller: textController,
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                          maxLines: null,
                        ),

                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                      IconButton(
                          icon: Icon(
                            MdiIcons.pinOutline,
                            color:
                            pinned!?
                            iconEnab_(context):
                            iconDisab_(context),
                          ),
                          onPressed: () => setState(() => pinned = !pinned!)
                      ),

                      Expanded(child: Container()),

                      Text(AccountData.name!, style: AppTextStyle()),
                      const SizedBox(width: 10.0),
                      AccountThumbnailWidget(name: AccountData.name, size: 24.0, elevated: false),
                      const SizedBox(width: Dimen.SIDE_MARG),
                    ],
                  ),

                  const SizedBox(height: Dimen.SIDE_MARG - Dimen.ICON_MARG),


                ],
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Align(
              alignment: Alignment.centerLeft,
              child: SimpleButton.from(
                  margin: EdgeInsets.zero,
                  context: context,
                  icon: MdiIcons.calendarBlankOutline,
                  text: startTime==null?
                  'Dodaj czas rozpoczęcia':
                  'Początek: ${dateToString(startTime, shortMonth: true, withTime: true)}',
                  fontWeight: weight.normal,
                  onTap: () => showScrollBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetDateTimePicker(
                        startTime,
                        backgroundColor: CirclePage.backgroundColor(context, palette),
                        start: true,
                        onSelected: (dateTime) => setState(() => startTime = dateTime),
                      )
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: SimpleButton.from(
                margin: EdgeInsets.zero,
                context: context,
                icon: MdiIcons.calendarCheckOutline,
                text: endTime==null?
                'Dodaj czas zakończenia':
                'Zakończ.:  ${dateToString(endTime, shortMonth: true, withTime: true)}',
                fontWeight: weight.normal,
                onTap: () => showScrollBottomSheet(
                  context: context,
                  builder: (context) => BottomSheetDateTimePicker(
                    endTime,
                    backgroundColor: CirclePage.backgroundColor(context, palette),
                    start: false,
                    onSelected: (dateTime) => setState(() => endTime = dateTime),
                  )
                )
              ),
            ),

            AppTextFieldHint(
              hint: 'Dodaj miejsce',
              hintTop: '',
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

            if(initAnnouncement != null)
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
                      onError: () async {
                        showAppToast(context, text: 'Coś poszło nie tak...');
                        await popPage(context); // Close loading widget.
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
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 100*365))
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
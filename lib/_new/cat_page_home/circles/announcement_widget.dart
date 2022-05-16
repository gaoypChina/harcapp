import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement_attendance_resp_mode.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import 'cover_image.dart';
import 'model/announcement_attendace.dart';

class AnnouncementWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? paletteGenerator;
  final void Function()? onUpdateTap;
  final void Function()? onPinTap;
  final void Function(AnnouncementAttendance)? onAttendanceChanged;

  const AnnouncementWidget(
      this.announcement,
      { this.paletteGenerator,
        this.onUpdateTap,
        this.onPinTap,
        this.onAttendanceChanged,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    color: CirclePage.cardColor(context, paletteGenerator),
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
    elevation: AppCard.bigElevation,
    child: Column(
      children: [

        if(announcement.coverImage != null)
          CoverImage(announcement.coverImage),

        Row(
          children: [

            const SizedBox(width: Dimen.SIDE_MARG),

            Text(
              dateToString(announcement.postTime),
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),
            ),

            Expanded(child: Container()),

            if(AccountData.key == announcement.author.key)
              IconButton(
                  icon: Icon(
                    MdiIcons.pinOutline,
                    color:
                    announcement.pinned?
                    iconEnab_(context):
                    iconDisab_(context),
                  ),
                  onPressed: onPinTap
              ),

            if(AccountData.key == announcement.author.key)
              IconButton(
                  icon: const Icon(MdiIcons.pencilOutline),
                  onPressed: onUpdateTap
              ),

            const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG, height: Dimen.ICON_FOOTPRINT),

          ],
        ),

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

              const SizedBox(height: Dimen.SIDE_MARG),

              Text(
                announcement.text,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Expanded(child: Container()),

            Text(announcement.author.name, style: AppTextStyle()),
            const SizedBox(width: 10.0),
            AccountThumbnailWidget(name: announcement.author.name, size: 24.0, elevated: false),
            const SizedBox(width: Dimen.SIDE_MARG),
          ],
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        if(announcement.respMode != AnnouncementAttendanceRespMode.NONE)
          Builder(builder: (context){

            AnnouncementAttendance? myAtt = announcement.myAttendance?.response;

            return Row(
              children: [

                Expanded(
                  child: SimpleButton.from(
                    color:
                    myAtt == null || myAtt == AnnouncementAttendance.ATTENDING?
                    backgroundIcon_(context):
                    Colors.transparent,

                    textColor:
                    myAtt == null || myAtt == AnnouncementAttendance.ATTENDING?
                    iconEnab_(context):
                    iconDisab_(context),

                    icon: MdiIcons.check,
                    onTap: () => openDialog(
                      context: context,
                      builder: (context) => AttendingDialog(
                        announcement,
                        paletteGenerator,
                        onSuccess: (){
                          Navigator.pop(context);
                          onAttendanceChanged?.call(AnnouncementAttendance.ATTENDING);
                        },
                        onError: (){
                          Navigator.pop(context);
                        },
                      )
                    ),
                  ),
                ),

                Expanded(
                  child: SimpleButton.from(
                    color:
                    myAtt == null || myAtt == AnnouncementAttendance.POSTPONE_RESP?
                    backgroundIcon_(context):
                    Colors.transparent,

                    textColor:
                    myAtt == null || myAtt == AnnouncementAttendance.POSTPONE_RESP?
                    iconEnab_(context):
                    iconDisab_(context),

                    icon: MdiIcons.clockOutline,
                    onTap: () => openDialog(
                        context: context,
                        builder: (context) => PostponeRespDialog(
                          announcement,
                          paletteGenerator,
                          onSuccess: (){
                            Navigator.pop(context);
                            onAttendanceChanged?.call(AnnouncementAttendance.POSTPONE_RESP);
                          },
                          onError: (){
                            Navigator.pop(context);
                          },
                        )
                    ),
                  ),
                ),

                Expanded(
                  child: SimpleButton.from(
                    color:
                    myAtt == null || myAtt == AnnouncementAttendance.NOT_ATTENDING?
                    backgroundIcon_(context):
                    Colors.transparent,

                    textColor:
                    myAtt == null || myAtt == AnnouncementAttendance.NOT_ATTENDING?
                    iconEnab_(context):
                    iconDisab_(context),

                    icon: MdiIcons.close,
                    onTap: () => openDialog(
                        context: context,
                        builder: (context) => NotAttendingDialog(
                          announcement,
                          paletteGenerator,
                          onSuccess: (){
                            Navigator.pop(context);
                            onAttendanceChanged?.call(AnnouncementAttendance.NOT_ATTENDING);
                          },
                          onError: (){
                            Navigator.pop(context);
                          },
                        )
                    ),
                  ),
                ),

              ],
            );
          }),

      ],
    ),
  );

}

class AttendingDialog extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function()? onSuccess;
  final void Function()? onError;
  const AttendingDialog(this.announcement, this.palette, {this.onSuccess, this.onError, super.key});
  
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
                'Czy chcesz potwierdzić swoje uczestnicwto w wydarzeniu?',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Row(
              children: [

                Expanded(
                  child: SimpleButton.from(
                      context: context,
                      text: 'Jednak nie',
                      margin: EdgeInsets.zero,
                      onTap: () => Navigator.pop(context)
                  ),
                ),

                Expanded(
                  child: SimpleButton.from(
                      context: context,
                      text: 'Oczywiście!',
                      margin: EdgeInsets.zero,
                      onTap: () async {

                        showLoadingWidget(
                            context,
                            CirclePage.strongColor(context, palette),
                            'Chwileczkę...'
                        );

                        await ApiCircle.updateAnnouncementAttendanceResponse(
                          annKey: announcement.key,
                          response: AnnouncementAttendance.ATTENDING,
                          onSuccess: (announcementAttendanceResp) async {
                            announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                            await popPage(context); // Close loading widget.
                            onSuccess?.call();
                          },
                          onError: () async {
                            await popPage(context); // Close loading widget.
                            onError?.call();
                          }
                        );

                      }
                  ),
                )

              ],
            )

          ],
        )
      ),
    ),
  );
  
  
  
}

class NotAttendingDialog extends StatefulWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function()? onSuccess;
  final void Function()? onError;

  const NotAttendingDialog(this.announcement, this.palette, {this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => NotAttendingDialogState();

}

class NotAttendingDialogState extends State<NotAttendingDialog>{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  void Function()? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

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
                  'Czy chcesz zadeklarować, swoją niedyspozycyjność w wydarzeniu?'
                  '\n\nJeżeli tak, z szacunku dla organizatora poinformuj go o przyczynie.',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Powód:',
                  hintTop: 'Powód',
                  controller: controller,
                  maxLines: null,
                ),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Row(
                children: [

                  Expanded(
                    child: SimpleButton.from(
                        context: context,
                        text: 'Jednak nie',
                        margin: EdgeInsets.zero,
                        onTap: () => Navigator.pop(context)
                    ),
                  ),

                  Expanded(
                    child: SimpleButton.from(
                        context: context,
                        text: 'Potwierdzam',
                        textColor: controller.text.isEmpty?
                        iconDisab_(context):
                        iconEnab_(context),

                        margin: EdgeInsets.zero,

                        onTap: controller.text.isEmpty?null:() async {

                          showLoadingWidget(
                            context,
                            CirclePage.strongColor(context, palette),
                            'Chwileczkę...'
                          );

                          await ApiCircle.updateAnnouncementAttendanceResponse(
                            annKey: announcement.key,
                            response: AnnouncementAttendance.NOT_ATTENDING,
                            rejectionReason: controller.text,
                            onSuccess: (announcementAttendanceResp) async {
                              announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                              await popPage(context); // Close loading widget.
                              onSuccess?.call();
                            },
                            onError: () async {
                              await popPage(context); // Close loading widget.
                              onError?.call();
                            }
                          );

                        }
                    ),
                  )

                ],
              )

            ],
          )
      ),
    ),
  );

}

class PostponeRespDialog extends StatefulWidget{

  final Announcement announcement;
  final PaletteGenerator? palette;
  final void Function()? onSuccess;
  final void Function()? onError;

  const PostponeRespDialog(this.announcement, this.palette, {this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => PostponeRespDialogState();

}

class PostponeRespDialogState extends State<PostponeRespDialog>{

  Announcement get announcement => widget.announcement;
  PaletteGenerator? get palette => widget.palette;
  void Function()? get onSuccess => widget.onSuccess;
  void Function()? get onError => widget.onError;

  late DateTime postponeDate;
  late TextEditingController controller;

  @override
  void initState() {
    postponeDate = DateTime.now();
    controller = TextEditingController();
    super.initState();
  }

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
            children: [

              AppBar(
                title: const Text('Jeszcze nie wiem'),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Text(
                  'Czy chcesz zadeklarować, że nie jesteś jeszcze w stanie odpowiedzieć na wydarzenie?'
                  '\n\nJeżeli tak, podaj termin, gdy podasz odpowiedź.',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                ),
              ),

              DatePicker(
                DateTime.now(),
                initialSelectedDate: postponeDate,
                selectionColor: CirclePage.strongColor(context, palette),
                selectedTextColor: Colors.white,
                locale: 'pl_PL',
                daysCount: announcement.eventTime?.difference(DateTime.now()).abs().inDays??365,
                onDateChange: (date) {
                  setState(() {
                    postponeDate = date;
                  });
                },
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Opcjonalny komentarz:',
                  hintTop: 'Komentarz',
                  controller: controller,
                  maxLines: null,
                ),
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Row(
                children: [

                  Expanded(
                    child: SimpleButton.from(
                        context: context,
                        text: 'Jednak nie',
                        margin: EdgeInsets.zero,
                        onTap: () => Navigator.pop(context)
                    ),
                  ),

                  Expanded(
                    child: SimpleButton.from(
                        context: context,
                        text: 'Potwierdzam',
                        textColor: controller.text.isEmpty?
                        iconDisab_(context):
                        iconEnab_(context),

                        margin: EdgeInsets.zero,

                        onTap: controller.text.isEmpty?null:() async {

                          showLoadingWidget(
                              context,
                              CirclePage.strongColor(context, palette),
                              'Chwileczkę...'
                          );

                          await ApiCircle.updateAnnouncementAttendanceResponse(
                              annKey: announcement.key,
                              response: AnnouncementAttendance.POSTPONE_RESP,
                              rejectionReason: controller.text,
                              onSuccess: (announcementAttendanceResp) async {
                                announcement.attendance[AccountData.key!] = announcementAttendanceResp;
                                await popPage(context); // Close loading widget.
                                onSuccess?.call();
                              },
                              onError: () async {
                                await popPage(context); // Close loading widget.
                                onError?.call();
                              }
                          );

                        }
                    ),
                  )

                ],
              )

            ],
          )
      ),
    ),
  );

}
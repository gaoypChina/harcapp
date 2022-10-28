import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CreateNewButton extends StatelessWidget{

  final IconData icon;
  final String title;
  final String description;
  final Widget? bottom;
  final void Function()? onTap;

  const CreateNewButton({required this.icon, required this.title, required this.description, this.bottom, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.bigRadius,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
              children: [
                Icon(icon),
                const SizedBox(width: Dimen.SIDE_MARG),
                Text(
                  title,
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: AppText(
                description,
                size: Dimen.TEXT_SIZE_BIG,
              ),
            ),

            if(bottom != null)
              bottom!,

          ],
        ),
      )
  );


}

class ShareCodeWidget extends StatefulWidget{

  static const IconData iconOn = MdiIcons.lockOpenVariantOutline;
  static const IconData iconOff = MdiIcons.lockOutline;

  final ValueNotifier<String> shareCode;
  final ValueNotifier<bool> shareCodeSearchable;
  final ValueNotifier<bool> enabled;
  final ValueNotifier<bool>? processing;
  final Color? backgroundColor;
  final Color? borderColor;
  final Future<void> Function() resetShareCode;

  final String description;
  final int resetFrequencyDays;

  static ShareCodeWidget from(
      String shareCode,
      bool shareCodeSearchable,
      bool enabled,
      { Color? backgroundColor,
        Color? borderColor,
        required Future<void> Function() resetShareCode,

        required String description,
        required int resetFrequencyDays,

        Key? key
      }) => ShareCodeWidget(
    ValueNotifier(shareCode),
    ValueNotifier(shareCodeSearchable),
    ValueNotifier(enabled),
    backgroundColor: backgroundColor,
    borderColor: borderColor,
    resetShareCode: resetShareCode,
    description: description,
    resetFrequencyDays: resetFrequencyDays,
    key: key,
  );

  const ShareCodeWidget(
      this.shareCode,
      this.shareCodeSearchable,
      this.enabled,
      { this.processing,
        this.backgroundColor,
        this.borderColor,
        required this.resetShareCode,

        required this.description,
        required this.resetFrequencyDays,

        super.key
      });

  @override
  State<StatefulWidget> createState() => ShareCodeWidgetState();

}

class ShareCodeWidgetState extends State<ShareCodeWidget>{

  static bool _dialogOpened = false;

  static const double backgroundIconSize = (Dimen.ICON_FOOTPRINT + 2*Dimen.ICON_MARG) + 2*24;
  static const double backgroundIconShift = 60;

  ValueNotifier<String> get shareCode => widget.shareCode;
  ValueNotifier<bool> get shareCodeSearchable => widget.shareCodeSearchable;
  ValueNotifier<bool> get enabled => widget.enabled;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get borderColor => widget.borderColor;

  Future<void> Function() get resetShareCode => widget.resetShareCode;

  String get description => widget.description;
  int get resetFrequencyDays => widget.resetFrequencyDays;

  bool get processing => !widget.enabled.value || _processing.value;
  late ValueNotifier<bool> _processing;

  late GlobalKey positionKey;

  void notify() => setState(() {});

  @override
  void initState() {

    _processing = widget.processing??ValueNotifier(false);

    shareCode.addListener(notify);
    shareCodeSearchable.addListener(notify);
    enabled.addListener(notify);
    _processing.addListener(notify);

    positionKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    shareCode.removeListener(notify);
    shareCodeSearchable.removeListener(notify);
    enabled.removeListener(notify);
    _processing.removeListener(notify);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Hero(
    tag: 'ShareCodeWidget',
    child: GestureDetector(
      onTap: _dialogOpened?null:() async {

        setState(() => _dialogOpened = true);

        await openDialog(
            context: context,
            builder: (context){

              final RenderBox renderBox = positionKey.currentContext!.findRenderObject() as RenderBox;
              final position = renderBox.localToGlobal(Offset.zero);

              return Stack(
                children: [

                  Positioned.fill(
                      top: max(
                          Dimen.SIDE_MARG,
                          position.dy - MediaQuery.of(context).viewPadding.top
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                          child: Material(
                              borderRadius: BorderRadius.circular(AppCard.bigRadius),
                              color: backgroundColor??background_(context),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [

                                  ShareCodeWidget(
                                    shareCode,
                                    shareCodeSearchable,
                                    enabled,
                                    processing: _processing,
                                    backgroundColor: backgroundColor,
                                    borderColor: borderColor,
                                    resetShareCode: resetShareCode,
                                    description: description,
                                    resetFrequencyDays: resetFrequencyDays,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                        Text(
                                          'O co chodzi?',
                                          style: AppTextStyle(
                                            fontSize: Dimen.TEXT_SIZE_BIG,
                                            fontWeight: weight.halfBold
                                          ),
                                        ),

                                        const SizedBox(height: Dimen.SIDE_MARG),

                                        AppText(
                                          description,
                                          size: Dimen.TEXT_SIZE_BIG,
                                        ),

                                        const SizedBox(height: 2*Dimen.defMarg),

                                        Text(
                                          'Kod dostępu można zmienić raz na $resetFrequencyDays dni.',
                                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                                        ),

                                        const SizedBox(height: 2*Dimen.defMarg),

                                        Row(
                                          children: [

                                            const Icon(ShareCodeWidget.iconOn),

                                            const SizedBox(width: Dimen.SIDE_MARG),

                                            Expanded(
                                              child: Text(
                                                'Dostęp po kodzie można włączyć lub wyłączyć tymże przyciskiem.',
                                                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                                              ),
                                            ),

                                          ],
                                        ),

                                        const SizedBox(height: 2*Dimen.defMarg),

                                      ],
                                    )
                                  ),

                                  SimpleButton.from(
                                      context: context,
                                      icon: MdiIcons.check,
                                      text: 'Wszystko jasne',
                                      onTap: () => Navigator.pop(context)
                                  ),

                                ],
                              )
                          ),
                        ),
                      )
                  )

                ],
              );

            }
        );

        setState(() => _dialogOpened = false);

      },
      key: positionKey,
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        color: borderColor??backgroundIcon_(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(AppCard.bigRadius-6),
              color: backgroundColor??background_(context),
              child: Stack(
                children: [

                  Positioned(
                    left: 0,
                    top: -backgroundIconShift,
                    bottom: -backgroundIconShift,
                    child: Icon(
                        ShareCodeWidget.iconOn,
                        color: borderColor??backgroundIcon_(context),
                        size: backgroundIconSize
                    ),
                  ),

                  Padding(
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      child: Row(
                        children: [

                          const SizedBox(width: Dimen.ICON_FOOTPRINT),

                          Expanded(
                              child: GestureDetector(
                                onLongPress: (){
                                  Clipboard.setData(ClipboardData(text: shareCode.value));
                                  showAppToast(context, text: 'Skopiowano');
                                },
                                child: Text(
                                  shareCode.value,
                                  style: AppTextStyle(
                                      fontSize: Dimen.ICON_SIZE,
                                      fontWeight: weight.bold,
                                      color: shareCodeSearchable.value?iconEnab_(context):iconDisab_(context)
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),

                          IconButton(
                            icon: const Icon(MdiIcons.refresh),
                            onPressed: processing || !shareCodeSearchable.value?null:() async {

                              setState(() => _processing.value = true);
                              await resetShareCode();
                              setState(() => _processing.value = false);

                            },
                          ),

                        ],
                      )
                  ),

                ],
              )
          ),
        ),
      ),
    ),
  );

}

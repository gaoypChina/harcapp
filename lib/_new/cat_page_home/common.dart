import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class ShareCodeDialog extends StatefulWidget{

  static IconData iconAppBarOn = MdiIcons.share;
  static IconData iconAppBarOff = MdiIcons.shareOff;

  static IconData iconOn = MdiIcons.lockOpenVariantOutline;
  static IconData iconOff = MdiIcons.lockOutline;

  final String shareCode;
  final bool shareCodeSearchable;
  final bool enabled;
  final bool? processing;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isAdmin;
  final Future<String?> Function() resetShareCode;
  final Future<bool> Function() changeShareCodeSearchable;

  final String description;
  final int resetFrequencyDays;

  static ShareCodeDialog from(
      String shareCode,
      bool shareCodeSearchable,
      bool enabled,
      { Color? backgroundColor,
        Color? borderColor,
        required bool isAdmin,
        required Future<String?> Function() resetShareCode,
        required Future<bool> Function() changeShareCodeSearchable,

        required String description,
        required int resetFrequencyDays,

        Key? key
      }) => ShareCodeDialog(
    shareCode,
    shareCodeSearchable,
    enabled,
    backgroundColor: backgroundColor,
    borderColor: borderColor,
    isAdmin: isAdmin,
    resetShareCode: resetShareCode,
    changeShareCodeSearchable: changeShareCodeSearchable,
    description: description,
    resetFrequencyDays: resetFrequencyDays,
    key: key,
  );

  const ShareCodeDialog(
      this.shareCode,
      this.shareCodeSearchable,
      this.enabled,
      { this.processing,
        this.backgroundColor,
        this.borderColor,
        required this.isAdmin,
        required this.resetShareCode,
        required this.changeShareCodeSearchable,

        required this.description,
        required this.resetFrequencyDays,

        super.key
      });

  @override
  State<StatefulWidget> createState() => ShareCodeDialogState();

}

class ShareCodeDialogState extends State<ShareCodeDialog>{
  
  static const double backgroundIconSize = (Dimen.ICON_FOOTPRINT + 2*Dimen.ICON_MARG) + 2*24;
  static const double backgroundIconShift = 60;

  late String? shareCode;
  late bool shareCodeSearchable;

  bool get enabled => widget.enabled;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get borderColor => widget.borderColor;

  bool get isAdmin => widget.isAdmin;
  Future<String?> Function() get resetShareCode => widget.resetShareCode;
  Future<bool> Function() get changeShareCodeSearchable => widget.changeShareCodeSearchable;

  String get description => widget.description;
  int get resetFrequencyDays => widget.resetFrequencyDays;

  bool get processing => !widget.enabled || _processing;
  late bool _processing;

  late GlobalKey positionKey;

  @override
  void initState() {

    _processing = widget.processing??false;
    shareCode = widget.shareCode;
    shareCodeSearchable = widget.shareCodeSearchable;

    positionKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
      child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          color: backgroundColor??background_(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Material(
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
                                shareCodeSearchable?
                                ShareCodeDialog.iconOn:
                                ShareCodeDialog.iconOff,
                                color: borderColor??backgroundIcon_(context),
                                size: backgroundIconSize
                            ),
                          ),

                          Center(
                            child: Padding(
                                padding: const EdgeInsets.all(2*Dimen.ICON_MARG),
                                child: shareCodeSearchable == false?
                                Text(
                                  '- - - - -',
                                  style: AppTextStyle(
                                      fontSize: Dimen.ICON_SIZE,
                                      fontWeight: weight.bold,
                                      color: iconDisab_(context)
                                  ),
                                  textAlign: TextAlign.center,
                                ):
                                shareCode == null?
                                Text(
                                  'Kod niedostępny',
                                  style: AppTextStyle(
                                      fontSize: Dimen.ICON_SIZE,
                                      fontWeight: weight.bold,
                                      color: iconDisab_(context)
                                  ),
                                  textAlign: TextAlign.center,
                                ):GestureDetector(
                                  onLongPress: (){
                                    Clipboard.setData(ClipboardData(text: shareCode!));
                                    showAppToast(context, text: 'Skopiowano');
                                  },
                                  child: Text(
                                    shareCode!,
                                    style: AppTextStyle(
                                        fontSize: Dimen.ICON_SIZE,
                                        fontWeight: weight.bold,
                                        color: shareCodeSearchable?iconEnab_(context):iconDisab_(context)
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                            ),
                          )

                        ],
                      )
                  ),
                ),
              ),

              if(isAdmin)
                Row(
                  children: [
                    Expanded(
                      child: SimpleButton.from(
                          iconColor: processing?iconDisab_(context):iconEnab_(context),
                          textColor: processing?iconDisab_(context):iconEnab_(context),
                          icon: shareCodeSearchable?
                          ShareCodeDialog.iconOff:
                          ShareCodeDialog.iconOn,
                          text: shareCodeSearchable?'Ukryj':'Pokaż',
                          onTap: processing?null:() async {
                            setState(() => _processing = true);
                            shareCodeSearchable = await changeShareCodeSearchable();
                            setState(() => _processing = false);
                          },
                      ),
                    ),
                    Expanded(
                      child: SimpleButton.from(
                        iconColor: processing?iconDisab_(context):iconEnab_(context),
                        textColor: processing?iconDisab_(context):iconEnab_(context),
                        icon: MdiIcons.refresh,
                        text: 'Nowy kod',
                        onTap: processing || !shareCodeSearchable?null:() async {

                          setState(() => _processing = true);
                          String? shareCode = await resetShareCode();
                          if(shareCode != null)
                            shareCode = shareCode;

                          setState(() => _processing = false);

                        },
                      ),
                    ),
                  ],
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

                      if(isAdmin)
                        Text(
                          'Kod dostępu można zmienić raz na $resetFrequencyDays dni.',
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                        ),

                      if(isAdmin)
                        const SizedBox(height: 2*Dimen.defMarg),

                      // Row(
                      //   children: [
                      //
                      //     const Icon(ShareCodeWidget.iconOn),
                      //
                      //     const SizedBox(width: Dimen.SIDE_MARG),
                      //
                      //     Expanded(
                      //       child: Text(
                      //         'Dostęp po kodzie można włączyć lub wyłączyć tymże przyciskiem.',
                      //         style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                      //       ),
                      //     ),
                      //
                      //   ],
                      // ),
                      //
                      // const SizedBox(height: 2*Dimen.defMarg),

                    ],
                  )
              ),

              SimpleButton.from(
                  context: context,
                  radius: 0,
                  icon: MdiIcons.check,
                  margin: EdgeInsets.zero,
                  text: 'Wszystko jasne',
                  onTap: () => Navigator.pop(context)
              ),

            ],
          )
      ),
    ),
  );

}

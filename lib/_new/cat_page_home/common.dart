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
      color: background_(context),
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

  final String shareCode;
  final bool shareCodeSearchable;
  final bool enabled;
  final Color? backgroundColor;
  final Color? borderColor;
  final Future<void> Function() resetShareCode;

  const ShareCodeWidget(
      this.shareCode,
      this.shareCodeSearchable,
      { this.enabled = true,
        this.backgroundColor,
        this.borderColor,
        required this.resetShareCode,
        super.key
      });

  @override
  State<StatefulWidget> createState() => ShareCodeWidgetState();

}

class ShareCodeWidgetState extends State<ShareCodeWidget>{

  String get shareCode => widget.shareCode;
  bool get shareCodeSearchable => widget.shareCodeSearchable;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get borderColor => widget.borderColor;

  Future<void> Function() get resetShareCode => widget.resetShareCode;

  bool get processing => !widget.enabled || _processing;
  late bool _processing;

  @override
  void initState() {
    _processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Material(
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
                top: -60,
                bottom: -60,
                child: Icon(
                    MdiIcons.radar,
                    color: borderColor??backgroundIcon_(context),
                    size: (Dimen.ICON_FOOTPRINT + 2*Dimen.ICON_MARG) + 2*60
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                  child: Stack(
                    children: [

                      Text('Kod dostępu:', style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context))),

                      Row(
                        children: [

                          const SizedBox(width: Dimen.ICON_FOOTPRINT),

                          Expanded(
                              child: GestureDetector(
                                onLongPress: (){
                                  Clipboard.setData(ClipboardData(text: shareCode));
                                  showAppToast(context, text: 'Skopiowano');
                                },
                                child: Text(
                                  shareCode,
                                  style: AppTextStyle(
                                      fontSize: Dimen.ICON_SIZE,
                                      fontWeight: weight.bold,
                                      color: shareCodeSearchable?iconEnab_(context):iconDisab_(context)
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                          ),

                          IconButton(
                            icon: const Icon(MdiIcons.refresh),
                            onPressed: processing || !shareCodeSearchable?null:() async {

                              setState(() => _processing = true);
                              await resetShareCode();
                              setState(() => _processing = false);

                            },
                          ),

                        ],
                      )

                    ],
                  )
              ),

            ],
          )
      ),
    ),
  );

}
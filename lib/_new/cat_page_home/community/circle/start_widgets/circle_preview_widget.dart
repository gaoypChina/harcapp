import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CirclePreviewWidget extends StatelessWidget{

  final double width;
  final Widget child;

  const CirclePreviewWidget({required this.width, required this.child, super.key});

  static CirclePreviewWidget from({
    required BuildContext context,
    required double width,
    EdgeInsets padding = EdgeInsets.zero,
    required IconData icon,
    required String text,
    void Function()? onTap
  }) => CirclePreviewWidget(
    width: width,
    child: SimpleButton(
        color: background_(context),
        elevation: AppCard.bigElevation,
        margin: const EdgeInsets.all(Dimen.SIDE_MARG),
        padding: padding,
        borderRadius: BorderRadius.circular(1000), //AppCard.bigRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Row(
            children: [
              Icon(icon, size: 60),
              const SizedBox(width: 20),
              Text(
                text,
                style: AppTextStyle(
                  fontSize: 20.0,
                  color: iconEnab_(context)
                ),
              )
            ],
          ),
        )
    ),
  );

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      Positioned(
        top: -width/1.6,
        left: -.4*width,
        child: Icon(MdiIcons.circleOutline, size: 1.4*width),
      ),

      Positioned(
        top: 0,
        bottom: 0,
        right: -.9*width,
        child: Icon(MdiIcons.circleOutline, size: 1.4*width),
      ),

      Positioned(
        bottom: -width/1.4,
        left: -.5*width,
        child: Icon(MdiIcons.circleOutline, size: 1.4*width),
      ),

      Center(
        child: child,
      ),

    ],
  );

}
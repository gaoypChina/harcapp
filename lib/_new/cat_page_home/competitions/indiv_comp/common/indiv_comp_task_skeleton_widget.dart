import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

class IndivCompTaskSkeletonWidget extends StatelessWidget{

  static const double padding = 12.0;

  final Widget? leading;
  final Widget? title;
  final Widget? titleBottom;
  final Widget? description;

  final double elevation;
  final Widget? trailing;
  final Widget? bottom;

  final Widget? front;
  final void Function()? onTap;

  static TextStyle pointsTextStyle(BuildContext context, {bool enabled = true, bool crossOut = false}) => AppTextStyle(
      fontWeight: weight.halfBold, fontSize: 32.0, color: enabled?textEnab_(context):textDisab_(context), decoration: crossOut?TextDecoration.lineThrough:null);

  static TextStyle titleTextStyle(BuildContext context, {bool enabled = true, bool crossOut = false}) => AppTextStyle(
      fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_APPBAR, color: enabled?textEnab_(context):textDisab_(context), decoration: crossOut?TextDecoration.lineThrough:null);

  static TextStyle descriptionTextStyle(BuildContext context, {bool enabled = true, bool crossOut = false}) => AppTextStyle(
      fontSize: Dimen.TEXT_SIZE_BIG, color: enabled?textEnab_(context):textDisab_(context), decoration: crossOut?TextDecoration.lineThrough:null);

  const IndivCompTaskSkeletonWidget({
    this.leading,
    this.title,
    this.titleBottom,
    this.description,
    this.elevation=0,
    this.trailing,
    this.bottom,
    this.front,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) => BorderMaterial(
    child: Padding(
      padding: const EdgeInsets.only(top: padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Stack(
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      const SizedBox(width: IndivCompTaskSkeletonWidget.padding),
                      Expanded(child: title??Container()),

                      if(trailing != null)
                        const SizedBox(width: 12.0),

                      if(trailing != null)
                        trailing!,

                      const SizedBox(width: IndivCompTaskSkeletonWidget.padding),

                    ],
                  ),

                  if(titleBottom != null)
                    titleBottom!,

                  if(description != null)
                    Padding(
                      padding: const EdgeInsets.only(
                          top: IndivCompTaskSkeletonWidget.padding,
                          left: IndivCompTaskSkeletonWidget.padding,
                          right: IndivCompTaskSkeletonWidget.padding
                      ),
                      child: description,
                    ),
                ],
              ),

              if(front != null)
                front!

            ],
          ),

          const SizedBox(height: IndivCompTaskSkeletonWidget.padding),

          if(bottom != null)
            bottom!,

        ],
      ),
    ),
  );

}

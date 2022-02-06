import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IndivCompTaskSkeletonWidget extends StatelessWidget{

  static const double padding = 18.0;

  final Widget leading;
  final Widget title;
  final Widget titleBottom;
  final Widget description;

  final Widget trailing;
  final Widget bottom;

  final Widget front;
  final void Function() onTap;

  static TextStyle pointsTextStyle(BuildContext context, {bool enabled: true, bool crossOut: false}) => AppTextStyle(
      fontWeight: weight.halfBold, fontSize: 32.0, color: enabled?textEnab_(context):textDisab_(context), decoration: crossOut?TextDecoration.lineThrough:null);

  static TextStyle titleTextStyle(BuildContext context, {bool enabled: true, bool crossOut: false}) => AppTextStyle(
      fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_APPBAR, color: enabled?textEnab_(context):textDisab_(context), decoration: crossOut?TextDecoration.lineThrough:null);

  static TextStyle descriptionTextStyle(BuildContext context, {bool enabled: true, bool crossOut: false}) => AppTextStyle(
      fontSize: Dimen.TEXT_SIZE_BIG, color: enabled?textEnab_(context):textDisab_(context), decoration: crossOut?TextDecoration.lineThrough:null);

  const IndivCompTaskSkeletonWidget({this.leading, this.title, this.titleBottom, this.description, this.trailing, this.bottom, this.front, this.onTap});

  @override
  Widget build(BuildContext context) {

    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: cardEnab_(context),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(
          top: padding,
          //left: Dimen.DEF_MARG,
          //right: Dimen.DEF_MARG,
          //bottom: Dimen.DEF_MARG,
        ),
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

                        SizedBox(width: IndivCompTaskSkeletonWidget.padding),
                        Expanded(child: title??Container()),

                        if(trailing != null)
                          SizedBox(width: 12.0),

                        if(trailing != null)
                          trailing,

                        SizedBox(width: IndivCompTaskSkeletonWidget.padding),

                      ],
                    ),

                    if(titleBottom != null)
                      titleBottom,

                    if(description != null)
                      Padding(
                        padding: EdgeInsets.only(
                            top: IndivCompTaskSkeletonWidget.padding,
                            left: IndivCompTaskSkeletonWidget.padding,
                            right: IndivCompTaskSkeletonWidget.padding
                        ),
                        child: description,
                      ),
                  ],
                ),

                if(front != null)
                  front

              ],
            ),

            SizedBox(height: IndivCompTaskSkeletonWidget.padding),

            if(bottom != null)
              bottom,

          ],
        ),
      ),
    );

  }

}

class IndivTaskWidgetPointsWidget extends StatelessWidget{

  static const IconData icon = MdiIcons.circleMultipleOutline;

  final int points;
  final Color textColor;
  final bool crossOut;
  const IndivTaskWidgetPointsWidget(this.points, {this.textColor, this.crossOut: false});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text('$points', style: IndivCompTaskSkeletonWidget.pointsTextStyle(context, crossOut: crossOut).copyWith(color: textColor??textEnab_(context))),
      SizedBox(width: 6.0),
      Icon(icon, size: 30.0, color: textColor??textEnab_(context))
    ],
  );


}
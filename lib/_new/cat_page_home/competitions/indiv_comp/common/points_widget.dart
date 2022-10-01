import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_icon.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PointsWidget extends StatelessWidget{

  static const double fontSizeCoeff = .8;

  final int? points;
  final String prefix;
  final double size;
  final double? textSize;
  final Color? textColor;
  final Axis orientation;

  const PointsWidget({
    required this.points,
    this.prefix = '',
    this.size = PointsIcon.defSize,
    this.textSize,
    this.textColor,
    this.orientation = Axis.horizontal,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [

      Text(
          '$prefix$points ',
          style: AppTextStyle(
              fontSize: textSize??(fontSizeCoeff*size),
              fontWeight: weight.bold,
              color: textColor
          )
      ),

      PointsIcon(size: size),

    ];

    if(orientation == Axis.horizontal)
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    else
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
  }

}


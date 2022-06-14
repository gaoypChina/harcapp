import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'models/indiv_comp.dart';


class IndivCompThumbnailWidget extends StatelessWidget{

  static dynamic defHeroTag(IndivComp comp) => 'heroTagIndivCompThumbnail${comp.key}';

  static const double defSize = 72.0;
  static const double iconSizeFactor = .6;
  static const double borderSizeFactor = .1;
  static const double outerRadiusSizeFactor = .25;
  static const double innerRadiusSizeFactor = .16;

  final String? iconKey;
  final String? colorsKey;

  final double size;
  final double elevation;
  final void Function()? onTap;
  final dynamic heroTag;

  const IndivCompThumbnailWidget({
    required this.iconKey,
    required this.colorsKey,
    this.size=defSize,
    this.elevation = 0,
    this.onTap,
    this.heroTag,
    super.key});

  static IndivCompThumbnailWidget random() => IndivCompThumbnailWidget(
      iconKey: CommonIconData.randomKey,
      colorsKey: CommonColorData.randomKey,
  );

  static IndivCompThumbnailWidget from({required IndivComp comp, double? size, double elevation = 0, dynamic heroTag}) => IndivCompThumbnailWidget(
    iconKey: comp.iconKey,
    colorsKey: comp.colorsKey,
    size: size??defSize,
    elevation: elevation,
    heroTag: heroTag,
  );

  @override
  Widget build(BuildContext context) {

    CommonColorData colors = CommonColorData.ALL[colorsKey!]!;
    IconData? icon = CommonIconData.ALL[iconKey!];

    Widget widget = SizedBox(
      width: size,
      height: size,
      child: SimpleButton(
          onTap: onTap,
          elevation: elevation,
          radius: outerRadiusSizeFactor*size,
          color: colors.colorStart,
          colorEnd: colors.colorEnd,
          child: Padding(
            padding: EdgeInsets.all(borderSizeFactor*size),
            child: Material(
              animationDuration: Duration.zero,
              borderRadius: BorderRadius.circular(innerRadiusSizeFactor*size),
              clipBehavior: Clip.hardEdge,
              color: background_(context),
              child: GradientIcon(
                  icon,
                  colorStart: colors.colorStart,
                  colorEnd: colors.colorEnd,
                  size: iconSizeFactor*size
              ),
            ),
          )
      ),
    );

    if(heroTag == null)
      return widget;
    else
      return Hero(
        tag: heroTag,
        child: widget,
      );
  }

}
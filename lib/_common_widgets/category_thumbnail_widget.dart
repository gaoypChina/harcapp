import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class CategoryThumbnailCommonWidget extends StatelessWidget{

  final Color color;
  final double size;
  final bool elevated;
  final IconData? icon;
  final Color? iconColor;
  final String? svgPath;
  final double svgSizeFraction;
  final String? text;

  static CategoryThumbnailCommonWidget fromIcon({
    required Color color,
    required double size,
    required bool elevated,
    required IconData icon,
    Color? iconColor,
  }) => CategoryThumbnailCommonWidget(
    color: color,
    size: size,
    elevated: elevated,
    icon: icon,
    iconColor: iconColor,
  );

  static CategoryThumbnailCommonWidget fromSvg({
    required Color color,
    Color? iconColor,
    required double size,
    required bool elevated,
    required String svgPath,
    double svgSizeFraction = 1,
  }) => CategoryThumbnailCommonWidget(
    color: color,
    iconColor: iconColor,
    size: size,
    elevated: elevated,
    svgPath: svgPath,
    svgSizeFraction: svgSizeFraction,
  );

  static CategoryThumbnailCommonWidget fromText({
    required Color color,
    Color? iconColor,
    required double size,
    required bool elevated,
    required String text,
  }) => CategoryThumbnailCommonWidget(
    color: color,
    iconColor: iconColor,
    size: size,
    elevated: elevated,
    text: text,
  );

  const CategoryThumbnailCommonWidget({
    required this.color,
    this.iconColor,
    required this.size,
    required this.elevated,
    this.icon,
    this.svgPath,
    this.svgSizeFraction = 1,
    this.text,
    super.key
  });

  @override
  Widget build(BuildContext context) => Material(
      elevation: elevated?2.0:0,
      borderRadius: BorderRadius.circular(size),
      color: color,
      child: Builder(
        builder: (context){
          if(icon != null)
            return SizedBox(
              width: size,
              height: size,
              child: Center(
                child: Icon(icon, size: .9*size, color: iconColor??Colors.black),
              ),
            );

          if(svgPath != null)
            return SizedBox(
              width: size,
              height: size,
              child: Center(
                child: SvgPicture.asset(
                  svgPath!,
                  width: svgSizeFraction*size,
                  height: svgSizeFraction*size,
                ),
              ),
            );

          if(text != null)
            return SizedBox(
              width: size,
              height: size,
              child: Center(
                child: Text(
                    text!,
                    style: AppTextStyle(
                        color: iconColor??Colors.black,
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.bold
                    )
                ),
              ),
            );

          return Container();
        },
      )
  );

}
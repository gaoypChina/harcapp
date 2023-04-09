import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';

class CategoryThumbnailCommonWidget extends StatelessWidget{

  static const borderSize = 1.2;

  final Color color;
  final Color? colorEnd;
  final double size;
  final bool elevated;
  final IconData? icon;
  final Color? iconColor;
  final String? svgPath;
  final double svgSizeFraction;
  final String? text;

  static CategoryThumbnailCommonWidget fromIcon({
    required Color color,
    Color? colorEnd,
    required double size,
    required bool elevated,
    required IconData icon,
    Color? iconColor,
  }) => CategoryThumbnailCommonWidget(
    color: color,
    colorEnd: colorEnd,
    size: size,
    elevated: elevated,
    icon: icon,
    iconColor: iconColor,
  );

  static CategoryThumbnailCommonWidget fromSvg({
    required Color color,
    Color? colorEnd,
    Color? iconColor,
    required double size,
    required bool elevated,
    required String svgPath,
    double svgSizeFraction = 1,
  }) => CategoryThumbnailCommonWidget(
    color: color,
    colorEnd: colorEnd,
    iconColor: iconColor,
    size: size,
    elevated: elevated,
    svgPath: svgPath,
    svgSizeFraction: svgSizeFraction,
  );

  static CategoryThumbnailCommonWidget fromText({
    required Color color,
    Color? endColor,
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
    this.colorEnd,
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
    color: iconColor??colorEnd??color,
    child: Padding(
      padding: const EdgeInsets.all(borderSize),
      child: GradientWidget(
          borderRadius: BorderRadius.circular(size - 2*borderSize),
          duration: Duration.zero,
          colorStart: color,
          colorEnd: colorEnd??color,
          child: Builder(
            builder: (context){
              if(icon != null)
                return SizedBox(
                  width: size - 2*borderSize,
                  height: size - 2*borderSize,
                  child: Center(
                    child: Icon(icon, size: .9*(size - 2*borderSize), color: iconColor??Colors.black),
                  ),
                );

              if(svgPath != null)
                return SizedBox(
                  width: size - 2*borderSize,
                  height: size - 2*borderSize,
                  child: Center(
                    child: SvgPicture.asset(
                      svgPath!,
                      width: svgSizeFraction*(size - 2*borderSize),
                      height: svgSizeFraction*(size - 2*borderSize),
                    ),
                  ),
                );

              if(text != null)
                return SizedBox(
                  width: size - 2*borderSize,
                  height: size - 2*borderSize,
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
      ),
    ),
  );

}
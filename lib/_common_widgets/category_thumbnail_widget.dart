import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';

class CategoryThumbnailCommonWidget extends StatelessWidget{

  static const double defBorderSize = 1.2;
  static double borderSize(double size) => defBorderSize*size/24;

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
  
  Color effectiveIconColor(BuildContext context) => iconColor??
      (color == Colors.transparent && (colorEnd == null || colorEnd == Colors.transparent)?
      iconEnab_(context):
      Colors.black);
  
  @override
  Widget build(BuildContext context) => Material(
    elevation: elevated?2.0:0,
    borderRadius: BorderRadius.circular(size),
    color: iconColor??colorEnd??color,
    child: Padding(
      padding: EdgeInsets.all(borderSize(size)),
      child: GradientWidget(
          borderRadius: BorderRadius.circular(size - 2*borderSize(size)),
          duration: Duration.zero,
          colorStart: color,
          colorEnd: colorEnd??color,
          child: Builder(
            builder: (context){
              if(icon != null)
                return SizedBox(
                  width: size - 2*borderSize(size),
                  height: size - 2*borderSize(size),
                  child: Center(
                    child: Icon(
                        icon,
                        size: .9*(size - 2*borderSize(size)),
                        color: effectiveIconColor(context)
                    ),
                  ),
                );

              if(svgPath != null)
                return SizedBox(
                  width: size - 2*borderSize(size),
                  height: size - 2*borderSize(size),
                  child: Center(
                    child: SvgPicture.asset(
                      svgPath!,
                      width: svgSizeFraction*(size - 2*borderSize(size)),
                      height: svgSizeFraction*(size - 2*borderSize(size)),
                    ),
                  ),
                );

              if(text != null)
                return SizedBox(
                  width: size - 2*borderSize(size),
                  height: size - 2*borderSize(size),
                  child: Center(
                    child: Text(
                        text!,
                        style: AppTextStyle(
                            color: effectiveIconColor(context),
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
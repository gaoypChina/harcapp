import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import 'common/community_cover_colors.dart';

class CommunityThumbnailWidget extends StatelessWidget{

  static const double defSize = 50.0 + 2*defPaddingSize;
  static const double defBorderWidth = Dimen.defMarg;
  static const double defPaddingSize = Dimen.ICON_MARG - defBorderWidth;
  static const double defRadius = 14.0;

  static double border(double size) => defBorderWidth * (size/defSize);
  static double padding(double size) => defPaddingSize * (size/defSize);
  static double radius_(double size) => defRadius * (size/defSize);

  final String iconKey;
  final String communityKey;
  final PaletteGenerator? palette;
  final bool colorsInverted;

  final Color? backgroundColor;
  final Color? borderColor;
  final Color? iconColor;

  final double size;
  final double borderSize;
  final double paddingSize;
  final double radius;
  final void Function()? onTap;
  final bool heroTag;

  const CommunityThumbnailWidget(
      this.iconKey,
      this.communityKey,
      { this.palette,
        this.colorsInverted = false,

        this.backgroundColor,
        this.borderColor,
        this.iconColor,

        this.size = defSize,
        this.borderSize = defBorderWidth,
        this.paddingSize = defPaddingSize,
        this.radius = defRadius,
        this.onTap,
        this.heroTag = true,
        super.key
      });

  @override
  Widget build(BuildContext context){

    Widget child = Material(
      borderRadius: BorderRadius.circular(radius),
      clipBehavior: Clip.hardEdge,

      color: borderColor??(colorsInverted?
      CommunityCoverColors.backgroundColor(context, palette):
      CommunityCoverColors.cardColor(context, palette)),

      child: Padding(
        padding: EdgeInsets.all(borderSize),
        child: Material(
          borderRadius: BorderRadius.circular(radius*(size - 2*borderSize)/size),
          clipBehavior: Clip.hardEdge,

          color: backgroundColor??(colorsInverted?
          CommunityCoverColors.cardColor(context, palette):
          CommunityCoverColors.backgroundColor(context, palette)),

          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.all(paddingSize),
              child: Icon(
                CommonIconData.get(iconKey),
                size: size - 2*paddingSize,
                color: iconColor,
              ),
            ),
          ),
        ),
      ),
    );

    // child = Material(
    //   shape: RoundedRectangleBorder(
    //     side: BorderSide(
    //       color: borderColor??(colorsInverted?
    //       CommunityCoverColors.backgroundColor(context, palette):
    //       CommunityCoverColors.cardColor(context, palette)),
    //       width: borderSize
    //     ),
    //     borderRadius: BorderRadius.circular(radius),
    //   ),
    //   clipBehavior: Clip.hardEdge,
    //
    //   color: backgroundColor??(colorsInverted?
    //   CommunityCoverColors.cardColor(context, palette):
    //   CommunityCoverColors.backgroundColor(context, palette)),
    //
    //   child: InkWell(
    //     onTap: onTap,
    //     child: Padding(
    //       padding: EdgeInsets.all(paddingSize),
    //       child: Icon(
    //         CommonIconData.get(iconKey),
    //         size: size - 2*paddingSize,
    //         color: iconColor,
    //       ),
    //     ),
    //   ),
    // );

    if(!heroTag)
      return child;

    return Hero(
      tag: 'CommunityThumbnailWidget$communityKey',
      child: child
    );

  }

}

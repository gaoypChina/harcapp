import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import 'common/community_cover_colors.dart';

class CommunityThumbnailWidget extends StatelessWidget{

  static const double defSize = 54.0 + 2*defPaddingSize;
  static const double defBorderWidth = Dimen.defMarg;
  static const double defPaddingSize = Dimen.ICON_MARG;
  static const double defRadius = AppCard.bigRadius;

  static double border(double size) => defBorderWidth * (size/defSize);
  static double padding(double size) => defPaddingSize * (size/defSize);
  static double radius_(double size) => defRadius * (size/defSize);

  final String iconKey;
  final String communityKey;
  final PaletteGenerator? palette;
  final bool colorsInverted;
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
        this.size = defSize,
        this.borderSize = defBorderWidth,
        this.paddingSize = defPaddingSize,
        this.radius = AppCard.bigRadius,
        this.onTap,
        this.heroTag = true,
        super.key
      });

  @override
  Widget build(BuildContext context){

    Widget child = Material(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorsInverted?
          CommunityCoverColors.backgroundColor(context, palette):
          CommunityCoverColors.cardColor(context, palette),
          width: borderSize
        ),
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,

      color: colorsInverted?
      CommunityCoverColors.cardColor(context, palette):
      CommunityCoverColors.backgroundColor(context, palette),

      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: Icon(
            CommonIconData.get(iconKey),
            size: size - 2*paddingSize,
          ),
        ),
      ),
    );

    if(!heroTag)
      return child;

    return Hero(
      tag: 'CommunityThumbnailWidget$communityKey',
      child: child
    );

  }

}

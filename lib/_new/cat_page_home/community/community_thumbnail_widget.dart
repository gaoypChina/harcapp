import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import 'common/community_cover_colors.dart';

class CommunityThumbnailWidget extends StatelessWidget{

  static const double defSize = 54.0 + 2*defPaddingSize;
  static const double defBorderWidth = Dimen.DEF_MARG;
  static const double defPaddingSize = Dimen.ICON_MARG;

  final String iconKey;
  final PaletteGenerator? palette;
  final double size;
  final double borderSize;
  final double paddingSize;
  final double radius;
  final void Function()? onTap;
  final dynamic heroTag;

  const CommunityThumbnailWidget(
      this.iconKey,
      { this.palette,
        this.size = defSize,
        this.borderSize = defBorderWidth,
        this.paddingSize = defPaddingSize,
        this.radius = AppCard.BIG_RADIUS,
        this.heroTag,
        this.onTap,
        super.key
      });

  @override
  Widget build(BuildContext context){

    Widget child = Material(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CommunityCoverColors.cardColor(context, palette), width: borderSize),
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,
      color: CommunityCoverColors.backgroundColor(context, palette),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(paddingSize),
          child: Icon(
            CommonIconData.ALL[iconKey],
            size: size - 2*paddingSize,
          ),
        ),
      ),
    );

    if(heroTag == null)
      return child;

    return Hero(
      tag: 'CommunityThumbnailWidget$iconKey',
      child: child
    );

  }

}

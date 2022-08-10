import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import 'common/community_cover_colors.dart';

class CommunityThumbnailWidget extends StatelessWidget{

  final String iconKey;
  final PaletteGenerator? palette;

  const CommunityThumbnailWidget(this.iconKey, {this.palette, super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: 'CommunityThumbnailWidget$iconKey',
    child: Material(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: CommunityCoverColors.cardColor(context, palette), width: Dimen.DEF_MARG),
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
      ),
      clipBehavior: Clip.hardEdge,
      color: CommunityCoverColors.backgroundColor(context, palette),
      child: Padding(
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        child: Icon(
          CommonIconData.ALL[iconKey],
          size: 48.0,
        ),
      ),
    )
  );

}

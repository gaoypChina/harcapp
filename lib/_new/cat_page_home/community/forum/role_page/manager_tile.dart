import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../common/community_cover_colors.dart';

class ForumManagerTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final ForumManager manager;
  final PaletteGenerator? palette;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? subtitle;
  final dynamic heroTag;

  const ForumManagerTile({
    required this.manager,
    this.palette,

    this.onTap,
    this.onLongPress,
    this.subtitle,
    this.heroTag,
    super.key
  });

  @override
  Widget build(BuildContext context) => AccountTile(
    manager.name,
    shadow: manager.shadow,

    thumbnailColor: CommunityCoverColors.cardColor(context, palette),
    thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
    subtitle: subtitle,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
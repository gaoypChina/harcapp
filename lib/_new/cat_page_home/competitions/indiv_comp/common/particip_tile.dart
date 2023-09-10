import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../../../../../account/account_tile.dart';

class ParticipTile extends StatelessWidget{

  static const double height = AccountTile.height;
  static const double horizontalPadding = 16.0;

  final IndivCompParticip particip;

  final bool selected;
  final Color? selectedTextColor;
  final Color? selectedThumbnailBorderColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;
  final IconData? markIcon;
  final dynamic heroTag;
  final bool thumbnailTapable;

  const ParticipTile({
    required this.particip,
    this.selected=false,
    this.selectedTextColor,
    this.selectedThumbnailBorderColor,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.subtitle,
    this.markIcon,
    this.heroTag,
    this.thumbnailTapable = false,
    super.key
  });

  @override
  Widget build(BuildContext context) => AccountTile(
    particip.name,
    shadow: particip.shadow,
    
    textColor: particip.profile.active?(selected?selectedTextColor:iconEnab_(context)):hintEnab_(context),
    backgroundColor: selected?backgroundIcon_(context):Colors.transparent,
    thumbnailBorderColor: selected?selectedThumbnailBorderColor:null,
    leading: leading,
    trailing: trailing,
    subtitle: subtitle,
    markIcon: markIcon,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
    thumbnailTapable: thumbnailTapable,
  );
  
}
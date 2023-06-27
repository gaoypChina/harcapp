import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../../../../../account/account_tile.dart';

class ParticipTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final IndivCompParticip particip;

  final bool selected;
  final Color? selectedTextColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;
  final IconData? mardIcon;
  final dynamic heroTag;

  const ParticipTile({
    required this.particip,
    this.selected=false,
    this.selectedTextColor,
    this.onTap,
    this.onLongPress,
    this.leading,
    this.trailing,
    this.subtitle,
    this.mardIcon,
    this.heroTag,
    super.key
  });

  @override
  Widget build(BuildContext context) => AccountTile(
    particip.name,
    shadow: particip.shadow,
    
    textColor: particip.profile.active?(selected?selectedTextColor:iconEnab_(context)):hintEnab_(context),
    backgroundColor: selected?cardEnab_(context):Colors.transparent,
    leading: leading,
    trailing: trailing,
    subtitle: subtitle,
    markIcon: mardIcon,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
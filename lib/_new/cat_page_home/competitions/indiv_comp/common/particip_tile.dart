import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../../../../../account/account_tile.dart';
import '../comp_role.dart';

class ParticipTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final String userKey;
  final String name;
  final bool shadow;
  final bool active;
  final CompRole role;

  final bool anythingSelected;
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
        required this.userKey,
        required this.name,
        required this.shadow,
        required this.active,
        required this.role,

        required this.anythingSelected,
        this.selected=false, this.selectedTextColor,
        this.onTap,
        this.onLongPress,
        this.leading,
        this.trailing,
        this.subtitle,
        this.mardIcon,
        this.heroTag,
        super.key
      });

  static ParticipTile fromUserData(UserData userData, {bool active = true, CompRole role = CompRole.OBSERVER, heroTag}) =>
      ParticipTile(
          userKey: userData.key,
          shadow: userData.shadow,
          name: userData.name,
          active: active,
          role: role,
          anythingSelected: false,
          heroTag: heroTag
      );

  static ParticipTile fromIndivCompParticip(IndivCompParticip particip, {heroTag}) =>
      ParticipTile(
          userKey: particip.key,
          name: particip.name,
          shadow: particip.shadow,
          active: particip.profile.active,
          role: particip.profile.role,
          anythingSelected: false,
          heroTag: heroTag
      );

  @override
  Widget build(BuildContext context) => AccountTile(
    name,
    shadow: shadow,
    
    textColor: active?(selected?selectedTextColor:iconEnab_(context)):hintEnab_(context),
    backgroundColor: selected?cardEnab_(context):Colors.transparent,
    leading: leading,
    trailing: trailing,
    subtitle: subtitle,
    mardIcon: mardIcon,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
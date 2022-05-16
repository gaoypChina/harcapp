import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../../../../../account/account_tile.dart';
import '../circle_role.dart';
import '../model/member.dart';

class MemberTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final String userKey;
  final String name;
  final bool shadow;
  final CircleRole? role;

  final bool anythingSelected;
  final bool selected;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;
  final IconData? mardIcon;
  final dynamic heroTag;

  const MemberTile({
        required this.userKey,
        required this.name,
        required this.shadow,
        this.role,

        required this.anythingSelected,
        this.selected=false,
        this.selectedColor,
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

  static MemberTile fromUserData(UserData userData, {heroTag}) =>
      MemberTile(
          userKey: userData.key,
          shadow: userData.shadow,
          name: userData.name,
          anythingSelected: false,
          heroTag: heroTag
      );

  static MemberTile fromMember(Member mem, {heroTag}) =>
      MemberTile(
          userKey: mem.key,
          name: mem.name,
          shadow: mem.shadow,
          role: mem.role,
          anythingSelected: false,
          heroTag: heroTag
      );

  @override
  Widget build(BuildContext context) => AccountTile(
    name,
    shadow: shadow,
    
    textColor: selected?selectedTextColor:iconEnab_(context),
    backgroundColor: selected?selectedColor??cardEnab_(context):Colors.transparent,
    leading: leading,
    trailing: trailing,
    subtitle: subtitle,
    mardIcon: mardIcon,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import '../../forum_role.dart';

class ManagerTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final String userKey;
  final String name;
  final bool shadow;
  final ForumRole? role;

  final bool anythingSelected;
  final bool selected;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subtitle;
  final IconData? mardIcon;
  final dynamic heroTag;

  const ManagerTile({
        required this.userKey,
        required this.name,
        required this.shadow,
        this.role,

        required this.anythingSelected,
        this.selected=false,
        this.selectedColor,
        this.selectedTextColor,
        this.thumbnailColor,
        this.thumbnailBorderColor,
        this.onTap,
        this.onLongPress,
        this.leading,
        this.trailing,
        this.subtitle,
        this.mardIcon,
        this.heroTag,
        super.key
      });

  static ManagerTile fromUserData(UserData userData, {heroTag}) =>
      ManagerTile(
          userKey: userData.key,
          shadow: userData.shadow,
          name: userData.name,
          anythingSelected: false,
          heroTag: heroTag
      );

  static ManagerTile fromMember(ForumManager mem, {heroTag}) =>
      ManagerTile(
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
    thumbnailColor: thumbnailColor,
    thumbnailBorderColor: thumbnailBorderColor,
    leading: leading,
    trailing: trailing,
    subtitle: subtitle,
    mardIcon: mardIcon,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
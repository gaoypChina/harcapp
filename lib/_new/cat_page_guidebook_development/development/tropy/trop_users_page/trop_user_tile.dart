import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_user.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

class TropUserTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final TropUser user;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? subtitle;
  final dynamic heroTag;

  const TropUserTile({
    required this.user,

    this.onTap,
    this.onLongPress,
    this.subtitle,
    this.heroTag,
    super.key
  });

  @override
  Widget build(BuildContext context) => AccountTile(
    user.name,
    shadow: user.shadow,

    subtitle: subtitle,
    thumbnailHeroTag: heroTag,

    thumbnailBorderColor: cardEnab_(context),
    thumbnailColor: cardEnab_(context),

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
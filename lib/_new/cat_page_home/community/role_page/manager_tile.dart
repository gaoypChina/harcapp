import 'package:flutter/material.dart';
import 'package:harcapp/account/account_tile.dart';
import '../model/community_manager.dart';

class CommunityManagerTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final CommunityManager manager;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? subtitle;
  final dynamic heroTag;

  const CommunityManagerTile({
    required this.manager,

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

    subtitle: subtitle,
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
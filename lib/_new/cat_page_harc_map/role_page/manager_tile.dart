import 'package:flutter/material.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import '../model/marker_manager.dart';

class MarkerManagerTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final MarkerManager manager;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget? subtitle;
  final dynamic heroTag;

  const MarkerManagerTile({
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

    thumbnailBorderColor: cardEnab_(context),
    thumbnailColor: cardEnab_(context),

    onTap: onTap,
    onLongPress: onLongPress,
  );
  
}
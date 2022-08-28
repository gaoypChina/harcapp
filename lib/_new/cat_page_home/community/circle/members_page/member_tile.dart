import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../../account/account_tile.dart';
import '../model/member.dart';

class MemberTile extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final Member member;
  final PaletteGenerator? palette;

  final void Function()? onTap;
  final void Function()? onLongPress;
  final dynamic heroTag;

  const MemberTile({
    required this.member,
    this.palette,
    this.onTap,
    this.onLongPress,
    this.heroTag,
    super.key
  });

  @override
  Widget build(BuildContext context) => AccountTile(
    member.name,
    subtitle: member.patrol==null?null:Text(member.patrol!, style: AppTextStyle()),
    shadow: member.shadow,

    thumbnailColor: CommunityCoverColors.backgroundColor(context, palette),
    thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
    thumbnailHeroTag: heroTag,

    onTap: onTap,
    onLongPress: onLongPress,
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import '../circle_role.dart';
import '../model/member.dart';

class MemberHeaderWidget extends StatelessWidget{

  final Member member;
  final PaletteGenerator? palette;
  final dynamic heroTag;

  const MemberHeaderWidget(this.member, {this.palette, this.heroTag, super.key});

  @override
  Widget build(BuildContext context) => AccountHeaderWidget.fromUserData(
    member,
    thumbnailColor: CommunityCoverColors.cardColor(context, palette),
    thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    showDetails: false,
    showDetailsButton: true,
    detailsBorderColor: CommunityCoverColors.cardColor(context, palette),
    shadow: member.shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(circleRoleToIcon[member.role], color: iconDisab_(context))
      ],
    ),
  );

}
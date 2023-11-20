import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/community_role.dart';
import '../model/community_manager.dart';

class ManagerHeaderWidget extends StatelessWidget{

  final CommunityManager manager;
  final PaletteGenerator? palette;
  final dynamic heroTag;

  const ManagerHeaderWidget(this.manager, {this.palette, this.heroTag, super.key});

  @override
  Widget build(BuildContext context) => AccountHeaderWidget.fromUserData(
    manager,
    thumbnailColor: cardEnab_(context),
    thumbnailBorderColor: cardEnab_(context),
    shadow: manager.shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(communityRoleToIcon[manager.role], color: iconDisab_(context))
      ],
    ),
  );

}
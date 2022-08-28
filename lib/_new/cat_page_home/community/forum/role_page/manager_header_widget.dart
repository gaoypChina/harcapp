import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import '../forum_role.dart';
import '../model/forum_manager.dart';

class ManagerHeaderWidget extends StatelessWidget{

  final ForumManager manager;
  final PaletteGenerator? palette;
  final dynamic heroTag;

  const ManagerHeaderWidget(this.manager, {this.palette, this.heroTag, super.key});

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    manager.name,
    shadow: manager.shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(forumRoleToIcon[manager.role], color: iconDisab_(context))
      ],
    ),
  );

}
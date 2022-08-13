import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../../forum_role.dart';

class ManagerHeaderWidget extends StatelessWidget{

  final String name;
  final bool shadow;
  final ForumRole role;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;
  final dynamic heroTag;

  const ManagerHeaderWidget(this.name, this.shadow, this.role, {this.thumbnailColor, this.thumbnailBorderColor, this.heroTag, super.key});

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    name,
    shadow: shadow,
    thumbnailColor: thumbnailColor,
    thumbnailBorderColor: thumbnailBorderColor,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(forumRoleToIcon[role], color: iconDisab_(context))
      ],
    ),
  );

}

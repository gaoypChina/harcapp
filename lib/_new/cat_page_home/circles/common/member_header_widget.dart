import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../circle_role.dart';

class MemberHeaderWidget extends StatelessWidget{

  final String name;
  final bool shadow;
  final CircleRole role;
  final dynamic heroTag;

  const MemberHeaderWidget(this.name, this.shadow, this.role, {this.heroTag, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    name,
    shadow: shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(circleRoleToIcon[role], color: iconDisab_(context))
      ],
    ),
  );

}
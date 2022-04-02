import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../comp_role.dart';

class ParticipHeaderWidget extends StatelessWidget{

  final String name;
  final bool shadow;
  final CompRole role;
  final dynamic heroTag;

  const ParticipHeaderWidget(this.name, this.shadow, this.role, {this.heroTag, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    name,
    shadow: shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(compRoleToIcon[role], color: iconDisab_(context))
      ],
    ),
  );

}
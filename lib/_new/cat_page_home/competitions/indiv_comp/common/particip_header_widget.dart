import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../comp_role.dart';

class ParticipHeaderWidget extends StatelessWidget{

  final String name;
  final CompRole role;
  final heroTag;

  const ParticipHeaderWidget(this.name, this.role, {this.heroTag});

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    name,
    leading: SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        SizedBox(width: Dimen.ICON_MARG),
        Icon(compRoleToIcon[role], color: iconDisab_(context))
      ],
    ),
  );

}
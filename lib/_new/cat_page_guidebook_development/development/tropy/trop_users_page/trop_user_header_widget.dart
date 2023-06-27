import 'package:flutter/cupertino.dart';
import 'package:harcapp/_app_common/accounts/account_header_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_user.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../model/trop_role.dart';

class TropUserHeaderWidget extends StatelessWidget{

  final TropUser manager;
  final dynamic heroTag;

  const TropUserHeaderWidget(this.manager, {this.heroTag, super.key});

  @override
  Widget build(BuildContext context) => AccountHeaderWidget(
    manager.name,
    thumbnailColor: cardEnab_(context),
    thumbnailBorderColor: cardEnab_(context),
    verified: manager.verified,
    shadow: manager.shadow,
    leading: const SizedBox(width: Dimen.ICON_SIZE + Dimen.ICON_MARG),
    trailing: Row(
      children: [
        const SizedBox(width: Dimen.ICON_MARG),
        Icon(tropRoleToIcon[manager.role], color: iconDisab_(context))
      ],
    ),
  );

}
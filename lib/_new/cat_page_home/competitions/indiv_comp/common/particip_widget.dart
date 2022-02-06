import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../comp_role.dart';

class ParticipWidget extends StatelessWidget{

  static const double horizontalPadding = 16.0;

  final String userKey;
  final String name;
  final bool active;
  final CompRole role;

  final bool anythingSelected;
  final bool selected;
  final Color selectedTextColor;
  final void Function() onTap;
  final void Function() onLongPress;
  final Widget trailing;
  final heroTag;

  const ParticipWidget({
        @required this.userKey,
        @required this.name,
        this.active = true,
        this.role,

        @required this.anythingSelected,
        this.selected=false, this.selectedTextColor,
        this.onTap,
        this.onLongPress,
        this.trailing,
        this.heroTag
      });

  static ParticipWidget fromUserData(UserData userData, {heroTag}) =>
      ParticipWidget(
          userKey: userData.key,
          name: userData.name,
          anythingSelected: false,
          heroTag: heroTag
      );

  static ParticipWidget fromIndivCompParticip(IndivCompParticip particip, {heroTag}) =>
      ParticipWidget(
          userKey: particip.key,
          name: particip.name,
          active: particip.profile.active,
          role: particip.profile.role,
          anythingSelected: false,
          heroTag: heroTag
      );

  @override
  Widget build(BuildContext context) => Material(
    animationDuration: Duration.zero,
    color: selected?cardEnab_(context):Colors.transparent,
    child: ListTile(
        selected: selected,
        onTap: onTap,
        onLongPress: onLongPress,
        contentPadding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, top: Dimen.ICON_MARG/2, bottom: Dimen.ICON_MARG/2),
        leading: heroTag == null?
        AccountThumbnailWidget(name, elevated: false) :
        Hero(
          tag: heroTag,
          child: AccountThumbnailWidget(name, elevated: false),
        ),
        title: Text(
            name,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: active?(selected?selectedTextColor:iconEnab_(context)):hintEnab_(context)
            )
        ),
        trailing: trailing
    ),
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'account_thumbnail_widget.dart';

class AccountTile extends StatelessWidget{

  final String name;
  final bool shadow;

  final Color textColor;
  final Color backgroundColor;

  final Widget trailing;
  final dynamic thumbnailHeroTag;
  final void Function() onTap;
  final void Function() onLongPress;

  const AccountTile(
      this.name,
      { this.shadow = false,
        this.textColor,
        this.backgroundColor,

        this.trailing,
        this.thumbnailHeroTag,
        this.onTap,
        this.onLongPress,
        Key key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    animationDuration: Duration.zero,
    color: backgroundColor??Colors.transparent,
    clipBehavior: Clip.none,
    child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        contentPadding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            top: Dimen.ICON_MARG/2,
            bottom: Dimen.ICON_MARG/2
        ),
        leading: thumbnailHeroTag == null?
        AccountThumbnailWidget(name, shadow: shadow, elevated: false) :
        Hero(
          tag: thumbnailHeroTag,
          child: AccountThumbnailWidget(name, shadow: shadow, elevated: false),
        ),
        title: Text(
            name,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: textColor
            )
        ),
        trailing: trailing,
    ),
  );

}
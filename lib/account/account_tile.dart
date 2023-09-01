import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'account_thumbnail_widget.dart';

class AccountTile extends StatelessWidget{

  static const double height = 72;

  final String name;
  final Widget? subtitle;
  final bool showVerified;
  final bool verified;
  final bool shadow;

  final Color? textColor;
  final Color? backgroundColor;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;
  final Color? thumbnailMarkerColor;

  final Widget? leading;
  final Widget? trailing;
  final bool showThumbnail;
  final dynamic thumbnailHeroTag;
  final EdgeInsets? contentPadding;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final bool thumbnailTapable;
  final IconData? markIcon;

  const AccountTile(
      this.name,
      { this.subtitle,
        this.showVerified = true,
        this.verified = false,
        this.shadow = false,
        this.textColor,
        this.backgroundColor,
        this.thumbnailColor,
        this.thumbnailBorderColor,
        this.thumbnailMarkerColor,

        this.leading,
        this.trailing,
        this.showThumbnail = true,
        this.thumbnailHeroTag,
        this.contentPadding,
        this.onTap,
        this.onLongPress,
        this.thumbnailTapable = false,
        this.markIcon,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    animationDuration: Duration.zero,
    color: backgroundColor??Colors.transparent,
    clipBehavior: Clip.none,
    child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        contentPadding: contentPadding??const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            top: Dimen.ICON_MARG/2,
            bottom: Dimen.ICON_MARG/2
        ),
        leading: !showThumbnail && leading == null?
        null:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [

            if(leading != null) leading!,

            if(showThumbnail && thumbnailHeroTag == null)
              AccountThumbnailWidget(
                  name: name,
                  showVerified: showVerified,
                  verified: verified,
                  shadow: shadow,
                  elevated: false,
                  color: thumbnailColor,
                  borderColor: thumbnailBorderColor,
                  markerColor: thumbnailMarkerColor,
                  backgroundColor: backgroundColor,
                  markIcon: markIcon,
                  tapable: thumbnailTapable,
              )
            else if(showThumbnail)
              Hero(
                tag: thumbnailHeroTag,
                child: AccountThumbnailWidget(
                    name: name,
                    showVerified: showVerified,
                    verified: verified,
                    shadow: shadow,
                    elevated: false,
                    color: thumbnailColor,
                    borderColor: thumbnailBorderColor,
                    markerColor: thumbnailMarkerColor,
                    backgroundColor: backgroundColor,
                    markIcon: markIcon
                ),
              ),

          ],
        ),
        title: Text(
            name,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: textColor
            )
        ),
        subtitle: subtitle,
        trailing: trailing,
    ),
  );

}
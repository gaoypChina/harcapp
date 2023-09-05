import 'package:flutter/cupertino.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

class AccountHeaderWidget extends StatelessWidget{

  final String name;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;
  final bool verified;
  final bool showSex;
  final bool shadow;
  final Widget? leading;
  final Widget? trailing;
  final dynamic heroTag;

  const AccountHeaderWidget(
      this.name,
      { this.thumbnailColor,
        this.thumbnailBorderColor,
        required this.verified,
        this.showSex = false,
        this.shadow = false,
        this.leading,
        this.trailing,
        this.heroTag,
        super.key
      });

  @override
  Widget build(BuildContext context){

    Widget child = Column(
      children: [

        AccountThumbnailWidget(
            name: name,
            verified: verified,
            shadow: shadow,
            size: 84,
            elevated: false,
            color: thumbnailColor,
            borderColor: thumbnailBorderColor,
            onTap: null
        ),

        const SizedBox(height: 12),

        IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: Dimen.ICON_FOOTPRINT),
              if(leading != null) leading!,
              Expanded(
                child: Text(name, style: AppTextStyle(fontSize: 24.0, fontWeight: weight.bold)),
              ),
              if(trailing != null) trailing!,
            ],
          ),
        ),

      ],
    );

    if(heroTag == null)
      return child;

    return Hero(
      tag: heroTag,
      child: child,
    );

  }

}
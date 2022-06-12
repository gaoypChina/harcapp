import 'package:flutter/cupertino.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

class AccountHeaderWidget extends StatelessWidget{

  final String name;
  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;
  final bool shadow;
  final Widget? leading;
  final Widget? trailing;
  final dynamic heroTag;

  const AccountHeaderWidget(
      this.name,
      { this.thumbnailColor,
        this.thumbnailBorderColor,
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
            shadow: shadow,
            size: 84,
            elevated: false,
            color: thumbnailColor,
            borderColor: thumbnailBorderColor,
            onTap: null
        ),

        const SizedBox(height: 24),

        IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
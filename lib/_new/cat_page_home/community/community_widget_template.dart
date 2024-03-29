import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'common_widgets/community_header_widget.dart';
import 'model/community.dart';
import 'model/community_category.dart';

class CommunityWidgetTemplate extends StatelessWidget{

  final String communityKey;
  final String iconKey;
  final String name;
  final CommunityCategory category;
  final Widget? subtitle;
  final Widget child;

  const CommunityWidgetTemplate(
      this.communityKey,
      this.iconKey,
      this.name,
      this.category,
      { this.subtitle,
        required this.child,
        super.key
      });

  @override
  Widget build(BuildContext context) => Consumer<CommunityProvider>(
      builder: (context, prov, _) => Material(
          clipBehavior: Clip.hardEdge,
          color: CommunityCoverColors.nonPaletteBackgroundColor(context),
          borderRadius: BorderRadius.circular(communityRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Padding(
                padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    left: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    bottom: Dimen.SIDE_MARG - Dimen.ICON_MARG
                ),
                child: CommunityHeaderWidget(
                  iconKey,
                  communityKey,
                  name,
                  category,
                  thumbnailBorderColor: CommunityCoverColors.backgroundColor(context, null),
                  thumbnailBackgroundColor: CommunityCoverColors.cardColor(context, null),
                ),
              ),

              if(subtitle != null)
                subtitle!,

              child,

            ],
          )
      )
  );

}
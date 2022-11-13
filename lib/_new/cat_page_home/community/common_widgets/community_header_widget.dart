import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../community_category_widget.dart';
import '../community_thumbnail_widget.dart';
import '../model/community_category.dart';

class CommunityHeaderWidget extends StatelessWidget{

  final String iconKey;
  final String communityKey;
  final String name;
  final CommunityCategory category;

  final Color? thumbnailBackgroundColor;
  final Color? thumbnailBorderColor;
  final Color? thumbnailColor;

  final Color? nameColor;
  final double? tagOpacity;

  final bool thumbnailHeroTag;

  const CommunityHeaderWidget(
      this.iconKey,
      this.communityKey,
      this.name,
      this.category,
      { this.thumbnailBackgroundColor,
        this.thumbnailBorderColor,
        this.thumbnailColor,

        this.nameColor,
        this.tagOpacity,

        this.thumbnailHeroTag = true,
        super.key
      });

  @override
  Widget build(BuildContext context) => Row(
    children: [

      CommunityThumbnailWidget(
        iconKey,
        communityKey,
        backgroundColor: thumbnailBackgroundColor,
        borderColor: thumbnailBorderColor,
        iconColor: thumbnailColor,
        heroTag: thumbnailHeroTag,
      ),

      const SizedBox(width: Dimen.ICON_MARG),

      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                  name,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG + 2,
                      fontWeight: weight.bold,
                      color: nameColor??iconEnab_(context)
                  )
              ),

              const SizedBox(height: Dimen.ICON_MARG),

              Align(
                alignment: Alignment.centerLeft,
                child:
                Opacity(
                  opacity: tagOpacity??1.0,
                  child: CommunityCategoryWidget(category, dense: true),
                ),
              ),

            ],
          )
      ),

    ],
  );

}
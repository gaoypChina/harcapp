import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

import '../community_thumbnail_widget.dart';
import '../model/community_category.dart';

class CommunityHeaderWidget extends StatelessWidget{

  final String iconKey;
  final String communityKey;
  final String name;
  final CommunityCategory category;

  final Color? thumbnailBackgroundColor;
  final Color? thumbnailBorderColor;

  const CommunityHeaderWidget(
      this.iconKey,
      this.communityKey,
      this.name,
      this.category,
      { this.thumbnailBackgroundColor,
        this.thumbnailBorderColor,
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
      ),

      const SizedBox(width: Dimen.ICON_MARG),

      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                  name,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: iconEnab_(context)
                  )
              ),

              const SizedBox(height: Dimen.defMarg),

              Align(
                alignment: Alignment.centerLeft,
                child: Material(
                    borderRadius: BorderRadius.circular(100),
                    color: hintEnab_(context),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.defMarg),
                      child: Text(
                          commCatToName[category]??'',
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_NORMAL,
                              fontWeight: weight.halfBold,
                              color: background_(context)
                          )
                      ),
                    )
                ),
              )

            ],
          )
      ),

    ],
  );

}
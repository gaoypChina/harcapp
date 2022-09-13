import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

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
          color: CommunityCoverColors.nonPaletteBackgroundColor(),
          borderRadius: BorderRadius.circular(communityRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    left: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    bottom: Dimen.SIDE_MARG - Dimen.ICON_MARG
                ),
                child: Row(
                  children: [

                    CommunityThumbnailWidget(iconKey, communityKey),

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

                            Row(
                              children: [

                                Material(
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

                                const SizedBox(width: Dimen.ICON_MARG),

                                if(subtitle != null)
                                  subtitle!

                              ],
                            )

                          ],
                        )
                    ),

                  ],
                ),
              ),

              child,

            ],
          )
      )
  );

}
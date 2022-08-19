import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'model/community.dart';

class CommunityWidgetTemplate extends StatelessWidget{

  final String iconKey;
  final String name;
  final Widget child;

  const CommunityWidgetTemplate(
      this.iconKey,
      this.name,
      { required this.child,
        super.key
      });

  @override
  Widget build(BuildContext context) => SizedBox(
      child: Consumer<CommunityProvider>(
        builder: (context, prov, _) => Material(
            clipBehavior: Clip.hardEdge,
            color: cardEnab_(context),
            borderRadius: BorderRadius.circular(AppCard.bigRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    left: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  ),
                  child: Row(
                    children: [

                      CommunityThumbnailWidget(iconKey),

                      const SizedBox(width: Dimen.ICON_MARG),

                      Expanded(
                        child: Text(
                            name,
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                fontWeight: weight.halfBold,
                                color: iconEnab_(context)
                            )
                        ),
                      ),

                    ],
                  ),
                ),

                child,

              ],
            )
        )
      )
  );

}
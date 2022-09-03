import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'common/community_cover_image_data.dart';

class CommunityGroupWidgetTemplate extends StatelessWidget{

  static const double height = 180;

  final CommunityCoverImageData coverImage;
  final IconData icon;
  final String text;
  final Widget? titleBottom;

  final void Function()? onTap;

  const CommunityGroupWidgetTemplate(
      this.coverImage,
      { required this.icon,
        required this.text,
        this.titleBottom,
        this.onTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: Material(
          elevation: AppCard.bigElevation,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [

                CoverImageWidget(coverImage),

                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                      decoration: BoxDecoration(
                          color: cardEnab_(context),
                          borderRadius: BorderRadius.circular(AppCard.bigRadius - 4)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: Dimen.ICON_MARG),

                          Row(
                            children: [
                              const SizedBox(width: Dimen.ICON_MARG),
                              Icon(icon),
                              const SizedBox(width: Dimen.ICON_MARG),
                              Text(
                                text,
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold,
                                    color: iconEnab_(context)
                                )
                              ),

                              const SizedBox(width: Dimen.ICON_MARG),

                            ],
                          ),

                          const SizedBox(height: Dimen.ICON_MARG),

                          if(titleBottom != null)
                            titleBottom!,

                          if(titleBottom != null)
                            const SizedBox(height: Dimen.ICON_MARG),

                        ],
                      )
                  ),
                ),

              ],
            ),
          )
      )
  );

}
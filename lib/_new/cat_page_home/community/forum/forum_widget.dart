import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_new/cat_page_home/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'model/forum.dart';

class ForumWidget extends StatelessWidget{

  static const double height = 180;

  final Forum forum;
  final void Function()? onTap;
  const ForumWidget(this.forum, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: Material(
          elevation: AppCard.bigElevation,
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: InkWell(
            onTap: onTap,
            child: Stack(
              fit: StackFit.expand,
              children: [

                CoverImage(forum.coverImage),

                Positioned(
                  top: 0,
                  left: 0,
                  height: Dimen.ICON_FOOTPRINT,
                  child: Material(
                      clipBehavior: Clip.hardEdge,
                      color: cardEnab_(context)!.withOpacity(.7),
                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(AppCard.BIG_RADIUS),
                          bottomRight: Radius.circular(AppCard.BIG_RADIUS),
                        ),
                        side: BorderSide(color: cardEnab_(context)!.withOpacity(.7), width: 4),
                      ),
                      child: Blur(
                        mode: TileMode.repeated,
                        sigma: 4,
                        child: Row(
                          children: [
                            const SizedBox(width: Dimen.ICON_MARG),
                            const Icon(MdiIcons.broadcast),
                            const SizedBox(width: Dimen.ICON_MARG),
                            Text(
                                'Forum',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold,
                                    color: iconEnab_(context)
                                )
                            ),

                            const SizedBox(width: Dimen.ICON_MARG),

                          ],
                        )
                      ),
                  ),
                ),

              ],
            ),
          )
      )
  );

}
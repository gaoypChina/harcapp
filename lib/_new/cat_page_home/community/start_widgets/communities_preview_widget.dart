import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../forum/model/forum.dart';
import '../model/community.dart';

class CommunitiesPreviewWidget extends StatelessWidget{

  final double width;
  final Widget child;

  const CommunitiesPreviewWidget({required this.width, required this.child, super.key});

  static CommunitiesPreviewWidget from({
    required BuildContext context,
    required double width,
    EdgeInsets padding = EdgeInsets.zero,
    required IconData icon,
    required String text,
    void Function()? onTap
  }) => CommunitiesPreviewWidget(
    width: width,
    child: SimpleButton(
        color: background_(context),
        margin: const EdgeInsets.all(Dimen.SIDE_MARG),
        padding: padding,
        borderRadius: BorderRadius.circular(1000), //AppCard.bigRadius),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Row(
            children: [
              Icon(icon, size: 60),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: AppTextStyle(
                      fontSize: 20.0,
                      color: iconEnab_(context)
                  ),
                ),
              )
            ],
          ),
        )
    ),
  );

  @override
  Widget build(BuildContext context) => Column(
    children: [

      Expanded(child: Container()),

      child,

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        child: Row(
          children: [

            Expanded(
              flex: 2,
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(communityRadius),
                child: CoverImageWidget(CommunityCoverImageData.allSample[43]),
              ),
            ),

            Expanded(child: Container()),

          ],
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        child: Row(
          children: [

            Expanded(child: Container()),

            Expanded(
              flex: 2,
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(communityRadius),
                child: CoverImageWidget(CommunityCoverImageData.allSample[34]),
              ),
            ),

          ],
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
        child: Row(
          children: [

            Expanded(
              flex: 2,
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(communityRadius),
                child: CoverImageWidget(CommunityCoverImageData.allSample[10]),
              ),
            ),

            Expanded(child: Container()),

          ],
        ),
      ),

      const SizedBox(height: Dimen.SIDE_MARG),

    ],
  );

}
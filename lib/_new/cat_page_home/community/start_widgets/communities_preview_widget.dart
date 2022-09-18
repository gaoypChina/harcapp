import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/dimen.dart';

class CommunitiesPreviewWidget extends StatelessWidget{

  const CommunitiesPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      Positioned.fill(
        child: Row(
          children: [

            Expanded(child: Container()),

            Expanded(
              flex: 2,
              child: Material(
                clipBehavior: Clip.hardEdge,
                elevation: 3.0,
                borderRadius: BorderRadius.circular(communityRadius),
                child: CoverImageWidget(CommunityCoverImageData.allSample[34]),
              ),
            ),

          ],
        ),
      ),

      Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Row(
            children: [

              Expanded(
                flex: 2,
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(communityRadius),
                  child: CoverImageWidget(CommunityCoverImageData.allSample[43]),
                ),
              ),

              Expanded(child: Container()),

            ],
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          Row(
            children: [

              Expanded(
                flex: 2,
                child: Material(
                  clipBehavior: Clip.hardEdge,
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(communityRadius),
                  child: CoverImageWidget(CommunityCoverImageData.allSample[10]),
                ),
              ),

              Expanded(child: Container()),

            ],
          ),

        ],
      ),

    ],
  );

}
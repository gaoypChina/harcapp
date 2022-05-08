import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'model/circle.dart';

class CircleTile extends StatelessWidget{
  
  final Circle circle;
  const CircleTile(this.circle, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){

    double height = 200;

    return SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [

            Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
              child: CoverImage(circle.coverImage),
            ),

            Positioned(
              top: -1.8*height,
              left: -.8*height,
              height: 2.3*height,
              width: 2.3*height,
              child: Material(
                borderRadius: BorderRadius.circular(2*height),
                color: background_(context)
              ),
            ),

            Positioned(
              top: Dimen.SIDE_MARG,
              left: Dimen.SIDE_MARG,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                      circle.name,
                      style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_APPBAR,
                        fontWeight: weight.bold,
                      )
                  ),

                  const SizedBox(height: Dimen.ICON_MARG),

                  Row(
                    children: [

                      Text(
                          '${circle.members.length}',
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.bold,
                            color: hintEnab_(context)
                          )
                      ),

                      const SizedBox(width: 3.0),

                      Icon(MdiIcons.accountMultiple, size: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),

                    ],
                  )

                ],
              )
            )

          ],
        )
    );
  }

}
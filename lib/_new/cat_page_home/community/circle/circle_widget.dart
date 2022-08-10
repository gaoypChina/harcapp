import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_new/cat_page_home/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'model/circle.dart';

class CircleWidget extends StatelessWidget{

  static const double height = 180;

  final Circle circle;
  final void Function()? onTap;
  const CircleWidget(this.circle, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: Consumer<CircleProvider>(
        builder: (context, prov, child) => Material(
            elevation: AppCard.bigElevation,
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            child: InkWell(
              onTap: onTap,
              child: Stack(
                fit: StackFit.expand,
                children: [

                  CoverImage(circle.coverImage),

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
                              const Icon(MdiIcons.googleCircles),
                              const SizedBox(width: Dimen.ICON_MARG),
                              Text(
                                  'Krąg',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      fontWeight: weight.halfBold,
                                      color: iconEnab_(context)
                                  )
                              ),

                              if(circle.awaitingCount != 0)
                                const SizedBox(width: 2*Dimen.ICON_MARG),

                              if(circle.awaitingCount != 0)
                                const Icon(MdiIcons.clockAlertOutline, color: Colors.red),

                              if(circle.awaitingCount != 0)
                                const SizedBox(width: Dimen.ICON_MARG),

                              if(circle.awaitingCount != 0)
                                Text(
                                    '${circle.awaitingCount}',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_BIG,
                                        color: Colors.red,
                                        fontWeight: weight.halfBold
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
      )
  );

}
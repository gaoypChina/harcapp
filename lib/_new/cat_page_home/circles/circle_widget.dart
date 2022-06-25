import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/circles/cover_image.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'model/circle.dart';

class CircleWidget extends StatelessWidget{

  static const double height = 220;

  final Circle circle;
  final void Function(Circle)? onTap;
  const CircleWidget(this.circle, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: Stack(
            fit: StackFit.expand,
            children: [

              InkWell(
                onTap: () => onTap?.call(circle),
                child: Material(
                  child: CoverImage(circle.coverImage),
                ),
              ),

              Positioned(
                top: -2.44*height,
                left: -1.0*height,
                height: 2.8*height,
                width: 2.8*height,
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

                      Row(
                        children: [

                          if(circle.awaitingCount != 0)
                            const Icon(MdiIcons.clockAlertOutline, color: Colors.red),

                          if(circle.awaitingCount != 0)
                            const SizedBox(width: Dimen.ICON_MARG),

                          Text(
                              circle.name,
                              style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_APPBAR,
                                fontWeight: weight.bold,
                              )
                          ),

                        ],
                      ),

                      const SizedBox(height: Dimen.ICON_MARG),

                      /*
                      Row(
                        children: [

                          Icon(MdiIcons.accountMultiple, color: hintEnab_(context)),
                          const SizedBox(width: Dimen.ICON_MARG),
                          Text(
                              '${circle.members.length}',
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  fontWeight: weight.bold,
                                  color: hintEnab_(context)
                              )
                          ),

                        ],
                      )

                       */
                    ],
                  )
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children: [

                    Expanded(
                      child: SimpleButton.from(
                          context: context,
                          color: background_(context),
                          icon: MdiIcons.googleCircles,
                          margin: const EdgeInsets.only(bottom: Dimen.DEF_MARG, left: Dimen.DEF_MARG),
                          borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppCard.BIG_RADIUS - 2)),
                          text: 'Krąg',
                          onTap: () => onTap?.call(circle)
                      ),
                    ),

                    Expanded(
                      child: SimpleButton.from(
                          context: context,
                          color: background_(context),
                          icon: MdiIcons.broadcast,
                          margin: const EdgeInsets.only(bottom: Dimen.DEF_MARG, right: Dimen.DEF_MARG),
                          borderRadius: const BorderRadius.horizontal(right: Radius.circular(AppCard.BIG_RADIUS - 2)),
                          text: 'Forum',
                          onTap: () => showAppToast(context, text: 'Będzie w przyszłości.')
                      ),
                    ),

                  ],
                ),
              )

            ],
          )
      )
  );

}
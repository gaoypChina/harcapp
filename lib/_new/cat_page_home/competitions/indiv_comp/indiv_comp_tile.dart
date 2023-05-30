import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/points_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../details/app_settings.dart';
import 'common/points_widget.dart';
import 'indiv_comp_thumbnail_widget.dart';
import 'models/indiv_comp.dart';
import 'models/rank_disp_type.dart';

class IndivCompTile extends StatelessWidget{

  static const double textSizeVal = 42.0;
  static const double textSizePkt = 32.0;

  final IndivComp comp;
  final Widget? leading;
  final Widget? trailing;
  final Widget? subTitle;
  final void Function(IndivComp)? onTap;
  final Color? participBorderColor;
  final Color? participBackgroundColor;
  final bool showPinned;

  IndivCompTile(
      this.comp,
      { this.leading,
        this.trailing,
        this.subTitle,
        this.onTap,
        this.participBorderColor,
        this.participBackgroundColor,
        this.showPinned = false
      }): super(key: ValueKey(comp));

  @override
  Widget build(BuildContext context) {

    List<Widget> othParticipWidgets = [];

    for(int i=0; i<comp.loadedParticips.length; i++){
      String othParticip = comp.loadedParticips[i].name;
      othParticipWidgets.add(
          Text(
              '$othParticip${i==comp.loadedParticips.length-1?'':', '}',
              style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_SMALL, color: hintEnab_(context)))
      );
    }

    return SimpleButton(
        clipBehavior: Clip.none,
        radius: AppCard.bigRadius,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        onTap: () => onTap?.call(comp),
        child: Row(
          children: [

            if(leading != null)
              leading!,

            Expanded(
              child: Row(
                children: [
                  IndivCompThumbnailWidget.from(
                      comp: comp,
                      heroTag: IndivCompThumbnailWidget.defHeroTag(comp)
                  ),

                  const SizedBox(width: Dimen.ICON_MARG),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        SizedBox(
                            height: 36.0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                comp.name,
                                style: AppTextStyle(
                                  fontSize: 18.0,
                                  fontWeight: weight.halfBold,
                                  color: AppSettings.isDark?comp.colors.colorStart:comp.colors.colorEnd,
                                ),
                                maxLines: 2,
                              ),
                            )
                        ),

                        SizedBox(
                            height: PointsIcon.defSize,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: subTitle??
                                  (comp.myProfile?.active == true?
                                  Row(
                                    children: [

                                      Icon(
                                        compRoleToIcon(comp.myProfile!.role),
                                        color: hintEnab_(context),
                                      ),

                                      const SizedBox(width: Dimen.ICON_MARG/2),
                                      Icon(MdiIcons.circleMedium, color: backgroundIcon_(context)),
                                      const SizedBox(width: Dimen.ICON_MARG/2),

                                      PointsWidget(
                                          points: comp.myProfile?.points,
                                          size: 32.0
                                      ),

                                      /*
                              AccountThumbnailRowWidget(
                                  comp.particips.map((particip) => particip.name).toList(),
                                  size: 24.0,
                                  clipBehavior: Clip.hardEdge,
                                  borderColor: participBorderColor,
                                  backgroundColor: participBackgroundColor,
                                  onTap: () => onTap?.call(comp),
                                )
                               */

                                    ],
                                  ):
                                  Text('obserwator', style: AppTextStyle(fontSize: PointsIcon.defSize, color: hintEnab_(context)))),
                            )
                        )

                      ],
                    ),
                  ),

                ],
              ),
            ),

            trailing??
                IndivCompRankIcon(
                  comp.myProfile!,
                  activeParticipCnt: comp.activeParticipCount,
                  showPercent: comp.rankDispType == RankDispType.RANGE_PERC,
                  colors: comp.colors,
                  size: 54.0,
                )
          ],
        )
    );

  }

}

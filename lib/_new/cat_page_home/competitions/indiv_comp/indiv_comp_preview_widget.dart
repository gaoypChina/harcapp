
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

import 'common/points_widget.dart';
import 'indiv_comp_thumbnail_widget.dart';
import 'models/indiv_comp.dart';

class IndivCompPreviewWidget extends StatelessWidget{

  static const double height = IndivCompThumbnailWidget.defSize + 2*sepSize + textSize;

  static const double sepSize = 3;
  static const double textSize = 24;

  final IndivComp comp;

  IndivCompPreviewWidget(this.comp): super(key: ValueKey(comp));

  void openCompPage(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IndivCompPage(comp))
  );

  @override
  Widget build(BuildContext context) => SimpleButton(
    clipBehavior: Clip.none,
    radius: AppCard.BIG_RADIUS,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    onTap: () => openCompPage(context),
    child: GradientWidget(
      radius: IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.outerRadiusSizeFactor,
      colorStart: comp.colors.colorEnd,
      colorEnd: comp.colors.colorStart,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IndivCompThumbnailWidget.from(
            comp: comp,
            heroTag: IndivCompThumbnailWidget.defHeroTag(comp),
            elevation: 6.0
          ),

          if(comp.profile.active)
            const SizedBox(height: sepSize),

          if(comp.profile.active)
            PointsWidget(
                points: comp.profile.points,
                size: textSize,
                textSize: .65*textSize,
                textColor: comp.colors.iconColor
            ),

          if(comp.profile.active)
            const SizedBox(height: sepSize),

        ],
      ),
    ),
  );

}

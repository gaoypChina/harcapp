
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import '../../../details/app_settings.dart';
import 'common/points_widget.dart';
import 'indiv_comp_thumbnail_widget.dart';
import 'models/indiv_comp.dart';

class IndivCompPreviewWidget extends StatelessWidget{

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
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        IndivCompThumbnailWidget.from(
            comp: comp,
            heroTag: IndivCompThumbnailWidget.defHeroTag(comp)
        ),

        if(comp.profile.active!)
          Positioned(
            bottom: -.1*IndivCompThumbnailWidget.defSize,
            right: -.1*IndivCompThumbnailWidget.defSize,
            child: Material(
              color: background_(context),
              borderRadius: BorderRadius.circular(2.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: PointsWidget(points: comp.profile.points, size: 24.0),
              ),
            ),
          ),

      ],
    ),
  );

}

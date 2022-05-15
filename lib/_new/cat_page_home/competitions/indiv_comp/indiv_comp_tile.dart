import 'package:flutter/material.dart';
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

class IndivCompTile extends StatelessWidget{

  static const double textSizeVal = 42.0;
  static const double textSizePkt = 32.0;

  final Widget? leading;
  final IndivComp comp;
  final bool showPinned;

  IndivCompTile(this.comp, {this.leading, this.showPinned = false}): super(key: ValueKey(comp));

  void openCompPage(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IndivCompPage(comp))
  );

  @override
  Widget build(BuildContext context) {

    List<Widget> othParticipWidgets = [];

    for(int i=0; i<comp.particips.length; i++){
      String othParticip = comp.particips[i].name;
      othParticipWidgets.add(
          Text(
              '$othParticip${i==comp.particips.length-1?'':', '}',
              style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_SMALL, color: hintEnab_(context)))
      );
    }

    return Column(
      children: [

        const SizedBox(height: 10),

        Row(
          children: [

            if(leading != null)
              leading!,

            Expanded(
              child: SimpleButton(
                clipBehavior: Clip.none,
                radius: AppCard.BIG_RADIUS,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                onTap: () => openCompPage(context),
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

                          const SizedBox(height: Dimen.DEF_MARG),

                          Row(
                            children: [

                              Expanded(
                                child: Text(
                                  comp.name,
                                  style: AppTextStyle(
                                    fontSize: 18.0,
                                    fontWeight: weight.bold,
                                    color: AppSettings.isDark?comp.colors.colorStart:comp.colors.colorEnd,
                                  ),
                                  maxLines: 2,
                                ),
                              ),

                              const SizedBox(width: Dimen.ICON_MARG),

                              Icon(
                                compRoleToIcon[comp.profile.role!],
                                color: hintEnab_(context),
                              ),

                              const SizedBox(width: Dimen.ICON_MARG),

                            ],
                          ),

                          const SizedBox(height: Dimen.DEF_MARG),

                          if(comp.profile.active!)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Expanded(
                                  child: AccountThumbnailRowWidget(
                                    comp.particips.map((particip) => particip.name).toList(),
                                    size: 24.0,
                                    clipBehavior: Clip.hardEdge,
                                    onTap: () => openCompPage(context),
                                  )
                                ),

                                const SizedBox(width: Dimen.DEF_MARG),

                                PointsWidget(points: comp.profile.points, size: 32.0),

                                const SizedBox(width: Dimen.DEF_MARG),

                              ],
                            )
                          else
                            Text('obserwator', style: AppTextStyle(fontSize: 42.0, color: hintEnab_(context))),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),

      ],
    );
  }

}

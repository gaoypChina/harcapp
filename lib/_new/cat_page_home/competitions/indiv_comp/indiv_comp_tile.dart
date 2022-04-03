
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

class IndivCompTile extends StatelessWidget{

  static const double textSizeVal = 42.0;
  static const double textSizePkt = 32.0;

  final Widget leading;
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
              leading,

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
                                compRoleToIcon[comp.profile.role],
                                color: hintEnab_(context),
                              ),

                              const SizedBox(width: Dimen.ICON_MARG),

                            ],
                          ),

                          const SizedBox(height: Dimen.DEF_MARG),

                          if(comp.profile.active)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                //IndivCompRankIcon(comp.profile, colors: comp.colors, size: 32),

                                Expanded(
                                  child: AccountThumbnailRowWidget(
                                    comp.particips.map((particip) => particip.name).toList(),
                                    size: 24.0,
                                    clipBehavior: Clip.hardEdge,
                                    onTap: () => openCompPage(context),
                                  )
                                ),

                                //Expanded(child: Container()),

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


class RankingWidget extends StatelessWidget{

  static const double defTextSize = IndivCompTile.textSizePkt;

  final IndivComp comp;
  final Color textColor;
  final double textSize;
  final weight fontWeight;
  final bool withHash;
  final bool clickable;

  const RankingWidget(
      this.comp,
      {this.textColor,
        this.textSize,
        this.fontWeight=weight.halfBold,
        this.withHash=true,
        this.clickable=false,
        Key key
      }): super(key: key);

  @override
  Widget build(BuildContext context) {
    if(comp.profile.showRank != null)
      return GestureDetector(
        child: Text(
            '${withHash?'#':''}${comp.profile.showRank==-1?'∞':comp.profile.showRank}',
            style: AppTextStyle(fontSize: textSize??defTextSize, color: textColor??textEnab_(context), fontWeight: fontWeight)
        ),
        onTap: clickable?(){
          String text;
          int rankPop = comp.profile.rankPopularity - 1;
          if(rankPop == 0)
            text = 'Tylko Ty masz ${comp.profile.points} punktów.';
          else if(rankPop == 1)
            text = 'Jeszcze 1 osoba ma ${comp.profile.points} punkt.';
          else if(rankPop >= 2 && rankPop <= 4)
            text = 'Jeszcze $rankPop osoby mają ${comp.profile.points} punkty.';
          else if(rankPop >= 5)
            text = 'Jeszcze $rankPop osób ma ${comp.profile.points} punktów.';

          if(text == null)
            showAppToast(context, text: 'Na razie wszyscy mają 0 punktów.');
          else
            showAppToast(context, text: text);

        }:null,
      );
    else
      return GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              'top',
              style: AppTextStyle(fontSize: 16.0, color: textColor??textEnab_(context)),
              maxLines: 1,
            ),
            AutoSizeText(
                comp.profile.showRankRange==null?'Pusty zakres':'${(comp.profile.showRankRange.item1*100).toInt()}-${(comp.profile.showRankRange.item2*100).toInt()}%',
                style: AppTextStyle(fontSize: 24.0, color: textColor??textEnab_(context), fontWeight: weight.halfBold),
                maxLines: 1,
            ),
          ],
        ),
        onTap: clickable?() => showAppToast(context, text: 'text'):null,
      );
  }

}
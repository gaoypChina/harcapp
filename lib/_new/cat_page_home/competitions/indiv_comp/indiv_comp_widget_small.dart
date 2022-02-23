
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_awards_page.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common/indiv_comp_task_skeleton_widget.dart';
import 'indiv_comp_thumbnail_widget.dart';
import 'models/indiv_comp.dart';

class IndivCompWidgetSmall extends StatelessWidget{

  static const double textSizeVal = 42.0;
  static const double textSizePkt = 32.0;

  final Widget leading;
  final IndivComp comp;
  final bool showPinned;

  IndivCompWidgetSmall(this.comp, {this.leading, this.showPinned = false}): super(key: ValueKey(comp));

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
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IndivCompPage(comp))
                ),
                child: Row(
                  children: [
                    IndivCompThumbnailWidget(comp, heroTag: comp),

                    const SizedBox(width: Dimen.ICON_MARG),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          Row(
                            children: [

                              Expanded(child: Text(
                                comp.name,
                                style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                                  fontWeight: weight.bold,
                                  color: hintEnab_(context),
                                ),
                                maxLines: 2,
                              )),

                              if(showPinned && comp.pinned)
                                SizedBox(
                                  width: RankingWidget.defTextSize,
                                  child: Center(
                                    child: Icon(MdiIcons.pin, color: backgroundIcon_(context), size: Dimen.TEXT_SIZE_APPBAR),
                                  ),
                                )
                            ],
                          ),

                          const SizedBox(height: Dimen.DEF_MARG),

                          if(comp.profile.active)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text('${comp.profile.points} ', style: AppTextStyle(fontSize: textSizeVal, fontWeight: weight.bold)),
                                Icon(
                                  IndivTaskWidgetPointsWidget.icon,
                                  size: .9*textSizeVal,
                                  color: textEnab_(context),
                                ),
                                //Text('pkt', style: AppTextStyle(fontSize: textSizePkt)),
                                Expanded(child: Container()),
                                RankingWidget(comp, textColor: hintEnab_(context)),
                                const SizedBox(width: 10.0),
                                rankToAwardWidget(comp.profile.showRank, size: RankingWidget.defTextSize)
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

  static const double defTextSize = IndivCompWidgetSmall.textSizePkt;

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


import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_progress_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_tile_widget_template.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_widget.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import '../../details/app_settings.dart';
import 'models_common/rank.dart';

class RankTileWidgetShare extends StatelessWidget {

  final SharedRankMetaData data;

  const RankTileWidgetShare(this.data, {super.key});

  @override
  Widget build(BuildContext context) {

    Rank rank = Rank.allMap[data.rankUniqName]!;

    Tuple2<List<IconData>, double> iconStuff = RankData.iconSizeMap[rank.data]!;
    RankColors colors = RankData.colors[rank.data]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        RankTileWidgetTemplate(
          colorStart: colors.start(AppSettings.isDark),
          colorEnd: colors.end(AppSettings.isDark),
          icons: iconStuff.item1,
          iconSize: iconStuff.item2,
          titleTop: data.userData.isMale?rank.titleMale:rank.titleFemale,
          titleBottom: data.userData.name,
          titleBottomColor: hintEnab_(context),
          titleBottomLeading: Padding(
            padding: const EdgeInsets.only(right: Dimen.DEF_MARG),
            child: Icon(MdiIcons.accountCircle, color: hintEnab_(context)),
          ),

          onTap: (context) => loadOpenRankDialog(context, RankData.colors[rank.data]!.avgColor(AppSettings.isDark), data),
          trailing: RankProgressWidget(data.rankCompleted, data.rankInProgress, 100*data.rankCompletedTasksCnt~/(rank.state as RankStateLocal).taskCount),
        ),

        Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Row(
            children: [
              Icon(MdiIcons.update, size: Dimen.TEXT_SIZE_NORMAL + 2, color: hintEnab_(context)),
              const SizedBox(width: Dimen.DEF_MARG),
              Text(dateToString(data.lastUpdateDate, shortMonth: true, withTime: true), style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.halfBold))
            ],
          ),
        )

      ],
    );
  }
}

Future<void> _openRankDialog(BuildContext context, Rank sharedRank, DateTime lastUpdateDate) => openDialog(
    context: context,
    builder: (context) => Padding(
      padding: AppCard.normMargin,
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        child: RankWidget(
          rank: sharedRank,
          icons: RankData.iconSizeMap[sharedRank.data]!.item1,
          lastUpdateTime: lastUpdateDate,
          showBack: true,
          previewOnly: true,
        ),
      ),
    )
);

Future<void> loadOpenRankDialog(BuildContext context, Color color, SharedRankMetaData data) async {

  Rank? loadedSharedRank;
  if(RankStateShared.dumpExists(data.sharedRankKey)) {
    RankStateShared stateShared = RankStateShared.fromDump(data.sharedRankKey)!;
    if(data.lastUpdateDate == stateShared.lastUpdateTime)
      loadedSharedRank = Rank.fromStateShared(data.rankUniqName, stateShared);
  }
  
  if(loadedSharedRank != null)
    _openRankDialog(context, loadedSharedRank, data.lastUpdateDate);
  else {
    showLoadingWidget(context, color, 'Otwieranie...');
    await ApiRank.getShared(
        key: data.sharedRankKey,
        lastUpdateTime: data.lastUpdateDate,
        onSuccess: (Rank sharedRank) async {
          await popPage(context);
          _openRankDialog(context, sharedRank, data.lastUpdateDate);
        },
        onError: (_) async {
          await popPage(context);
          showAppToast(context, text: simpleErrorMessage);
        }
    );
  }
}
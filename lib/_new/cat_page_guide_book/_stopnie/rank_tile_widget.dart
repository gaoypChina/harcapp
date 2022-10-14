import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_progress_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_tile_widget_template.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:tuple/tuple.dart';

import '../../details/app_settings.dart';
import 'models_common/rank.dart';

const String GROUP_TITLE_OGOLNE = 'Ogólne';
const String GROUP_TITLE_POZOSTALE = 'Pozostałe';


class RankTileWidget<T extends Rank> extends StatelessWidget {

  final T rank;

  const RankTileWidget({required this.rank, super.key});

  @override
  Widget build(BuildContext context) {

    Tuple2<List<IconData>, double> iconStuff = RankData.iconSizeMap[rank.data]!;
    RankColors colors = RankData.colors[rank.data]!;

    return RankTileWidgetTemplate(
      colorStart: colors.start(AppSettings.isDark),
      colorEnd: colors.end(AppSettings.isDark),
      icons: iconStuff.item1,
      iconSize: iconStuff.item2,
      titleTop: rank.titleMale,
      titleBottom: rank.titleFemale,

      trailing: Padding(
        padding: const EdgeInsets.only(right: Dimen.SIDE_MARG),
        child: RankProgressWidget(rank.completed, rank.inProgress, rank.completenessPercent),
      ),
      onTap: (context) => openRankPage(context, rank),
    );
  }

}
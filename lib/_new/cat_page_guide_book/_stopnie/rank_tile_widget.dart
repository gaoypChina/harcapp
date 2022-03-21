
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_progress_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_tile_widget_template.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_widget.dart';
import 'package:harcapp/_new/details/part_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import '../../details/app_settings.dart';
import 'models_common/rank.dart';

const String GROUP_TITLE_OGOLNE = 'Ogólne';
const String GROUP_TITLE_POZOSTALE = 'Pozostałe';


class RankTileWidget<T extends Rank> extends StatelessWidget {

  final T rank;

  const RankTileWidget({@required this.rank, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    Tuple2<List<IconData>, double> iconStuff = RankData.iconSizeMap[rank.data];
    RankColors colors = RankData.colors[rank.data];

    return RankTileWidgetTemplate(
      colorStart: colors.start(AppSettings.isDark),
      colorEnd: colors.end(AppSettings.isDark),
      icons: iconStuff.item1,
      iconSize: iconStuff.item2,
      titleTop: rank.titleMale,
      titleBottom: rank.titleFemale,

      trailing: RankProgressWidget(rank.completed, rank.inProgress, rank.completenessPercent),
      onTap: (context) => openRankDialog(context, rank),
    );
  }

}

Future<void> openRankDialog(BuildContext context, Rank rank) => openDialog(
    context: context,
    builder: (context) => Padding(
      padding: AppCard.normMargin,
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        child: RankWidget(
          rank: rank,
          icons: RankData.iconSizeMap[rank.data].item1,
          showBack: true,
        ),
      ),
    )
);
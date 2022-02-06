
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

import 'models_common/rank.dart';

const String GROUP_TITLE_OGOLNE = 'Ogólne';
const String GROUP_TITLE_POZOSTALE = 'Pozostałe';


class RankTileWidget<T extends Rank> extends StatelessWidget {

  final T rank;

  const RankTileWidget({@required this.rank});

  @override
  Widget build(BuildContext context) {

    Tuple2<List<IconData>, double> iconStuff = RankData.iconSizeMap[rank.data];
    RankColors colors = RankData.colors[rank.data];

      return RankTileWidgetTemplate(
        colorStart: colors.start(Settings.isDark),
        colorEnd: colors.end(Settings.isDark),
        icons: iconStuff.item1,
        iconSize: iconStuff.item2,
        titleTop: rank.titleMale,
        titleBottom: rank.titleFemale,

        trailing: RankProgressWidget(rank.completed, rank.inProgress, rank.completenessPercent),
        onTap: (context) => openRankDialog(context, rank),
      );
}
  /*
      SimpleButton(
    radius: AppCard.BIG_RADIUS,
    padding: EdgeInsets.zero,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.none,
    onTap: () => onTap?.call(context),
    child: Row(
      children: [
        SizedBox(
          width: leadingWidth,
          child: AspectRatio(
            aspectRatio: leadingAspectRatio,
            child: GradientWidget(
              radius: AppCard.BIG_RADIUS,
              colorStart: colorStart,
              colorEnd: colorEnd,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: icons.map((icon) => Icon(icon, size: iconSize, color: textColor??iconEnab_(context))).toList(),
              ),
              elevation: AppCard.bigElevation,
            ),
          ),
        ),

        SizedBox(width: Dimen.SIDE_MARG),

        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              rank.titleMale,
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  fontWeight: weight.halfBold,
                  color: textColor??iconEnab_(context)
              ),
            ),

            if(rank.titleFemale != null)
              Text(
                rank.titleFemale,
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    fontWeight: weight.halfBold,
                    color: textColor??textEnab_(context)
                ),
              )

          ],
        )),

        SizedBox(width: Dimen.SIDE_MARG),

        getTrailing(context)??Container()

      ],
    ),
  );
*/

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
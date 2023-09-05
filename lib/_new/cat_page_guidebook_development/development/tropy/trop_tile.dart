import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import 'trop_icon.dart';

class TropTile extends StatelessWidget{

  final String name;
  final TropCategory category;
  final String? zuchTropName;
  final int? completenessPercent;
  final double iconSize;
  // final Widget? trailing;
  final EdgeInsets padding;
  final String? tropLclIdForHero;
  final String? tropKeyForHero;

  const TropTile({
    required this.name,
    required this.category,
    this.zuchTropName,
    required this.completenessPercent,
    this.iconSize = TropIcon.tileSize,
    // this.trailing,
    this.padding = EdgeInsets.zero,
    this.tropLclIdForHero,
    this.tropKeyForHero,
    super.key
  });

  @override
  Widget build(BuildContext context){

    Widget child = Material(
      color: Colors.transparent,
      child: Padding(
        padding: padding,
        child: Row(
          children: [

            TropIcon(category, size: iconSize, zuchTropName: zuchTropName),

            const SizedBox(width: Dimen.SIDE_MARG),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    name,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold,
                        color: iconEnab_(context)
                    ),
                  ),

                  const SizedBox(height: Dimen.defMarg),

                  Text(
                    tropCategoryToName(category),
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold,
                      color: hintEnab_(context),
                    ),
                  ),

                ],
              ),
            ),

            if(completenessPercent != null)
              TropTileProgressWidget(completenessPercent!),
            // if(trailing != null) trailing!

          ],
        ),
      ),
    );

    if(tropLclIdForHero != null && tropKeyForHero != null)
      return Hero(
          tag: Tuple2(tropLclIdForHero, tropKeyForHero),
          child: child
      );

    return child;

  }

}

class TropTileProgressWidget extends StatelessWidget{

  final int completenessPercent;
  const TropTileProgressWidget(this.completenessPercent, {super.key});

  @override
  Widget build(BuildContext context) => Consumer<TropTaskProvider>(
    builder: (context, prov, child) => Text(
      '$completenessPercent%',
      style: AppTextStyle(
          fontSize: Dimen.TEXT_SIZE_APPBAR,
          fontWeight: weight.halfBold
      ),
    )
  );

}
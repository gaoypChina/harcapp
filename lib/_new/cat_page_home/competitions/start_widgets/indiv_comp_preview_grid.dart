import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp_core/dimen.dart';

class IndivCompPreviewGrid extends StatelessWidget{

  @override
  Widget build(BuildContext context) => GridView.count(
    clipBehavior: Clip.none,
    mainAxisSpacing: Dimen.SIDE_MARG,
    crossAxisSpacing: Dimen.SIDE_MARG,
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.only(
        top: 5,
        left: Dimen.SIDE_MARG,
        right: Dimen.SIDE_MARG,
        bottom: 10.0),
    shrinkWrap: true,
    crossAxisCount: 4,
    children: [
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'rosegold', iconKey: 'map')),
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'turquoise', iconKey: 'androidStudio')),
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'deepblue', iconKey: 'jellyfish')),
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'gold', iconKey: 'axe')),

      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'raspberry', iconKey: 'deathStarVariant')),
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'green', iconKey: 'music')),
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'turquoise', iconKey: 'pirate')),
      Center(child: IndivCompThumbnailWidget.from(colorsKey: 'chocolate', iconKey: 'chessKing')),

    ],
  );

}
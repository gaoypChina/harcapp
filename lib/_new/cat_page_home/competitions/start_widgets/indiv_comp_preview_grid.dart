import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp_core/dimen.dart';

class IndivCompPreviewGrid extends StatelessWidget{

  const IndivCompPreviewGrid({Key key}) : super(key: key);

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
    children: const [
      Center(child: IndivCompThumbnailWidget(colorsKey: 'rosegold', iconKey: 'map')),
      Center(child: IndivCompThumbnailWidget(colorsKey: 'turquoise', iconKey: 'androidStudio')),
      Center(child: IndivCompThumbnailWidget(colorsKey: 'deepblue', iconKey: 'jellyfish')),
      Center(child: IndivCompThumbnailWidget(colorsKey: 'gold', iconKey: 'axe')),

      Center(child: IndivCompThumbnailWidget(colorsKey: 'raspberry', iconKey: 'deathStarVariant')),
      Center(child: IndivCompThumbnailWidget(colorsKey: 'green', iconKey: 'music')),
      Center(child: IndivCompThumbnailWidget(colorsKey: 'turquoise', iconKey: 'pirate')),
      Center(child: IndivCompThumbnailWidget(colorsKey: 'chocolate', iconKey: 'chessKing')),
    ],
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp_core/dimen.dart';

class IndivCompPreviewGrid extends StatelessWidget{

  final bool? singleLine;

  const IndivCompPreviewGrid({this.singleLine = false, super.key});

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
      const Center(child: IndivCompThumbnailWidget(colorsKey: 'rosegold', iconKey: 'map')),
      const Center(child: IndivCompThumbnailWidget(colorsKey: 'turquoise', iconKey: 'androidStudio')),
      const Center(child: IndivCompThumbnailWidget(colorsKey: 'deepblue', iconKey: 'jellyfish')),
      const Center(child: IndivCompThumbnailWidget(colorsKey: 'gold', iconKey: 'axe')),

      if(!singleLine!)
        const Center(child: IndivCompThumbnailWidget(colorsKey: 'raspberry', iconKey: 'deathStarVariant')),
      if(!singleLine!)
        const Center(child: IndivCompThumbnailWidget(colorsKey: 'green', iconKey: 'music')),
      if(!singleLine!)
        const Center(child: IndivCompThumbnailWidget(colorsKey: 'turquoise', iconKey: 'pirate')),
      if(!singleLine!)
        const Center(child: IndivCompThumbnailWidget(colorsKey: 'chocolate', iconKey: 'chessKing')),
    ],
  );

}
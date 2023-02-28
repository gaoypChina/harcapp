import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp_core/dimen.dart';

import '../indiv_comp/indiv_comp_thumbnail_widget.dart';

class CompetitionPreviewGrid extends StatelessWidget{

  const CompetitionPreviewGrid({super.key});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.rosegoldKey, iconKey: 'map')),
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.deepblueKey, iconKey: 'jellyfish')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.goldKey, iconKey: 'axe')),
        ],
      ),

      SizedBox(height: (MediaQuery.of(context).size.width - 4*IndivCompThumbnailWidget.defSize - 2*Dimen.SIDE_MARG)/3),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.mintKey, iconKey: 'fleurDeLis')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.rosegoldKey, iconKey: 'music')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
        ],
      ),

      SizedBox(height: (MediaQuery.of(context).size.width - 4*IndivCompThumbnailWidget.defSize - 2*Dimen.SIDE_MARG)/3),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.raspberryKey, iconKey: 'pirate')),
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.turquoiseKey, iconKey: 'androidStudio')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
          Center(child: IndivCompThumbnailWidget(colorsKey: CommonColorData.chocolateKey, iconKey: 'chessKing')),
        ],
      ),

    ],
  );



}
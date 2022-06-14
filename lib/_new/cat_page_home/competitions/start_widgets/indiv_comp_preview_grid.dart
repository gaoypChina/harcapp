import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';


class IndivCompPreviewGrid extends StatelessWidget{

  final double width;
  final Widget child;

  const IndivCompPreviewGrid({required this.width, required this.child, super.key});

  static IndivCompPreviewGrid from({
    required BuildContext context,
    required double width,
    required IconData icon,
    required String text,
    void Function()? onTap
  }) => IndivCompPreviewGrid(
    width: width,
    child: SimpleButton(
      color: background_(context),
      borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Row(
          children: [
            Icon(icon, size: 60),
            const SizedBox(width: 20),
            Text(
              text,
              style: AppTextStyle(
                fontSize: 20.0,
                color: iconEnab_(context),
                height: 1.2
              ),
            )
          ],
        ),
      )
    ),
  );

  /*
  LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            SizedBox(height: (constraints.maxWidth - 4*IndivCompThumbnailWidget.defSize)/3),
      ),
   */

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(child: IndivCompThumbnailWidget(colorsKey: 'rosegold', iconKey: 'map')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'deepblue', iconKey: 'jellyfish')),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'gold', iconKey: 'axe')),
        ],
      ),

      SizedBox(height: (width - 4*IndivCompThumbnailWidget.defSize)/3),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(width: IndivCompThumbnailWidget.defSize),//SizedBox(width: IndivCompThumbnailWidget.defSize, child: Center(child: PointsIcon(size: .7*IndivCompThumbnailWidget.defSize))),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'green', iconKey: 'music')),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'turquoise', iconKey: 'pirate')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
        ],
      ),

      Expanded(
        child: Center(
          child: child,
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(child: IndivCompThumbnailWidget(colorsKey: 'mint', iconKey: 'fleurDeLis')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),//SizedBox(width: IndivCompThumbnailWidget.defSize, child: IndivCompRankIconTemplate(1, colors: CommonColorData.ALL.values.first,),),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'rosegold', iconKey: 'paperRollOutline')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
        ],
      ),

      SizedBox(height: (width - 4*IndivCompThumbnailWidget.defSize)/3),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Center(child: IndivCompThumbnailWidget(colorsKey: 'raspberry', iconKey: 'deathStarVariant')),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'turquoise', iconKey: 'androidStudio')),
          SizedBox(width: IndivCompThumbnailWidget.defSize),
          Center(child: IndivCompThumbnailWidget(colorsKey: 'chocolate', iconKey: 'chessKing')),
        ],
      ),

    ],
  );

}
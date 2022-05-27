import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_folder.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'apel_ewan.dart';

class ApelEwanGridView<T extends ApelEwanFolder> extends StatelessWidget{

  final T folder;

  const ApelEwanGridView({
    required this.folder,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(ApelEwan apelEwan in folder.generalApelEwans)
      children.add(ApelEwanThumbnailWidget(apelEwan));

    while(children.length % 3 != 0)
      children.add(const SizedBox(width: SprawWidgetSmall.width, height: SprawWidgetSmall.height));

    return Stack(
      children: [

        Positioned(
            right: -0.1*MediaQuery.of(context).size.width,
            bottom: -0.1*MediaQuery.of(context).size.width,
            child: Hero(
              tag: folder.iconKey,
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: Icon(
                  folder.icon,
                  color: background_(context),
                  size: MediaQuery.of(context).size.width,
                ),
              ),
            )
        ),

        if(folder.isEmpty)
          Positioned.fill(
            child: Center(
              child: Text(
                'W folderze...\n\n\npusto!',
                style: AppTextStyle(
                  fontSize: 24.0,
                  fontWeight: weight.bold,
                  color: iconEnab_(context),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

        GridView.count(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 3,
          crossAxisSpacing: Dimen.ICON_MARG,
          mainAxisSpacing: Dimen.ICON_MARG,
          childAspectRatio: 1,
          children: children,
        ),

      ],
    );

  }

}

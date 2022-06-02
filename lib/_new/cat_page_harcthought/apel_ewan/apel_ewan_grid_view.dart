import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_own_folder.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_thumbnail_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'apel_ewan.dart';
import 'apel_ewan_folder.dart';

class ApelEwanGridView<T extends ApelEwanFolder> extends StatelessWidget{

  static const int crossCount = 3;

  final T folder;
  final EdgeInsets padding;
  final bool animate;

  const ApelEwanGridView({
    required this.folder,
    this.padding = const EdgeInsets.all(Dimen.ICON_MARG),
    this.animate = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int index=0; index <folder.apelEwans.length; index++) {
      ApelEwan apelEwan = folder.apelEwans[index];
      children.add(
        animate?
        AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 375),
          columnCount: crossCount,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: ApelEwanThumbnailWidget(
                apelEwan,
                subgroup:
                folder is ApelEwanOwnFolder?
                (folder as ApelEwanOwnFolder).getSubgroupSuff(apelEwan.siglum):
                null,
              ),
            ),
          ),
        ):
        ApelEwanThumbnailWidget(
          apelEwan,
          subgroup:
          folder is ApelEwanOwnFolder?
          (folder as ApelEwanOwnFolder).getSubgroupSuff(apelEwan.siglum):
          null,
        )
      );
    }
    while(children.length % 3 != 0)
      children.add(const SizedBox(width: 0, height: 0));

    return GridView.count(
      padding: padding,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: crossCount,
      crossAxisSpacing: Dimen.ICON_MARG,
      mainAxisSpacing: Dimen.ICON_MARG,
      childAspectRatio: 1,
      children: children,
    );

  }

}

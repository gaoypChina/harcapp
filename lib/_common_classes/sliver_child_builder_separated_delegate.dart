import 'dart:math';

import 'package:flutter/material.dart';

class SliverChildSeparatedBuilderDelegate extends SliverChildBuilderDelegate{

  final int count;
  final Widget Function(BuildContext, int) separatorBuilder;

  SliverChildSeparatedBuilderDelegate(builder, {required this.separatorBuilder, required this.count}) : super(
  (BuildContext context, int index) {
      final int itemIndex = index ~/ 2;
      if (index.isEven) {
        return builder(context, itemIndex);
      }
      return separatorBuilder(context, itemIndex);
    },
    semanticIndexCallback: (Widget widget, int localIndex) {
      if (localIndex.isEven)
        return localIndex ~/ 2;

      return null;
    },
    childCount: max(0, count * 2 - 1),

    /*
    (BuildContext context, int index) {
      final int itemIndex = index ~/ 2;
      if (index.isEven) return builder(context, itemIndex);
      return separatorBuilder(context, itemIndex);
    },
    semanticIndexCallback: (Widget widget, int localIndex) {
      if (localIndex.isEven)
        return localIndex ~/ 2;

      return null;
    },
    childCount: max(0, childCount * 2 - 1),
     */
  );

}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_page.dart';
import 'package:harcapp_core/dimen.dart';


class PagingLoadablePage extends StatelessWidget{

  final String title;
  final Color loadingIndicatorColor;

  final int totalItemsCount;
  final int loadedItemsCount;

  final FutureOr<void> Function() callReload;
  final FutureOr<bool> Function() callLoadMore;
  final bool callLoadOnInit;

  final EdgeInsets? padding;
  final void Function(int) loadedItemBuilder;
  final double itemSeparatorHeight;

  final Widget? bottomNavigationBar;

  const PagingLoadablePage({
    required this.title,
    required this.loadingIndicatorColor,

    required this.totalItemsCount,
    required this.loadedItemsCount,

    required this.callReload,
    required this.callLoadMore,
    required this.callLoadOnInit,

    this.padding,
    required this.loadedItemBuilder,
    this.itemSeparatorHeight = 0,

    this.bottomNavigationBar,

    super.key
  });

  @override
  Widget build(BuildContext context) => PagingLoadableBasePage(
    appBarTitle: title,
    loadingIndicatorColor: loadingIndicatorColor,

    totalItemsCount: totalItemsCount,
    loadedItemsCount: loadedItemsCount,

    callReload: callReload,
    callLoadMore: callLoadMore,
    callLoadOnInit: callLoadOnInit,

    sliverBody: SliverPadding(
      padding: padding??const EdgeInsets.all(Dimen.SIDE_MARG),
      sliver: SliverList(
        delegate: SliverChildSeparatedBuilderDelegate((context, index) =>
        loadedItemBuilder(index),
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: itemSeparatorHeight),
          count: loadedItemsCount,
        ),
      ),
    ),

    bottomNavigationBar: bottomNavigationBar,
  );

}
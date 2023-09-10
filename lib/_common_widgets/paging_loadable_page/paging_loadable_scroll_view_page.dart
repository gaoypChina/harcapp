import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_scroll_view_page.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


class PagingLoadableScrollViewPage extends StatelessWidget{

  final String appBarTitle;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;

  final Color? backgroundColor;
  final Color? appBottomNavColor;
  final Color? loadingIndicatorColor;

  final int totalItemsCount;
  final int loadedItemsCount;

  final FutureOr<int> Function() callReload;
  final FutureOr<int> Function() callLoadMore;
  final RefreshController? controller;
  final bool loadMoreIfHeightNotExceeding;

  final EdgeInsets? padding;
  final Widget Function(int) loadedItemBuilder;
  final Widget? emptyWidget;
  final double itemSeparatorHeight;

  final Widget? bottomNavigationBar;

  const PagingLoadableScrollViewPage({
    required this.appBarTitle,
    this.appBarLeading,
    this.appBarActions,

    this.backgroundColor,
    this.appBottomNavColor,
    this.loadingIndicatorColor,

    required this.totalItemsCount,
    required this.loadedItemsCount,

    required this.callReload,
    required this.callLoadMore,
    this.controller,
    this.loadMoreIfHeightNotExceeding = true,

    this.padding,
    required this.loadedItemBuilder,
    this.emptyWidget,
    this.itemSeparatorHeight = 0,

    this.bottomNavigationBar,

    super.key
  });

  @override
  Widget build(BuildContext context) => PagingLoadableBaseScrollViewPage(
    appBarTitle: appBarTitle,
    appBarLeading: appBarLeading,
    appBarActions: appBarActions,

    backgroundColor: backgroundColor,
    appBottomNavColor: appBottomNavColor,
    loadingIndicatorColor: loadingIndicatorColor,

    totalItemsCount: totalItemsCount,
    loadedItemsCount: loadedItemsCount,

    callReload: callReload,
    callLoadMore: callLoadMore,
    controller: controller,
    loadMoreIfHeightNotExceeding: loadMoreIfHeightNotExceeding,

    sliverBody: (context, isLoading) => totalItemsCount==0 && emptyWidget!=null?
    SliverPadding(
      padding: padding??const EdgeInsets.all(Dimen.SIDE_MARG),
      sliver: SliverFillRemaining(
        hasScrollBody: false,
        child: emptyWidget,
      )
    ):
    SliverPadding(
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
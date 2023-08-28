import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_widget.dart';
import 'package:harcapp/values/consts.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


class PagingLoadableBaseScrollViewPage extends StatefulWidget{

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
  // final bool callReloadOnInit;
  // final bool showReloadStatusOnInit;
  // final bool callLoadOnInit;
  // final bool showLoadStatusOnInit;
  final RefreshController? controller;
  final bool loadMoreIfHeightNotExceeding;

  final Widget Function(BuildContext, bool) sliverBody;
  final Widget? bottomNavigationBar;
  
  const PagingLoadableBaseScrollViewPage({
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
    // this.callReloadOnInit = false,
    // this.showReloadStatusOnInit = false,
    // this.callLoadOnInit = false,
    // this.showLoadStatusOnInit = false,
    this.controller,
    this.loadMoreIfHeightNotExceeding = true,

    required this.sliverBody,
    this.bottomNavigationBar,

    super.key
  });

  @override
  State<StatefulWidget> createState() => PagingLoadableBaseScrollViewPageState();

}

class PagingLoadableBaseScrollViewPageState extends State<PagingLoadableBaseScrollViewPage>{

  String get appBarTitle => widget.appBarTitle;
  Widget? get appBarLeading => widget.appBarLeading;
  List<Widget>? get appBarActions => widget.appBarActions;

  Color? get backgroundColor => widget.backgroundColor;
  Color? get appBottomNavColor => widget.appBottomNavColor;
  Color? get loadingIndicatorColor => widget.loadingIndicatorColor;

  int get totalItemsCount => widget.totalItemsCount;
  int get loadedItemsCount => widget.loadedItemsCount;

  FutureOr<int> Function() get callReload => widget.callReload;
  FutureOr<int> Function() get callLoadMore => widget.callLoadMore;
  // bool get callReloadOnInit => widget.callReloadOnInit;
  // bool get showReloadStatusOnInit => widget.showReloadStatusOnInit;
  // bool get callLoadOnInit => widget.callLoadOnInit;
  // bool get showLoadStatusOnInit => widget.showLoadStatusOnInit;
  RefreshController? get controller => widget.controller;
  bool get loadMoreIfHeightNotExceeding => widget.loadMoreIfHeightNotExceeding;

  Widget Function(BuildContext, bool) get sliverBody => widget.sliverBody;
  Widget? get bottomNavigationBar => widget.bottomNavigationBar;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      backgroundColor: backgroundColor,
      appBottomNavColor: appBottomNavColor,
      body: PagingLoadableBaseWidget(
        headerHeight: defRefreshHeaderHeight + kToolbarHeight,
        headerDistance: defRefreshHeaderDistance + kToolbarHeight,
        backgroundColor: backgroundColor,
        loadingIndicatorColor: loadingIndicatorColor,
        totalItemsCount: totalItemsCount,
        loadedItemsCount: loadedItemsCount,
        callReload: callReload,
        callLoadMore: callLoadMore,
        controller: controller,
        loadMoreIfHeightNotExceeding: loadMoreIfHeightNotExceeding,
        sliversBuilder: (context, isLoading, innerScrollViewKey) => [

          SliverAppBar(
            floating: true,
            title: Text(appBarTitle),
            leading: appBarLeading,
            actions: appBarActions,
            centerTitle: true,
            backgroundColor: backgroundColor,
          ),

          Container(
            key: innerScrollViewKey,
            child: sliverBody(context, isLoading),
          )

        ],
      ),

      bottomNavigationBar: bottomNavigationBar
  );

}
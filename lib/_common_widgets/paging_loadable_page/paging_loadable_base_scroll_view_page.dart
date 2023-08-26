import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_widget.dart';


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
  final bool callReloadOnInit;
  final bool showReloadStatusOnInit;
  final bool callLoadOnInit;
  final bool showLoadStatusOnInit;
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
    this.callReloadOnInit = false,
    this.showReloadStatusOnInit = false,
    this.callLoadOnInit = false,
    this.showLoadStatusOnInit = false,
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
  bool get callReloadOnInit => widget.callReloadOnInit;
  bool get showReloadStatusOnInit => widget.showReloadStatusOnInit;
  bool get callLoadOnInit => widget.callLoadOnInit;
  bool get showLoadStatusOnInit => widget.showLoadStatusOnInit;
  bool get loadMoreIfHeightNotExceeding => widget.loadMoreIfHeightNotExceeding;

  Widget Function(BuildContext, bool) get sliverBody => widget.sliverBody;
  Widget? get bottomNavigationBar => widget.bottomNavigationBar;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      backgroundColor: backgroundColor,
      appBottomNavColor: appBottomNavColor,
      body: PagingLoadableBaseWidget(
        backgroundColor: backgroundColor,
        loadingIndicatorColor: loadingIndicatorColor,
        totalItemsCount: totalItemsCount,
        loadedItemsCount: loadedItemsCount,
        callReload: callReload,
        callLoadMore: callLoadMore,
        callReloadOnInit: callReloadOnInit,
        showReloadStatusOnInit: showReloadStatusOnInit,
        callLoadOnInit: callLoadOnInit,
        showLoadStatusOnInit: showLoadStatusOnInit,
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

      /*
      SmartRefresher(
        enablePullDown: true,
        enablePullUp: !refreshController.isRefresh,
        footer: AppCustomFooter(
          moreToLoad: moreToLoad,
          color: loadingIndicatorColor,
          showDotWhenAllLoaded: false
        ),
        physics: const BouncingScrollPhysics(),
        header: MaterialClassicHeader(
            backgroundColor: cardEnab_(context),
            color: loadingIndicatorColor??iconEnab_(context)
        ),
        controller: refreshController,
        onRefresh: () async {

          if(!await isNetworkAvailable()){
            if(mounted) showAppToast(context, text: 'Brak dostępu do Internetu');
            if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
            post(() => mounted?setState(() {}):null);
            return;
          }

          int allLoadedItems = await callReload();

          await handleOnExceedingHeightLoader(allLoadedItems);

          if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
          post(() => mounted?setState(() {}):null);

        },
        onLoading: onLoading,
        child: CustomScrollView(
          key: outerScrollViewKey,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [

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

            //sliverBody,
            
          ],
        ),
      ),
      */
      bottomNavigationBar: bottomNavigationBar
  );

}
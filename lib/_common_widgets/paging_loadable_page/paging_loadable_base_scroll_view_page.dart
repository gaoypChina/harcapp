import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


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
  final bool callLoadOnInit;
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
    required this.callLoadOnInit,
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
  bool get callLoadOnInit => widget.callLoadOnInit;
  bool get loadMoreIfHeightNotExceeding => widget.loadMoreIfHeightNotExceeding;

  Widget Function(BuildContext, bool) get sliverBody => widget.sliverBody;
  Widget? get bottomNavigationBar => widget.bottomNavigationBar;

  late RefreshController refreshController;

  bool get moreToLoad => loadedItemsCount < totalItemsCount;

  bool get isLoading => refreshController.isRefresh || refreshController.isLoading;

  late GlobalKey outerScrollViewKey;
  late GlobalKey innerScrollViewKey;

  @override
  void initState() {

    refreshController = RefreshController(
        initialRefresh: callLoadOnInit && loadedItemsCount == 0,

        initialLoadStatus:
        callLoadOnInit && loadedItemsCount > 0?
        LoadStatus.loading:
        LoadStatus.idle
    );
    if(callLoadOnInit)
      onLoading();
    else
      post(() => handleOnExceedingHeightLoader(0));

    outerScrollViewKey = GlobalKey();
    innerScrollViewKey = GlobalKey();

    super.initState();
  }

  Future<void> handleOnExceedingHeightLoader(int allLoadedItems) async {

    if(!loadMoreIfHeightNotExceeding)
      return;

    if(outerScrollViewKey.currentContext == null) return;
    final outerBox = outerScrollViewKey.currentContext?.findRenderObject() as RenderBox;
    double outerHeight = outerBox.size.height;

    if(innerScrollViewKey.currentContext == null) return;
    final innerBox = innerScrollViewKey.currentContext?.findRenderObject() as RenderSliver;
    double innerHeight = innerBox.geometry!.maxPaintExtent;

    print('allLoadedItems: $allLoadedItems, totalItemsCount: $totalItemsCount');
    if(allLoadedItems >= totalItemsCount)
      return;

    if(innerHeight < outerHeight)
      await onLoading();

  }

  Future<void> onLoading() async {

    if(!moreToLoad) {
      refreshController.loadComplete();
      return;
    }

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      refreshController.loadComplete();
      return;
    }

    int loadedItems = await callLoadMore.call();

    await handleOnExceedingHeightLoader(loadedItems);

    refreshController.loadComplete();

  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      backgroundColor: backgroundColor,
      appBottomNavColor: appBottomNavColor,
      body: SmartRefresher(
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
      bottomNavigationBar: bottomNavigationBar
  );

}
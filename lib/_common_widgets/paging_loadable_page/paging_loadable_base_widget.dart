import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class PagingLoadableBaseWidget extends StatefulWidget{

  final Color? backgroundColor;
  final Color? loadingIndicatorColor;

  final int totalItemsCount;
  final int loadedItemsCount;

  final FutureOr<int> Function() callReload;
  final FutureOr<int> Function() callLoadMore;
  final RefreshController? controller;
  final bool loadMoreIfHeightNotExceeding;

  final List<Widget> Function(BuildContext, bool, GlobalKey) sliversBuilder;

  const PagingLoadableBaseWidget({

    this.backgroundColor,
    this.loadingIndicatorColor,

    required this.totalItemsCount,
    required this.loadedItemsCount,

    required this.callReload,
    required this.callLoadMore,
    this.controller,

    this.loadMoreIfHeightNotExceeding = true,

    required this.sliversBuilder,

    super.key
  });

  @override
  State<StatefulWidget> createState() => PagingLoadableBaseWidgetState();

}

class PagingLoadableBaseWidgetState extends State<PagingLoadableBaseWidget>{

  Color? get backgroundColor => widget.backgroundColor;
  Color? get loadingIndicatorColor => widget.loadingIndicatorColor;

  int get totalItemsCount => widget.totalItemsCount;
  int get loadedItemsCount => widget.loadedItemsCount;

  FutureOr<int> Function() get callReload => widget.callReload;
  FutureOr<int> Function() get callLoadMore => widget.callLoadMore;
  RefreshController get refreshController => widget.controller??_controller!;
  bool get loadMoreIfHeightNotExceeding => widget.loadMoreIfHeightNotExceeding;

  List<Widget> Function(BuildContext, bool, GlobalKey) get sliversBuilder => widget.sliversBuilder;

  bool get moreToLoad => loadedItemsCount < totalItemsCount;

  bool get isLoading => refreshController.isRefresh || refreshController.isLoading;

  late GlobalKey outerScrollViewKey;
  late GlobalKey innerScrollViewKey;

  RefreshController? _controller;

  @override
  void initState() {

    if(widget.controller == null)
      _controller = RefreshController();

    //   _controller = RefreshController(
    //     initialRefresh: callReloadOnInit,
    //     initialRefreshStatus: showReloadStatusOnInit?
    //     RefreshStatus.refreshing:
    //     RefreshStatus.idle,
    //
    //     initialLoadStatus:
    //     callLoadOnInit || showLoadStatusOnInit?
    //     LoadStatus.loading:
    //     LoadStatus.idle
    // );
    // // `initialRefresh` is handling this.
    // // if(callReloadOnInit)
    // //   onReloading();
    // if(callLoadOnInit)
    //   onLoading();
    // else
    //   post(() => handleOnExceedingHeightLoader(0));

    outerScrollViewKey = GlobalKey();
    innerScrollViewKey = GlobalKey();

    super.initState();
  }

  @override
  dispose(){
    _controller?.dispose();
    super.dispose();
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
      refreshController.loadComplete(); // This is called in `post()` inside.
      post(() => mounted?setState(() {}):null);
      return;
    }

    if(!await isNetworkAvailable()){
      if(mounted) showAppToast(context, text: noInternetMessage);
      if(mounted) refreshController.loadComplete(); // This is called in `post()` inside.
      post(() => mounted?setState(() {}):null);
      return;
    }

    int loadedItems = await callLoadMore.call();

    await handleOnExceedingHeightLoader(loadedItems);

    if(mounted) refreshController.loadComplete(); // This is called in `post()` inside.
    post(() => mounted?setState(() {}):null);

  }

  Future<void> onReloading() async {

    if(!await isNetworkAvailable()){
      if(mounted) showAppToast(context, text: noInternetMessage);
      if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
      post(() => mounted?setState(() {}):null);
      return;
    }

    int allLoadedItems = await callReload();

    await handleOnExceedingHeightLoader(allLoadedItems);

    if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
    post(() => mounted?setState(() {}):null);

  }

  @override
  Widget build(BuildContext context) => SmartRefresher(
    enablePullDown: !refreshController.isLoading,
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
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
        refreshController.refreshCompleted(); // This is called in `post()` inside.
        post(() => setState(() {}));
        return;
      }

      int allLoadedItems = await callReload();

      await handleOnExceedingHeightLoader(allLoadedItems);

      if(!mounted) return;
      refreshController.refreshCompleted(); // This is called in `post()` inside.
      post(() => setState(() {}));

    },
    onLoading: onLoading,
    child: CustomScrollView(
      key: outerScrollViewKey,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: sliversBuilder(context, isLoading, innerScrollViewKey),
    ),
  );

}
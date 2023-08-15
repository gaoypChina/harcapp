import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
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
  final bool callReloadOnInit;
  final bool callLoadOnInit;
  final bool loadMoreIfHeightNotExceeding;

  final List<Widget> Function(BuildContext, bool, GlobalKey) sliversBuilder;

  const PagingLoadableBaseWidget({

    this.backgroundColor,
    this.loadingIndicatorColor,

    required this.totalItemsCount,
    required this.loadedItemsCount,

    required this.callReload,
    required this.callLoadMore,
    required this.callReloadOnInit,
    required this.callLoadOnInit,

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
  bool get callReloadOnInit => widget.callReloadOnInit;
  bool get callLoadOnInit => widget.callLoadOnInit;
  bool get loadMoreIfHeightNotExceeding => widget.loadMoreIfHeightNotExceeding;

  List<Widget> Function(BuildContext, bool, GlobalKey) get sliversBuilder => widget.sliversBuilder;

  late RefreshController refreshController;

  bool get moreToLoad => loadedItemsCount < totalItemsCount;

  bool get isLoading => refreshController.isRefresh || refreshController.isLoading;

  late GlobalKey outerScrollViewKey;
  late GlobalKey innerScrollViewKey;

  @override
  void initState() {

    refreshController = RefreshController(
        initialRefresh: callReloadOnInit,

        initialLoadStatus:
        callLoadOnInit?
        LoadStatus.loading:
        LoadStatus.idle
    );
    if(callReloadOnInit)
      onReloading();
    else if(callLoadOnInit)
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
      refreshController.loadComplete(); // This is called in `post()` inside.
      post(() => mounted?setState(() {}):null);
      return;
    }

    if(!await isNetworkAvailable()){
      if(mounted) showAppToast(context, text: 'Brak dostępu do Internetu');
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
      if(mounted) showAppToast(context, text: 'Brak dostępu do Internetu');
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
      slivers: sliversBuilder(context, isLoading, innerScrollViewKey),
    ),
  );

}
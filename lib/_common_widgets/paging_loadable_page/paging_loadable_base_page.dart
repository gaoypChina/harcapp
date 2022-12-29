import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class PagingLoadableBasePage extends StatefulWidget{

  final String appBarTitle;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;
  
  final Color? backgroundColor;
  final Color? appBottomNavColor;
  final Color? loadingIndicatorColor;

  final int totalItemsCount;
  final int loadedItemsCount;

  final FutureOr<void> Function() callReload;
  final FutureOr<bool> Function() callLoadMore;
  final bool callLoadOnInit;

  final Widget sliverBody;
  final Widget? bottomNavigationBar;
  
  const PagingLoadableBasePage({
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

    required this.sliverBody,
    required this.bottomNavigationBar,

    super.key
  });

  @override
  State<StatefulWidget> createState() => PagingLoadableBasePageState();

}

class PagingLoadableBasePageState extends State<PagingLoadableBasePage>{

  String get appBarTitle => widget.appBarTitle;
  Widget? get appBarLeading => widget.appBarLeading;
  List<Widget>? get appBarActions => widget.appBarActions;

  Color? get backgroundColor => widget.backgroundColor;
  Color? get appBottomNavColor => widget.appBottomNavColor;
  Color? get loadingIndicatorColor => widget.loadingIndicatorColor;

  int get totalItemsCount => widget.totalItemsCount;
  int get loadedItemsCount => widget.loadedItemsCount;

  FutureOr<void> Function() get callReload => widget.callReload;
  FutureOr<bool> Function() get callLoadMore => widget.callLoadMore;
  bool get callLoadOnInit => widget.callLoadOnInit;

  Widget get sliverBody => widget.sliverBody;
  Widget? get bottomNavigationBar => widget.bottomNavigationBar;

  late RefreshController refreshController;

  bool get moreToLoad => loadedItemsCount < totalItemsCount;

  @override
  void initState() {

    refreshController = RefreshController(
        initialLoadStatus: callLoadOnInit?LoadStatus.loading:LoadStatus.idle
    );
    if(callLoadOnInit)
      onLoading();

    super.initState();
  }

  void onLoading() async {

    if(!moreToLoad) {
      refreshController.loadComplete();
      return;
    }

    if(!await isNetworkAvailable()){
      showAppToast(context, text: 'Brak dostępu do Internetu');
      refreshController.loadComplete();
      return;
    }

    bool success = await callLoadMore.call();

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
            showAppToast(context, text: 'Brak dostępu do Internetu');
            refreshController.refreshCompleted();
            return;
          }

          await callReload();

          refreshController.refreshCompleted();

        },
        onLoading: onLoading,
        child: CustomScrollView(
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

            sliverBody,
            
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar
  );

}
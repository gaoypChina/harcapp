import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';


class PagingLoadablePageViewPage extends StatefulWidget{

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

  final Widget Function(int) loadedItemBuilder;
  final String Function(int, bool)? tabTitle;
  final Widget? emptyBody;
  final Widget? bottomNavigationBar;
  
  const PagingLoadablePageViewPage({
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

    required this.loadedItemBuilder,
    this.tabTitle,

    this.emptyBody,
    this.bottomNavigationBar,

    super.key
  });

  @override
  State<StatefulWidget> createState() => PagingLoadablePageViewPageState();

}

class PagingLoadablePageViewPageState extends State<PagingLoadablePageViewPage> with TickerProviderStateMixin{

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

  Widget Function(int) get loadedItemBuilder => widget.loadedItemBuilder;
  String Function(int, bool)? get tabTitle => widget.tabTitle;

  Widget? get emptyBody => widget.emptyBody;
  Widget? get bottomNavigationBar => widget.bottomNavigationBar;

  bool get moreToLoad => loadedItemsCount < totalItemsCount;

  late TabController tabController;
  late RefreshController refreshController;

  int get tabCount{
    if(totalItemsCount > loadedItemsCount) return loadedItemsCount + 1;
    else return loadedItemsCount;
  }

  List<Tab> get tabs{
    List<Tab> result = [];

    int length = tabCount;
    for(int i=0; i<length; i++)
      result.add(Tab(text: tabTitle==null?'$i':tabTitle?.call(i, totalItemsCount > loadedItemsCount && i == loadedItemsCount)));

    return result;
  }

  void lastTabListener(){
    if(tabController.index == tabController.length-1)
      if(loadedItemsCount<totalItemsCount)
        onLoading();
  }

  void initTabController({int? initialIndex}){
    // if(initialIndex != null){
    //   tabController.removeListener(lastTabListener);
    //   tabController.dispose();
    // }

    int length = tabCount;

    logger.d('Initialized TabController with length: $length');
    tabController = TabController(length: length, initialIndex: initialIndex??0, vsync: this);
    tabController.addListener(lastTabListener);
  }

  @override
  void initState() {
    initTabController();
    refreshController = RefreshController(
      initialLoadStatus: callLoadOnInit?LoadStatus.loading:LoadStatus.idle
    );
    if(callLoadOnInit)
      onLoading();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant PagingLoadablePageViewPage oldWidget) {
    initTabController(initialIndex: tabController.index);
    post(() => tabController.offset += 0.000001);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    tabController.removeListener(lastTabListener);
    tabController.dispose();
    super.dispose();
  }

  void onLoading() async {

    if(!moreToLoad) {
      refreshController.loadComplete();
      return;
    }

    if(!await isNetworkAvailable()){
      if(!mounted) return;
      showAppToast(context, text: noInternetMessage);
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
            if(mounted) showAppToast(context, text: noInternetMessage);
            if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
            post(() => mounted?setState(() {}):null);
            return;
          }

          await callReload();

          if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
          post(() => mounted?setState(() {}):null);

        },
        onLoading: onLoading,
        child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                floating: true,
                title: Text(appBarTitle),
                leading: appBarLeading,
                actions: appBarActions,
                forceElevated: innerBoxIsScrolled,
                centerTitle: true,
                pinned: true,
                backgroundColor: backgroundColor,

                bottom:
                totalItemsCount <= 1?
                null:
                TabBar(
                  controller: tabController,
                  physics: const BouncingScrollPhysics(),
                  isScrollable: loadedItemsCount>3,
                  tabs: tabs,
                  indicator: AppTabBarIncdicator(color: loadingIndicatorColor),
                ),

              ),
            ],
            body:
            totalItemsCount == 0?
            emptyBody??Container():
            Builder(builder: (context){

              List<Widget> children = [];

              for(int i=0; i<loadedItemsCount; i++)
                children.add(loadedItemBuilder(i));

              if(totalItemsCount > loadedItemsCount)
                children.add(Center(
                  child: SpinKitChasingDots(
                    size: Dimen.ICON_SIZE,
                    color: iconEnab_(context),
                  ),
                ));

              return TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: children,
              );

            })

        )),
      bottomNavigationBar: bottomNavigationBar
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/widgets/spraw_tile_template_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'trop_shared_previews_loader.dart';

class TropSelector extends StatefulWidget{

  final void Function(String?, String?)? onSelected;
  final ScrollController? controller;

  const TropSelector({this.onSelected, this.controller, super.key});

  @override
  State<StatefulWidget> createState() => TropSelectorState();

}

class TropSelectorState extends State<TropSelector>{

  void Function(String?, String?)? get onSelected => widget.onSelected;
  ScrollController? get controller => widget.controller;

  late List<Trop> searchedOwnTrops;
  late List<TropSharedPreviewData> searchedSharedTrops;

  late RefreshController refreshController;

  late TropSharedPreviewsLoaderListener tropSharedPreviewsLoaderListener;

  @override
  void initState() {
    searchedOwnTrops = Trop.allOwn;
    searchedSharedTrops = TropSharedPreviewData.all??[];

    TropListProvider tropListProv = TropListProvider.of(context);

    tropSharedPreviewsLoaderListener = TropSharedPreviewsLoaderListener(
      onStart: () => setState((){}),
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onSharedPrevsLoaded: (tropsPage, reloaded){
        tropListProv.notify();
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        Navigator.pop(context);
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        Navigator.pop(context);
        return true;
      },
      onError: (_){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      },
      onEnd: (_, __){
        if(!mounted) return;
        refreshController.loadComplete();
        refreshController.refreshCompleted();
        post(() => mounted?setState(() {}):null);
      }
    );

    tropSharedPreviewsLoader.addListener(tropSharedPreviewsLoaderListener);

    // if(AccountData.loggedIn && TropSharedPreviewData.all == null)
    //   tropSharedPreviewsLoader.run();

    refreshController = RefreshController(
      initialRefresh: AccountData.loggedIn && Trop.allLoadedShared.isEmpty && !tropSharedPreviewsLoader.running,
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(!AccountData.loggedIn) return;
      if(Trop.allLoadedShared.isEmpty && tropSharedPreviewsLoader.running)
        refreshController.headerMode!.value = RefreshStatus.refreshing;
      if(Trop.allLoadedShared.isNotEmpty && tropSharedPreviewsLoader.running)
        refreshController.footerMode!.value = LoadStatus.loading;
    });
    super.initState();
  }

  @override
  void dispose(){
    refreshController.dispose();
    super.dispose();
  }

  List<Widget> getSlivers(GlobalKey innerScrollViewKey){
    List<Widget> slivers = [

      // To się może kiedyś przydać.
      // FloatingContainer.child(
      //     child: SearchField(
      //       hint: 'Szukaj tropów',
      //       margin: EdgeInsets.zero,
      //       onChanged: (text){
      //
      //         text = remPolChars(text);
      //         if(text.isEmpty){
      //           setState(() => this.searchedOwnTrops = Trop.allOwn);
      //           setState(() => searchedSharedTrops = TropSharedPreviewData.all??[]);
      //           return;
      //         }
      //
      //         List<Trop> searchedOwnTrops = [];
      //
      //         for(Trop trop in Trop.allOwn)
      //           if(remPolChars(trop.name).contains(text))
      //             searchedOwnTrops.add(trop);
      //
      //         setState(() => this.searchedOwnTrops = searchedOwnTrops);
      //
      //         // Run shared trop search.
      //
      //       },
      //     ),
      //     height: SearchField.height - SearchField.defMargVal
      // )
    ];

    if(Trop.allOwn.isEmpty && !TropSharedPreviewData.hasAny)
      slivers.add(SliverFillRemaining(
        key: innerScrollViewKey,
        child: Center(
          child: EmptyMessageWidget(
            text: 'Nie masz rozpoczętych\nżadnych tropów',
            icon: Trop.icon,
          )
        ),
      ));
    else if(searchedOwnTrops.isEmpty && searchedSharedTrops.isEmpty)
      slivers.add(SliverFillRemaining(
        key: innerScrollViewKey,
        child: Center(
          child: EmptyMessageWidget(
            text: 'Brak tropów spełniających\nkryteria wyszukiwania',
            icon: Trop.icon,
          )
        ),
      ));
    else{

      slivers.add(
          SliverList(
              key: innerScrollViewKey,
              delegate: SliverChildListDelegate([

                if(searchedOwnTrops.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
                    child: TitleShortcutRowWidget(title: 'Moje lokalne tropy', textAlign: TextAlign.left),
                  ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchedOwnTrops.length,
                  itemBuilder: (context, index) => SimpleButton(
                    radius: 0,
                    onTap: onSelected==null?null:() => onSelected!.call(
                        searchedOwnTrops[index].lclId, null
                    ),
                    child: SizedBox(
                      height: SprawTileTemplateWidget.height,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          right: Dimen.SIDE_MARG,
                          left: Dimen.SIDE_MARG,
                        ),
                        child: TropTile(
                          name: searchedOwnTrops[index].name,
                          category: searchedOwnTrops[index].category,
                          zuchTropName: searchedOwnTrops[index].customIconTropName,
                          completenessPercent: searchedOwnTrops[index].completenessPercent,
                        ),
                      ),
                    ),
                  ),
                ),

                if(AccountData.loggedIn && searchedSharedTrops.isNotEmpty)
                  const Padding(
                      padding: EdgeInsets.only(top: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
                      child: TitleShortcutRowWidget(title: 'Udostępnione tropy', textAlign: TextAlign.left)
                  ),

                if(AccountData.loggedIn)
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: searchedSharedTrops.length,
                      itemBuilder: (context, index) => SimpleButton(
                        radius: 0,
                        onTap: onSelected==null?null:() => onSelected!.call(
                            null, searchedSharedTrops[index].key
                        ),
                        child: SizedBox(
                          height: SprawTileTemplateWidget.height,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                right: Dimen.SIDE_MARG,
                                left: Dimen.SIDE_MARG,
                              ),
                              child: TropTile(
                                name: searchedSharedTrops[index].name,
                                category: searchedSharedTrops[index].category,
                                zuchTropName: searchedSharedTrops[index].customIconTropName,
                                completenessPercent: searchedSharedTrops[index].completenessPercent,
                              )
                          ),
                        ),
                      )
                  ),

              ])
          )
      );

    }

    return slivers;

  }

  @override
  Widget build(BuildContext context){

    if(!AccountData.loggedIn)
      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: getSlivers(GlobalKey()),
      );

    return PagingLoadableBaseWidget(
      totalItemsCount: Trop.allOwn.length + (Trop.allSharedCount??0),
      loadedItemsCount: Trop.allOwn.length + (TropSharedPreviewData.all?.length??0),
      callReload: () async {
        await tropSharedPreviewsLoader.run(awaitFinish: true, reloadAll: true);
        return Trop.allOwn.length + (TropSharedPreviewData.all?.length??0);
      },
      callLoadMore: () async {
        await tropSharedPreviewsLoader.run(awaitFinish: true, reloadAll: false);
        return Trop.allOwn.length + (TropSharedPreviewData.all?.length??0);
      },
      controller: refreshController,
      sliversBuilder: (context, isLoading, innerScrollViewKey) => getSlivers(innerScrollViewKey),
    );
  }
}

Future<void> openTropSelector(
    BuildContext context,
    { void Function(String? lclId, String? tropKey)? onSelected
    }) => openDialog(
    context: context,
    builder: (context) => Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
          color: background_(context),
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: Column(
            children: [
              AppBar(
                title: const Text('Wybierz trop'),
                elevation: 0,
                centerTitle: true,
              ),
              Expanded(
                child: TropSelector(onSelected: onSelected),
              )
            ],
          ),
        )
    )
);

Future<(String?, String?)> selectTrop(BuildContext context) async {

  String? selLclId;
  String? selTropKey;

  await openTropSelector(
    context,
    onSelected: (lclId, tropKey){
      selLclId = lclId;
      selTropKey = tropKey;
      Navigator.pop(context);
    },
  );

  return (selLclId, selTropKey);
}
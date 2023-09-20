import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/super_search_field.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_page/account_page.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../account_test_widget.dart';
import 'community/circle/model/circle.dart';
import 'community/communities_loader.dart';
import 'community/community_publishable.dart';
import 'community/community_publishable_widget_template.dart';
import 'community/community_publishables_sliver.dart';
import 'community/forum/model/forum.dart';
import 'community/model/community.dart';
import 'community/community_preview_page.dart';

class FeedPage extends StatefulWidget{

  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;

  const FeedPage({
    this.onCircleTap,
    this.onForumTap,
    super.key
  });

  @override
  State<StatefulWidget> createState() => FeedPageState();

}

class FeedPageState extends State<FeedPage>{

  void Function(Circle)? get onCircleTap => widget.onCircleTap;
  void Function(Forum)? get onForumTap => widget.onForumTap;

  late RefreshController refreshController;

  late int loadedPage;
  late bool moreToLoad;

  late CommunityLoaderListener communitiesLoaderListener;

  @override
  void initState() {

    bool loggedIn = LoginProvider.of(context).loggedIn;
    bool loadInit = AccountData.emailConf && loggedIn && (Community.all == null || CommunityPublishable.all == null);
    refreshController = RefreshController(initialRefresh: loadInit);
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(loadInit || communitiesLoader.running)
        refreshController.headerMode!.value = RefreshStatus.refreshing;
    });

    communitiesLoaderListener = CommunityLoaderListener(
      onStart: () => setState((){}),
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onCommunitiesLoaded: (communities) async {
        if(refreshController.isRefresh)
          return;

        if(await isNetworkAvailable() && CommunityPublishable.all == null)
          if(mounted) refreshController.requestRefresh();
      },
      onForceLoggedOut: (){
        if(mounted) setState((){});
        return true;
      },
      onError: (_){ if(mounted) setState((){}); },
      onEnd: (_, __){ if(mounted) setState((){}); },
    );
    communitiesLoader.addListener(communitiesLoaderListener);

    loadedPage = -1;
    moreToLoad = true;

    super.initState();
  }

  @override
  void dispose(){
    communitiesLoader.removeListener(communitiesLoaderListener);

    refreshController.dispose();
    super.dispose();
  }

  List<Widget> getSlivers({required bool networkAvailable}) {
    List<Widget> slivers = [];

    slivers.add(SliverPadding(
      padding: const EdgeInsets.only(bottom: Dimen.SIDE_MARG),
      sliver: SliverList(delegate: SliverChildListDelegate([
        const AccountTestWidget()
      ])),
    ));

    slivers.add(SliverList(delegate: SliverChildListDelegate([

      const SuperSearchFieldButton(
        margin: EdgeInsets.symmetric(horizontal: Dimen.defMarg),
      ),

      if(CommunityPublishable.all != null && CommunityPublishable.all!.isNotEmpty)
        const SizedBox(height: Dimen.SIDE_MARG),

    ])));

    if(!AccountData.emailConf) {
      slivers.add(SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            child: SimpleButton(
              onTap: () => AccountPage.open(context),
              child: EmptyMessageWidget(
                icon: MdiIcons.accountReactivateOutline,
                text: 'Aktywuj konto by\nbyć na bieżąco',
                color: textEnab_(context),
              ),
            )
          )
      ));
      return slivers;
    }

    slivers.add(getCommunityPublishablesSliver(
      context,
      CommunityPublishable.all??[],
      onCircleButtonTap: (circle) => onCircleTap?.call(circle),
      onForumButtonTap: (forum) => onForumTap?.call(forum),
      padding: const EdgeInsets.symmetric(horizontal: CommunityPublishableWidgetTemplate.borderHorizontalMarg),
      loading: refreshController.isRefresh,
      hasNetwork: networkAvailable,
      onAnnouncementUpdated: () => setState((){}),
      onPostUpdated: () => setState((){}),
    ));

    if(!moreToLoad && CommunityPublishable.all!.isNotEmpty)
      slivers.add(SliverList(delegate: SliverChildListDelegate([
        SizedBox(
          height: 50,
          child: Icon(MdiIcons.circleMedium, color: hintEnab_(context)),
        )
      ])));

    return slivers;

  }

  @override
  Widget build(BuildContext context) => Consumer3<ConnectivityProvider, CommunityListProvider, CommunityPublishableListProvider>(
    builder: (context, connProv, communityListProv, communityPublishableListProv, child) => ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: moreToLoad && CommunityPublishable.all != null && !refreshController.isRefresh,
          physics: const BouncingScrollPhysics(),

          header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
          controller: refreshController,
          footer: AppCustomFooter(
              moreToLoad: moreToLoad,
              showDotWhenAllLoaded: true
          ),

          onRefresh: () async {

            if(!await isNetworkAvailable()){
              if(!mounted) return;
              showAppToast(context, text: noInternetMessage);
              refreshController.refreshCompleted(); // This is called in `post()` inside.
              post(() => setState(() {}));
              return;
            }

            setState(() {}); // To jest po to, żeby ekrany braku ogłoszeń dobrze wyświetliły swój stan.

            await communitiesLoader.awaitFinishIfRunning();

            if(Community.all == null){
              if(mounted) showAppToast(context, text: simpleErrorMessage);
              if(mounted) refreshController.refreshCompleted();
              return;
            }

            await ApiCommunity.getFeed(
                page: 0,
                onSuccess: (List<CommunityPublishable> newFeedPublishables) async {

                  CommunityPublishable.init(newFeedPublishables, context: mounted?context:null);
                  if(!mounted) return;

                  loadedPage = 0;
                  moreToLoad = newFeedPublishables.length == CommunityPublishable.feedPageSize;
                  setState((){});
                },
                onServerMaybeWakingUp: () {
                  if(!mounted) return true;
                  showServerWakingUpToast(context);
                  setState((){});
                  return true;
                },
                onForceLoggedOut: (){
                  if(!mounted) return true;
                  showAppToast(context, text: forceLoggedOutMessage);
                  setState(() {});
                  return true;
                },
                onError: (){
                  if(!mounted) return;
                  showAppToast(context, text: simpleErrorMessage);
                  setState((){});
                }
            );

            if(mounted) refreshController.refreshCompleted(); // This is called in `post()` inside.
            post(() => mounted?setState(() {}):null);

          },
          onLoading: () async {

            CommunityPublishableListProvider publishableListProv = CommunityPublishableListProvider.of(context);

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

            await ApiCommunity.getFeed(
                page: loadedPage + 1,
                onSuccess: (nextPublishables){

                  int i;
                  for(i=0; i<nextPublishables.length; i++)
                    if(!CommunityPublishable.allMap!.containsKey(nextPublishables[i].key)) break;

                  CommunityPublishable.addListToAll(
                      nextPublishables.sublist(i),
                      context: mounted?context:null
                  );

                  if(!mounted) return;

                  loadedPage += 1;

                  if(mounted) publishableListProv.notify();

                  if(nextPublishables.length != CommunityPublishable.feedPageSize)
                    moreToLoad = false;

                  setState((){});

                },
                onServerMaybeWakingUp: () {
                  if(!mounted) return true;
                  showServerWakingUpToast(context);
                  setState((){});
                  return true;
                },
                onForceLoggedOut: (){
                  if(!mounted) return true;
                  showAppToast(context, text: forceLoggedOutMessage);
                  setState(() {});
                  return true;
                },
                onError: (){
                  if(!mounted) return;
                  showAppToast(context, text: simpleErrorMessage);
                  setState((){});
                }
            );

            refreshController.loadComplete();

          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: getSlivers(networkAvailable: connProv.connected),
          )
      ),
    ),
  );

}

class CommunitiesBarWidget extends StatelessWidget{

  final void Function()? onAllCommunitiesOpen;
  const CommunitiesBarWidget({this.onAllCommunitiesOpen, super.key});

  @override
  Widget build(BuildContext context) => Consumer2<CommunityListProvider, CommunityProvider>(
      builder: (context, _, __, child){

        List<Widget> children = [];
        for(Community community in Community.all!){
          children.add(InkWell(
            onTap: () => pushPage(
              context,
              builder: (context) => CommunityPreviewPage(
                community,
                onAllCommunitiesTap: (){
                  Navigator.pop(context);
                  onAllCommunitiesOpen?.call();
                }
              )
            ),
            child: Stack(
              children: [

                CommunityThumbnailWidget(
                    community.iconKey,
                    community.key
                ),

                Positioned.fill(
                  child: Material(
                    borderRadius: BorderRadius.circular(AppCard.bigRadius),
                    clipBehavior: Clip.hardEdge,
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => pushPage(
                          context,
                          builder: (context) => CommunityPreviewPage(
                              community,
                              onAllCommunitiesTap: (){
                                Navigator.pop(context);
                                onAllCommunitiesOpen?.call();
                              }
                          )
                      ),
                    ),
                  )
                )
                
              ],
            ),
          ));

          if(community != Community.all!.last)
            children.add(const SizedBox(width: Dimen.SIDE_MARG));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          child: Row(children: children),
        );
      }
  );

}

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_custom_footer.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/super_search_field.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/login_provider.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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

  late LoginListener loginListener;
  late LoginProvider loginProv;

  @override
  void initState() {
    communitiesLoaderListener = CommunityLoaderListener(
      onStart: () => setState((){}),
      onCommunitiesLoaded: (communities) async {
        if(refreshController.isRefresh)
          return;

        if(await isNetworkAvailable() && CommunityPublishable.all == null)
          if(mounted) refreshController.requestRefresh();
      },
      onForceLoggedOut: (){
        if(mounted) setState((){});
        loginProv.notify();
        return true;
      },
      onError: (_){ if(mounted) setState((){}); },
      onEnd: (_, __){ if(mounted) setState((){}); },
    );
    communitiesLoader.addListener(communitiesLoaderListener);

    loginListener = LoginListener(
      onForceLogout: () => loginProv.notify()
    );

    AccountData.addLoginListener(loginListener);

    loginProv = LoginProvider.of(context);

    refreshController = RefreshController(
        initialRefresh: Community.all == null ||
        CommunityPublishable.all == null
    );

    loadedPage = -1;
    moreToLoad = true;

    super.initState();
  }

  @override
  void dispose(){
    communitiesLoader.removeListener(communitiesLoaderListener);
    AccountData.removeLoginListener(loginListener);

    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer2<ConnectivityProvider, CommunityListProvider>(
    builder: (context, connProv, communityListProv, child) => ScrollConfiguration(
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
              showAppToast(context, text: 'Brak dostępu do Internetu');
              refreshController.refreshCompleted();
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
                  loginProv.notify();
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

            if(mounted) refreshController.refreshCompleted();

          },
          onLoading: () async {

            CommunityPublishableListProvider publishableListProv = CommunityPublishableListProvider.of(context);

            if(!moreToLoad) {
              refreshController.loadComplete();
              return;
            }

            if(!await isNetworkAvailable()){
              showAppToast(context, text: 'Brak dostępu do Internetu');
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
                  loginProv.notify();
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
            slivers: [

              SliverPadding(
                padding: const EdgeInsets.only(bottom: Dimen.SIDE_MARG),
                sliver: SliverList(delegate: SliverChildListDelegate([
                  const AccountTestWidget()
                ])),
              ),

              SliverList(delegate: SliverChildListDelegate([

                const SuperSearchFieldButton(
                  margin: EdgeInsets.symmetric(horizontal: Dimen.defMarg),
                ),

                if(CommunityPublishable.all != null && CommunityPublishable.all!.isNotEmpty)
                  const SizedBox(height: Dimen.SIDE_MARG),

              ])),

              getCommunityPublishablesSliver(
                context,
                CommunityPublishable.all??[],
                onCircleButtonTap: (circle) => onCircleTap?.call(circle),
                onForumButtonTap: (forum) => onForumTap?.call(forum),
                padding: const EdgeInsets.symmetric(horizontal: CommunityPublishableWidgetTemplate.borderHorizontalMarg),
                loading: refreshController.isRefresh,
                hasNetwork: connProv.connected,
                onAnnouncementUpdated: () => setState((){}),
                onPostUpdated: () => setState((){}),
              ),

              if(!moreToLoad && CommunityPublishable.all!.isNotEmpty)
                SliverList(delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 50,
                    child: Icon(MdiIcons.circleMedium, color: hintEnab_(context)),
                  )
                ]))

            ],
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

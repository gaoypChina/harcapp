import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'forum_followers_loader.dart';
import 'model/forum.dart';

class ForumFollowersPage extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;

  const ForumFollowersPage({
    required this.forum,
    required this.palette,
    super.key});

  @override
  State<StatefulWidget> createState() => ForumFollowersPageState();

}

class ForumFollowersPageState extends State<ForumFollowersPage>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  List<UserData> get followers => forum.loadedFollowers;

  late ForumFollowersLoaderListener followersLoaderListener;

  late RefreshController controller;

  @override
  void initState() {

    ForumProvider forumProv = ForumProvider.of(context);
    ForumListProvider forumListProv = ForumListProvider.of(context);
    ForumFollowersProvider forumFollowersProv = ForumFollowersProvider.of(context);

    followersLoaderListener = ForumFollowersLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onFollowersLoaded: (followersPage, reloaded){
        Forum.callProvidersWithFollowers(forumProv, forumListProv, forumFollowersProv);
        setState((){});
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        setState(() {});
        return true;
      },
      onServerMaybeWakingUp: (){
        if(!mounted) return true;
        showServerWakingUpToast(context);
        return true;
      },
      onError: (_){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
      },
      onEnd: (_, __){
        if(!mounted) return;
        controller.loadComplete();
        controller.refreshCompleted();
        post(() => mounted?setState(() {}):null);
      }
    );

    forum.addFollowersLoaderListener(followersLoaderListener);

    controller = RefreshController(
      initialRefresh: forum.loadedFollowers.isEmpty && forum.followersCnt > 0 && !forum.isFollowersLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(forum.loadedFollowers.isEmpty && forum.isFollowersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(forum.loadedFollowers.isNotEmpty && forum.isFollowersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    forum.removeFollowersLoaderListener(followersLoaderListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<ForumFollowersProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<UserData>(
          appBarTitle: 'Obserwujący (${forum.followersCnt})',
          userSets: [
            UserSet(
                icon: null,
                name: null,
                users: followers,
                permissions: []
            ),
          ],
          userTileBuilder: (context, follower) => AccountTile(
            follower.name,
            showVerified: true,
            verified: follower.verified,
            thumbnailColor: CommunityCoverColors.cardColor(context, palette),
            thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
            thumbnailMarkerColor: CommunityCoverColors.strongColor(context, palette),
            backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          ),

          strongColor: CommunityCoverColors.strongColor(context, palette),
          backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),

          userCount: forum.followersCnt,
          callReload: () async {
            await forum.reloadFollowersPage(awaitFinish: true);
            return forum.loadedFollowers.length;
          },
          callLoadMore: () async {
            await forum.loadFollowersPage(awaitFinish: true);
            return forum.loadedFollowers.length;
          },
          controller: controller,

          emptyWidget: EmptyMessageWidget(
            text: 'Brak obserwujących',
            icon: MdiIcons.eyeOffOutline,
            color: CommunityCoverColors.strongColor(context, palette),
          ),

          emptyLoadingWidget: EmptyMessageWidget(
            text: 'Ładowanie obserwujących...',
            icon: MdiIcons.eyeOutline,
            color: CommunityCoverColors.strongColor(context, palette),
          ),

      )
  );

}

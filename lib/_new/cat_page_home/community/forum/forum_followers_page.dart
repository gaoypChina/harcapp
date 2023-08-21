import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState() {

    ForumProvider forumProv = ForumProvider.of(context);
    ForumListProvider forumListProv = ForumListProvider.of(context);
    ForumFollowersProvider forumFollowersProv = ForumFollowersProvider.of(context);

    followersLoaderListener = ForumFollowersLoaderListener(
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
    );

    forum.addFollowersLoaderListener(followersLoaderListener);

    super.initState();
  }

  @override
  void dispose() {
    forum.removeFollowersLoaderListener(followersLoaderListener);
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
            // await ApiForum.getFollowers(
            //   forumKey: forum.key,
            //   pageSize: Forum.followerPageSize,
            //   lastUserName: null,
            //   lastUserKey: null,
            //   onSuccess: (followersPage){
            //     forum.setAllLoadedFollowers(followersPage, context: context);
            //     if(mounted) setState((){});
            //   },
            //   onForceLoggedOut: (){
            //     if(!mounted) return true;
            //     showAppToast(context, text: forceLoggedOutMessage);
            //     setState(() {});
            //     return true;
            //   },
            //   onServerMaybeWakingUp: (){
            //     if(!mounted) return true;
            //     showServerWakingUpToast(context);
            //     return true;
            //   },
            //   onError: (){
            //     if(!mounted) return;
            //     showAppToast(context, text: simpleErrorMessage);
            //   },
            // );
            return forum.loadedFollowers.length;
          },
          callLoadMore: () async {
            await forum.loadFollowersPage(awaitFinish: true);
            // await ApiForum.getFollowers(
            //   forumKey: forum.key,
            //   pageSize: Forum.followerPageSize,
            //   lastUserName: followers.isEmpty?null:followers.last.name,
            //   lastUserKey: followers.isEmpty?null:followers.last.key,
            //   onSuccess: (followersPage){
            //     forum.addLoadedFollowers(followersPage, context: context);
            //     if(mounted) setState((){});
            //   },
            //   onForceLoggedOut: (){
            //     if(!mounted) return true;
            //     showAppToast(context, text: forceLoggedOutMessage);
            //     setState(() {});
            //     return true;
            //   },
            //   onServerMaybeWakingUp: (){
            //     if(!mounted) return true;
            //     showServerWakingUpToast(context);
            //     return true;
            //   },
            //   onError: (){
            //     if(!mounted) return;
            //     showAppToast(context, text: simpleErrorMessage);
            //   },
            // );
            return forum.loadedFollowers.length;
          },
          callLoadOnInit: false,
          callReloadOnInit: forum.loadedFollowers.isEmpty && !forum.isFollowersLoading(),

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

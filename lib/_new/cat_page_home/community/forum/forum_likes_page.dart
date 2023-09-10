import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account_details_bottom_sheet.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'forum_likes_loader.dart';
import 'model/forum.dart';

class ForumLikesPage extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;

  const ForumLikesPage({
    required this.forum,
    required this.palette,
    super.key});

  @override
  State<StatefulWidget> createState() => ForumLikesPageState();

}

class ForumLikesPageState extends State<ForumLikesPage>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  List<UserData> get likes => forum.loadedLikes;

  late ForumLikesLoaderListener likesLoaderListener;

  late RefreshController controller;

  @override
  void initState() {

    ForumProvider forumProv = ForumProvider.of(context);
    ForumListProvider forumListProv = ForumListProvider.of(context);
    ForumLikesProvider forumLikesProv = ForumLikesProvider.of(context);

    likesLoaderListener = ForumLikesLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onLikesLoaded: (likesPage, reloaded){
        Forum.callProvidersWithLikes(forumProv, forumListProv, forumLikesProv);
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
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

    forum.addLikesLoaderListener(likesLoaderListener);

    controller = RefreshController(
      initialRefresh: forum.loadedLikes.isEmpty && forum.likeCnt > 0 && !forum.isLikesLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(forum.loadedLikes.isEmpty && forum.isLikesLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(forum.loadedLikes.isNotEmpty && forum.isLikesLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    forum.removeLikesLoaderListener(likesLoaderListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<ForumLikesProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<UserData>(
          appBarTitle: 'Lubiący (${forum.likeCnt})',
          userSets: [
            UserSet(
                icon: null,
                name: null,
                users: likes,
                permissions: []
            ),
          ],
          userTileBuilder: (context, like) => AccountTile(
            like.name,

            showVerified: true,
            verified: like.verified,
            thumbnailColor: CommunityCoverColors.cardColor(context, palette),
            thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
            thumbnailMarkerColor: CommunityCoverColors.strongColor(context, palette),
            backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
            onTap: () => showAccountDetailsButtonSheet(
              context,
              like,
              thumbnailColor: CommunityCoverColors.cardColor(context, palette),
              thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
              thumbnailMarkerColor: CommunityCoverColors.strongColor(context, palette),
              backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
            ),
          ),

          strongColor: CommunityCoverColors.strongColor(context, palette),
          backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),

          userCount: forum.likeCnt,
          callReload: () async {
            await forum.reloadLikesPage(awaitFinish: true);
            return forum.loadedLikes.length;
          },
          callLoadMore: () async {
            await forum.loadLikesPage(awaitFinish: true);
            return forum.loadedLikes.length;

          },
          controller: controller,

          emptyWidget: EmptyMessageWidget(
            text: 'Brak polubień',
            icon: MdiIcons.thumbDownOutline,
            color: CommunityCoverColors.strongColor(context, palette),
          ),

          emptyLoadingWidget: EmptyMessageWidget(
            text: 'Ładowanie polubień...',
            icon: MdiIcons.thumbUpOutline,
            color: CommunityCoverColors.strongColor(context, palette),
          ),
      )
  );

}

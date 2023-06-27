import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

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
          ),

          strongColor: CommunityCoverColors.strongColor(context, palette),
          backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),

          userCount: forum.likeCnt,
          callReload: () async {
            await ApiForum.getLikes(
              forumKey: forum.key,
              pageSize: Forum.likePageSize,
              lastUserName: null,
              lastUserKey: null,
              onSuccess: (likesPage){
                forum.setAllLoadedLikes(likesPage, context: context);
                if(mounted) setState((){});
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
              onError: (){
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
              },
            );
            return forum.loadedLikes.length;
          },
          callLoadMore: () async {

            int allLoadedItems = 0;

            await ApiForum.getLikes(
              forumKey: forum.key,
              pageSize: Forum.likePageSize,
              lastUserName: likes.isEmpty?null:likes.last.name,
              lastUserKey: likes.isEmpty?null:likes.last.key,
              onSuccess: (likesPage){
                forum.addLoadedLikes(likesPage, context: context);
                allLoadedItems = forum.loadedLikes.length;
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
              onError: (){
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
              },
            );

            return allLoadedItems;

          },
          callLoadOnInit: forum.loadedLikes.isEmpty,

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

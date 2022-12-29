import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
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
  List<UserData> get likes => forum.likes;
  
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

            thumbnailColor: CommunityCoverColors.cardColor(context, palette),
            thumbnailBorderColor: CommunityCoverColors.cardColor(context, palette),
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
                forum.setAllLikes(likesPage, context: context);
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
          },
          callLoadMore: () async {

            bool success = false;

            await ApiForum.getLikes(
              forumKey: forum.key,
              pageSize: Forum.likePageSize,
              lastUserName: likes.isEmpty?null:likes.last.name,
              lastUserKey: likes.isEmpty?null:likes.last.key,
              onSuccess: (likesPage){
                forum.setAllLikes(likesPage, context: context);
                success = true;
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

            return success;

          },
          callLoadOnInit: forum.likes.isEmpty,
      )
  );

}

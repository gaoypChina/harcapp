import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../common/community_cover_colors.dart';
import '../community_publishable.dart';
import '../community_publishable_widget_template.dart';
import 'model/post.dart';

class PostWidgetTemplate extends StatelessWidget{

  final Post post;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final void Function(Post)? onDeleted;
  final bool showCommunityInfo;
  final void Function()? onForumButtonTap;
  final bool constrainImage;

  const PostWidgetTemplate(
      this.post,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.onDeleted,
        this.showCommunityInfo = false,
        this.onForumButtonTap,
        this.constrainImage = true,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context){

    bool amIAuthor = AccountData.key == post.author?.key;

    return CommunityPublishableWidgetTemplate(
      post,
      palette,
      shrinkText: shrinkText,
      onTap: onTap,
      onUpdateTap: onUpdateTap,
      showCommunityInfo: showCommunityInfo,
      onCommunityButtonTap: onForumButtonTap,
      onMoreTap:
      amIAuthor && post.forum.myRole != null?
      () => showScrollBottomSheet(
          context: context,
          builder: (_) => BottomSheetDef(
            color: CommunityCoverColors.backgroundColor(context, palette),
            builder: (_) => Column(
              children: [

                if(amIAuthor && post.forum.myRole != null)
                  ListTile(
                    leading: const Icon(MdiIcons.pencilOutline),
                    title: Text('Edytuj post', style: AppTextStyle()),
                    onTap: (){
                      Navigator.pop(context);
                      onUpdateTap?.call();
                    },
                  ),

                if(amIAuthor && post.forum.myRole != null)
                  ListTile(
                    leading: const Icon(MdiIcons.trashCanOutline),
                    title: Text('Usuń post', style: AppTextStyle()),
                    onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),
                    onLongPress: (){

                      Navigator.pop(context); // Hide bottom sheet

                      showLoadingWidget(
                          context,
                          CommunityCoverColors.strongColor(context, palette),
                          'Usuwanie...'
                      );

                      ApiForum.deletePost(
                          postKey: post.key,
                          onSuccess: () async {
                            post.forum.removePost(post);
                            PostListProvider.notify_(context);
                            CommunityPublishableListProvider.notify_(context);
                            await popPage(context); // Close loading widget.
                            onDeleted?.call(post);
                          },
                          onServerMaybeWakingUp: () {
                            showServerWakingUpToast(context);
                            return true;
                          },
                          onError: () async {
                            showAppToast(context, text: simpleErrorMessage);
                            await popPage(context); // Close loading widget.
                          }
                      );

                    },
                  ),

              ],
            ),
          )
      ):null,
      constrainImage: constrainImage
    );

  }

}

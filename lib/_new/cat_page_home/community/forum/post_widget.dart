import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_editor/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_extended_page.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_widget_template.dart';
import 'package:harcapp/account/account.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../community_publishable.dart';
import '../community_publishable_widget_template.dart';
import 'model/forum.dart';
import 'model/post.dart';

class PostWidget extends StatelessWidget{

  final Post post;
  final PaletteGenerator? palette;
  final bool shrinkText;
  final bool disableTap;
  final void Function()? onPostUpdated;
  final bool showCommunityInfo;
  final void Function()? onForumButtonTap;

  Forum get forum => post.forum;

  const PostWidget(
      this.post,
      this.palette,
      { this.shrinkText = true,
        this.disableTap = false,
        this.onPostUpdated,
        this.showCommunityInfo = false,
        this.onForumButtonTap,
        super.key
      });

  @override
  Widget build(BuildContext context){

    bool editable = post.author?.key == AccountData.key && post.forum.myRole != null;

    return Hero(
        tag: post,
        child: Consumer<PostProvider>(
          builder: (context, prov, child) => PostWidgetTemplate(
            post,
            palette: palette,
            shrinkText: shrinkText,
            onUpdateTap: editable ? () => pushPage(
                context,
                builder: (context) => PostEditorPage(
                  forum: forum,
                  initPost: post,
                  palette: palette,
                  onSaved: (updatedPost){
                    Post.allMap?[post.key]?.update(updatedPost);
                    (CommunityPublishable.allMap?[post.key] as Post?)?.update(updatedPost);
                    onPostUpdated?.call();
                    prov.notify();
                  },
                  onRemoved: (){
                    forum.removePost(post);
                    onPostUpdated?.call();
                    prov.notify();
                  },
                )
            ):null,

            onTap: !disableTap && CommunityPublishableWidgetTemplate.isTextExpandable(post.text, context: context)?
            () => pushPage(
              context,
              builder: (context) => PostExpandedPage(
                post,
                palette: palette,
                onPostUpdated: onPostUpdated,
              ),
            ):null,
            showCommunityInfo: showCommunityInfo,
            onForumButtonTap: onForumButtonTap,

          ),
        )
    );

  }

}
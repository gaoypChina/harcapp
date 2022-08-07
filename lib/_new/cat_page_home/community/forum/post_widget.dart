import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_widget_template.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import 'model/forum.dart';
import 'model/post.dart';

class PostWidget extends StatelessWidget{

  final Post post;
  final PaletteGenerator? palette;
  final bool shrinkText;
  final bool pinnable;
  final bool editable;
  final bool showOnTap;
  final void Function()? onPostUpdated;
  final bool showForumButton;
  final void Function()? onForumButtonTap;

  Forum get forum => post.forum!;

  const PostWidget(
      this.post,
      this.palette,
      { this.shrinkText = true,
        this.pinnable = true,
        this.editable = true,
        this.showOnTap = true,
        this.onPostUpdated,
        this.showForumButton = false,
        this.onForumButtonTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => Hero(
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
                    // circle.updateAnnouncement(updatedAnnouncement);
                    post.update(updatedPost);
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

            onTap: showOnTap?() => pushPage(
              context,
              builder: (context) => PostExpandedPage(
                post,
                palette: palette,
                onAnnouncementsUpdated: onPostUpdated,
              ),
            ):null,
            showForumButton: showForumButton,
            onForumButtonTap: onForumButtonTap,
        ),
      )
  );

}
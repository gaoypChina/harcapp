import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

import '../community_publishable_widget_template.dart';
import 'model/post.dart';

class PostWidgetTemplate extends StatelessWidget{

  final Post post;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final bool showCommunityInfo;
  final void Function()? onForumButtonTap;

  const PostWidgetTemplate(
      this.post,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.showCommunityInfo = false,
        this.onForumButtonTap,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => CommunityPublishableWidgetTemplate(
    post,
    palette,
    shrinkText: shrinkText,
    onTap: onTap,
    onUpdateTap: onUpdateTap,
    showCommunityInfo: showCommunityInfo,
    onCommunityButtonTap: onForumButtonTap,
  );

}

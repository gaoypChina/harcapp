import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/post_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common/community_cover_colors.dart';
import '../community_publishable_widget_template.dart';
import 'model/forum.dart';
import 'model/post.dart';


Widget getPostsSliver(
    BuildContext context,
    List<Post> posts,
    { EdgeInsets padding = EdgeInsets.zero,
      bool showCommunityInfo = false,
      void Function(Forum)? onForumButtonTap,
      PaletteGenerator? palette,
      bool loading = false,
      String? emptyMessage,
      String? loadingMessage,
      void Function()? onPostUpdated,
    }) {

  if (posts.isEmpty)
    return SliverPadding(
      padding: padding,
      sliver: SliverList(delegate: SliverChildListDelegate([
        const SizedBox(height: 2 * Dimen.SIDE_MARG),
        EmptyMessageWidget(
          icon: MdiIcons.newspaperVariantOutline,
          text: loading?(loadingMessage??'Ładowanie ogłoszeń'):(emptyMessage??'Brak ogłoszeń'),
          color: CommunityCoverColors.cardColor(context, palette),
        ),
      ])),
    );
  else
    return SliverPadding(
      padding: padding,
      sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) =>
              PostWidget(
                posts[index],
                palette,
                onPostUpdated: onPostUpdated,
                showCommunityInfo: showCommunityInfo,
                onForumButtonTap: onForumButtonTap == null?null:() => onForumButtonTap.call(posts[index].forum),
              ),
          separatorBuilder: (context, index) =>
          const SizedBox(height: 3*CommunityPublishableWidgetTemplate.borderHorizontalMarg),
          count: posts.length
      )),
    );

}

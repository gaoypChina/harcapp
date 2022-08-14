import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/announcement_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle/model/circle.dart';
import 'common/community_cover_colors.dart';
import 'forum/model/forum.dart';
import 'forum/model/post.dart';
import 'forum/post_widget.dart';

Widget getCommunityPublishablesSliver(
    BuildContext context,
    List<CommunityPublishable> communityPublishables,
    { EdgeInsets padding = EdgeInsets.zero,
      void Function(Circle)? onCircleButtonTap,
      void Function(Forum)? onForumButtonTap,
      PaletteGenerator? palette,
      bool loading = false,
      String? emptyMessage,
      String? loadingMessage,
      void Function()? onAnnouncementUpdated,
      void Function()? onPostUpdated,
    }) {

  if (communityPublishables.isEmpty)
    return SliverPadding(
      padding: padding,
      sliver: SliverList(delegate: SliverChildListDelegate([
        const SizedBox(height: 2 * Dimen.SIDE_MARG),
        EmptyMessageWidget(
          icon: MdiIcons.newspaperVariantOutline,
          text: loading?(loadingMessage??'Ładowanie'):(emptyMessage??'Brak ogłoszeń'),
          color: CommunityCoverColors.cardColor(context, palette),
        ),
      ])),
    );
  else
    return SliverPadding(
      padding: padding,
      sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
          (context, index){

            CommunityPublishable publishable = communityPublishables[index];

            if(publishable is Announcement)
              return AnnouncementWidget(
                publishable,
                palette,
                pinnable: false,
                editable: false,
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCommunityInfo: true,
                onCircleButtonTap: onCircleButtonTap == null?null:() => onCircleButtonTap.call(publishable.circle),
              );
            else if(publishable is Post)
              return PostWidget(
                publishable,
                palette,
                pinnable: false,
                editable: false,
                onPostUpdated: onPostUpdated,
                showCommunityInfo: true,
                onForumButtonTap: onForumButtonTap == null?null:() => onForumButtonTap.call(publishable.forum),
              );

          },
          separatorBuilder: (context, index) =>
          const SizedBox(height: Dimen.SIDE_MARG),
          count: communityPublishables.length
      )),
    );

}

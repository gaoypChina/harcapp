import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/announcement_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle/model/circle.dart';
import 'common/community_cover_colors.dart';
import 'community_publishable_widget_template.dart';
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
      required bool loading,
      required bool hasNetwork,
      String noNetMessage = 'Brak połączenia\nz siecią',
      String emptyMessage = 'Brak ogłoszeń',
      String nullMessage = 'Przeciągnij,\nby załadować',
      String loadingMessage = 'Ładowanie',
      void Function()? onAnnouncementUpdated,
      void Function()? onPostUpdated,
    }) {

  if (communityPublishables.isEmpty)
    return SliverPadding(
      padding: padding,
      sliver: SliverFillRemaining(child:
        EmptyMessageWidget(
          icon: MdiIcons.newspaperVariantOutline,
          text: !hasNetwork?
          noNetMessage:

          loading?
          loadingMessage:

          CommunityPublishable.all == null?
          nullMessage:

          emptyMessage,
          color: CommunityCoverColors.strongColor(context, palette),
        ),

      ),
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
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCommunityInfo: true,
                onCircleButtonTap: onCircleButtonTap == null?null:() => onCircleButtonTap.call(publishable.circle),
                showPinShortcutButton: true
              );
            else if(publishable is Post)
              return PostWidget(
                publishable,
                palette,
                onPostUpdated: onPostUpdated,
                showCommunityInfo: true,
                onForumButtonTap: onForumButtonTap == null?null:() => onForumButtonTap.call(publishable.forum),
              );

          },
          separatorBuilder: (context, index) =>
          const SizedBox(height: 3*CommunityPublishableWidgetTemplate.borderHorizontalMarg),
          count: communityPublishables.length
      )),
    );

}

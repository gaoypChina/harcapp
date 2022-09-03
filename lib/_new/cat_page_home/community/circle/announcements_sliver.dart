import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/announcement_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../common/community_cover_colors.dart';
import '../community_publishable_widget_template.dart';
import 'model/announcement.dart';
import 'model/circle.dart';

Widget getAnnouncementsSliver(
    BuildContext context,
    List<Announcement> announcements,
    { EdgeInsets padding = EdgeInsets.zero,
      bool showCommunityInfo = false,
      void Function(Circle)? onCircleButtonTap,
      PaletteGenerator? palette,
      bool loading = false,
      String? emptyMessage,
      String? loadingMessage,
      void Function()? onAnnouncementUpdated,
    }) {

  if (announcements.isEmpty)
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
              AnnouncementWidget(
                announcements[index],
                palette,
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCommunityInfo: showCommunityInfo,
                onCircleButtonTap: onCircleButtonTap == null?null:() => onCircleButtonTap.call(announcements[index].circle),
              ),
          separatorBuilder: (context, index) => const SizedBox(height: 3*CommunityPublishableWidgetTemplate.borderHorizontalMarg),
          
          //SizedBox(height: Dimen.SIDE_MARG),
          count: announcements.length
      )),
    );

}

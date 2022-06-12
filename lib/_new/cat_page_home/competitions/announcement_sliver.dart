import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/circle.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Widget getAnnouncementsSliver(
    BuildContext context,
    List<Announcement> announcements,
    { EdgeInsets padding = EdgeInsets.zero,
      bool showCircleButton = false,
      void Function(Circle)? onCircleButtonTap,
      PaletteGenerator? palette,
      String? emptyMessage,
      void Function()? onAnnouncementUpdated,
    }) {

  if (announcements.isEmpty)
    return SliverPadding(
      padding: padding,
      sliver: SliverList(delegate: SliverChildListDelegate([
        const SizedBox(height: 2 * Dimen.SIDE_MARG),
        EmptyMessageWidget(
          icon: MdiIcons.newspaperVariantOutline,
          text: emptyMessage??'Brak ogłoszeń',
          color: CirclePage.cardColor(context, palette),
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
                pinnable: false,
                editable: false,
                onAnnouncementUpdated: onAnnouncementUpdated,
                showCircleButton: showCircleButton,
                onCircleButtonTap: onCircleButtonTap == null?null:() => onCircleButtonTap.call(announcements[index].circle!),
              ),
          separatorBuilder: (context, index) =>
          const SizedBox(height: Dimen.SIDE_MARG),
          count: announcements.length
      )),
    );

}

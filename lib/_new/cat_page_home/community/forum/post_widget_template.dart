import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/cover_image.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import '../common/community_cover_colors.dart';
import '../community_publishable_widget_template.dart';
import 'model/post.dart';

class PostWidgetTemplate extends StatelessWidget{

  final Post post;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final bool showForumButton;
  final void Function()? onForumButtonTap;

  const PostWidgetTemplate(
      this.post,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.showForumButton = false,
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
    showSourceButton: showForumButton,
    sourceIcon: MdiIcons.broadcast,
    sourceText: post.forum!.name,

    bottomLeadingPadding: Dimen.SIDE_MARG - Dimen.ICON_MARG,
    bottomTrailingPadding: Dimen.SIDE_MARG - Dimen.ICON_MARG,
  );

}

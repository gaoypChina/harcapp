import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../community_group_widget_template.dart';
import 'model/forum.dart';

class ForumWidget extends StatelessWidget{

  static const double height = 180;

  final ForumBasicData forum;
  final BorderRadius? borderRadius;
  final double? elevation;
  final void Function()? onTap;
  const ForumWidget(this.forum, {this.borderRadius, this.elevation, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Consumer<ForumProvider>(
      builder: (context, prov, child) => CommunityGroupWidgetTemplate(
        forum.coverImage,
        text: 'Forum',
        icon: Forum.icon,
        borderRadius: borderRadius,
        elevation: elevation,
        onTap: onTap,
        titleBottom: Column(
          children: [

            Row(
              children: [
                const SizedBox(width: Dimen.ICON_MARG),
                Icon(forum.followed?MdiIcons.eyeCheck:MdiIcons.eyeOutline),
                const SizedBox(width: Dimen.ICON_MARG),
                Text(
                    '${forum.followersCnt}',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: iconEnab_(context),
                        fontWeight: weight.halfBold
                    )
                ),
              ],
            ),

            const SizedBox(height: Dimen.ICON_MARG),

            Row(
              children: [
                const SizedBox(width: Dimen.ICON_MARG),
                Icon(forum.liked?MdiIcons.thumbUp:MdiIcons.thumbUpOutline),
                const SizedBox(width: Dimen.ICON_MARG),
                Text(
                    '${forum.likeCnt}',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: iconEnab_(context),
                        fontWeight: weight.halfBold
                    )
                ),
              ],
            ),

          ],
        )
      )
  );

}
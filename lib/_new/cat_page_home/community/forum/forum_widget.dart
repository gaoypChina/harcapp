import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../community_group_widget_template.dart';
import 'model/forum.dart';
import 'model/post.dart';

class ForumWidget extends StatelessWidget{

  static const double height = 180;

  final ForumBasicData forum;
  final void Function()? onTap;
  const ForumWidget(this.forum, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) => Consumer<ForumProvider>(
      builder: (context, prov, child) => CommunityGroupWidgetTemplate(
        forum.coverImage,
        text: 'Forum',
        icon: Post.icon,
        onTap: onTap,
        titleBottom: Column(
          children: [

            Row(
              children: [
                const SizedBox(width: Dimen.ICON_MARG),
                const Icon(MdiIcons.eyeCheckOutline),
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
                const Icon(MdiIcons.thumbUpOutline),
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

          ],
        )
      )
  );

}
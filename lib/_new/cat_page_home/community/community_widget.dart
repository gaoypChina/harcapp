import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/_main.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'forum/forum_widget.dart';
import 'forum/model/forum.dart';
import 'model/community.dart';
import '../circles/model/circle.dart';

class CommunityWidget extends StatelessWidget{

  final Community community;
  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;
  const CommunityWidget(this.community, {this.onCircleTap, this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      child: Material(
          clipBehavior: Clip.hardEdge,
          color: cardEnab_(context),
          borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(
                  top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  left: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                ),
                child: Row(
                  children: [

                    Material(
                      borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                      clipBehavior: Clip.hardEdge,
                      elevation: AppCard.bigElevation,
                      color: background_(context),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimen.ICON_MARG),
                        child: Icon(
                          CommonIconData.ALL[community.iconKey]
                        ),
                      ),
                    ),

                    const SizedBox(width: Dimen.ICON_MARG),

                    Expanded(
                      child: Text(
                          community.name,
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.halfBold,
                            color: iconEnab_(context)
                          )
                      ),
                    ),

                    IconButton(
                      icon: const Icon(MdiIcons.cogOutline),
                      onPressed: () => pushPage(
                        context,
                        builder: (context) => CommunityEditorPage(
                            initCommunity: community
                        )
                      )
                    )

                  ],
                ),
              ),

              if(community.circle != null)
                Padding(
                  padding: const EdgeInsets.all(Dimen.DEF_MARG),
                  child: CircleWidget(community.circle!, onTap: () => onCircleTap?.call(community.circle!)),
                ),

              if(community.forum != null)
                Padding(
                  padding: const EdgeInsets.all(Dimen.DEF_MARG),
                  child: ForumWidget(community.forum!, onTap: () => onForumTap?.call(community.forum!)),
                ),

            ],
          )
      )
  );

}
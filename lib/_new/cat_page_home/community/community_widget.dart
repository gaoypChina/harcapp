import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle/model/circle.dart';
import 'common_widgets/community_buttons_widget.dart';
import 'common_widgets/community_groups_widget.dart';
import 'community_page.dart';
import 'community_widget_template.dart';
import 'forum/model/forum.dart';
import 'model/community.dart';

class CommunityWidget extends StatelessWidget{

  final Community community;
  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;
  const CommunityWidget(this.community, {this.onCircleTap, this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => Consumer<CommunityProvider>(
      builder: (context, prov, child) => CommunityWidgetTemplate(
          community.key,
          community.iconKey,
          community.name,
          community.category,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(
                    left: Dimen.defMarg,
                    right: Dimen.defMarg,
                ),
                child: Row(
                  children: [

                    if(community.myRole != null)
                      CommunityButtonsWidget(
                        community,
                        onCircleTap: onCircleTap,
                        onForumTap: onForumTap,
                      ),

                    Expanded(child: Container()),

                    SimpleButton.from(
                        context: context,
                        margin: EdgeInsets.zero,
                        radius: communityRadius,
                        icon: MdiIcons.arrowRight,
                        text: community.myRole != null?null:'Więcej',
                        iconLeading: false,
                        onTap: () => pushPage(
                            context,
                            builder: (context) => CommunityPage(
                              community,
                              onCircleTap: onCircleTap,
                              onForumTap: onForumTap,
                            )
                        )
                    ),

                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.defMarg),
                child: CommunityGroupsWidget(
                  community,
                  onCircleTap: onCircleTap,
                  onForumTap: onForumTap,
                ),
              ),

            ],
          )
      )
  );

}
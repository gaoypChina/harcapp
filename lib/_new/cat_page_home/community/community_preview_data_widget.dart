import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/common_contact_widget.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp/_new/cat_page_home/community/community_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../_main.dart';
import 'forum/forum_loader_page.dart';
import 'forum/forum_widget.dart';
import 'model/community.dart';

class CommunityPreviewDataWidget extends StatelessWidget{

  final CommunityPreviewData community;
  final void Function(ForumBasicData)? onForumTap;
  final bool showHeaderInContact;

  const CommunityPreviewDataWidget(this.community, {this.onForumTap, this.showHeaderInContact = false, super.key});

  @override
  Widget build(BuildContext context) => CommunityWidgetTemplate(
      community.key,
      community.iconKey,
      community.name,
      community.category,

      subtitle: community.contact == null?
      null:
      Align(
        alignment: Alignment.topLeft,
        child: SimpleButton.from(
            context: context,
            borderRadius: BorderRadius.circular(communityRadius),
            color: background_(context),
            margin: const EdgeInsets.only(
                left: Dimen.defMarg,
                bottom: Dimen.defMarg
            ),
            icon: MdiIcons.informationOutline,
            text: 'Kontakt',
            onTap: () => openCommonContact(
                context,
                community.contact!,
                showHeader: showHeaderInContact,
                community: community
            )
        ),
      ),

      child: Consumer<ForumProvider>(
        builder: (context, prov, child) => Padding(
            padding: const EdgeInsets.only(
              left: Dimen.defMarg,
              right: Dimen.defMarg,
              bottom: Dimen.defMarg,
            ),
            child: Material(
              clipBehavior: Clip.hardEdge,
              elevation: AppCard.bigElevation,
              color: background_(context),
              borderRadius: BorderRadius.circular(communityRadius),
              child:
              community.forum == null?
              Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                child: Text(
                  'Środowisko nie ma założonego forum',
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG
                  ),
                  textAlign: TextAlign.center,
                ),
              ):
              Column(
                children: [

                  ForumWidget(
                    community.forum!,

                    borderRadius: BorderRadius.zero,
                    elevation: 0,

                    onTap:
                    onForumTap == null?
                    null: () => onForumTap?.call(community.forum!),
                  ),

                  if(community.forum!.description != null)
                    Material(
                      color: background_(context),
                      child: Padding(
                        padding: const EdgeInsets.all(Dimen.ICON_MARG),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Text(
                              'Opis:',
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  fontWeight: weight.halfBold
                              ),
                              maxLines: 4,
                            ),

                            const SizedBox(height: Dimen.ICON_MARG),

                            Text(
                              community.forum!.description!,
                              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                              maxLines: 4,
                            ),

                          ],
                        ),
                      ),
                    )

                ],
              ),
            )
        ),
      )
  );

}

void tryOpenPreviewForum(BuildContext context, ForumBasicData forum, {
  void Function()? onDeleted,
  void Function(bool)? onFollowChanged,
  void Function(bool)? onLikeChanged,
}){

  if(Community.allForumMap!.containsKey(forum.key))
    CatPageHomeState.openForumPage(
        context,
        Community.allForumMap![forum.key]!,
        onDeleted: () => onDeleted,
        onFollowChanged: (followed){

          if(followed && !forum.followed)
            forum.followersCnt += 1;
          else if(!followed && forum.followed)
            forum.followersCnt -= 1;

          forum.followed = followed;

          onFollowChanged?.call(followed);

        },
        onLikeChanged: (liked){

          if(liked && !forum.liked)
            forum.likeCnt += 1;
          else if(!liked && forum.liked)
            forum.likeCnt -= 1;

          forum.liked = liked;

          onLikeChanged?.call(liked);

        }
    );
  else
    pushPage(
        context,
        builder: (context) => ForumLoaderPage(forum: forum)
    );

}
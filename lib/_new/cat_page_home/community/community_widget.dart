import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/circle_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle/circle_editor/_main.dart';
import 'circle/circle_page.dart';
import 'circle/model/circle.dart';
import 'circle/new_circle_type.dart';
import 'community_role.dart';
import 'forum/forum_editor/_main.dart';
import 'forum/forum_page.dart';
import 'forum/forum_widget.dart';
import 'forum/model/forum.dart';
import 'forum/model/post.dart';
import 'model/community.dart';

class CommunityWidget extends StatelessWidget{

  final Community community;
  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;
  const CommunityWidget(this.community, {this.onCircleTap, this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      child: Consumer<CommunityProvider>(
        builder: (context, prov, child) => Material(
            clipBehavior: Clip.hardEdge,
            color: cardEnab_(context),
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                    top: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    right: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                    left: Dimen.SIDE_MARG - Dimen.ICON_MARG,
                  ),
                  child: Row(
                    children: [

                      CommunityThumbnailWidget(community.iconKey),

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

                    ],
                  ),
                ),

                if(community.myRole == CommunityRole.ADMIN && community.circle == null && community.forum == null)
                  const Padding(
                    padding: EdgeInsets.all(Dimen.SIDE_MARG),
                    child: AppText(
                      'Środowisko jest na razie gołe i wesołe!'
                          '\n\nZawiąż <b>krąg</b>, by komunikować się w <b>zamkniętej grupie</b>.'
                          '\n\nZawiąż <b>forum</b>, by <b>świat wiedział</b> co się u Was dzieje!',
                      size: Dimen.TEXT_SIZE_BIG,
                      textAlign: TextAlign.start,
                    ),
                  ),

                if(community.circle != null)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: Dimen.DEF_MARG,
                        right: Dimen.DEF_MARG,
                        left: Dimen.DEF_MARG
                    ),
                    child: CircleWidget(community.circle!, onTap: () => onCircleTap?.call(community.circle!)),
                  )
                else if(community.myRole == CommunityRole.ADMIN)
                  SimpleButton(
                      elevation: AppCard.bigElevation,
                      margin: const EdgeInsets.only(
                          top: Dimen.DEF_MARG,
                          right: Dimen.DEF_MARG,
                          left: Dimen.DEF_MARG
                      ),
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      radius: AppCard.BIG_RADIUS,
                      color: background_(context),
                      child: Row(
                        children: [
                          const Icon(MdiIcons.googleCircles),
                          const SizedBox(width: Dimen.SIDE_MARG),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Zawiąż krąg',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_BIG,
                                    fontWeight: weight.halfBold,
                                    color: iconEnab_(context)
                                ),
                              ),
                              Text(
                                community.name,
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                                    color: iconEnab_(context)
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      onTap: () async {

                        NewCircleType? type = await pickNewCircleType(context);
                        if (type == null) return;

                        if(type == NewCircleType.join)
                          return;
                        else
                          pushPage(
                            context,
                            builder: (context) =>
                                CircleEditorPage(
                                  community: community,
                                  onSaved: (comp) async {
                                    Circle.addToAll(context, comp);
                                    await pushReplacePage(context, builder: (context) => CirclePage(Circle.all!.last));
                                  },
                                ),
                          );

                      }
                  ),

                if(community.forum != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimen.DEF_MARG,
                      right: Dimen.DEF_MARG,
                      left: Dimen.DEF_MARG
                    ),
                    child: ForumWidget(community.forum!, onTap: () => onForumTap?.call(community.forum!)),
                  )
                else if(community.myRole == CommunityRole.ADMIN)
                  SimpleButton(
                    elevation: AppCard.bigElevation,
                    margin: const EdgeInsets.only(
                        top: Dimen.DEF_MARG,
                        right: Dimen.DEF_MARG,
                        left: Dimen.DEF_MARG
                    ),
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    radius: AppCard.BIG_RADIUS,
                    color: background_(context),
                    child: Row(
                      children: [
                        const Icon(Post.icon),
                        const SizedBox(width: Dimen.SIDE_MARG),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Zawiąż forum',
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  fontWeight: weight.halfBold,
                                  color: iconEnab_(context)
                              ),
                            ),
                            Text(
                              community.name,
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_NORMAL,
                                  color: iconEnab_(context)
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    onTap: () async => pushPage(
                      context,
                      builder: (context) =>
                          ForumEditorPage(
                            community: community,
                            onSaved: (forum) async {
                              Forum.addToAll(context, forum);
                              await pushReplacePage(context, builder: (context) => ForumPage(Forum.all!.last));
                            },
                          ),
                    )
                  ),

                if(community.myRole != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: SimpleButton.from(
                        context: context,
                        icon: MdiIcons.cogOutline,
                        text: 'Ustawienia',
                        onTap: () => pushPage(
                            context,
                            builder: (context) => CommunityEditorPage(
                              initCommunity: community,
                              onSaved: (community) =>
                                  Provider.of<CommunityProvider>(context, listen: false).notify(),
                            )
                        )
                    ),
                  )
                else
                  const SizedBox(height: Dimen.DEF_MARG),


              ],
            )
        )
      )
  );

}
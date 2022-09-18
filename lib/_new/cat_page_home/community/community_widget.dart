import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/circle_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/role_page/managers_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'circle/circle_editor/_main.dart';
import 'circle/model/circle.dart';
import 'community_role.dart';
import 'community_widget_template.dart';
import 'forum/forum_editor/_main.dart';
import 'forum/forum_widget.dart';
import 'forum/model/forum.dart';
import 'model/community.dart';

class CommunityWidget extends StatelessWidget{

  final Community community;
  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;
  const CommunityWidget(this.community, {this.onCircleTap, this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
      child: Consumer<CommunityProvider>(
        builder: (context, prov, child) => CommunityWidgetTemplate(
          community.key,
            community.iconKey,
            community.name,
            community.category,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if(community.myRole != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimen.defMarg),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        SimpleButton.from(
                            context: context,
                            margin: EdgeInsets.zero,
                            radius: communityRadius,
                            icon: MdiIcons.accountSupervisorCircleOutline,
                            text: 'Role',
                            onTap: () => pushPage(
                                context,
                                builder: (context) => CommunityManagersPage(
                                  community: community,
                                )
                            )
                        ),

                        SimpleButton.from(
                            context: context,
                            margin: EdgeInsets.zero,
                            radius: communityRadius,
                            icon: MdiIcons.cogOutline,
                            text: 'Ustawienia',
                            onTap: (){

                              CommunityProvider communityProv = CommunityProvider.of(context);

                              pushPage(
                                  context,
                                  builder: (context) => CommunityEditorPage(
                                    initCommunity: community,
                                    onSaved: (updatedCommunity){
                                      community.update(updatedCommunity);
                                      communityProv.notify();
                                    },
                                    onForceLoggedOut: (){
                                      Navigator.pop(context);
                                    },
                                  )
                              );

                            }
                        ),

                      ],
                    ),
                  ),

                if(community.myRole == CommunityRole.ADMIN && community.circle == null && community.forum == null)
                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: Text(
                      'Nic tu nie ma!',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_APPBAR,
                          fontWeight: weight.bold,
                          color: hintEnab_(context)
                      ),
                    ),
                  ),
                if(community.myRole == CommunityRole.ADMIN && community.circle == null && community.forum == null)
                  const Padding(
                    padding: EdgeInsets.only(
                      left: Dimen.SIDE_MARG,
                      right: Dimen.SIDE_MARG,
                      bottom: Dimen.SIDE_MARG
                    ),
                    child: AppText(
                          'Zawiąż <b>krąg</b>, by komunikować się w <b>zamkniętej grupie</b>.'
                          '\n\nZawiąż <b>forum</b>, by <b>świat wiedział</b> co się u Was dzieje!',
                      size: Dimen.TEXT_SIZE_BIG,
                      textAlign: TextAlign.start,
                    ),
                  ),

                if(community.circle != null)
                  Padding(
                    padding: const EdgeInsets.only(
                        right: Dimen.defMarg,
                        left: Dimen.defMarg
                    ),
                    child: CircleWidget(community.circle!, onTap: () => onCircleTap?.call(community.circle!)),
                  )
                else if(community.myRole == CommunityRole.ADMIN)
                  SimpleButton(
                      elevation: AppCard.bigElevation,
                      margin: const EdgeInsets.only(
                          top: Dimen.defMarg,
                          right: Dimen.defMarg,
                          left: Dimen.defMarg
                      ),
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      radius: communityRadius,
                      color: background_(context),
                      child: Row(
                        children: [
                          const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),
                          const Icon(MdiIcons.googleCircles),
                          const SizedBox(width: Dimen.SIDE_MARG),
                          Expanded(
                            child: Column(
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
                                ),

                                const SizedBox(height: Dimen.defMarg),

                                Text(
                                  'Krąg to zamknięta grupa środowiska służąca wymianie informacji.',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_NORMAL,
                                      color: iconDisab_(context)
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      onTap: () async {

                        pushPage(
                          context,
                          builder: (context) =>
                              CircleEditorPage(
                                community: community,
                                onSaved: (circle) async {
                                  community.setCircle(circle);
                                  CommunityProvider.notify_(context);
                                  CommunityListProvider.notify_(context);

                                  CatPageHomeState.openCirclePage(context, circle);
                                },
                              ),
                        );

                      }
                  ),

                if(community.forum != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: Dimen.defMarg,
                      right: Dimen.defMarg,
                      left: Dimen.defMarg
                    ),
                    child: ForumWidget(community.forum!, onTap: () => onForumTap?.call(community.forum!)),
                  )
                else if(community.myRole == CommunityRole.ADMIN)
                  SimpleButton(
                    elevation: AppCard.bigElevation,
                    margin: const EdgeInsets.only(
                        top: Dimen.defMarg,
                        right: Dimen.defMarg,
                        left: Dimen.defMarg
                    ),
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    radius: communityRadius,
                    color: background_(context),
                    child: Row(
                      children: [
                        const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),
                        const Icon(Forum.icon),
                        const SizedBox(width: Dimen.SIDE_MARG),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Załóż forum',
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
                              ),

                              const SizedBox(height: Dimen.defMarg),

                              Text(
                                'Forum to publiczna strona środowiska, którą każdy może obserwować.',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_NORMAL,
                                    color: iconDisab_(context)
                                ),
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                    onTap: () async => pushPage(
                      context,
                      builder: (context) =>
                          ForumEditorPage(
                            community: community,
                            onSaved: (forum) async {
                              community.setForum(forum);

                              CommunityProvider.notify_(context);
                              CommunityListProvider.notify_(context);

                              CatPageHomeState.openForumPage(context, forum);
                            },
                          ),
                    )
                  ),

                 const SizedBox(height: Dimen.defMarg),

              ],
            )
        )
      )
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'circle/model/circle.dart';
import 'common_widgets/community_buttons_widget.dart';
import 'common_widgets/community_contact_widget.dart';
import 'common_widgets/community_groups_widget.dart';
import 'common_widgets/community_header_widget.dart';
import 'forum/model/forum.dart';
import 'model/community.dart';

class CommunityPage extends StatelessWidget{

  final Community community;
  final void Function(Circle)? onCircleTap;
  final void Function(Forum)? onForumTap;
  const CommunityPage(this.community, {this.onCircleTap, this.onForumTap, super.key});

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: Consumer<CommunityProvider>(
        builder: (context, prov, child) => CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            SliverAppBar(
              title: Text(community.name),
              centerTitle: true,
              floating: true,
            ),

            SliverPadding(
              padding: const EdgeInsets.all(Dimen.defMarg),
              sliver: SliverList(delegate: SliverChildListDelegate([

                Material(
                  color: backgroundIcon_(context),
                  borderRadius: BorderRadius.circular(communityRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimen.defMarg),
                    child: Column(
                      children: [

                        CommunityHeaderWidget(
                          community.iconKey,
                          community.key,
                          community.name,
                          community.category,
                        ),

                        const SizedBox(height: Dimen.defMarg),

                        CommunityButtonsWidget(
                          community,
                          onCircleTap: onCircleTap,
                          onForumTap: onForumTap,
                        ),

                      ],
                    ),
                  )
                ),

                const SizedBox(height: Dimen.defMarg),

                if(community.contact != null)
                  Material(
                    color: backgroundIcon_(context),
                    borderRadius: BorderRadius.circular(communityRadius),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.defMarg),
                      child: CommunityContactWidget(community.contact!),
                    ),
                  ),

                if(community.contact != null)
                  const SizedBox(height: Dimen.defMarg),

                CommunityGroupsWidget(
                  community,
                  onCircleTap: onCircleTap,
                  onForumTap: onForumTap,
                ),

              ])),
            )

          ],
        ),


        //     CommunityWidgetTemplate(
        //     community.key,
        //     community.iconKey,
        //     community.name,
        //     community.category,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //
        //         if(community.myRole != null)
        //           Padding(
        //             padding: const EdgeInsets.only(
        //               left: Dimen.defMarg,
        //               right: Dimen.defMarg,
        //               bottom: Dimen.defMarg
        //             ),
        //             child: Row(
        //               children: [
        //
        //                 SimpleButton.from(
        //                     context: context,
        //                     margin: EdgeInsets.zero,
        //                     radius: communityRadius,
        //                     icon: MdiIcons.cogOutline,
        //                     text: 'Ustawienia',
        //                     onTap: (){
        //
        //                       CommunityProvider communityProv = CommunityProvider.of(context);
        //
        //                       pushPage(
        //                           context,
        //                           builder: (context) => CommunityEditorPage(
        //                             initCommunity: community,
        //                             onSaved: (updatedCommunity){
        //                               community.update(updatedCommunity);
        //                               communityProv.notify();
        //                             },
        //                             onForceLoggedOut: (){
        //                               Navigator.pop(context);
        //                             },
        //                           )
        //                       );
        //
        //                     }
        //                 ),
        //
        //                 SimpleButton.from(
        //                     context: context,
        //                     margin: EdgeInsets.zero,
        //                     radius: communityRadius,
        //                     icon: MdiIcons.accountSupervisorCircleOutline,
        //                     text: 'Role',
        //                     onTap: () => pushPage(
        //                         context,
        //                         builder: (context) => CommunityManagersPage(
        //                           community: community,
        //                         )
        //                     )
        //                 ),
        //
        //                 Expanded(child: Container()),
        //
        //                 SimpleButton.from(
        //                     context: context,
        //                     margin: EdgeInsets.zero,
        //                     radius: communityRadius,
        //                     icon: MdiIcons.arrowRight,
        //                     onTap: () => pushPage(
        //                         context,
        //                         builder: (context) => CommunityManagersPage(
        //                           community: community,
        //                         )
        //                     )
        //                 ),
        //
        //               ],
        //             ),
        //           ),
        //
        //         if(community.myRole == CommunityRole.ADMIN && community.circle == null && community.forum == null)
        //           Padding(
        //             padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        //             child: Text(
        //               'Nic tu nie ma!',
        //               style: AppTextStyle(
        //                   fontSize: Dimen.TEXT_SIZE_APPBAR,
        //                   fontWeight: weight.bold,
        //                   color: hintEnab_(context)
        //               ),
        //             ),
        //           ),
        //         if(community.myRole == CommunityRole.ADMIN && community.circle == null && community.forum == null)
        //           const Padding(
        //             padding: EdgeInsets.only(
        //               left: Dimen.SIDE_MARG,
        //               right: Dimen.SIDE_MARG,
        //               bottom: Dimen.SIDE_MARG
        //             ),
        //             child: AppText(
        //                   'Zawiąż <b>krąg</b>, by komunikować się w <b>zamkniętej grupie</b>.'
        //                   '\n\nZawiąż <b>forum</b>, by <b>świat wiedział</b> co się u Was dzieje!',
        //               size: Dimen.TEXT_SIZE_BIG,
        //               textAlign: TextAlign.start,
        //             ),
        //           ),
        //
        //         if(community.circle != null)
        //           Padding(
        //             padding: const EdgeInsets.only(
        //                 right: Dimen.defMarg,
        //                 left: Dimen.defMarg
        //             ),
        //             child: CircleWidget(community.circle!, onTap: () => onCircleTap?.call(community.circle!)),
        //           )
        //         else if(community.myRole == CommunityRole.ADMIN)
        //           SimpleButton(
        //               elevation: AppCard.bigElevation,
        //               margin: const EdgeInsets.only(
        //                   top: Dimen.defMarg,
        //                   right: Dimen.defMarg,
        //                   left: Dimen.defMarg
        //               ),
        //               padding: const EdgeInsets.all(Dimen.ICON_MARG),
        //               radius: communityRadius,
        //               color: background_(context),
        //               child: Row(
        //                 children: [
        //                   const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),
        //                   const Icon(MdiIcons.googleCircles),
        //                   const SizedBox(width: Dimen.SIDE_MARG),
        //                   Expanded(
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: [
        //                         Text(
        //                           'Zawiąż krąg',
        //                           style: AppTextStyle(
        //                               fontSize: Dimen.TEXT_SIZE_BIG,
        //                               fontWeight: weight.halfBold,
        //                               color: iconEnab_(context)
        //                           ),
        //                         ),
        //                         Text(
        //                           community.name,
        //                           style: AppTextStyle(
        //                               fontSize: Dimen.TEXT_SIZE_NORMAL,
        //                               color: iconEnab_(context)
        //                           ),
        //                         ),
        //
        //                         const SizedBox(height: Dimen.defMarg),
        //
        //                         Text(
        //                           'Krąg to zamknięta grupa środowiska służąca wymianie informacji.',
        //                           style: AppTextStyle(
        //                               fontSize: Dimen.TEXT_SIZE_NORMAL,
        //                               color: iconDisab_(context)
        //                           ),
        //                         )
        //                       ],
        //                     ),
        //                   )
        //                 ],
        //               ),
        //               onTap: () async {
        //
        //                 pushPage(
        //                   context,
        //                   builder: (context) =>
        //                       CircleEditorPage(
        //                         community: community,
        //                         onSaved: (circle) async {
        //                           community.setCircle(circle);
        //                           CommunityProvider.notify_(context);
        //                           CommunityListProvider.notify_(context);
        //
        //                           CatPageHomeState.openCirclePage(context, circle);
        //                         },
        //                       ),
        //                 );
        //
        //               }
        //           ),
        //
        //         if(community.forum != null)
        //           Padding(
        //             padding: const EdgeInsets.only(
        //               top: Dimen.defMarg,
        //               right: Dimen.defMarg,
        //               left: Dimen.defMarg
        //             ),
        //             child: ForumWidget(community.forum!, onTap: () => onForumTap?.call(community.forum!)),
        //           )
        //         else if(community.myRole == CommunityRole.ADMIN)
        //           SimpleButton(
        //             elevation: AppCard.bigElevation,
        //             margin: const EdgeInsets.only(
        //                 top: Dimen.defMarg,
        //                 right: Dimen.defMarg,
        //                 left: Dimen.defMarg
        //             ),
        //             padding: const EdgeInsets.all(Dimen.ICON_MARG),
        //             radius: communityRadius,
        //             color: background_(context),
        //             child: Row(
        //               children: [
        //                 const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),
        //                 const Icon(Forum.icon),
        //                 const SizedBox(width: Dimen.SIDE_MARG),
        //                 Expanded(
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         'Załóż forum',
        //                         style: AppTextStyle(
        //                             fontSize: Dimen.TEXT_SIZE_BIG,
        //                             fontWeight: weight.halfBold,
        //                             color: iconEnab_(context)
        //                         ),
        //                       ),
        //                       Text(
        //                         community.name,
        //                         style: AppTextStyle(
        //                             fontSize: Dimen.TEXT_SIZE_NORMAL,
        //                             color: iconEnab_(context)
        //                         ),
        //                       ),
        //
        //                       const SizedBox(height: Dimen.defMarg),
        //
        //                       Text(
        //                         'Forum to publiczna strona środowiska, którą każdy może obserwować.',
        //                         style: AppTextStyle(
        //                             fontSize: Dimen.TEXT_SIZE_NORMAL,
        //                             color: iconDisab_(context)
        //                         ),
        //                       )
        //
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //             onTap: () async => pushPage(
        //               context,
        //               builder: (context) =>
        //                   ForumEditorPage(
        //                     community: community,
        //                     onSaved: (forum) async {
        //                       community.setForum(forum);
        //
        //                       CommunityProvider.notify_(context);
        //                       CommunityListProvider.notify_(context);
        //
        //                       CatPageHomeState.openForumPage(context, forum);
        //                     },
        //                   ),
        //             )
        //           ),
        //
        //          const SizedBox(height: Dimen.defMarg),
        //
        //       ],
        //     )
        // )
      )
  );

}
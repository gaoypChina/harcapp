import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'community_widget.dart';
import 'model/community.dart';

class CommunityPreviewPage extends StatelessWidget{

  final Community community;
  final void Function()? onAllCommunitiesTap;
  const CommunityPreviewPage(this.community, {this.onAllCommunitiesTap, super.key});

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    bottomNavigationBar: onAllCommunitiesTap == null? null: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        color: cardEnab_(context),
        elevation: AppCard.bigElevation,
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: TitleShortcutRowWidget(
          leading: Padding(
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            child: Icon(MdiIcons.accountGroup, color: hintEnab_(context)),
          ),
          title: 'Wszystkie środowiska',
          onOpen: onAllCommunitiesTap,
        ),
      )
    ),
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          title: Text(community.name),
          centerTitle: true,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            CommunityWidget(
              community,
              onCircleTap: (circle) => CatPageHomeState.openCirclePage(context, circle),
              onForumTap: (forum) => CatPageHomeState.openForumPage(context, forum),
            )

          ])),
        )

      ],
    )
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../../forum_role.dart';
import '../../model/forum.dart';


class MembersPageTempl extends StatelessWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  List<ForumManager> get managers => forum.managers;

  final SliverAppBar? customAppBar;

  final Widget Function(List<ForumManager> particips)? adminsListHeaderTrailing;
  final Widget Function(List<ForumManager> particips)? editorsListHeaderTrailing;

  final Widget? floatingButton;
  final Widget? bottomNavigationBar;
  final Widget? bottom;

  final Widget Function(BuildContext context, ForumManager manager) itemBuilder;

  const MembersPageTempl({
    required this.forum,
    required this.palette,

    this.customAppBar,

    this.adminsListHeaderTrailing,
    this.editorsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    required this.itemBuilder,
    super.key});

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
    body: Consumer<ForumManagersProvider>(
        builder: (context, prov, child){

          List<ForumManager> managerAdmins = [];
          List<ForumManager> managerEditors = [];

          for(ForumManager m in managers) {
            if (m.role == ForumRole.ADMIN)
              managerAdmins.add(m);

            else if (m.role == ForumRole.EDITOR)
              managerEditors.add(m);
          }

          managerAdmins.sort((p1, p2) => p1.name.compareTo(p2.name));
          managerEditors.sort((p1, p2) => p1.name.compareTo(p2.name));

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              customAppBar?? SliverAppBar(
                title: const Text('Lista ogarniaczy'),
                centerTitle: true,
                floating: true,
                backgroundColor: CommunityCoverColors.appBarColor(context, palette),
              ),

              SliverList(delegate: SliverChildListDelegate([

                // ADMINS
                if(managerAdmins.isNotEmpty)
                  _Border(
                    header: _ManagerListHeader(
                      forumRole: ForumRole.ADMIN,
                      title: 'Administratorzy',
                      trailing: adminsListHeaderTrailing?.call(managerAdmins),
                    ),
                    body: _ManagerColumnWidget(
                        managers: managerAdmins,
                        itemBuilder: itemBuilder
                    ),
                    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                  ),

                // EDITORS
                if(managerEditors.isNotEmpty)

                  _Border(
                    header: _ManagerListHeader(
                      forumRole: ForumRole.EDITOR,
                      title: 'Redaktorzy',
                      trailing: adminsListHeaderTrailing?.call(managerEditors),
                    ),
                    body: _ManagerColumnWidget(
                        managers: managerEditors,
                        itemBuilder: itemBuilder
                    ),
                    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                  ),

                if(bottom != null)
                  bottom!,
              ])),

            ],
          );
        }
    ),
    bottomNavigationBar: bottomNavigationBar,
    floatingActionButton: floatingButton
  );

}

class _Border extends StatelessWidget{

  final Widget header;
  final Widget body;
  final Color? backgroundColor;

  const _Border({
    required this.header,
    required this.body,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(Dimen.DEF_MARG),
      child: Material(
        color: backgroundIcon_(context),
        borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS-4),
              clipBehavior: Clip.hardEdge,
              color: backgroundColor??background_(context),
              child: Column(
                children: [
                  const SizedBox(height: Dimen.DEF_MARG),
                  header,
                  const SizedBox(height: Dimen.DEF_MARG),
                  body
                ],
              ),
            )
        ),
      )
  );

}

class _ManagerListHeader extends StatelessWidget{

  final ForumRole forumRole;
  final String title;
  final Widget? trailing;

  const _ManagerListHeader({
    required this.forumRole,
    required this.title,
    required this.trailing,
    super.key
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SizedBox(
        width: AccountThumbnailWidget.defSize + 2*Dimen.SIDE_MARG,
        child: Center(
          child: Icon(forumRoleToIcon[forumRole], color: hintEnab_(context)),
        ),
      ),

      Expanded(
          child: Text(
            title,
            style: AppTextStyle(
                fontWeight: weight.bold,
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: hintEnab_(context)
            ),
          )
      ),

      if(trailing != null)
        trailing!

    ],
  );

}

class _ManagerColumnWidget extends StatelessWidget{

  final List<ForumManager> managers;
  final Widget Function(BuildContext, ForumManager) itemBuilder;

  const _ManagerColumnWidget({
    required this.managers,
    required this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(ForumManager m in managers)
      children.add(itemBuilder(context, m));

    return Column(mainAxisSize: MainAxisSize.min, children: children);
  }

}
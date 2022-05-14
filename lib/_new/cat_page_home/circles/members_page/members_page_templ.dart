import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/member.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../circle_role.dart';
import '../model/circle.dart';

class MembersPageTempl extends StatelessWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  List<Member> get members => circle.members;

  final SliverAppBar? customAppBar;

  final Widget Function(List<Member> particips)? adminsListHeaderTrailing;
  final Widget Function(List<Member> particips)? modsListHeaderTrailing;
  final Widget Function(List<Member> particips)? obsListHeaderTrailing;

  final Widget? floatingButton;
  final Widget? bottomNavigationBar;
  final Widget? bottom;

  final Widget Function(BuildContext context, Member member) itemBuilder;

  const MembersPageTempl({
    required this.circle,
    required this.palette,

    this.customAppBar,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    required this.itemBuilder,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CirclePage.backgroundColor(context, palette),
    body: Consumer<CircleMembersProvider>(
        builder: (context, prov, child){

          List<Member> memAdmins = [];
          List<Member> memMods = [];
          List<Member> memObs = [];

          for(Member mem in members) {
            if (mem.role == CircleRole.ADMIN)
              memAdmins.add(mem);

            else if (mem.role == CircleRole.MODERATOR)
              memMods.add(mem);

            else if (mem.role == CircleRole.OBSERVER)
              memObs.add(mem);
          }

          memObs.sort((p1, p2) => p1.name.compareTo(p2.name));
          memMods.sort((p1, p2) => p1.name.compareTo(p2.name));
          memAdmins.sort((p1, p2) => p1.name.compareTo(p2.name));

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              customAppBar?? SliverAppBar(
                title: const Text('Lista uczestników'),
                centerTitle: true,
                floating: true,
                backgroundColor: CirclePage.appBarColor(context, palette),
              ),

              SliverList(delegate: SliverChildListDelegate([

                // ADMINS
                if(memAdmins.isNotEmpty)
                  _Border(
                    header: _ParticipListHeader(
                      circleRole: CircleRole.ADMIN,
                      title: 'Administratorzy',
                      trailing: adminsListHeaderTrailing?.call(memAdmins),
                    ),
                    body: _MemberColumnWidget(
                        members: memAdmins,
                        itemBuilder: itemBuilder
                    ),
                    backgroundColor: CirclePage.backgroundColor(context, palette),
                  ),

                // MODERATORS
                if(memMods.isNotEmpty)
                  _Border(
                    header: _ParticipListHeader(
                      circleRole: CircleRole.MODERATOR,
                      title: 'Moderatorzy',
                      trailing: adminsListHeaderTrailing?.call(memMods),
                    ),
                    body: _MemberColumnWidget(
                        members: memMods,
                        itemBuilder: itemBuilder
                    ),
                    backgroundColor: CirclePage.backgroundColor(context, palette),
                  ),

                // OBSERVATORS
                if(memObs.isNotEmpty)

                  _Border(
                    header: _ParticipListHeader(
                      circleRole: CircleRole.OBSERVER,
                      title: 'Pozostali',
                      trailing: adminsListHeaderTrailing?.call(memObs),
                    ),
                    body: _MemberColumnWidget(
                        members: memObs,
                        itemBuilder: itemBuilder
                    ),
                    backgroundColor: CirclePage.backgroundColor(context, palette),
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

class _ParticipListHeader extends StatelessWidget{

  final CircleRole circleRole;
  final String title;
  final Widget? trailing;

  const _ParticipListHeader({
    required this.circleRole,
    required this.title,
    required this.trailing,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SizedBox(
        width: AccountThumbnailWidget.defSize + 2*Dimen.SIDE_MARG,
        child: Center(
          child: Icon(circleRoleToIcon[circleRole], color: hintEnab_(context)),
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

class _MemberColumnWidget extends StatelessWidget{

  final List<Member> members;
  final Widget Function(BuildContext, Member) itemBuilder;

  const _MemberColumnWidget({
    required this.members,
    required this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(Member mem in members)
      children.add(itemBuilder(context, mem));

    return Column(mainAxisSize: MainAxisSize.min, children: children);
  }

}
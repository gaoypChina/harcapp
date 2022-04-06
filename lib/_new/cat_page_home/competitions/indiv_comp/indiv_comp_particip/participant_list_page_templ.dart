import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

class ParticipantListPageTempl extends StatelessWidget{

  final IndivComp comp;
  List<IndivCompParticip> get particips => comp.particips;

  final bool sorftByPoints;
  final SliverAppBar customAppBar;

  final Widget Function(List<IndivCompParticip> particips) adminsListHeaderTrailing;
  final Widget Function(List<IndivCompParticip> particips) modsListHeaderTrailing;
  final Widget Function(List<IndivCompParticip> particips) obsListHeaderTrailing;

  final Widget floatingButton;
  final Widget bottomNavigationBar;
  final Widget bottom;

  final Widget Function(BuildContext context, IndivCompParticip particip) itemBuilder;

  const ParticipantListPageTempl({
    @required this.comp,
    @required this.sorftByPoints,

    this.customAppBar,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    @required this.itemBuilder,
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: Consumer<IndivCompParticipsProvider>(
          builder: (context, prov, child){

            List<IndivCompParticip> participAdmins = [];
            List<IndivCompParticip> participMods = [];
            List<IndivCompParticip> participObs = [];

            for(IndivCompParticip particip in particips) {
              if (particip.profile.role == CompRole.ADMIN)
                participAdmins.add(particip);

              else if (particip.profile.role == CompRole.MODERATOR)
                participMods.add(particip);

              else if (particip.profile.role == CompRole.OBSERVER)
                participObs.add(particip);
            }

            if(sorftByPoints) {
              participObs.sort((p1, p2) => p2.profile.points - p1.profile.points);
              participMods.sort((p1, p2) => p2.profile.points - p1.profile.points);
              participAdmins.sort((p1, p2) => p2.profile.points - p1.profile.points);
            } else {
              participObs.sort((p1, p2) => p1.name.compareTo(p2.name));
              participMods.sort((p1, p2) => p1.name.compareTo(p2.name));
              participAdmins.sort((p1, p2) => p1.name.compareTo(p2.name));
            }


            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [

                customAppBar?? const SliverAppBar(
                  title: Text('Lista uczestników'),
                  centerTitle: true,
                  floating: true,
                ),

                SliverList(delegate: SliverChildListDelegate([

                  // ADMINS
                  if(participAdmins.isNotEmpty)
                    _Border(
                      header: _ParticipListHeader(
                        compRole: CompRole.ADMIN,
                        title: 'Administratorzy',
                        trailing: adminsListHeaderTrailing?.call(participAdmins),
                      ),
                      body: _ParticipColumnWidget(
                          particips: participAdmins,
                          itemBuilder: itemBuilder
                      ),
                    ),

                  // MODERATORS
                  if(participMods.isNotEmpty)
                    _Border(
                      header: _ParticipListHeader(
                        compRole: CompRole.MODERATOR,
                        title: 'Moderatorzy',
                        trailing: adminsListHeaderTrailing?.call(participMods),
                      ),
                      body: _ParticipColumnWidget(
                          particips: participMods,
                          itemBuilder: itemBuilder
                      ),
                    ),

                  // OBSERVATORS
                  if(participObs.isNotEmpty)

                    _Border(
                      header: _ParticipListHeader(
                        compRole: CompRole.OBSERVER,
                        title: 'Pozostali',
                        trailing: adminsListHeaderTrailing?.call(participObs),
                      ),
                      body: _ParticipColumnWidget(
                          particips: participObs,
                          itemBuilder: itemBuilder
                      ),
                    ),

                  if(bottom != null)
                    bottom,
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

  const _Border({
    @required this.header,
    @required this.body
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
              color: background_(context),
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

  final CompRole compRole;
  final String title;
  final Widget trailing;

  const _ParticipListHeader({
    @required this.compRole,
    @required this.title,
    @required this.trailing,
    Key key
  }): super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SizedBox(
        width: AccountThumbnailWidget.defSize + 2*Dimen.SIDE_MARG,
        child: Center(
          child: Icon(compRoleToIcon[compRole], color: hintEnab_(context)),
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
        trailing

    ],
  );

}

class _ParticipColumnWidget extends StatelessWidget{

  final List<IndivCompParticip> particips;
  final Widget Function(BuildContext, IndivCompParticip) itemBuilder;

  const _ParticipColumnWidget({
    @required this.particips,
    @required this.itemBuilder
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(IndivCompParticip particip in particips)
      children.add(itemBuilder(context, particip));

    return Column(children: children, mainAxisSize: MainAxisSize.min);
  }

}
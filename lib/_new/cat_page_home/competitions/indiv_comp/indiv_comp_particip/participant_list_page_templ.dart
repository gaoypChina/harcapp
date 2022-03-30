import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

class ParticipantListPageTempl extends StatelessWidget{

  final IndivComp comp;
  List<IndivCompParticip> get particips => comp.particips;

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

    this.customAppBar,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    @required this.itemBuilder,
  });

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

            return CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [

                customAppBar??
                    SliverAppBar(
                      title: Text('Lista uczestników'),
                      centerTitle: true,
                      floating: true,
                    ),

                getHeaderSliverList(
                  'Administratorzy',
                  participAdmins,
                  leading: adminsListHeaderTrailing?.call(participAdmins),
                ),

                getParticipSliverList(participAdmins),

                getHeaderSliverList(
                  'Moderatorzy',
                  participMods,
                  leading: modsListHeaderTrailing?.call(participMods),
                ),

                getParticipSliverList(participMods),

                getHeaderSliverList(
                  'Pozostali',
                  participObs,
                  leading: obsListHeaderTrailing?.call(participObs),
                ),

                getParticipSliverList(participObs),

                SliverList(delegate: SliverChildListDelegate([
                  if(bottom != null)
                    bottom,
                ]))


              ],
            );
          }
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingButton
  );

  SliverList getHeaderSliverList(String title, List<IndivCompParticip> particips, {Widget leading}) => SliverList(delegate: SliverChildListDelegate([
    if(particips.isNotEmpty)
      ParticipListHeader(
        title: title,
        leading: leading,
      ),

  ]));

  SliverList getParticipSliverList(List<IndivCompParticip> particips) => SliverList(
    delegate: SliverChildBuilderDelegate((context, index) =>
        itemBuilder(context, particips[index]),
        childCount: particips.length
    ),
  );


}

class ParticipListHeader extends StatelessWidget{

  final String title;
  final Widget leading;

  const ParticipListHeader({this.title, this.leading});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      top: 24.0,
    ),
    child: TitleShortcutRowWidget(
      title: title,
      titleColor: hintEnab_(context),
      textAlign: TextAlign.center,
      leading: SizedBox(
        width: AccountThumbnailWidget.defSize + 2*Dimen.SIDE_MARG,
        child: Center(
          child: leading,
        ),
      ),
      trailing: SizedBox(width: AccountThumbnailWidget.defSize + 2*Dimen.SIDE_MARG),
    ),
  );

}

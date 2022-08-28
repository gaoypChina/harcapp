import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_page.dart';
import 'package:provider/provider.dart';

import '../common/particip_tile.dart';
import '../comp_role.dart';
import '../models/indiv_comp.dart';

class ParticipantsPage extends StatelessWidget{

  final IndivComp comp;

  List<IndivCompParticip> get particips => comp.particips;

  final Widget Function(List<IndivCompParticip> particips)? adminsListHeaderTrailing;
  final Widget Function(List<IndivCompParticip> particips)? modsListHeaderTrailing;
  final Widget Function(List<IndivCompParticip> particips)? obsListHeaderTrailing;

  final Widget? floatingButton;
  final Widget? bottomNavigationBar;
  final Widget? bottom;

  const ParticipantsPage({
    required this.comp,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    super.key});

  @override
  Widget build(BuildContext context) => Consumer<IndivCompParticipsProvider>(
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

        participAdmins.sort((p1, p2) => p1.name.compareTo(p2.name));
        participMods.sort((p1, p2) => p1.name.compareTo(p2.name));
        participObs.sort((p1, p2) => p1.name.compareTo(p2.name));

        return UserListManagementPage<IndivCompParticip>(
          appBarTitle: 'Lista członków (${particips.length})',
          userSets: [
            UserSet(
                icon: compRoleToIcon[CompRole.ADMIN]!,
                name: 'Administratorzy',
                users: participAdmins
            ),

            UserSet(
                icon: compRoleToIcon[CompRole.MODERATOR]!,
                name: 'Moderatorzy',
                users: participMods
            ),

            UserSet(
                icon: compRoleToIcon[CompRole.OBSERVER]!,
                name: 'Pozostali',
                users: participObs
            )
          ],
          userTileBuilder: (context, particip) =>
          ParticipTile(
            particip: particip,
            heroTag: particip
          ),

        );

      }
  );

}

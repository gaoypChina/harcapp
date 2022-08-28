import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../community_role.dart';
import '../model/community_manager.dart';
import 'add_user_bottom_sheet.dart';
import 'manager_tile.dart';
import 'manager_tile_extended.dart';


class CommunityManagersPage extends StatelessWidget{

  final Community community;
  List<CommunityManager> get managers => community.managers;

  const CommunityManagersPage({
    required this.community,
    super.key
  });


  @override
  Widget build(BuildContext context) => Consumer<CommunityManagersProvider>(
      builder: (context, prov, child){

        List<CommunityManager> managAdmins = [];
        List<CommunityManager> managRegulars = [];

        for(CommunityManager manag in managers) {
          if (manag.role == CommunityRole.ADMIN)
            managAdmins.add(manag);

          else if (manag.role == CommunityRole.REGULAR)
            managRegulars.add(manag);
        }

        managAdmins.sort((m1, m2) => m1.name.compareTo(m2.name));
        managRegulars.sort((m1, m2) => m1.name.compareTo(m2.name));

        return UserListManagementPage<CommunityManager>(
          appBarTitle: 'Lista ogarniaczy (${managers.length})',
          userSets: [
            UserSet(
              icon: communityRoleToIcon[CommunityRole.ADMIN]!,
              name: 'Administratorzy',
              users: managAdmins,
              persmissions: [
                'Dodawanie nowych ogarniaczy',
                'Wyrzucanie ogarniaczy',
                'Edycja ról ogarniaczy',
                'Zmiana ustawień środowiska'
              ]
            ),

            UserSet(
                icon: communityRoleToIcon[CommunityRole.REGULAR]!,
                name: 'Redaktorzy',
                users: managRegulars,
                persmissions: [
                  'Pilne obserwowanie kto ogarnia środowisko',
                ]
            ),

          ],
          userTileBuilder: (context, manager) => community.myRole==CommunityRole.ADMIN?
          CommunityManagerTileExtended(
            community: community,
            manager: manager,
            heroTag: manager,
          ):
          CommunityManagerTile(
              manager: manager,
              heroTag: manager
          ),

          appBarActions: [
            if(community.myRole == CommunityRole.ADMIN)
              IconButton(
                  icon: const Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (context) => AddUserBottomSheet(community)
                  )
              )
          ],

        );

      }
  );

}

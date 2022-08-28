import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/role_page/manager_tile_extended.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../forum_role.dart';
import '../model/forum.dart';
import 'add_user_bottom_sheet.dart';
import 'manager_tile.dart';


class ManagersPage extends StatelessWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  List<ForumManager> get managers => forum.managers;

  const ManagersPage({
    required this.forum,
    required this.palette,
    super.key
  });


  @override
  Widget build(BuildContext context) => Consumer<ForumManagersProvider>(
      builder: (context, prov, child){

        List<ForumManager> managAdmins = [];
        List<ForumManager> managEditors = [];

        for(ForumManager manag in managers) {
          if (manag.role == ForumRole.ADMIN)
            managAdmins.add(manag);

          else if (manag.role == ForumRole.EDITOR)
            managEditors.add(manag);
        }

        managAdmins.sort((m1, m2) => m1.name.compareTo(m2.name));
        managEditors.sort((m1, m2) => m1.name.compareTo(m2.name));

        return UserListManagementPage<ForumManager>(
          appBarTitle: 'Lista ogarniaczy (${managers.length})',
          userSets: [
            UserSet(
                icon: forumRoleToIcon[ForumRole.ADMIN]!,
                name: 'Administratorzy',
                users: managAdmins,
                persmissions: [
                  'Dodawanie postów',
                  'Dodawanie nowych ogarniaczy',
                  'Wyrzucanie ogarniaczy',
                  'Edycja ról ogarniaczy',
                  'Zmiana ustawień forum'
                ]
            ),

            UserSet(
                icon: forumRoleToIcon[ForumRole.EDITOR]!,
                name: 'Redaktorzy',
                users: managEditors,
                persmissions: [
                  'Dodawanie postów',
                ]
            ),

          ],
          userTileBuilder: (context, manager) => forum.myRole==ForumRole.ADMIN?
          ForumManagerTileExtended(
            forum: forum,
            manager: manager,
            palette: palette,
            heroTag: manager,
          ):
          ForumManagerTile(
              manager: manager,
              palette: palette,
              heroTag: manager
          ),

          backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),

          appBarActions: [
            if(forum.myRole == ForumRole.ADMIN)
              IconButton(
                  icon: const Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (context) => AddUserBottomSheet(forum, palette)
                  )
              )
          ],

        );

      }
  );

}

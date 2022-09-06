import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/members_page/member_tile_extended.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/member.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';

import '../circle_role.dart';
import '../model/circle.dart';
import 'add_user_bottom_sheet.dart';
import 'member_tile.dart';

class MembersPage extends StatelessWidget{

  static String adminsHeaderTitle = 'Administratorzy';
  static String editorsHeaderTitle = 'Redaktorzy';
  static String observersHeaderTitle = 'Obserwatorzy';

  static List<String> adminPersmissions = [
    'Dodawanie ogłoszeń',
    'Dodawanie nowych uczestników',
    'Wyrzucanie uczestników',
    'Edycja ról uczestników',
    'Zmiana ustawień kręgu'
  ];

  static List<String> editorPersmissions = [
    'Dodawanie ogłoszeń',
  ];

  static List<String> observerPersmissions = [
    'Śledzenie wiadomości (:',
  ];

  final Circle circle;
  final PaletteGenerator? palette;
  List<Member> get members => circle.members;

  final Widget Function(List<Member> members)? adminsListHeaderTrailing;
  final Widget Function(List<Member> members)? modsListHeaderTrailing;
  final Widget Function(List<Member> members)? obsListHeaderTrailing;

  final Widget? floatingButton;
  final Widget? bottomNavigationBar;
  final Widget? bottom;

  const MembersPage({
    required this.circle,
    required this.palette,

    this.adminsListHeaderTrailing,
    this.modsListHeaderTrailing,
    this.obsListHeaderTrailing,

    this.floatingButton,
    this.bottomNavigationBar,
    this.bottom,

    super.key});

  @override
  Widget build(BuildContext context) => Consumer<CircleMembersProvider>(
      builder: (context, prov, child){

        List<Member> memAdmins = [];
        List<Member> memMods = [];
        List<Member> memObs = [];

        for(Member mem in members) {
          if (mem.role == CircleRole.ADMIN)
            memAdmins.add(mem);

          else if (mem.role == CircleRole.EDITOR)
            memMods.add(mem);

          else if (mem.role == CircleRole.OBSERVER)
            memObs.add(mem);
        }

        memAdmins.sort((p1, p2) => p1.name.compareTo(p2.name));
        memMods.sort((p1, p2) => p1.name.compareTo(p2.name));
        memObs.sort((p1, p2) => p1.name.compareTo(p2.name));

        return UserListManagementPage<Member>(
          appBarTitle: 'Członkowie (${members.length})',
          userSets: [
            UserSet(
                icon: circleRoleToIcon[CircleRole.ADMIN]!,
                name: adminsHeaderTitle,
                users: memAdmins,
                persmissions: adminPersmissions
            ),

            UserSet(
              icon: circleRoleToIcon[CircleRole.EDITOR]!,
              name: editorsHeaderTitle,
              users: memMods,
              persmissions: editorPersmissions
            ),

            UserSet(
                icon: circleRoleToIcon[CircleRole.OBSERVER]!,
                name: observersHeaderTitle,
                users: memObs,
                persmissions: observerPersmissions
            )
          ],
          userTileBuilder: (context, member) => circle.myRole == CircleRole.ADMIN?
          MemberTileExtended(
            circle: circle,
            member: member,
            palette: palette,
            heroTag: member
          ):
          MemberTile(
            member: member,
            palette: palette,
            heroTag: member
          ),

          backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),

          appBarActions: [
            if(circle.myRole == CircleRole.ADMIN)
              IconButton(
                  icon: const Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (context) => AddUserBottomSheet(circle, palette)
                  )
              )
          ],

        );

      }
  );

}

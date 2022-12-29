import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../model/community_role.dart';
import '../model/community_manager.dart';
import 'add_user_bottom_sheet.dart';
import 'manager_tile.dart';
import 'manager_tile_extended.dart';


class CommunityManagersPage extends StatefulWidget{

  static String adminsHeaderTitle = 'Administratorzy';
  static String regularsHeaderTitle = 'Parobkowie';

  static List<String> adminPersmissions = [
    'Dodawanie nowych ogarniaczy',
    'Wyrzucanie ogarniaczy',
    'Edycja ról ogarniaczy',
    'Zmiana ustawień środowiska'
  ];

  static List<String> regularPersmissions = [
    'Pilne obserwowanie kto ogarnia środowisko'
  ];

  final Community community;

  const CommunityManagersPage({
    required this.community,
    super.key
  });

  @override
  State<StatefulWidget> createState() => CommunityManagersPageState();

}

class CommunityManagersPageState extends State<CommunityManagersPage>{

  Community get community => widget.community;
  List<CommunityManager> get managers => community.managers;

  List<CommunityManager> managAdmins = [];
  List<CommunityManager> managRegulars = [];

  void updateUserSets(){
    managAdmins.clear();
    managRegulars.clear();
    for(CommunityManager manag in managers) {
      switch(manag.role){
        case CommunityRole.ADMIN:
          managAdmins.add(manag);
          break;
        case CommunityRole.REGULAR:
          managRegulars.add(manag);
          break;
      }
    }
  }

  @override
  void initState() {
    updateUserSets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<CommunityManagersProvider>(
      builder: (context, prov, child){

        return UserListManagementLoadablePage<CommunityManager>(
          appBarTitle: 'Ogarniacze (${community.managerCount})',
          userSets: [
            UserSet(
                icon: communityRoleToIcon[CommunityRole.ADMIN]!,
                name: CommunityManagersPage.adminsHeaderTitle,
                users: managAdmins,
                permissions: CommunityManagersPage.adminPersmissions
            ),

            UserSet(
                icon: communityRoleToIcon[CommunityRole.REGULAR]!,
                name: CommunityManagersPage.regularsHeaderTitle,
                users: managRegulars,
                permissions: CommunityManagersPage.regularPersmissions
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

          userCount: community.managerCount??0,
          callReload: () async {
            await ApiCommunity.getManagers(
              communityKey: community.key,
              pageSize: Community.managerPageSize,
              lastRole: null,
              lastUserName: null,
              lastUserKey: null,
              onSuccess: (managersPage){
                CommunityManager me = community.managersMap[AccountData.key]!;
                managersPage.removeWhere((manager) => manager.key == me.key);
                managersPage.insert(0, me);
                community.setAllManagers(managersPage, context: context);
                updateUserSets();

                setState((){});
              },
              onForceLoggedOut: (){
                if(!mounted) return true;
                showAppToast(context, text: forceLoggedOutMessage);
                setState(() {});
                return true;
              },
              onServerMaybeWakingUp: (){
                if(!mounted) return true;
                showServerWakingUpToast(context);
                return true;
              },
              onError: (){
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
              },
            );
          },
          callLoadMore: () async {

            bool success = false;

            await ApiCommunity.getManagers(
              communityKey: community.key,
              pageSize: Community.managerPageSize,
              lastRole: managers.length==1?null:managers.last.role,
              lastUserName: managers.length==1?null:managers.last.name,
              lastUserKey: managers.length==1?null:managers.last.key,
              onSuccess: (managersPage){
                community.addManagers(managersPage, context: context);
                updateUserSets();
                success = true;
                setState((){});
              },
              onForceLoggedOut: (){
                if(!mounted) return true;
                showAppToast(context, text: forceLoggedOutMessage);
                setState(() {});
                return true;
              },
              onServerMaybeWakingUp: (){
                if(!mounted) return true;
                showServerWakingUpToast(context);
                return true;
              },
              onError: (){
                if(!mounted) return;
                showAppToast(context, text: simpleErrorMessage);
              },
            );

            return success;

          },
          callLoadOnInit: community.managers.length == 1,

        );

      }
  );

}
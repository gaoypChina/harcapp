import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../model/marker_data.dart';
import '../model/marker_role.dart';
import '../model/marker_manager.dart';
import 'add_user_bottom_sheet.dart';
import 'manager_tile.dart';
import 'manager_tile_extended.dart';


class MarkerManagersPage extends StatefulWidget{

  static String adminsHeaderTitle = 'Administratorzy';
  static String regularsHeaderTitle = 'Przedstawiciele środowisk';

  static List<String> adminPersmissions = [
    'Dodawanie nowych ogarniaczy',
    'Wyrzucanie ogarniaczy',
    'Edycja ról ogarniaczy',
    'Zmiana ustawień miejsca'
  ];

  static List<String> regularPersmissions = [
    'Zarządzanie powiązaniem swoich środowisk z miejscem'
  ];

  final MarkerData marker;

  const MarkerManagersPage({
    required this.marker,
    super.key
  });

  @override
  State<StatefulWidget> createState() => MarkerManagersPageState();

}

class MarkerManagersPageState extends State<MarkerManagersPage>{

  MarkerData get marker => widget.marker;
  List<MarkerManager> get managers => marker.managers;

  List<MarkerManager> managAdmins = [];
  List<MarkerManager> managCommMods = [];

  void updateUserSets(){
    managAdmins.clear();
    managCommMods.clear();
    for(MarkerManager manag in managers) {
      switch(manag.role){
        case MarkerRole.ADMIN:
          managAdmins.add(manag);
          break;
        case MarkerRole.COMMUNITY_MODERATOR:
          managCommMods.add(manag);
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
  Widget build(BuildContext context) => Consumer<MarkerManagersProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<MarkerManager>(
          appBarTitle: 'Ogarniacze (${marker.managerCount})',
          userSets: [

            UserSet(
                icon: markerRoleToIcon[MarkerRole.ADMIN]!,
                name: MarkerManagersPage.adminsHeaderTitle,
                users: managAdmins,
                permissions: MarkerManagersPage.adminPersmissions
            ),

            UserSet(
                icon: markerRoleToIcon[MarkerRole.COMMUNITY_MODERATOR]!,
                name: MarkerManagersPage.regularsHeaderTitle,
                users: managCommMods,
                permissions: MarkerManagersPage.regularPersmissions
            ),

          ],
          userTileBuilder: (context, manager) => marker.myRole==MarkerRole.ADMIN?
          MarkerManagerTileExtended(
            marker: marker,
            manager: manager,
            heroTag: manager,
            onUpdated: (){
              updateUserSets();
              prov.notify();
            },
            onRemoved: (){
              updateUserSets();
              prov.notify();
            },
          ):
          MarkerManagerTile(
            manager: manager,
            heroTag: manager
          ),

          appBarActions: [
            if(marker.myRole == MarkerRole.ADMIN)
              IconButton(
                icon: const Icon(MdiIcons.plus),
                onPressed: () => showScrollBottomSheet(
                  context: context,
                  builder: (context) => AddUserBottomSheet(marker)
                )
              )
          ],

          userCount: marker.managerCount,
          callReload: () async {
            await ApiHarcMap.getManagers(
              markerKey: marker.key,
              pageSize: MarkerData.managerPageSize,
              lastRole: null,
              lastUserName: null,
              lastUserKey: null,
              onSuccess: (managersPage){
                MarkerManager me = marker.managersMap[AccountData.key]!;
                managersPage.removeWhere((manager) => manager.key == me.key);
                managersPage.insert(0, me);
                marker.setAllManagers(managersPage, context: context);
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

            await ApiHarcMap.getManagers(
              markerKey: marker.key,
              pageSize: MarkerData.managerPageSize,
              lastRole: managers.length==1?null:managers.last.role,
              lastUserName: managers.length==1?null:managers.last.name,
              lastUserKey: managers.length==1?null:managers.last.key,
              onSuccess: (managersPage){
                marker.addManagers(managersPage, context: context);
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
          callLoadOnInit: marker.managers.length == 1,
      )
  );

}
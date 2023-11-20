import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_managers_loader.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

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
  List<MarkerManager> get managers => marker.loadedManagers;

  late MarkerManagersProvider markerManagersProv;
  late MarkerManagersLoaderListener managersLoaderListener;

  List<MarkerManager> managAdmins = [];
  List<MarkerManager> managCommMods = [];

  late RefreshController controller;

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

  void onManagersProviderNotified(){
    updateUserSets();
    if(mounted) setState((){});
  }

  @override
  void initState() {

    MarkerProvider markerProv = MarkerProvider.of(context);
    MarkerListProvider markerListProv = MarkerListProvider.of(context);

    managersLoaderListener = MarkerManagersLoaderListener(
        onNoInternet: (){
          if(!mounted) return;
          showAppToast(context, text: noInternetMessage);
        },
        onManagersLoaded: (managersPage, reloaded){
          updateUserSets();
          MarkerData.callProvidersWithManagers(markerProv, markerListProv, markerManagersProv);
          if(mounted) setState((){});
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
        onError: (_){
          if(!mounted) return;
          showAppToast(context, text: simpleErrorMessage);
        },
        onEnd: (_, __, ___){
          if(!mounted) return;
          controller.loadComplete();
          controller.refreshCompleted();
          post(() => mounted?setState(() {}):null);
        }
    );

    markerManagersProv = MarkerManagersProvider.of(context);
    markerManagersProv.addListener(onManagersProviderNotified);

    marker.addManagersLoaderListener(managersLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: marker.loadedManagers.length == 1 && marker.managerCount! > 1 && !marker.isManagersLoading(),
    );

    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(marker.loadedManagers.length == 1 && marker.isManagersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(marker.loadedManagers.length > 1 && marker.isManagersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    markerManagersProv.removeListener(onManagersProviderNotified);
    marker.removeManagersLoaderListener(managersLoaderListener);
    controller.dispose();
    super.dispose();
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
                icon: Icon(MdiIcons.plus),
                onPressed: () => showScrollBottomSheet(
                  context: context,
                  builder: (_) => AddUserBottomSheet(marker, context: context)
                )
              )
          ],

          userCount: marker.managerCount!,
          callReload: () async {
            await marker.reloadManagersPage(awaitFinish: true);
            return marker.loadedManagers.length;
          },
          callLoadMore: () async {
            await marker.loadManagersPage(awaitFinish: true);
            return marker.loadedManagers.length;
          },
          controller: controller,
      )
  );

}
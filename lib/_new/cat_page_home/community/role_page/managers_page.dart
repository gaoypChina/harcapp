import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../community_managers_loader.dart';
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
  List<CommunityManager> get managers => community.loadedManagers;

  late CommunityManagersProvider communityManagersProv;
  late CommunityManagersLoaderListener managersLoaderListener;

  List<CommunityManager> managAdmins = [];
  List<CommunityManager> managRegulars = [];

  late RefreshController controller;

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

  void onManagersProviderNotified(){
    updateUserSets();
    if(mounted) setState((){});
  }

  @override
  void initState() {
    CommunityProvider communityProv = CommunityProvider.of(context);
    CommunityListProvider communityListProv = CommunityListProvider.of(context);

    managersLoaderListener = CommunityManagersLoaderListener(
        onNoInternet: (){
          if(!mounted) return;
          showAppToast(context, text: noInternetMessage);
        },
        onManagersLoaded: (managersPage, reloaded){
          updateUserSets();
          Community.callProvidersWithManagers(communityProv, communityListProv, communityManagersProv);
        },
        onForceLoggedOut: (){
          if(!mounted) return true;
          showAppToast(context, text: forceLoggedOutMessage);
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
        onEnd: (_, __){
          if(!mounted) return;
          controller.loadComplete();
          controller.refreshCompleted();
          post(() => mounted?setState(() {}):null);
        }
    );

    communityManagersProv = CommunityManagersProvider.of(context);
    communityManagersProv.addListener(onManagersProviderNotified);

    community.addManagersLoaderListener(managersLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: community.loadedManagers.length == 1 && community.managerCount! > 1 && !community.isManagersLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(community.loadedManagers.length == 1 && community.isManagersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(community.loadedManagers.length > 1 && community.isManagersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    communityManagersProv.removeListener(onManagersProviderNotified);
    community.removeManagersLoaderListener(managersLoaderListener);
    controller.dispose();
    super.dispose();
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
                  icon: Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (_) => AddUserBottomSheet(community, context: context)
                  )
              )
          ],

          userCount: community.managerCount??0,
          callReload: () async {
            await community.reloadManagersPage(awaitFinish: true);
            return community.loadedManagers.length;
          },
          callLoadMore: () async {
            await community.loadManagersPage(awaitFinish: true);
            return community.loadedManagers.length;

          },
          controller: controller,

        );

      }
  );

}
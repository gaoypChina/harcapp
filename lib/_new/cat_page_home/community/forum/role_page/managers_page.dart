import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/role_page/manager_tile_extended.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../forum_managers_loader.dart';
import '../forum_role.dart';
import '../model/forum.dart';
import 'add_user_bottom_sheet.dart';
import 'manager_tile.dart';


class ManagersPage extends StatefulWidget{

  static String adminsHeaderTitle = 'Administratorzy';
  static String editorsHeaderTitle = 'Redaktorzy';

  static List<String> adminPersmissions = [
    'Dodawanie postów',
    'Dodawanie nowych ogarniaczy',
    'Wyrzucanie ogarniaczy',
    'Edycja ról ogarniaczy',
    'Zmiana ustawień forum'
  ];

  static List<String> editorPersmissions = [
    'Dodawanie postów',
  ];


  final Forum forum;
  final PaletteGenerator? palette;
  List<ForumManager> get managers => forum.loadedManagers;

  const ManagersPage({
    required this.forum,
    required this.palette,
    super.key
  });

  @override
  State<StatefulWidget> createState() => ManagersPageState();

}

class ManagersPageState extends State<ManagersPage>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  List<ForumManager> get managers => forum.loadedManagers;

  late ForumManagersProvider forumManagersProv;
  late ForumManagersLoaderListener managersLoaderListener;

  List<ForumManager> managAdmins = [];
  List<ForumManager> managEditors = [];

  late RefreshController controller;

  void updateUserSets(){
    managAdmins.clear();
    managEditors.clear();
    for(ForumManager manag in managers) {
      switch(manag.role){
        case ForumRole.ADMIN:
          managAdmins.add(manag);
          break;
        case ForumRole.EDITOR:
          managEditors.add(manag);
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

    ForumProvider forumProv = ForumProvider.of(context);
    ForumListProvider forumListProv = ForumListProvider.of(context);

    managersLoaderListener = ForumManagersLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onManagersLoaded: (managersPage, reloaded){
        updateUserSets();
        Forum.callProvidersWithManagers(forumProv, forumListProv, forumManagersProv);
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
      onEnd: (_, __){
        if(!mounted) return;
        controller.loadComplete();
        controller.refreshCompleted();
        post(() => mounted?setState(() {}):null);
      }
    );

    forumManagersProv = ForumManagersProvider.of(context);
    forumManagersProv.addListener(onManagersProviderNotified);

    forum.addManagersLoaderListener(managersLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: forum.loadedManagers.length == 1 && forum.managerCount! > 1 && !forum.isManagersLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(forum.loadedManagers.length == 1 && forum.isManagersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(forum.loadedManagers.length > 1 && forum.isManagersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    forumManagersProv.removeListener(onManagersProviderNotified);
    forum.removeManagersLoaderListener(managersLoaderListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<ForumManagersProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<ForumManager>(
          appBarTitle: 'Ogarniacze (${forum.managerCount})',
          userSets: [
            UserSet(
                icon: forumRoleToIcon[ForumRole.ADMIN]!,
                name: ManagersPage.adminsHeaderTitle,
                users: managAdmins,
                permissions: ManagersPage.adminPersmissions
            ),

            UserSet(
                icon: forumRoleToIcon[ForumRole.EDITOR]!,
                name: ManagersPage.editorsHeaderTitle,
                users: managEditors,
                permissions: ManagersPage.editorPersmissions
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
                  icon: Icon(MdiIcons.plus),
                  onPressed: () => showScrollBottomSheet(
                      context: context,
                      builder: (_) => AddUserBottomSheet(forum, palette, context: context)
                  )
              )
          ],

          userCount: forum.managerCount!,
          callReload: () async {
            await forum.reloadManagersPage(awaitFinish: true);
            return forum.loadedManagers.length;
          },
          callLoadMore: () async {
            await forum.loadManagersPage(awaitFinish: true);
            return forum.loadedManagers.length;

          },
          controller: controller,
      )
  );

}
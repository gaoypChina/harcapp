import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile_extended.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_loader.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../model/trop_role.dart';
import '../model/trop_user.dart';
import 'add_user_bottom_sheet.dart';


class TropUsersPage extends StatefulWidget{

  static String ownersHeaderTitle = 'Koordynatorzy';
  static String regularsHeaderTitle = 'Członkowie';
  static String observersHeaderTitle = 'Obserwatorzy';

  static List<String> ownerPersmissions = [
    'Dodawanie nowych osób do grona ludzi tropu',
    'Wyrzucanie osób z grona ludzi tropu',
    'Zmiana ustawień tropu',
    'Zaliczanie zadań tropu'
  ];

  static List<String> regularPersmissions = [
    'Zaliczanie zadań tropu'
  ];

  static List<String> observerPersmissions = [
    'Pilne obserwowanie jak idzie realizacja tropu'
  ];

  static TropUser fixTropUser(List<TropUser> observersPage){
    TropUser me = observersPage.firstWhere((user) => user.key == AccountData.key);
    return me;
  }

  final Trop trop;

  final void Function(bool wasShared)? onUserAdded;

  const TropUsersPage({
    required this.trop,
    this.onUserAdded,
    super.key
  });

  @override
  State<StatefulWidget> createState() => TropUsersPageState();

}

class TropUsersPageState extends State<TropUsersPage>{
  
  Trop get trop => widget.trop;
  List<TropUser> get loadedUsers => trop.loadedUsers;

  void Function(bool wasShared)? get onUserAdded => widget.onUserAdded;

  late TropLoadedUsersProvider tropLoadedUsersProv;
  late TropUsersLoaderListener usersLoaderListener;

  List<TropUser> userOwners = [];
  List<TropUser> userRegulars = [];
  List<TropUser> userObservers = [];

  late RefreshController controller;

  void updateUserSets(){
    userOwners.clear();
    userRegulars.clear();
    userObservers.clear();
    for(TropUser user in loadedUsers) {
      switch(user.role){
        case TropRole.OWNER:
          userOwners.add(user);
          break;
        case TropRole.REGULAR:
          userRegulars.add(user);
          break;
        case TropRole.OBSERVER:
          userObservers.add(user);
          break;
      }
    }
  }

  void onTropUserProviderNotified(){
    updateUserSets();
    if(mounted) setState((){});
  }

  @override
  void initState() {

    TropProvider tropProv = TropProvider.of(context);
    TropListProvider tropListProv = TropListProvider.of(context);

    usersLoaderListener = TropUsersLoaderListener(
      onNoInternet: (){
        if(!mounted) return;
        showAppToast(context, text: noInternetMessage);
      },
      onUsersLoaded: (usersPage, reloaded){
        updateUserSets();
        Trop.callProvidersWithLoadedUsers(tropProv, tropListProv, tropLoadedUsersProv);
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

    tropLoadedUsersProv = TropLoadedUsersProvider.of(context);
    tropLoadedUsersProv.addListener(onTropUserProviderNotified);

    trop.addUsersLoaderListener(usersLoaderListener);
    updateUserSets();

    controller = RefreshController(
      initialRefresh: trop.loadedUsers.length == 1 && trop.userCount > 1 && !trop.isUsersLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(trop.loadedUsers.length == 1 && trop.isUsersLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(trop.loadedUsers.length > 1 && trop.isUsersLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });

    super.initState();
  }

  @override
  void dispose() {
    tropLoadedUsersProv.removeListener(onTropUserProviderNotified);
    trop.removeUsersLoaderListener(usersLoaderListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<TropLoadedUsersProvider>(
      builder: (context, prov, child) => UserListManagementLoadablePage<TropUser>(
        appBarTitle: 'Ludzie tropu (${trop.name})',
        userSets: [
          UserSet(
              icon: tropRoleToIcon[TropRole.OWNER]!,
              name: TropUsersPage.ownersHeaderTitle,
              users: userOwners,
              permissions: TropUsersPage.ownerPersmissions
          ),

          UserSet(
              icon: tropRoleToIcon[TropRole.REGULAR]!,
              name: TropUsersPage.regularsHeaderTitle,
              users: userRegulars,
              permissions: TropUsersPage.regularPersmissions
          ),

          UserSet(
              icon: tropRoleToIcon[TropRole.OBSERVER]!,
              name: TropUsersPage.observersHeaderTitle,
              users: userObservers,
              permissions: TropUsersPage.regularPersmissions
          ),

        ],
        userTileBuilder: (context, user) => trop.myRole==TropRole.OWNER?
        TropUserTileExtended(
          trop: trop,
          user: user,
          heroTag: user,
        ):
        TropUserTile(
            user: user,
            heroTag: user
        ),

        appBarActions: [
          if(!trop.isShared || trop.myRole == TropRole.OWNER)
            IconButton(
                icon: Icon(MdiIcons.plus),
                onPressed: () => openAddUserBottomSheet(context),
            )
        ],

        userCount: trop.userCount,
        callReload: () async {

          if(trop.key == null){
            logger.e("Registered a failed attempt to call `getUsers` on trop with no trop key.");
            return trop.assignedUsers.length + trop.loadedUsers.length;
          }

          await trop.reloadUsersPage(awaitFinish: true);
          return trop.loadedUsers.length;
        },
        callLoadMore: () async {

          if(trop.key == null){
            logger.e("Registered a failed attempt to call `getUsers` on trop with no trop key.");
            return trop.loadedUsers.length;
          }

          await trop.loadUsersPage(awaitFinish: true);
          return trop.loadedUsers.length;
        },
        controller: controller,

        emptyWidget: Center(
          child: SimpleButton(
            radius: AppCard.bigRadius,
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            onTap: () => openAddUserBottomSheet(context),
            child: EmptyMessageWidget(
              text: 'Zaproś nowe osoby\ndo tropu',
              icon: Trop.icon,
            ),
          ),
        )
      )
  );

  void openAddUserBottomSheet(BuildContext context) => showScrollBottomSheet(
      context: context,
      builder: (_) => AddUserBottomSheet(
          trop,
          context: context,
          onUserAdded: onUserAdded
      )
  );

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile_extended.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_users_page/trop_user_tile.dart';
import 'package:harcapp/_new/cat_page_home/user_list_managment_loadable_page.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

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

  final Trop trop;

  const TropUsersPage({
    required this.trop,
    super.key
  });

  @override
  State<StatefulWidget> createState() => TropUsersPageState();

}

class TropUsersPageState extends State<TropUsersPage>{

  Trop get trop => widget.trop;
  List<TropUser> get loadedUsers => trop.loadedUsers;

  late TropLoadedUsersProvider tropLoadedUsersProv;

  List<TropUser> userOwners = [];
  List<TropUser> userRegulars = [];
  List<TropUser> userObservers = [];

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
    setState((){});
  }

  @override
  void initState() {
    updateUserSets();
    tropLoadedUsersProv = TropLoadedUsersProvider.of(context);
    tropLoadedUsersProv.addListener(onTropUserProviderNotified);
    super.initState();
  }

  @override
  void dispose() {
    tropLoadedUsersProv.removeListener(onTropUserProviderNotified);
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
          if(trop.myRole == TropRole.OWNER)
            IconButton(
                icon: const Icon(MdiIcons.plus),
                onPressed: () => showScrollBottomSheet(
                    context: context,
                    builder: (_) => AddUserBottomSheet(trop, context: context)
                )
            )
        ],

        userCount: trop.userCount??0,
        callReload: () async {
          await ApiTrop.getUsers(
            tropUniqName: trop.uniqName,
            pageSize: Trop.userPageSize,
            lastRole: null,
            lastUserName: null,
            lastUserKey: null,
            onSuccess: (observersPage){
              TropUser me = trop.loadedUsersMap[AccountData.key]??fixTropUser(observersPage);
              observersPage.removeWhere((manager) => manager.key == me.key);
              observersPage.insert(0, me);
              trop.setAllLoadedUsers(observersPage, context: context);
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
          return trop.assignedUsers.length + trop.loadedUsers.length;
        },
        callLoadMore: () async {
          await ApiTrop.getUsers(
            tropUniqName: trop.uniqName,
            pageSize: Trop.userPageSize,
            lastRole: loadedUsers.length==1?null:loadedUsers.last.role,
            lastUserName: loadedUsers.length==1?null:loadedUsers.last.name,
            lastUserKey: loadedUsers.length==1?null:loadedUsers.last.key,
            onSuccess: (observersPage){
              trop.addLoadedUsers(observersPage, context: context);
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
            onError: (){
              if(!mounted) return;
              showAppToast(context, text: simpleErrorMessage);
            },
          );

          return trop.loadedUsers.length;

        },
        callLoadOnInit: trop.loadedUsers.length == 1,

      )
  );

  TropUser fixTropUser(List<TropUser> observersPage){
    TropUser me = observersPage.firstWhere((user) => user.key == AccountData.key);
    return me;
  }

}
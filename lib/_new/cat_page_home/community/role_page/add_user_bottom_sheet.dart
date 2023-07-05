import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';

import '../model/community_role.dart';
import '../model/community.dart';
import '../model/community_manager.dart';


class AddUserBottomSheet extends StatelessWidget{

  final Community community;
  // This is needed, because dialogs are closed in the process and local contexts are disposed.
  final BuildContext context;

  const AddUserBottomSheet(this.community, {required this.context, super.key});


  @override
  Widget build(BuildContext _) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj ogarniacza',
    addUserWithHarcappAccountMess: 'Dodaj osobę posiadającą konto HarcApp.',
    alreadyAddedMess: 'Już jest w kręgu',
    userAlreadyAddedMess: (name) => '$name już jest w kręgu!',

    participatingUserKeys: community.loadedManagersMap.keys.toList(),
    handleAddingUser: (UserDataNick userData) async {

      showLoadingWidget(context, 'Dodawanie ogarniacza');

      CommunityProvider communityProv = CommunityProvider.of(context);
      CommunityListProvider communityListProv = CommunityListProvider.of(context);
      CommunityManagersProvider communityManagersProv = CommunityManagersProvider.of(context);

      await ApiCommunity.addManagers(
          communityKey: community.key,
          users: [CommunityManagerBodyNick(userData.key, CommunityRole.REGULAR, userData.nick)],
          onSuccess: (List<CommunityManager> addedManagers){

            for(CommunityManager manager in addedManagers)
              if(community.isManagerWithinLoaded(manager))
                community.addLoadedManagers([manager], context: null);
            community.managerCount = community.managerCount! + addedManagers.length;
            Community.callProvidersWithManagers(
                communityProv,
                communityListProv,
                communityManagersProv
            );

            Navigator.pop(context); // Close loading widget.
            Navigator.pop(context);
            showAppToast(context, text: '${userData.name} ${userData.isMale?'dodany':'dodana'}');
          },
          onForceLoggedOut: (){
            Navigator.pop(context); // Close loading widget.
            Navigator.pop(context);
            return true;
          },
          onServerMaybeWakingUp: () {
            Navigator.pop(context); // Close loading widget.
            showServerWakingUpToast(context);
            return true;
          },
          onError: (){
            Navigator.pop(context); // Close loading widget.
            showAppToast(context, text: simpleErrorMessage);
          }
      );

    },
  );

}

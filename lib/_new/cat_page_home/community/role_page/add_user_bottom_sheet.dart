import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';

import '../community_role.dart';
import '../model/community.dart';
import '../model/community_manager.dart';


class AddUserBottomSheet extends StatelessWidget{

  final Community community;

  const AddUserBottomSheet(this.community, {super.key});


  @override
  Widget build(BuildContext context) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj członka',
    addUserWithHarcappAccountMess: 'Dodaj członka posiadającego konto HarcApp.',
    alreadyAddedMess: 'Już jest w kręgu',
    userAlreadyAddedMess: (name) => '$name już jest w kręgu!',

    participatingUserKeys: community.managersMap.keys.toList(),
    handleAddingUser: (BuildContext context, UserDataNick userData) async {

      showLoadingWidget(context, iconEnab_(context), 'Dodawanie członka');

      await ApiCommunity.addManagers(
          communityKey: community.key,
          users: [CommunityManagerRespBodyNick(userData.key, CommunityRole.REGULAR, userData.nick)],
          onSuccess: (List<CommunityManager> allManagers){
            community.setAllManagers(context, allManagers);
            Navigator.pop(context); // Close loading widget.
            Navigator.pop(context);
            showAppToast(context, text: '${userData.name} ${userData.isMale?'dodany':'dodana'}.');
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

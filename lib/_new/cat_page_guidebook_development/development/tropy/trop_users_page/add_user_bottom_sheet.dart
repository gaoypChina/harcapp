import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';

import '../model/trop_role.dart';
import '../model/trop_user.dart';


class AddUserBottomSheet extends StatelessWidget{

  final Trop trop;

  const AddUserBottomSheet(this.trop, {super.key});


  @override
  Widget build(BuildContext context) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj człowieka tropu',
    addUserWithHarcappAccountMess: 'Dodaj osobę posiadającą konto HarcApp.',
    alreadyAddedMess: 'Już jest w kręgu',
    userAlreadyAddedMess: (name) => '$name już jest w kręgu!',

    participatingUserKeys: trop.assignedUsersMap.keys.toList(),
    handleAddingUser: (BuildContext context, UserDataNick userData) async {

      showLoadingWidget(context, iconEnab_(context), 'Dodawanie człowieka tropu');

      await ApiTrop.addUsers(
          tropUniqName: trop.uniqName,
          users: [TropUserBodyNick(userData.key, TropRole.REGULAR, userData.nick)],
          onSuccess: (List<TropUser> allUsers){
            trop.setAllAssignedUsers(allUsers, context: context);
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

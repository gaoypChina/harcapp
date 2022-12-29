import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';


class AddUserBottomSheet extends StatelessWidget{

  final IndivComp comp;

  const AddUserBottomSheet(this.comp, {super.key});

  @override
  Widget build(BuildContext context) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj uczestnika',
    addUserWithHarcappAccountMess: 'Dodaj uczestnika posiadającego konto HarcApp.',
    alreadyAddedMess: 'Już uczestniczy',
    userAlreadyAddedMess: (name) => '$name już uczestniczy we współzawodnictwie!',

    participatingUserKeys: comp.participMap.keys.toList(),
    handleAddingUser: (BuildContext context, UserDataNick userData) async {

      showLoadingWidget(context, comp.colors.avgColor, 'Dodawanie uczestnika');

      await ApiIndivComp.addParticipants(
          compKey: comp.key,
          users: [ParticipBodyNick(userData.key, CompRole.OBSERVER, true, userData.nick)],
          onSuccess: (List<IndivCompParticip> allParticips){
            comp.participMap.clear();
            comp.particips.clear();
            comp.addParticips(allParticips, context: context);
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
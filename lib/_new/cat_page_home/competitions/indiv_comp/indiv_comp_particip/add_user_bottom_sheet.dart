import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';


class AddUserBottomSheet extends StatelessWidget{

  final IndivComp comp;
  // This is needed, because dialogs are closed in the process and local contexts are disposed.
  final BuildContext context;

  const AddUserBottomSheet(this.comp, {required this.context, super.key});

  @override
  Widget build(BuildContext _) => UserListAddNewBottomSheet(
    selectButtonColor: comp.colors.avgColor,
    selectButtonTextColor: comp.colors.iconColor,

    addUserMess: 'Dodaj uczestnika',
    addUserWithHarcappAccountMess: 'Dodaj uczestnika posiadającego konto HarcApp.',
    // alreadyAddedMess: 'Już uczestniczy',
    selectSearchedUserButtonText: 'Dodaj',
    userAlreadyAddedMess: (name) => '$name już uczestniczy we współzawodnictwie!',

    isUserParticipating: (user){
      if(user.shadow)
        return AccountData.loadedShadowUserMap![user.key]?.indivCompKeys.contains(comp.key) == true;
      else
        return comp.loadedParticipMap.containsKey(user.key);
    },
    handleAddingUser: (UserDataNick userData) async {

      showLoadingWidget(context, 'Dodawanie uczestnika', color: comp.colors.avgColor);

      IndivCompProvider indivCompProv = IndivCompProvider.of(context);
      IndivCompListProvider indivCompListProv = IndivCompListProvider.of(context);
      IndivCompParticipsProvider indivCompParticipsProv = IndivCompParticipsProvider.of(context);

      await ApiIndivComp.addParticipants(
          comp: comp,
          users: [ParticipBodyNick(userData.key, CompRole.OBSERVER, true, userData.nick)],
          onSuccess: (List<IndivCompParticip> addedParticips){
            for(IndivCompParticip particip in addedParticips)
              if(particip.shadow){
                ShadowUserData? shadowUser = AccountData.loadedShadowUserMap![particip.key];
                if(shadowUser == null) continue;
                shadowUser.indivCompKeys.add(comp.key);
                AccountData.writeShadowUsers(AccountData.loadedShadowUsers);
              }

            // This must be done only on the already loaded particips.
            for(IndivCompParticip particip in addedParticips)
              if(comp.isParticipWithinLoaded(particip))
                comp.adjustToOtherParticipChange(null, particip);

            for(IndivCompParticip particip in addedParticips)
              if(comp.isParticipWithinLoaded(particip))
                comp.addLoadedParticips([particip], context: null);

            comp.participCount += addedParticips.length;
            IndivComp.callProvidersWithParticips(
                indivCompProv,
                indivCompListProv,
                indivCompParticipsProv
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
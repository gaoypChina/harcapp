import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:palette_generator/palette_generator.dart';

import '../circle_role.dart';
import '../model/circle.dart';
import '../model/member.dart';

class AddUserBottomSheet extends StatelessWidget{

  final Circle circle;
  final PaletteGenerator? palette;

  const AddUserBottomSheet(this.circle, this.palette, {super.key});


  @override
  Widget build(BuildContext context) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj członka',
    addUserWithHarcappAccountMess: 'Dodaj osobę posiadającą konto HarcApp.',
    alreadyAddedMess: 'Już jest w kręgu',
    userAlreadyAddedMess: (name) => '$name już jest w kręgu!',

    participatingUserKeys: circle.loadedMembersMap.keys.toList(),
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    handleAddingUser: (BuildContext context, UserDataNick userData) async {

      showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Dodawanie członka');

      await ApiCircle.addMembers(
          circleKey: circle.key,
          users: [MemberRespBodyNick(userData.key, CircleRole.OBSERVER, null, userData.nick)],
          onSuccess: (List<Member> allMems){
            circle.setAllLoadedMembers(allMems, context: context);
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

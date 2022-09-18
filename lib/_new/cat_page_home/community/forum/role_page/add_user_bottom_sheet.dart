import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum_manager.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:palette_generator/palette_generator.dart';

import '../forum_role.dart';
import '../model/forum.dart';

class AddUserBottomSheet extends StatelessWidget{

  final Forum forum;
  final PaletteGenerator? palette;

  const AddUserBottomSheet(this.forum, this.palette, {super.key});


  @override
  Widget build(BuildContext context) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj ogarniacza',
    addUserWithHarcappAccountMess: 'Dodaj osobę posiadającą konto HarcApp.',
    alreadyAddedMess: 'Już jest w kręgu',
    userAlreadyAddedMess: (name) => '$name już jest w kręgu!',

    participatingUserKeys: forum.managersMap.keys.toList(),
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    handleAddingUser: (BuildContext context, UserDataNick userData) async {

      showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Dodawanie ogarniacza');

      await ApiForum.addManagers(
          forumKey: forum.key,
          users: [ForumManagerRespBodyNick(userData.key, ForumRole.EDITOR, userData.nick)],
          onSuccess: (List<ForumManager> allManagers){
            forum.setAllManagers(allManagers, context: context);
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
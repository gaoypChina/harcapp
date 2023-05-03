import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp/_new/cat_page_home/user_list_add_new_bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';

import '../model/marker_data.dart';
import '../model/marker_role.dart';
import '../model/marker_manager.dart';


class AddUserBottomSheet extends StatelessWidget{

  final MarkerData marker;
  // This is needed, because dialogs are closed in the process and local contexts are disposed.
  final BuildContext context;

  const AddUserBottomSheet(this.marker, {required this.context, super.key});


  @override
  Widget build(BuildContext _) => UserListAddNewBottomSheet(
    addUserMess: 'Dodaj ogarniacza',
    addUserWithHarcappAccountMess: 'Dodaj osobę posiadającą konto HarcApp.',
    alreadyAddedMess: 'Już jest w kręgu',
    userAlreadyAddedMess: (name) => '$name już jest w kręgu!',

    participatingUserKeys: marker.loadedManagersMap.keys.toList(),
    handleAddingUser: (UserDataNick userData) async {

      showLoadingWidget(context, iconEnab_(context), 'Dodawanie ogarniacza');

      MarkerProvider markerProv = MarkerProvider.of(context);
      MarkerListProvider markerListProv = MarkerListProvider.of(context);
      MarkerManagersProvider markerManagersProv = MarkerManagersProvider.of(context);

      await ApiHarcMap.addManagers(
          markerKey: marker.key,
          users: [MarkerManagerRespBodyNick(userData.key, MarkerRole.COMMUNITY_MODERATOR, userData.nick)],
          onSuccess: (List<MarkerManager> addedManagers){
            for(MarkerManager manager in addedManagers)
              if(marker.isManagerWithinLoaded(manager))
                marker.addLoadedManagers([manager], context: null);
            marker.managerCount += addedManagers.length;
            MarkerData.callProvidersWithManagers(
                markerProv,
                markerListProv,
                markerManagersProv
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

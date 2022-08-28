
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';

Future<void> showUpdateDialog({
  required BuildContext context,
  required bool isMe,
  required bool loosingAdmin,
  required int currAdminCount,

  required String looseAdminConfMess, // 'Czy na pewno chcesz zrzec się roli <b>administratora</b> współzawodnictwa <b>${comp.name}</b>?'

  required void Function() handleUpdate
}) async {

  if(!await isNetworkAvailable()){
    showAppToast(context, text: 'Brak dostępu do Internetu');
    return;
  }

  if(loosingAdmin && currAdminCount == 1){
    await _showLastAdminError(context);
    return;
  }

  bool close = false;

  if(isMe && loosingAdmin)
    await showAlertDialog(
      context,
      title: 'Chwileczkę!',
      content: looseAdminConfMess,
      actionBuilder: (context) => [
        AlertDialogButton(
          text: 'Tak',
          onTap: () => Navigator.pop(context)
        ),
        AlertDialogButton(
          text: 'Nie',
          onTap: (){
            close = true;
            Navigator.pop(context);
          },
        ),
      ],
    );

  if(close) return;

  return handleUpdate();

}

Future<void> showRemoveDialog({
  required BuildContext context,
  required bool isMe,
  required bool loosingAdmin,
  required int currAdminCount,

  required String removingUserTitleMess, // 'Wypraszanie użytkownika'
  required String removingUserDetailMess, // '{user.name} nie będzie mieć dłużej dostępu do współzawodnictwa.\n\nNa pewno chcesz go wyprosić?'

  required void Function() handleRemove
}) async {

  if(!await isNetworkAvailable()){
    showAppToast(context, text: 'Brak dostępu do Internetu');
    return;
  }

  if(loosingAdmin && currAdminCount == 1){
    await _showLastAdminError(context);
    return;
  }

  await showAlertDialog(
      context,
      title: removingUserTitleMess,
      content: removingUserDetailMess,
      actionBuilder: (_) => [

        AlertDialogButton(
            text: 'Nie',
            onTap: () => Navigator.pop(context)
        ),

        AlertDialogButton(
            text: 'Tak',
            onTap: () async {
              Navigator.pop(context);
              Navigator.pop(context);

              return handleRemove();
            }
        )
      ]
  );

}

Future<void> _showLastAdminError(BuildContext context) => showAlertDialog(
    context,
    title: 'Hola, hola...',
    content: 'Zamierzasz usunąć ostatniego administratora?\n\nTak nie wolno.',
    actionBuilder: (context) => [
      AlertDialogButton(
          text: 'No dobrze',
          onTap: () => Navigator.pop(context)
      )
    ]
);
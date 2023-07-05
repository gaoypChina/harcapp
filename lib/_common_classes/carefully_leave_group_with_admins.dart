import 'package:flutter/widgets.dart';

import '../_common_widgets/loading_widget.dart';
import 'app_navigator.dart';
import 'common.dart';

Future<void> carefullyLeaveGroupWithAdmins({
  required BuildContext context,
  required int allAdminCount,
  required bool amIAdmin,
  String cannotLeaveTitle = 'Hola, hola...',
  String cannotLeaveContent = 'Jesteś ostatnim administratorem i zamierzasz opuścić grupę!\n\nTak nie wolno.',

  String leavingMessage = 'Opuszczanie lokalu...',

  bool closeLoadingDialog = true,
  required Future<void> Function() requestLeave,
}) async {

  if(allAdminCount == 1 && amIAdmin){
    showAlertDialog(
        context,
        title: cannotLeaveTitle,
        content: cannotLeaveContent,
        actionBuilder: (context) => [
          AlertDialogButton(
              text: 'No dobrze',
              onTap: () => Navigator.pop(context)
          )
        ]
    );
    return;
  }else
    showAlertDialog(
        context,
        title: 'Zastanów się dobrze...',
        content: 'Jesteś na ostatniej prostej, by <b>opuścić</b> krąg.\n\nNa pewno chcesz kontynuować?',
        actionBuilder: (_) => [

          AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

          AlertDialogButton(
              text: 'Tak',
              onTap: () async {

                Navigator.pop(context); // Close alert dialog.

                showLoadingWidget(context, leavingMessage);

                await requestLeave();

                if(closeLoadingDialog)
                  await popPage(context); // Close loading widget.
                
              }
          )
        ]
    );


}
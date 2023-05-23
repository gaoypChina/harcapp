import 'package:flutter/widgets.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

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

  bool closeLoadingAndAlertDialog = true,
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

                showLoadingWidget(context, iconEnab_(context), leavingMessage);

                await requestLeave();

                // await ApiCircle.leave(
                //     circleKey: circle!.key,
                //     onSuccess: () async {
                //       Community.removeCircle(circle!, context: context);
                //       showAppToast(context, text: 'Krąg opuszczony');
                //       await popPage(context); // Close loading widget.
                //
                //       onLeft?.call();
                //     },
                //     onServerMaybeWakingUp: () {
                //       showServerWakingUpToast(context);
                //       return true;
                //     },
                //     onError: () async {
                //       showAppToast(context, text: simpleErrorMessage);
                //       await popPage(context); // Close loading widget.
                //
                //       onError?.call();
                //     }
                // );

                if(closeLoadingAndAlertDialog) {
                  await popPage(context); // Close loading widget.
                  Navigator.pop(context);
                }
              }
          )
        ]
    );


}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/carefully_leave_group_with_admins.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_role.dart';
import '../model/circle.dart';

class LeaveCircleButton extends StatelessWidget{

  final Circle? circle;
  final void Function()? onLeft;
  final void Function()? onError;

  const LeaveCircleButton(this.circle, {this.onLeft, this.onError, super.key});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: Icon(MdiIcons.exitToApp),
    title: Text(
      'Opuść krąg',
      style: AppTextStyle(),
    ),
    onTap: () {

      carefullyLeaveGroupWithAdmins(
        context: context,
        allAdminCount: circle!.memberAdminCount,
        amIAdmin: circle!.myRole == CircleRole.ADMIN,
        cannotLeaveContent: 'Jesteś ostatnim administratorem kręgu i zamierzasz je opuścić!\n\nTak nie wolno.',
        closeLoadingDialog: false,
        requestLeave: () => ApiCircle.leave(
            circleKey: circle!.key,
            onSuccess: () async {
              Community.removeCircle(circle!, context: context);
              showAppToast(context, text: 'Krąg opuszczony');
              await popPage(context); // Close loading widget.
              Navigator.pop(context);

              onLeft?.call();
            },
            onServerMaybeWakingUp: () async {
              showServerWakingUpToast(context);
              await popPage(context); // Close loading widget.
              Navigator.pop(context);

              return true;
            },
            onError: () async {
              showAppToast(context, text: simpleErrorMessage);
              await popPage(context); // Close loading widget.
              Navigator.pop(context);

              onError?.call();
            }
        ),
      );

      // int allAdminCount = 0;
      // for(Member? mem in circle!.loadedMembers) if(mem!.role == CircleRole.ADMIN) allAdminCount++;
      //
      // if(allAdminCount == 1 && circle!.myRole == CircleRole.ADMIN){
      //   showAlertDialog(
      //       context,
      //       title: 'Hola, hola...',
      //       content: 'Jesteś ostatnim administratorem kręgu i zamierzasz je opuścić!\n\nTak nie wolno.',
      //       actionBuilder: (context) => [
      //         AlertDialogButton(
      //             text: 'No dobrze',
      //             onTap: () => Navigator.pop(context)
      //         )
      //       ]
      //   );
      //   return;
      // }else
      //   showAlertDialog(
      //       context,
      //       title: 'Zastanów się dobrze...',
      //       content: 'Jesteś na ostatniej prostej, by <b>opuścić</b> krąg.\n\nNa pewno chcesz kontynuować?',
      //       actionBuilder: (_) => [
      //
      //         AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),
      //
      //         AlertDialogButton(
      //             text: 'Tak',
      //             onTap: () async {
      //
      //               Navigator.pop(context); // Close alert dialog.
      //
      //               showLoadingWidget(context, iconEnab_(context), 'Opuszczanie lokalu...');
      //
      //               await ApiCircle.leave(
      //                   circleKey: circle!.key,
      //                   onSuccess: () async {
      //                     Community.removeCircle(circle!, context: context);
      //                     showAppToast(context, text: 'Krąg opuszczony');
      //                     await popPage(context); // Close loading widget.
      //
      //                     onLeft?.call();
      //                   },
      //                   onServerMaybeWakingUp: () {
      //                     showServerWakingUpToast(context);
      //                     return true;
      //                   },
      //                   onError: () async {
      //                     showAppToast(context, text: simpleErrorMessage);
      //                     await popPage(context); // Close loading widget.
      //
      //                     onError?.call();
      //                   }
      //               );
      //               Navigator.pop(context);
      //             }
      //         )
      //       ]
      //   );

    },
  );

}
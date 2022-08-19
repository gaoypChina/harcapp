import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_role.dart';
import '../model/circle.dart';
import '../model/member.dart';

class LeaveCircleButton extends StatelessWidget{

  final Circle? circle;
  final void Function()? onLeft;
  final void Function()? onError;

  const LeaveCircleButton(this.circle, {this.onLeft, this.onError, super.key});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: const Icon(MdiIcons.exitToApp),
    title: Text(
      'Opuść krąg',
      style: AppTextStyle(),
    ),
    onTap: () {

      int allAdminCount = 0;
      for(Member? mem in circle!.members) if(mem!.role == CircleRole.ADMIN) allAdminCount++;

      if(allAdminCount == 1 && circle!.myRole == CircleRole.ADMIN){
        showAlertDialog(
            context,
            title: 'Hola, hola...',
            content: 'Jesteś ostatnim administratorem kręgu i zamierzasz je opuścić!\n\nTak nie wolno.',
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

                    showLoadingWidget(context, iconEnab_(context), 'Opuszczanie lokalu...');

                    await ApiCircle.leave(
                        circleKey: circle!.key,
                        onSuccess: () async {
                          Circle.removeFromAll(circle, context: context);
                          showAppToast(context, text: 'Krąg opuszczony');
                          await popPage(context); // Close loading widget.

                          onLeft?.call();
                        },
                        onServerMaybeWakingUp: () {
                          showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          showAppToast(context, text: simpleErrorMessage);
                          await popPage(context); // Close loading widget.

                          onError?.call();
                        }
                    );
                    Navigator.pop(context);
                  }
              )
            ]
        );

    },
  );

}
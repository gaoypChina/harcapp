import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_role.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/member.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_loader.dart';
import '../model/circle.dart';

class DangerPart extends StatefulWidget{

  final Circle circle;
  const DangerPart(this.circle, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DangerPartState();

}

class DangerPartState extends State<DangerPart>{

  Circle get circle => widget.circle;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      ListTile(
        leading: const Icon(MdiIcons.exitToApp),
        title: Text(
          'Opuść krąg',
          style: AppTextStyle(),
        ),
        onTap: () {

          int allAdminCount = 0;
          for(Member mem in circle.members) if(mem.role == CircleRole.ADMIN) allAdminCount++;

          if(allAdminCount == 1 && circle.myRole == CircleRole.ADMIN){
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

                        Navigator.pop(context);

                        showLoadingWidget(context, iconEnab_(context), 'Opuszczanie lokalu...');

                        await ApiCircle.leave(
                            compKey: circle.key,
                            onSuccess: () async {
                              await circleLoader.run();
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showAppToast(context,
                                  text: 'Krąg opuszczony');
                            },
                            onError: () =>
                                showAppToast(
                                    context, text: 'Coś poszło nie tak...')
                        );
                        Navigator.pop(context);
                      }
                  )
                ]
            );

        },
      )

    ],
  );

}

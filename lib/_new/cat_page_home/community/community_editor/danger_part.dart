import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DangerPart extends StatefulWidget{

  final Community community;
  final void Function()? onDeleted;
  final void Function()? onLeft;
  final void Function()? onError;

  const DangerPart(this.community, {this.onDeleted, this.onLeft, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => DangerPartState();

}

class DangerPartState extends State<DangerPart>{

  Community get community => widget.community;
  void Function()? get onLeft => widget.onLeft;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(communityRadius),
        ),
        leading: Icon(MdiIcons.vanish),
        title: Text(
          'Rozwiąż środowisko',
          style: AppTextStyle(),
        ),
        onTap: () => showAlertDialog(
            context,
            title: 'Zastanów się dobrze...',
            content: 'Środowisko <b>przestanie istnieć</b>. Dotyczy to także <b>kręgu</b> i <b>forum</b>.\n\nNie będzie już powrotu.\n\nNa pewno chcesz je <b>rozwiazać</b>?',
            actionBuilder: (_) => [

              AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

              AlertDialogButton(
                  text: 'Tak',
                  onTap: () async {

                    Navigator.pop(context); // Close alert dialog.

                    showLoadingWidget(context, iconEnab_(context), 'Zwijanie kręgu...');

                    await ApiCommunity.delete(
                        communityKey: community.key,
                        onSuccess: () async {
                          Community.removeFromAll(community, context: context);
                          showAppToast(context, text: 'Poszło z dymem!');
                          await popPage(context); // Close loading widget.

                          widget.onDeleted?.call();
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) showAppToast(context, text: simpleErrorMessage);
                          await popPage(context); // Close loading widget.

                          widget.onError?.call();
                        }
                    );
                  }
              )
            ]
        ),
      ),

    ],
  );

}

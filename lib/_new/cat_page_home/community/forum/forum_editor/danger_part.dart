import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../model/forum.dart';

class DangerPart extends StatefulWidget{

  final Forum? forum;
  final PaletteGenerator? palette;
  final void Function()? onDeleted;
  final void Function()? onLeft;
  final void Function()? onError;

  const DangerPart(this.forum, {this.palette, this.onDeleted, this.onLeft, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => DangerPartState();

}

class DangerPartState extends State<DangerPart>{

  Forum? get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  void Function()? get onLeft => widget.onLeft;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      ListTile(
        tileColor: CommunityCoverColors.cardColor(context, palette),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(communityRadius),
        ),
        leading: Icon(MdiIcons.vanish),
        title: Text(
          'Zamknij forum',
          style: AppTextStyle(),
        ),
        onTap: () => showAlertDialog(
            context,
            title: 'Zastanów się dobrze...',
            content: 'Forum <b>przestanie istnieć</b>.\n\nNie będzie już powrotu.\n\nNa pewno chcesz je <b>zamknąć</b>?',
            actionBuilder: (_) => [

              AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

              AlertDialogButton(
                  text: 'Tak',
                  onTap: () async {

                    Navigator.pop(context); // Close alert dialog.

                    showLoadingWidget(context, 'Zwijanie kręgu...');

                    await ApiForum.delete(
                      forumKey: forum!.key,
                      onSuccess: () async {
                        Community.removeForum(forum!, context: context);
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

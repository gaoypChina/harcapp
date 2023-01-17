import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/api/harc_map.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/marker_data.dart';

class DangerPart extends StatefulWidget{

  final MarkerData marker;
  final void Function()? onDeleted;
  final void Function()? onLeft;
  final void Function()? onError;

  const DangerPart(this.marker, {this.onDeleted, this.onLeft, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => DangerPartState();

}

class DangerPartState extends State<DangerPart>{

  MarkerData get marker => widget.marker;
  void Function()? get onLeft => widget.onLeft;

  @override
  Widget build(BuildContext context) => ListView(
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    children: [

      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(communityRadius),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(communityRadius),
          ),
          leading: const Icon(MdiIcons.vanish),
          title: Text(
            'Usuń miejsce',
            style: AppTextStyle(),
          ),
          onTap: () => showAlertDialog(
              context,
              title: 'Zastanów się dobrze...',
              content: 'Miejsce <b>przestanie istnieć</b>.\n\nNie będzie już powrotu.\n\nNa pewno chcesz je <b>usunąć</b>?',
              actionBuilder: (_) => [

                AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

                AlertDialogButton(
                    text: 'Tak',
                    onTap: () async {

                      Navigator.pop(context); // Close alert dialog.

                      showLoadingWidget(context, iconEnab_(context), 'Ewakuowanie miejsca...');

                      await ApiHarcMap.delete(
                          markerKey: marker.key,
                          onSuccess: () async {
                            MarkerData.removeFromAll(marker);
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
      )

    ],
  );

}

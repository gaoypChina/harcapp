import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../logger.dart';
import '../login_provider.dart';
import '../ms_oauth.dart';


class LogoutDialog extends StatefulWidget{

  final void Function() onLoggedOut;

  const LogoutDialog({this.onLoggedOut, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => LogoutDialogState();

}

class LogoutDialogState extends State<LogoutDialog> with TickerProviderStateMixin{

  static const int _STATE_CHECKING = 0;
  static const int _STATE_SYNCING = 1;
  static const int _STATE_OK = 2;
  static const int _STATE_FAILED = 3;

  int state;

  SynchronizerListener listener;

  Future<void> setSyncState() async {
    bool allSynced = await synchronizer.isAllSynced();

    if(allSynced)
      setState(() => state = _STATE_OK);
    else {
      setState(() => state = _STATE_SYNCING);
      await synchronizer.post();

      bool allSynced = await synchronizer.isAllSynced();
      if(allSynced)
        setState(() => state = _STATE_OK);
      else{

        logger.e(await synchronizer.allUnsynced());

        setState(() => state = _STATE_FAILED);

        //showAppToast(context, text: 'Coś poszło nie tak...');
        //Navigator.pop(context);
      }
    }
  }

  @override
  void dispose() {
    synchronizer.removeListener(listener);
    super.dispose();
  }

  @override
  void initState() {

    state = _STATE_CHECKING;

    listener = SynchronizerListener(onEnd: (oper) => setState((){}));
    synchronizer.addListener(listener);

    setSyncState();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
      child: SizedBox(
        width: 286,
        child: AppCard(
            radius: AppCard.ALERT_DIALOG_RADIUS,
            padding: const EdgeInsets.all(AppCard.ALERT_DIALOG_PADDING),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Cóż to?', style: AppTextStyle(fontSize: 20.0, color: textEnab_(context), fontWeight: weight.halfBold),
                        ),
                        const SizedBox(height: 20.0),

                        Text(
                          'Chcesz wylogować się z konta?', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: textEnab_(context)),
                        ),

                        const SizedBox(height: 20.0),

                        if(state == _STATE_CHECKING)
                          Row(
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: SpinKitThreeBounce(color: accent_(context), size: Dimen.ICON_SIZE - 4),
                              ),
                              const SizedBox(width: Dimen.DEF_MARG),
                              Text('Sprawdzanie stanu...', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: hintEnab_(context))),
                            ],
                          )
                        else if(state == _STATE_SYNCING)
                          Row(
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: SpinKitThreeBounce(color: accent_(context), size: Dimen.ICON_SIZE - 4),
                              ),
                              const SizedBox(width: Dimen.DEF_MARG),
                              Text('Trwa synchronizacja...', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: hintEnab_(context))),
                            ],
                          )
                        else if(state == _STATE_FAILED)
                            Row(
                              children: <Widget>[

                                const Icon(MdiIcons.alertCircleOutline, color: Colors.red),
                                const SizedBox(width: Dimen.DEF_MARG),
                                Text('Problem z synchronizacją', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL, color: Colors.red)),
                              ],
                            )
                        else
                          const SizedBox(height: Dimen.TEXT_SIZE_NORMAL),
                      ],
                    )
                ),

                const SizedBox(height: 16.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    AlertDialogButton(
                        text: 'Tak',
                        enabled: state == _STATE_OK || state == _STATE_FAILED,
                        onTap: () async {
                          await ZhpAccAuth.logout();
                          await ApiRegLog.logout(
                              onSuccess: () async {
                                await AccSecData.forgetAccount();
                                if(mounted) showAppToast(context, text: 'Wylogowano');
                                widget.onLoggedOut?.call();
                                if(mounted) Navigator.pop(context);
                              },
                              onError: () async {
                                if(mounted) showAppToast(context, text: 'Coś poszło nie tak...');
                                if(mounted) Navigator.pop(context);
                              }
                          );
                        }
                    ),

                    AlertDialogButton(
                      text: 'Nie',
                      onTap: () => Navigator.pop(context),
                    ),


                  ],
                ),

              ],
            )
        ),
      )
  );

}

void openLogoutDialog(BuildContext context) => openDialog(
    context: context,
    builder: (context) => LogoutDialog(
      onLoggedOut: (){
        Provider.of<LoginProvider>(context, listen: false).notify();
        Navigator.pop(context);
      },
    )
);
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/login_register.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../logger.dart';
import '../account.dart';
import '../login_provider.dart';


class LogoutDialog extends StatefulWidget{

  final void Function()? onLoggedOut;
  final void Function()? onLogoutFailed;

  const LogoutDialog({this.onLoggedOut, this.onLogoutFailed, super.key});

  @override
  State<StatefulWidget> createState() => LogoutDialogState();

}

class LogoutDialogState extends State<LogoutDialog> with TickerProviderStateMixin{

  static const int _STATE_CHECKING = 0;
  static const int _STATE_SYNCING = 1;
  static const int _STATE_OK = 2;
  static const int _STATE_FAILED = 3;

  int? state;

  SynchronizerListener? listener;

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

        //showAppToast(context, Lk_9_28b-36$text: 'Coś poszło nie tak...');
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
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Cóż to?', style: AppTextStyle(fontWeight: weight.halfBold)),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        const AppText('Chcesz wylogować się z konta?', size: Dimen.TEXT_SIZE_BIG),

        const SizedBox(height: 20.0),

        if(state == _STATE_CHECKING)
          Row(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(2),
                child: SpinKitThreeBounce(color: accent_(
                    context), size: Dimen.ICON_SIZE - 4),
              ),
              const SizedBox(width: Dimen.defMarg),
              Text('Sprawdzanie stanu...',
                  style: AppTextStyle(fontSize: Dimen
                      .TEXT_SIZE_NORMAL, color: hintEnab_(
                      context))),
            ],
          )
        else
          if(state == _STATE_SYNCING)
            Row(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(2),
                  child: SpinKitThreeBounce(
                      color: accent_(context),
                      size: Dimen.ICON_SIZE - 4),
                ),
                const SizedBox(width: Dimen.defMarg),
                Text('Trwa synchronizacja...',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_NORMAL,
                        color: hintEnab_(context))),
              ],
            )
          else
            if(state == _STATE_FAILED)
              Row(
                children: <Widget>[

                  Icon(MdiIcons.alertCircleOutline,
                      color: Colors.red),
                  const SizedBox(width: Dimen.defMarg),
                  Text('Problem z synchronizacją',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_NORMAL,
                          color: Colors.red)),
                ],
              )
            else
              const SizedBox(height: Dimen.ICON_SIZE),

      ],
    ),
    actions: [

      AlertDialogButton(
          text: 'Tak',
          enabled: state == _STATE_OK || state == _STATE_FAILED,
          onTap: () async {

            LoginProvider loginProv = LoginProvider.of(context);

            await ApiRegLog.logout(
                onSuccess: () async {
                  loginProv.notify();
                  widget.onLoggedOut?.call();
                  if (!mounted) return;
                  Navigator.pop(context);
                  showAppToast(context, text: 'Wylogowano');
                  Navigator.pop(context);
                },
                onServerMaybeWakingUp: () {
                  if (mounted) showServerWakingUpToast(context);
                  return true;
                },
                onError: () async {
                  widget.onLogoutFailed?.call();
                  if (mounted) showAppToast(context, text: simpleErrorMessage);
                  if (mounted) Navigator.pop(context);
                }
            );
          }
      ),

      AlertDialogButton(
        text: 'Nie',
        onTap: () => Navigator.pop(context),
      ),

    ],
    actionsPadding: const EdgeInsets.only(bottom: Dimen.ICON_MARG, right: Dimen.ICON_MARG),
    backgroundColor: cardEnab_(context),
    contentTextStyle: TextStyle(color: textEnab_(context)),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppCard.alertDialogRadius))),
  );
}

Future<void> openLogoutDialog(BuildContext context) async {
  bool problems = false;
  await openDialog(
      context: context,
      builder: (context) => LogoutDialog(
          onLogoutFailed: () => problems = true
      )
  );
  if(problems)
    await openForceLogoutDialog(context);
}

Future<void> openForceLogoutDialog(BuildContext context) => showAlertDialog(
    context,
    title: 'Mamy problem',
    content: 'Wystąpił błąd podczas próby wylogowania. Możliwe, że Twoja aplikacja nie jest zsynchronizowana z kontem.'
        '\n\nCzy chcesz wylogować się mimo to?',
    actionBuilder: (context) => [

      AlertDialogButton(
          text: 'Tak',
          onTap: () async {
            await AccountData.forgetAccount();
            AccountData.callOnLogout(false);
            LoginProvider.notify_(context);
            Navigator.pop(context);
            showAppToast(context, text: 'Wylogowano');
            Navigator.pop(context);
          }
      ),

      AlertDialogButton(
        text: 'Nie',
        onTap: () => Navigator.pop(context),
      ),

    ],


);
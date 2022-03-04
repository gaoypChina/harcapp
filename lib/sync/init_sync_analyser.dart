import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';

import '../logger.dart';

enum InitSyncOperation{
  noAction,
  post,
  postReplace,
  get,
  getReplace,
  logout,

  error,
}
class InitSyncAnalyser{

  static const String _diffAccLogin = 'Z kontem, do którego się logujesz, są zsynchronizowane inne ustawienia niż w Twojej aplikacji. Aby móc kontynuować, wszystkie różnice należy uwspólnić do jednej wersji.'
      '\n\nKtóre dane chcesz zachować, a które trwale usunać?';

  static const String _dataConflict = 'Wygląda na to, że pod Twoją nieobecność zsynchronizowane dane na koncie uległy zmianie. Aby móc kontynuwać, wszystkie różnice należy uwspólnić do jednej wersji.'
      '\n\nKtóre dane chcesz zachować, a które trwale usunać?';


  static Future<InitSyncOperation> analyse({
    @required BuildContext context,
    @required String email,
    @required String lastConfEmail,
    @required DateTime lastSyncTimeServer,
    @required DateTime lastSyncTimeLocal,
    bool log = false
  }) async {

    bool isAllSynced = await synchronizer.isAllSynced();

    if(log) logger.i('Sync carefully called. Conditions:'
        '\nemail: $email'
        '\nlastEmail: $lastConfEmail,'
        '\nisAllSynced: $isAllSynced,'
        '\nlastSyncServer: ${lastSyncTimeServer?.toIso8601String()}'
        '\nlastLocalSync: ${lastSyncTimeLocal?.toIso8601String()}');

    if(lastConfEmail == null) {

      if(isAllSynced) // NOTHING CHANGED YET.
        return InitSyncOperation.get;
      else if(lastSyncTimeServer == null)
        return InitSyncOperation.post;
      else // CHANGES HAVE BEEN MADE.
        return await resolveSyncConflict(context, _dataConflict);

    }else{

      if (lastConfEmail == email) { // SAME ACCOUNT LOGIN

        if (isAllSynced) {

          // Nothing was synced to server yet.
          if(lastSyncTimeServer == null){
            if(lastSyncTimeLocal == null)
              return InitSyncOperation.noAction;
            else
              // Server has no data, but device thinks it synced something already.
              return InitSyncOperation.error;
          }

          if(lastSyncTimeLocal == null || lastSyncTimeLocal.isBefore(lastSyncTimeServer))
            // Na urządzeniu bez zmian, na serwerze nowości.
            return InitSyncOperation.get;
          else
            // Wszystko gra, nic się nie zmieniło.
            return InitSyncOperation.noAction;

        } else {
          if(lastSyncTimeLocal == null || lastSyncTimeLocal.isAtSameMomentAs(lastSyncTimeServer))
            // Na urządzeniu nowości, na serwerze po staremu.
            return InitSyncOperation.post;
          else
            // Nie wszystko jest zsynchronizowane, ale na koncie coś się zmieniło.
            return await resolveSyncConflict(context, _dataConflict);
        }

      }else // DIFFERENT ACCOUNT LOGIN
        return await resolveSyncConflict(context, _diffAccLogin);

    }
  }

  static Future<InitSyncOperation> resolveSyncConflict(BuildContext context, String message) async {

    InitSyncOperation result;

    await showAlertDialog(
        context,
        title: 'Ostrożnie!',
        content: message,
        actionBuilder: (context) => [

          AlertDialogButton(
            text: 'Zachowaj stan lokalny.',
            onTap: () async {
              result = InitSyncOperation.postReplace;
              Navigator.pop(context);
            }
          ),
          AlertDialogButton(
            text: 'Zachowaj stan konta.',
            onTap: () async {
              result = InitSyncOperation.getReplace;
              Navigator.pop(context);
            }
          ),
          AlertDialogButton(
            text: 'Nie wiem. Wyloguj.',
            onTap: () async {
              result = InitSyncOperation.logout;
              Navigator.pop(context);
            }
          )
        ]
    );

    await Future.delayed(pageTransDuration);

    return result;
  }

}

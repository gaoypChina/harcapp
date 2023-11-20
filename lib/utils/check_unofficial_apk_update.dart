import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:package_info/package_info.dart';

bool updateAlreadyChecked = false;

Future<bool> checkUnofficialApkUpdate(BuildContext context) async {

  Response response = await Dio().get(
    'https://gitlab.com/n3o2k7i8ch5/harcapp_data/-/raw/master/unofficial_apk_version/version',
  );

  String dataStr = response.data;
  Map dataMap = jsonDecode(dataStr);
  int versionCode = dataMap['versionCode'];
  String versionName = dataMap['versionName'];
  String apkSource = dataMap['apkSource'];
  bool shouldMoveToPlayStore = dataMap['shouldMoveToPlayStore'];

  PackageInfo info = await PackageInfo.fromPlatform();

  bool updateAvailable = int.parse(info.buildNumber) != versionCode;

  if(updateAvailable)
    await showUpdateDialog(
      context: context,
      versionName: versionName,
      apkSource: apkSource
    );
  else if(shouldMoveToPlayStore)
    await showMoveToPlayStoreDialog(
        context: context
    );

  updateAlreadyChecked = true;

  return updateAvailable;
}

Future<void> showUpdateDialog({
  required BuildContext context,
  required String versionName,
  required String apkSource
}) => showAlertDialog(
    context,
    title: 'Aktualizacja dostępna',
    content: 'Dostępna jest HarcAppka w nowej wersji $versionName.\n\nCo powiesz?',
    actionBuilder: (context) => [
      AlertDialogButton(text: 'Później', onTap: () => Navigator.pop(context)),
      AlertDialogButton(text: 'Biorę!', onTap: () => launchURL(apkSource)),
    ]
);

Future<void> showMoveToPlayStoreDialog({
  required BuildContext context,
}) => showAlertDialog(
    context,
    title: 'Czas na zmiany!',
    content: 'Dostępna jest nowa HarcAppka w sklepie Google Play. Obecnie korzystasz z wersji pozasklepowej, która w najbliższym czasie przestanie być wspierana.\n\nTo co, przesiadasz się, by wędrować z HarcApką dalej?',
    actionBuilder: (context) => [
      AlertDialogButton(text: 'Później', onTap: () => Navigator.pop(context)),
      AlertDialogButton(text: 'Biorę!', onTap: () => launchURL('https://play.google.com/store/apps/details?id=zhp.harc.app')),
    ]
);
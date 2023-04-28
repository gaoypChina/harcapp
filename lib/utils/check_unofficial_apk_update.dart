import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
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

  PackageInfo info = await PackageInfo.fromPlatform();

  bool updateAvailable = int.parse(info.buildNumber) != versionCode;

  if(updateAvailable)
    await showUpdateDialog(
      context: context,
      versionName: versionName,
      apkSource: apkSource
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
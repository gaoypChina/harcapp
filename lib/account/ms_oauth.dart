import 'package:flutter/material.dart';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:harcapp/utils/keys.dart';

class ZhpAccAuth{

  static late AadOAuth msOauth;

  static init(GlobalKey<NavigatorState> navigatorKey){
    msOauth = AadOAuth(Config(
      tenant: MS_ZHP_TENANT, //'ZHP tenant, not mine',
      clientId: MS_AZURE_HARCAPP_CLIENT_ID,
      scope: 'openid email profile',
      redirectUri: 'https://login.live.com/oauth20_desktop.srf',
      navigatorKey: navigatorKey,
    ));
  }

  static Future<void> login() => msOauth.login();

  static Future<void> logout() => msOauth.logout();

  static Future<String?> get azureToken => msOauth.getIdToken();

}

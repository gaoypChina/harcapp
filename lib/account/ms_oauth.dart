import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:harcapp/utils/keys.dart';



class ZhpAccAuth{

  static final Config _config = Config(
    tenant: MS_ZHP_TENANT, //'ZHP tenant, not mine',
    clientId: MS_AZURE_HARCAPP_CLIENT_ID,
    scope: 'openid email profile',
    redirectUri: 'https://login.live.com/oauth20_desktop.srf',
  );
  static final AadOAuth msOauth = AadOAuth(_config);

  static Future<void> login(BuildContext context){
    msOauth.setWebViewScreenSizeFromMedia(MediaQuery.of(context));
    return msOauth.login();
  }

  static Future<void> logout() => msOauth.logout();

  static Future<String?> get azureToken => msOauth.getIdToken();

}

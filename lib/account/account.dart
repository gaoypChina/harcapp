import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';

import '../_app_common/accounts/user_data.dart';
import '../_new/cat_page_home/community/circle/model/announcement.dart';
import 'ms_oauth.dart';

//bool isLoggedIn = null; //true - logged in. false - not logged in. null - logging in;

class LoginListener{

  final void Function(bool)? onLogin;
  final void Function()? onRegistered;
  final void Function(bool)? onEmailConfirmChanged;
  final void Function(bool)? onLogout;

  const LoginListener({this.onLogin, this.onRegistered, this.onEmailConfirmChanged, this.onLogout});

}

class AccountData {

  static const int shadowUsersPageSize = 10;

  static final List<LoginListener> _listeners = [];

  static void addLoginListener(LoginListener listener) => _listeners.add(listener);
  static void removeLoginListener(LoginListener listener) => _listeners.remove(listener);

  static void callOnLogin(bool emailConfirmed){
    for(LoginListener? listener in _listeners)
      listener!.onLogin?.call(emailConfirmed);
  }

  static void callOnRegister(){
    for(LoginListener? listener in _listeners)
      listener!.onRegistered?.call();
  }

  static void callOnEmailConfirmChanged(bool emailConfirmed){
    for(LoginListener? listener in _listeners)
      listener!.onEmailConfirmChanged?.call(emailConfirmed);
  }

  static void callOnLogout(bool force){
    for(LoginListener? listener in _listeners)
      listener!.onLogout?.call(force);
  }

  static String? _lastConfLoginEmail;

  static DateTime? _lastServerTime;
  static String? _key;
  static String? _jwt;
  static String? _refreshToken;
  static String? _email;
  static String? _emailConf;
  static String? _name;
  static String? _verified;
  static String? _nick;
  static String? _nickSearchable;
  static Sex? _sex;
  static String? _nameEditable;
  static String? _nickEditable;
  static String? _microsoftAcc;
  static String? _regularAcc;
  static int? _shadowUserCount;
  static List<UserDataNick>? _loadedShadowUsers;
  static Map<String, UserDataNick>? _loadedShadowUserMap;


  static const String _keyLastConfLoginEmail = 'acc_last_conf_login_email';

  static const String _keyLastServerTime = 'acc_last_server_time';
  static const String _keyKey = 'acc_key';
  static const String _keyJwt = 'acc_jwt';
  static const String _keyRefreshToken = 'acc_refresh_token';
  static const String _keyEmail = 'acc_email';
  static const String _keyEmailConf = 'acc_email_conf';
  static const String _keyName = 'acc_name';
  static const String _keyVerified = 'acc_verified';
  static const String _keyNick = 'acc_nick';
  static const String _keyNickSearchable = 'acc_nick_searchable';
  static const String _keySex = 'acc_sex';
  static const String _keyNameEditable = 'acc_name_editable';
  static const String _keyNickEditable = 'acc_nick_editable';
  static const String _keyMicrosoftAcc = 'acc_microsoft_acc';
  static const String _keyRegularAcc = 'acc_regular_acc';
  static const String _keyShadowUserCount = 'acc_shadow_users_count';
  static const String _keyShadowUsers = 'acc_shadow_users';

  static bool get loggedIn => jwt != null;

  static Future<void> init() async {

    FlutterSecureStorage storage = const FlutterSecureStorage();
    _lastServerTime = DateTime.tryParse(await storage.read(key: _keyLastServerTime)??'')??DateTime.now();
    _key = await storage.read(key: _keyKey);
    _jwt = await storage.read(key: _keyJwt);
    _refreshToken = await storage.read(key: _keyRefreshToken);
    _email = await storage.read(key: _keyEmail);
    _emailConf = await storage.read(key: _keyEmailConf);
    _name = await storage.read(key: _keyName);
    _verified = await storage.read(key: _keyVerified);
    _nick = await storage.read(key: _keyNick);
    _nickSearchable = await storage.read(key: _keyNickSearchable);
    _sex = strToSex[await (storage.read(key: _keySex))];
    _nameEditable = await storage.read(key: _keyNameEditable);
    _nickEditable = await storage.read(key: _keyNickEditable);
    _microsoftAcc = await storage.read(key: _keyMicrosoftAcc);
    _regularAcc = await storage.read(key: _keyRegularAcc);

    String? shadowUserData = await storage.read(key: _keyShadowUsers);
    initShadowUsers(
        (jsonDecode(shadowUserData??'[]') as List).cast<Map<String, dynamic>>()
    );
    _shadowUserCount = int.tryParse(await storage.read(key: _keyShadowUserCount)??'0');
  }

  static Future<void> saveLoginData(String? email, Response response) async {
    await AccountData.writeKey(response.data['key']??(throw InvalidResponseError('key')));
    await AccountData.writeJwt(response.data['jwt']??(throw InvalidResponseError('jwt')));
    await AccountData.writeRefreshToken(response.data['refreshToken']??(throw InvalidResponseError('refreshToken')));
    await AccountData.writeEmail(email);
    await AccountData.writeLastConfLoginEmail(email);
    await AccountData.writeEmailConf(response.data['emailConfirmed']??(throw InvalidResponseError('emailConfirmed')));
    await AccountData.writeName(response.data['name']??(throw InvalidResponseError('name')));
    await AccountData.writeVerified(response.data['verified']??(throw InvalidResponseError('verified')));
    await AccountData.writeNick(response.data['nick']??(throw InvalidResponseError('nick')));
    await AccountData.writeNickSearchable(response.data['nickSearchable']??(throw InvalidResponseError('nickSearchable')));
    await AccountData.writeSex(boolToSex[response.data['sex']??(throw InvalidResponseError('sex'))]);

    await AccountData.writeNameEditable(response.data['nameEditable']??(throw InvalidResponseError('nameEditable')));
    await AccountData.writeNickEditable(response.data['nickEditable']??(throw InvalidResponseError('nickEditable')));
    await AccountData.writeMicrosoftAcc(response.data['microsoftLogin']??(throw InvalidResponseError('microsoftLogin')));
    await AccountData.writeRegularAcc(response.data['regularLogin']??(throw InvalidResponseError('regularLogin')));

    initShadowUsers(
        ((response.data['shadowUsers']??(throw InvalidResponseError('shadowUsers'))) as List).cast<Map<String, dynamic>>()
    );
    await AccountData.writeShadowUserCount(response.data['shadowUserCount']??(throw InvalidResponseError('shadowUserCount')));

  }

  static bool get convertableToMicrosoft => !microsoftAcc && (email != null && (email!.split('@')[1] == 'zhp.net.pl' || email!.split('@')[1] == 'zhp.pl'));


  static DateTime? get lastServerTime => _lastServerTime;

  static Future<void> removeLastServerTime() async {
    _lastServerTime = null;
    await const FlutterSecureStorage().delete(key: _keyLastServerTime);
  }

  static Future<void> writeLastServerTime(DateTime? value) async {
    _lastServerTime = value;
    if (value == null)
      return await removeLastServerTime();
    else
      return await const FlutterSecureStorage().write(key: _keyLastServerTime, value: value.toIso8601String());
  }


  static String? get key => _key;

  static Future<void> removeKey() async {
    _key = null;
    await const FlutterSecureStorage().delete(key: _keyKey);
  }

  static Future<void> writeKey(String? value) async {
    _key = value;
    if (value == null)
      return await removeKey();
    else
      return await const FlutterSecureStorage().write(key: _keyKey, value: value);
  }


  static String? get jwt => _jwt;

  static Future<void> removeJwt() async {
    _jwt = null;
    await const FlutterSecureStorage().delete(key: _keyJwt);
  }

  static Future<void> writeJwt(String? value) async {
    _jwt = value;
    if (value == null)
      return await removeJwt();
    else
      return await const FlutterSecureStorage().write(key: _keyJwt, value: value);
  }


  static String? get refreshToken => _refreshToken;

  static Future<void> removeRefreshToken() async {
    _refreshToken = null;
    await const FlutterSecureStorage().delete(key: _keyRefreshToken);
  }

  static Future<void> writeRefreshToken(String? value) async {
    _refreshToken = value;
    if (value == null)
      return await removeRefreshToken();
    else
      return await const FlutterSecureStorage().write(key: _keyRefreshToken, value: value);
  }


  static String? get lastConfLoginEmail => _lastConfLoginEmail;

  static Future<void> removeLastConfLoginEmail() async {
    _lastConfLoginEmail = null;
    await const FlutterSecureStorage().delete(key: _keyLastConfLoginEmail);
  }

  static Future<void> writeLastConfLoginEmail(String? value) async {
    _lastConfLoginEmail = value;
    if (value == null)
      return await removeLastConfLoginEmail();
    else
      return await const FlutterSecureStorage().write(
          key: _keyLastConfLoginEmail, value: value);
  }


  static String? get email => _email;

  static Future<void> removeEmail() async {
    _email = null;
    await const FlutterSecureStorage().delete(key: _keyEmail);
  }

  static Future<void> writeEmail(String? value) async {
    _email = value;
    if (value == null)
      return await removeEmail();
    else
      return await const FlutterSecureStorage().write(key: _keyEmail, value: value);
  }


  static bool get emailConf => _emailConf == 'true';

  static Future<void> removeEmailConf() async {
    _emailConf = null;
    await const FlutterSecureStorage().delete(key: _keyEmailConf);
  }

  static Future<void> writeEmailConf(bool value) async {
    _emailConf = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyEmailConf, value: value?'true':'false');
  }


  static String? get name => _name;

  static Future<void> removeName() async {
    _name = null;
    await const FlutterSecureStorage().delete(key: _keyName);
  }

  static Future<void> writeName(String? value) async {
    _name = value;
    if (value == null)
      return await removeName();
    else
      return await const FlutterSecureStorage().write(key: _keyName, value: value);
  }


  static bool get verified => _verified == 'true';

  static Future<void> removeVerified() async {
    _verified = null;
    await const FlutterSecureStorage().delete(key: _keyVerified);
  }

  static Future<void> writeVerified(String? value) async {
    _verified = value;
    if (value == null)
      return await removeVerified();
    else
      return await const FlutterSecureStorage().write(key: _keyVerified, value: value);
  }


  static String? get nick => _nick;

  static Future<void> removeNick() async {
    _nick = null;
    await const FlutterSecureStorage().delete(key: _keyNick);
  }

  static Future<void> writeNick(String? value) async {
    _nick = value;
    if (value == null)
      return await removeNick();
    else
      return await const FlutterSecureStorage().write(key: _keyNick, value: value);
  }


  static bool get nickSearchable => _nickSearchable == 'true';

  static Future<void> removeNickSearchable() async {
    _nickSearchable = null;
    await const FlutterSecureStorage().delete(key: _keyNickSearchable);
  }

  static Future<void> writeNickSearchable(bool value) async {
    _nickSearchable = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyNickSearchable, value: value?'true':'false');
  }


  static Sex? get sex => _sex;

  static Future<void> removeSex() async {
    _sex = null;
    await const FlutterSecureStorage().delete(key: _keySex);
  }

  static Future<void> writeSex(Sex? value) async {
    _sex = value;
    if (value == null)
      return await removeSex();
    else
      return await const FlutterSecureStorage().write(key: _keySex, value: sexToString[value]);
  }


  static bool get nameEditable => _nameEditable == 'true';

  static Future<void> removeNameEditable() async {
    _nameEditable = null;
    await const FlutterSecureStorage().delete(key: _keyNameEditable);
  }

  static Future<void> writeNameEditable(bool value) async {
    _nameEditable = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyNameEditable, value: value?'true':'false');
  }


  static bool get nickEditable => _nickEditable == 'true';

  static Future<void> removeNickEditable() async {
    _nickEditable = null;
    await const FlutterSecureStorage().delete(key: _keyNickEditable);
  }

  static Future<void> writeNickEditable(bool value) async {
    _nickEditable = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyNickEditable, value: value?'true':'false');
  }


  static bool get microsoftAcc => _microsoftAcc == 'true';

  static Future<void> removeMicrosoftAcc() async {
    _microsoftAcc = null;
    await const FlutterSecureStorage().delete(key: _keyMicrosoftAcc);
  }

  static Future<void> writeMicrosoftAcc(bool value) async {
    _microsoftAcc = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyMicrosoftAcc, value: value?'true':'false');
  }


  static bool get regularAcc => _regularAcc == 'true';

  static Future<void> removeRegularAcc() async {
    _regularAcc = null;
    await const FlutterSecureStorage().delete(key: _keyMicrosoftAcc);
  }

  static Future<void> writeRegularAcc(bool value) async {
    _regularAcc = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyRegularAcc, value: value?'true':'false');
  }


  static List<UserDataNick> get loadedShadowUsers => _loadedShadowUsers!;
  static set loadedShadowUsers(List<UserDataNick> value){
    value.sort((user1, user2) => user1.name.toLowerCase().compareTo(user2.name.toLowerCase()));
    _loadedShadowUsers = value;
    _loadedShadowUserMap = {for(UserDataNick user in value) user.key: user};
    writeShadowUsers(value);
  }

  static Map<String, UserDataNick>? get loadedShadowUserMap => _loadedShadowUserMap;

  static Future<void> removeShadowUsers() async {
    _loadedShadowUsers = null;
    _loadedShadowUserMap = null;
    await const FlutterSecureStorage().delete(key: _keyShadowUsers);
  }

  static Future<void> writeShadowUsers(List<UserDataNick> value) async {

    List<Map<String, dynamic>> shadowUser = [];
    for(UserDataNick user in value)
      shadowUser.add(user.toJsonMap());

    return await const FlutterSecureStorage().write(key: _keyShadowUsers, value: jsonEncode(shadowUser));
  }

  static Future<void> addLoadedShadowUser(UserDataNick value) async {
    List<UserDataNick> shadowUsers = _loadedShadowUsers??[];
    shadowUsers.add(value);
    _loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(UserDataNick user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> addLoadedShadowUsers(List<UserDataNick> value) async {
    List<UserDataNick> shadowUsers = _loadedShadowUsers??[];
    shadowUsers.addAll(value);
    _loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(UserDataNick user in value) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> setLoadedShadowUsers(List<UserDataNick> value) async {
    _loadedShadowUsers = value;
    _loadedShadowUserMap = {for(UserDataNick user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> updateShadowUser(UserDataNick value) async {
    List<UserDataNick> shadowUsers = _loadedShadowUsers!;
    UserDataNick? oldUser = _loadedShadowUserMap![value.key];
    shadowUsers.remove(oldUser);
    shadowUsers.add(value);
    AccountData.loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(UserDataNick user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> removeShadowUser(UserDataNick value) async {
    List<UserDataNick> shadowUsers = _loadedShadowUsers!;
    shadowUsers.remove(value);
    _loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(UserDataNick user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static void initShadowUsers(List<Map<String, dynamic>> shadowUserData){
    _loadedShadowUsers = [];
    _loadedShadowUserMap = {};
    addLoadedShadowUsers([for(Map map in shadowUserData) UserDataNick.fromRespMap(map, map['nick']) ]);
  }


  static int get shadowUserCount => _shadowUserCount!;

  static Future<void> removeShadowUserCount() async {
    _shadowUserCount = null;
    await const FlutterSecureStorage().delete(key: _keyShadowUserCount);
  }

  static Future<void> writeShadowUserCount(int value) async {
    _shadowUserCount = value;
    return await const FlutterSecureStorage().write(
        key: _keyShadowUserCount,
        value: value.toString()
    );
  }


  static Future<void> forgetAccount({bool forgetLastServerTime = false}) async {
    if(forgetLastServerTime) await AccountData.removeLastServerTime();

    await ZhpAccAuth.logout();

    await AccountData.removeKey();
    await AccountData.removeEmail();
    await AccountData.removeName();
    await AccountData.removeVerified();
    await AccountData.removeNick();
    await AccountData.removeJwt();
    await AccountData.removeSex();
    await AccountData.removeNameEditable();
    await AccountData.removeNickEditable();
    await AccountData.removeMicrosoftAcc();
    await AccountData.removeRegularAcc();
    await AccountData.removeShadowUsers();
    await AccountData.removeShadowUserCount();

    Community.forget();
    CommunityPublishable.forget();
    Announcement.forget();
    IndivComp.forget();
    TropSharedPreviewData.forget();
  }
}


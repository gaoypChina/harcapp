import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';

import '../_app_common/accounts/user_data.dart';
import '../_new/cat_page_home/community/circle/model/announcement.dart';

//bool isLoggedIn = null; //true - logged in. false - not logged in. null - logging in;

class LoginListener{

  final void Function(bool)? onLogin;
  final void Function()? onRegistered;
  final void Function(bool)? onEmailConfirmChanged;
  final void Function()? onForceLogout;

  const LoginListener({this.onLogin, this.onRegistered, this.onEmailConfirmChanged, this.onForceLogout});

}

class AccountData {

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

  static void callOnForceLogout(){
    for(LoginListener? listener in _listeners)
      listener!.onForceLogout?.call();
  }

  static String? _lastConfLoginEmail;

  static DateTime? _lastServerTime;
  static String? _key;
  static String? _jwt;
  static String? _email;
  static String? _emailConf;
  static String? _name;
  static String? _nick;
  static String? _nickSearchable;
  static Sex? _sex;
  static String? _nameEditable;
  static String? _nickEditable;
  static String? _microsoftAcc;
  static String? _regularAcc;
  static List<UserDataNick>? _shadowUsers;
  static Map<String, UserDataNick>? _shadowUserMap;


  static const String _keyLastConfLoginEmail = 'acc_last_conf_login_email';

  static const String _keyLastServerTime = 'acc_last_server_time';
  static const String _keyKey = 'acc_key';
  static const String _keyJwt = 'acc_jwt';
  static const String _keyEmail = 'acc_email';
  static const String _keyEmailConf = 'acc_email_conf';
  static const String _keyName = 'acc_name';
  static const String _keyNick = 'acc_nick';
  static const String _keyNickSearchable = 'acc_nick_searchable';
  static const String _keySex = 'acc_sex';
  static const String _keyNameEditable = 'acc_name_editable';
  static const String _keyNickEditable = 'acc_nick_editable';
  static const String _keyMicrosoftAcc = 'acc_microsoft_acc';
  static const String _keyRegularAcc = 'acc_regular_acc';
  static const String _keyShadowUsers = 'acc_shadow_users';

  static bool get loggedIn => jwt != null;

  static Future<void> init() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    _lastServerTime = DateTime.tryParse(await storage.read(key: _keyLastServerTime)??'')??DateTime.now();
    _key = await storage.read(key: _keyKey);
    _jwt = await storage.read(key: _keyJwt);
    _email = await storage.read(key: _keyEmail);
    _emailConf = await storage.read(key: _keyEmailConf);
    _name = await storage.read(key: _keyName);
    _nick = await storage.read(key: _keyNick);
    _nickSearchable = await storage.read(key: _keyNickSearchable);
    _sex = strToSex[await (storage.read(key: _keySex))];
    _nameEditable = await storage.read(key: _keyNameEditable);
    _nickEditable = await storage.read(key: _keyNickEditable);
    _microsoftAcc = await storage.read(key: _keyMicrosoftAcc);
    _regularAcc = await storage.read(key: _keyRegularAcc);


    String? shadowUserData = await storage.read(key: _keyShadowUsers);
    if(shadowUserData != null)
      initShadowUsers(
          (jsonDecode(shadowUserData) as List).cast<Map<String, dynamic>>()
      );
  }

  static Future<void> saveLoginData(String? email, Response response) async {
    await AccountData.writeKey(response.data['key']);
    await AccountData.writeJwt(response.data['jwt']);
    await AccountData.writeEmail(email);
    await AccountData.writeLastConfLoginEmail(email);
    await AccountData.writeEmailConf(response.data['email_confirmed']);
    await AccountData.writeName(response.data['name']);
    await AccountData.writeNick(response.data['nick']);
    await AccountData.writeNickSearchable(response.data['nick_searchable']);
    await AccountData.writeSex(boolToSex[response.data['sex']]);

    await AccountData.writeNameEditable(response.data['name_editable']);
    await AccountData.writeNickEditable(response.data['nick_editable']);
    await AccountData.writeMicrosoftAcc(response.data['microsoft_login']);
    await AccountData.writeRegularAcc(response.data['regular_login']);

    initShadowUsers(
        (response.data['shadow_users'] as List).cast<Map<String, dynamic>>()
    );

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
    if (value == null)
      return await removeEmailConf();
    else
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
    if (value == null)
      return await removeNickSearchable();
    else
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
    if (value == null)
      return await removeNameEditable();
    else
      return await const FlutterSecureStorage().write(key: _keyNameEditable, value: value?'true':'false');
  }


  static bool get nickEditable => _nickEditable == 'true';

  static Future<void> removeNickEditable() async {
    _nickEditable = null;
    await const FlutterSecureStorage().delete(key: _keyNickEditable);
  }

  static Future<void> writeNickEditable(bool value) async {
    _nickEditable = value?'true':'false';
    if (value == null)
      return await removeNickEditable();
    else
      return await const FlutterSecureStorage().write(key: _keyNickEditable, value: value?'true':'false');
  }


  static bool get microsoftAcc => _microsoftAcc == 'true';

  static Future<void> removeMicrosoftAcc() async {
    _microsoftAcc = null;
    await const FlutterSecureStorage().delete(key: _keyMicrosoftAcc);
  }

  static Future<void> writeMicrosoftAcc(bool value) async {
    _microsoftAcc = value?'true':'false';
    if (value == null)
      return await removeMicrosoftAcc();
    else
      return await const FlutterSecureStorage().write(key: _keyMicrosoftAcc, value: value?'true':'false');
  }


  static bool get regularAcc => _regularAcc == 'true';

  static Future<void> removeRegularAcc() async {
    _regularAcc = null;
    await const FlutterSecureStorage().delete(key: _keyMicrosoftAcc);
  }

  static Future<void> writeRegularAcc(bool value) async {
    _regularAcc = value?'true':'false';
    if (value == null)
      return await removeRegularAcc();
    else
      return await const FlutterSecureStorage().write(key: _keyRegularAcc, value: value?'true':'false');
  }


  static List<UserDataNick> get shadowUsers => _shadowUsers!;
  static set shadowUsers(List<UserDataNick> value){
    value.sort((user1, user2) => user1.name.toLowerCase().compareTo(user2.name.toLowerCase()));
    _shadowUsers = value;
    _shadowUserMap = {for(UserDataNick user in value) user.key: user};
    writeShadowUsers(value);
  }

  static Map<String, UserDataNick>? get shadowUserMap => _shadowUserMap;

  static Future<void> removeShadowUsers() async {
    _shadowUsers = null;
    _shadowUserMap = null;
    await const FlutterSecureStorage().delete(key: _keyShadowUsers);
  }

  static Future<void> writeShadowUsers(List<UserDataNick> value) async {

    List<Map<String, dynamic>> shadowUser = [];
    for(UserDataNick user in value)
      shadowUser.add(user.toJsonMap());

    if (value == null)
      return await removeRegularAcc();
    else
      return await const FlutterSecureStorage().write(key: _keyShadowUsers, value: jsonEncode(shadowUser));
  }

  static Future<void> addShadowUser(UserDataNick value) async {
    List<UserDataNick> shadowUsers = _shadowUsers!;
    shadowUsers.add(value);
    _shadowUsers = shadowUsers;
  }

  static Future<void> updateShadowUser(UserDataNick value) async {
    List<UserDataNick> shadowUsers = _shadowUsers!;
    UserDataNick? oldUser = _shadowUserMap![value.key];
    shadowUsers.remove(oldUser);
    shadowUsers.add(value);
    AccountData.shadowUsers = shadowUsers;
  }

  static Future<void> removeShadowUser(UserDataNick value) async {
    List<UserDataNick> shadowUsers = _shadowUsers!;
    shadowUsers.remove(value);
    _shadowUsers = shadowUsers;
  }

  static void initShadowUsers(List<Map<String, dynamic>> shadowUserData){

    List<UserDataNick> shadowUsers = [];

    for(Map map in shadowUserData)
      shadowUsers.add(UserDataNick.fromMap(map, map['nick']));

    AccountData.shadowUsers = shadowUsers;
    
  }
  
  static Future<void> forgetAccount({bool forgetLastServerTime = false}) async {
    if(forgetLastServerTime) await AccountData.removeLastServerTime();

    await AccountData.removeKey();
    await AccountData.removeEmail();
    await AccountData.removeName();
    await AccountData.removeNick();
    await AccountData.removeJwt();
    await AccountData.removeSex();
    await AccountData.removeNameEditable();
    await AccountData.removeNickEditable();
    await AccountData.removeMicrosoftAcc();
    await AccountData.removeRegularAcc();
    await AccountData.removeShadowUsers();

    Community.forget();
    CommunityPublishable.forget();
    Announcement.forget();
    IndivComp.forget();
  }
}


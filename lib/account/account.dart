import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_classes/sorted_list.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/rank_instr.dart';
import 'package:harcapp_core/comm_classes/common.dart';

import '../_app_common/accounts/user_data.dart';
import '../_new/cat_page_home/community/circle/model/announcement.dart';
import '../values/rank_harc.dart';
import 'login_provider.dart';
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

  static UserDataNick toUserData() => UserDataNick(
    key: _key!,
    name: _name!,
    verified: verified,
    shadow: false,
    sex: _sex!,
    org: _org,
    hufiec: _hufiec,
    druzyna: _druzyna,
    rankHarc: _rankHarc,
    rankInstr: _rankInstr,
    nick: _nick!,
  );

  static const int shadowUsersPageSize = 10;

  static final List<LoginListener> _listeners = [];

  static void addLoginListener(LoginListener listener) => _listeners.add(listener);
  static void removeLoginListener(LoginListener listener) => _listeners.remove(listener);

  static void callOnLogin(bool emailConfirmed, {required LoginProvider loginProv}){
    for(LoginListener listener in _listeners)
      listener.onLogin?.call(emailConfirmed);
    loginProv.notify();
  }

  static void callOnRegister({required LoginProvider loginProv}){
    for(LoginListener listener in _listeners)
      listener.onRegistered?.call();
    loginProv.notify();
  }

  static void callOnEmailConfirmChanged(bool emailConfirmed, {required LoginProvider loginProv}){
    for(LoginListener listener in _listeners)
      listener.onEmailConfirmChanged?.call(emailConfirmed);
    loginProv.notify();
  }

  static void callOnLogout_(bool force){
    for(LoginListener listener in _listeners)
      listener.onLogout?.call(force);
  }

  static void callOnLogout(bool force, {required LoginProvider loginProv}){
    callOnLogout_(force);
    loginProv.notify();
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

  static Org? _org;
  static String? _hufiec;
  static String? _druzyna;
  static RankHarc? _rankHarc;
  static RankInstr? _rankInstr;

  static String? _nameEditable;
  static String? _nickEditable;
  static String? _microsoftAcc;
  static String? _regularAcc;
  static int? _shadowUserCount;
  static SortedList<ShadowUserData>? _loadedShadowUsers;
  static Map<String, ShadowUserData>? _loadedShadowUserMap;
  static int? _allSharedTropCount;

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

  static const String _keyOrg = 'acc_org';
  static const String _keyHufiec = 'acc_hufiec';
  static const String _keyDruzyna = 'acc_druzyna';
  static const String _keyRankHarc = 'acc_rank_harc';
  static const String _keyRankInstr = 'acc_rank_instr';
  
  static const String _keyNameEditable = 'acc_name_editable';
  static const String _keyNickEditable = 'acc_nick_editable';
  static const String _keyMicrosoftAcc = 'acc_microsoft_acc';
  static const String _keyRegularAcc = 'acc_regular_acc';
  static const String _keyShadowUserCount = 'acc_shadow_users_count';
  static const String _keyShadowUsers = 'acc_shadow_users';
  static const String _keyAllSharedTropCount = 'acc_all_shared_trop_count';

  static bool get loggedIn => jwt != null;

  static Future<String?> read({required String key}) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    try {
      return await storage.read(key: key);
    } on PlatformException {
      // This is a bug. On some devices if the key does not exist, read throws a PlatformException
      return null;
    }
  }

  static Future<void> init() async {

    _lastServerTime = DateTime.tryParse(await read(key: _keyLastServerTime)??'')??DateTime.now();
    _key = await read(key: _keyKey);
    _jwt = await read(key: _keyJwt);
    _refreshToken = await read(key: _keyRefreshToken);
    _email = await read(key: _keyEmail);
    _emailConf = await read(key: _keyEmailConf);
    _name = await read(key: _keyName);
    _verified = await read(key: _keyVerified);
    _nick = await read(key: _keyNick);
    _nickSearchable = await read(key: _keyNickSearchable);
    _sex = strToSex[await (read(key: _keySex))];
    
    _org = orgFromInt[int.tryParse(await read(key: _keyOrg)??'')??-1];
    _hufiec = await read(key: _keyHufiec);
    _druzyna = await read(key: _keyDruzyna);
    _rankHarc = paramToRankHarc[await read(key: _keyRankHarc)];
    _rankInstr = strToRankInstr[await read(key: _keyRankInstr)];
    
    _nameEditable = await read(key: _keyNameEditable);
    _nickEditable = await read(key: _keyNickEditable);
    _microsoftAcc = await read(key: _keyMicrosoftAcc);
    _regularAcc = await read(key: _keyRegularAcc);

    String? shadowUserData = await read(key: _keyShadowUsers);
    try {
      initShadowUsers((jsonDecode(shadowUserData ?? '[]') as List).cast<Map<String, dynamic>>());
    } catch (e){
      logger.e("A problem occured when trying to init shadow users!\n${e.toString()}");
    }
    _shadowUserCount = int.tryParse(await read(key: _keyShadowUserCount)??'0');
    _allSharedTropCount = int.tryParse(await read(key: _keyAllSharedTropCount)??'0');
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

    await AccountData.writeOrg(paramToOrg[response.data['harcOrg']]);
    await AccountData.writeHufiec(response.data['hufiec']);
    await AccountData.writeDruzyna(response.data['druzyna']);
    await AccountData.writeRankHarc(paramToRankHarc[response.data['rankHarc']]);
    await AccountData.writeRankInstr(paramToRankInstr[response.data['rankInstr']]);
    
    await AccountData.writeNameEditable(response.data['nameEditable']??(throw InvalidResponseError('nameEditable')));
    await AccountData.writeNickEditable(response.data['nickEditable']??(throw InvalidResponseError('nickEditable')));
    await AccountData.writeMicrosoftAcc(response.data['microsoftLogin']??(throw InvalidResponseError('microsoftLogin')));
    await AccountData.writeRegularAcc(response.data['regularLogin']??(throw InvalidResponseError('regularLogin')));

    try {
      initShadowUsers(
          ((response.data['shadowUsers']??(throw InvalidResponseError('shadowUsers'))) as List).cast<Map<String, dynamic>>()
      );
    } catch (e){
      logger.e("A problem occured when trying to init shadow users!\n${e.toString()}");
    }

    await AccountData.writeAllSharedTropCount(response.data['allSharedTropCount']??(throw InvalidResponseError('allSharedTropCount')));
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

  static Future<void> writeVerified(bool value) async {
    _verified = value?'true':'false';
    return await const FlutterSecureStorage().write(key: _keyVerified, value: value?'true':'false');
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


  static Org? get org => _org;

  static Future<void> removeOrg() async {
    _org = null;
    await const FlutterSecureStorage().delete(key: _keyOrg);
  }

  static Future<void> writeOrg(Org? value) async {
    _org = value;
    if (value == null)
      return await removeOrg();
    else
      return await const FlutterSecureStorage().write(key: _keyOrg, value: orgToInt[value].toString());
  }


  static String? get hufiec => _hufiec;

  static Future<void> removeHufiec() async {
    _hufiec = null;
    await const FlutterSecureStorage().delete(key: _keyHufiec);
  }

  static Future<void> writeHufiec(String? value) async {
    _hufiec = value;
    if (value == null)
      return await removeHufiec();
    else
      return await const FlutterSecureStorage().write(key: _keyHufiec, value: value);
  }


  static String? get druzyna => _druzyna;

  static Future<void> removeDruzyna() async {
    _druzyna = null;
    await const FlutterSecureStorage().delete(key: _keyDruzyna);
  }

  static Future<void> writeDruzyna(String? value) async {
    _druzyna = value;
    if (value == null)
      return await removeDruzyna();
    else
      return await const FlutterSecureStorage().write(key: _keyDruzyna, value: value);
  }


  static RankHarc? get rankHarc => _rankHarc;

  static Future<void> removeRankHarc() async {
    _rankHarc = null;
    await const FlutterSecureStorage().delete(key: _keyRankHarc);
  }

  static Future<void> writeRankHarc(RankHarc? value) async {
    _rankHarc = value;
    if (value == null)
      return await removeRankHarc();
    else
      return await const FlutterSecureStorage().write(key: _keyRankHarc, value: rankHarcToStr(value));
  }


  static RankInstr? get rankInstr => _rankInstr;

  static Future<void> removeRankInstr() async {
    _rankInstr = null;
    await const FlutterSecureStorage().delete(key: _keyRankInstr);
  }

  static Future<void> writeRankInstr(RankInstr? value) async {
    _rankInstr = value;
    if (value == null)
      return await removeRankInstr();
    else
      return await const FlutterSecureStorage().write(key: _keyRankInstr, value: rankInstrToStr(value));
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


  static SortedList<ShadowUserData> get loadedShadowUsers => _loadedShadowUsers!;
  static set loadedShadowUsers(SortedList<ShadowUserData> value){
    _loadedShadowUsers = value;
    _loadedShadowUserMap = {for(ShadowUserData user in value) user.key: user};
    writeShadowUsers(value);
  }

  static Map<String, ShadowUserData>? get loadedShadowUserMap => _loadedShadowUserMap;

  static int shadowUserComparator(ShadowUserData u1, ShadowUserData u2){
    int nameResult = compareText(u1.name, u2.name);
    if(nameResult != 0) return nameResult;
    int keyResult = compareText(u1.key, u2.key);
    return keyResult;
  }

  static bool isShadowUserWithinLoaded(ShadowUserData user){
    if(loadedShadowUsers.length == shadowUserCount) return true;
    if(loadedShadowUsers.isEmpty) return false;
    ShadowUserData lastLoaded = loadedShadowUsers.last;

    int result = shadowUserComparator(user, lastLoaded);

    return result < 0;
  }

  static Future<void> removeShadowUsers() async {
    _loadedShadowUsers = null;
    _loadedShadowUserMap = null;
    await const FlutterSecureStorage().delete(key: _keyShadowUsers);
  }

  static Future<void> writeShadowUsers(List<UserDataNick> value) async {

    List<Map<String, dynamic>> shadowUsers = [];
    for(UserDataNick user in value)
      shadowUsers.add(user.toJsonMap());

    return await const FlutterSecureStorage().write(key: _keyShadowUsers, value: jsonEncode(shadowUsers));
  }

  static Future<void> addLoadedShadowUser(ShadowUserData value) async {
    SortedList<ShadowUserData> shadowUsers = _loadedShadowUsers??SortedList(shadowUserComparator);
    shadowUsers.add(value);
    _loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(ShadowUserData user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> addLoadedShadowUsers(List<ShadowUserData> value) async {
    SortedList<ShadowUserData> shadowUsers = _loadedShadowUsers??SortedList(shadowUserComparator);
    shadowUsers.addAll(value);
    _loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(ShadowUserData user in value) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> setLoadedShadowUsers(List<ShadowUserData> value) async {
    _loadedShadowUsers = SortedList.from(elements: value, compare: shadowUserComparator);
    _loadedShadowUserMap = {for(ShadowUserData user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> updateShadowUser(ShadowUserData value) async {
    SortedList<ShadowUserData> shadowUsers = _loadedShadowUsers!;
    ShadowUserData? oldUser = _loadedShadowUserMap![value.key];
    shadowUsers.remove(oldUser);
    shadowUsers.add(value);
    AccountData.loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(ShadowUserData user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static Future<void> removeShadowUser(ShadowUserData value) async {
    SortedList<ShadowUserData> shadowUsers = _loadedShadowUsers!;
    shadowUsers.remove(value);
    _loadedShadowUsers = shadowUsers;
    _loadedShadowUserMap = {for(ShadowUserData user in _loadedShadowUsers!) user.key: user};
    await writeShadowUsers(_loadedShadowUsers!);
  }

  static void initShadowUsers(List<Map<String, dynamic>> shadowUserData){
    _loadedShadowUsers = SortedList(shadowUserComparator);
    _loadedShadowUserMap = {};
    addLoadedShadowUsers([for(Map map in shadowUserData) ShadowUserData.fromRespMap(map)]);
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


  static int get allSharedTropCount => _allSharedTropCount??0;

  static Future<void> removeAllSharedTropCount() async {
    _allSharedTropCount = null;
    await const FlutterSecureStorage().delete(key: _keyAllSharedTropCount);
  }

  static Future<void> writeAllSharedTropCount(int value) async {
    _allSharedTropCount = value;
    return await const FlutterSecureStorage().write(
        key: _keyAllSharedTropCount,
        value: value.toString()
    );
  }

  static Future<void> forgetAccount_(bool force, {bool forgetLastServerTime = false}) async {
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
    await AccountData.removeAllSharedTropCount();

    Community.forget();
    CommunityPublishable.forget();
    Announcement.forget();
    IndivComp.forget();
    TropSharedPreviewData.forget();

  }

  static Future<void> forgetAccount(bool force, {bool forgetLastServerTime = false, required LoginProvider loginProv}) async {
    forgetAccount_(force, forgetLastServerTime: forgetLastServerTime);

    callOnLogout(force, loginProv: loginProv);
  }
}


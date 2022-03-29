import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';

//bool isLoggedIn = null; //true - logged in. false - not logged in. null - logging in;

class AccSecData {

  static String _key;
  static String _jwt;
  static String _email;
  static String _emailConf;
  static String _name;
  static String _nick;
  static String _nickSearchable;
  static Sex _sex;
  static String _nameEditable;
  static String _nickEditable;
  static String _microsoftAcc;
  static String _regularAcc;

  static String _lastConfLoginEmail;

  static String _KEY_LAST_CONF_LOGIN_EMAIL = 'acc_last_conf_login_email';

  static String _KEY_KEY = 'acc_key';
  static String _KEY_JWT = 'acc_jwt';
  static String _KEY_EMAIL = 'acc_email';
  static String _KEY_EMAIL_CONF = 'acc_email_conf';
  static String _KEY_NAME = 'acc_name';
  static String _KEY_NICK = 'acc_nick';
  static String _KEY_NICK_SEARCHABLE = 'acc_nick_searchable';
  static String _KEY_SEX = 'acc_sex';
  static String _KEY_NAME_EDITABLE = 'acc_name_editable';
  static String _KEY_NICK_EDITABLE = 'acc_nick_editable';
  static String _KEY_MICROSOFT_ACC = 'acc_microsoft_acc';
  static String _KEY_REGULAR_ACC = 'acc_regular_acc';

  static bool get loggedIn => jwt != null;

  static Future<void> init() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    _key = await storage.read(key: _KEY_KEY);
    _jwt = await storage.read(key: _KEY_JWT);
    _email = await storage.read(key: _KEY_EMAIL);
    _emailConf = await storage.read(key: _KEY_EMAIL_CONF);
    _name = await storage.read(key: _KEY_NAME);
    _nick = await storage.read(key: _KEY_NICK);
    _nickSearchable = await storage.read(key: _KEY_NICK_SEARCHABLE);
    _sex = strToSex[await storage.read(key: _KEY_SEX)];
    _nameEditable = await storage.read(key: _KEY_NAME_EDITABLE);
    _nickEditable = await storage.read(key: _KEY_NICK_EDITABLE);
    _microsoftAcc = await storage.read(key: _KEY_MICROSOFT_ACC);
    _regularAcc = await storage.read(key: _KEY_REGULAR_ACC);
  }

  static Future<void> saveLoginData(String email, Response response) async {
    await AccSecData.writeKey(response.data['key']);
    await AccSecData.writeJwt(response.data['jwt']);
    await AccSecData.writeEmail(email);
    await AccSecData.writeLastConfLoginEmail(email);
    await AccSecData.writeEmailConf(response.data['email_confirmed']);
    await AccSecData.writeName(response.data['name']);
    await AccSecData.writeNick(response.data['nick']);
    await AccSecData.writeNickSearchable(response.data['nick_searchable']);
    await AccSecData.writeSex(boolToSex[response.data['sex']]);

    await AccSecData.writeNameEditable(response.data['name_editable']);
    await AccSecData.writeNickEditable(response.data['nick_editable']);
    await AccSecData.writeMicrosoftAcc(response.data['microsoft_login']);
    await AccSecData.writeRegularAcc(response.data['regular_login']);

  }

  static bool get convertableToMicrosoft => !microsoftAcc && (email != null && (email.split('@')[1] == 'zhp.net.pl' || email.split('@')[1] == 'zhp.pl'));

  static String get key => _key;

  static Future<void> removeKey() async {
    _key = null;
    await const FlutterSecureStorage().delete(key: _KEY_KEY);
  }

  static Future<void> writeKey(String value) async {
    _key = value;
    if (value == null)
      return await removeKey();
    else
      return await const FlutterSecureStorage().write(key: _KEY_KEY, value: value);
  }


  static String get jwt => _jwt;

  static Future<void> removeJwt() async {
    _jwt = null;
    await const FlutterSecureStorage().delete(key: _KEY_JWT);
  }

  static Future<void> writeJwt(String value) async {
    _jwt = value;
    if (value == null)
      return await removeJwt();
    else
      return await const FlutterSecureStorage().write(key: _KEY_JWT, value: value);
  }


  static String get lastConfLoginEmail => _lastConfLoginEmail;

  static Future<void> removeLastConfLoginEmail() async {
    _lastConfLoginEmail = null;
    await const FlutterSecureStorage().delete(key: _KEY_LAST_CONF_LOGIN_EMAIL);
  }

  static Future<void> writeLastConfLoginEmail(String value) async {
    _lastConfLoginEmail = value;
    if (value == null)
      return await removeLastConfLoginEmail();
    else
      return await const FlutterSecureStorage().write(
          key: _KEY_LAST_CONF_LOGIN_EMAIL, value: value);
  }


  static String get email => _email;

  static Future<void> removeEmail() async {
    _email = null;
    await const FlutterSecureStorage().delete(key: _KEY_EMAIL);
  }

  static Future<void> writeEmail(String value) async {
    _email = value;
    if (value == null)
      return await removeEmail();
    else
      return await const FlutterSecureStorage().write(key: _KEY_EMAIL, value: value);
  }


  static bool get emailConf => _emailConf == 'true';

  static Future<void> removeEmailConf() async {
    _emailConf = null;
    await const FlutterSecureStorage().delete(key: _KEY_EMAIL_CONF);
  }

  static Future<void> writeEmailConf(bool value) async {
    _emailConf = value?'true':'false';
    if (value == null)
      return await removeEmailConf();
    else
      return await const FlutterSecureStorage().write(key: _KEY_EMAIL_CONF, value: value?'true':'false');
  }


  static String get name => _name;

  static Future<void> removeName() async {
    _name = null;
    await const FlutterSecureStorage().delete(key: _KEY_NAME);
  }

  static Future<void> writeName(String value) async {
    _name = value;
    if (value == null)
      return await removeName();
    else
      return await const FlutterSecureStorage().write(key: _KEY_NAME, value: value);
  }


  static String get nick => _nick;

  static Future<void> removeNick() async {
    _nick = null;
    await const FlutterSecureStorage().delete(key: _KEY_NICK);
  }

  static Future<void> writeNick(String value) async {
    _nick = value;
    if (value == null)
      return await removeNick();
    else
      return await const FlutterSecureStorage().write(key: _KEY_NICK, value: value);
  }


  static bool get nickSearchable => _nickSearchable == 'true';

  static Future<void> removeNickSearchable() async {
    _nickSearchable = null;
    await const FlutterSecureStorage().delete(key: _KEY_NICK_SEARCHABLE);
  }

  static Future<void> writeNickSearchable(bool value) async {
    _nickSearchable = value?'true':'false';
    if (value == null)
      return await removeNickSearchable();
    else
      return await const FlutterSecureStorage().write(key: _KEY_NICK_SEARCHABLE, value: value?'true':'false');
  }


  static Sex get sex => _sex;

  static Future<void> removeSex() async {
    _sex = null;
    await const FlutterSecureStorage().delete(key: _KEY_SEX);
  }

  static Future<void> writeSex(Sex value) async {
    _sex = value;
    if (value == null)
      return await removeSex();
    else
      return await const FlutterSecureStorage().write(key: _KEY_SEX, value: sexToString[value]);
  }


  static bool get nameEditable => _nameEditable == 'true';

  static Future<void> removeNameEditable() async {
    _nameEditable = null;
    await const FlutterSecureStorage().delete(key: _KEY_NAME_EDITABLE);
  }

  static Future<void> writeNameEditable(bool value) async {
    _nameEditable = value?'true':'false';
    if (value == null)
      return await removeNameEditable();
    else
      return await const FlutterSecureStorage().write(key: _KEY_NAME_EDITABLE, value: value?'true':'false');
  }


  static bool get nickEditable => _nickEditable == 'true';

  static Future<void> removeNickEditable() async {
    _nickEditable = null;
    await const FlutterSecureStorage().delete(key: _KEY_NICK_EDITABLE);
  }

  static Future<void> writeNickEditable(bool value) async {
    _nickEditable = value?'true':'false';
    if (value == null)
      return await removeNickEditable();
    else
      return await const FlutterSecureStorage().write(key: _KEY_NICK_EDITABLE, value: value?'true':'false');
  }


  static bool get microsoftAcc => _microsoftAcc == 'true';

  static Future<void> removeMicrosoftAcc() async {
    _microsoftAcc = null;
    await const FlutterSecureStorage().delete(key: _KEY_MICROSOFT_ACC);
  }

  static Future<void> writeMicrosoftAcc(bool value) async {
    _microsoftAcc = value?'true':'false';
    if (value == null)
      return await removeMicrosoftAcc();
    else
      return await const FlutterSecureStorage().write(key: _KEY_MICROSOFT_ACC, value: value?'true':'false');
  }


  static bool get regularAcc => _regularAcc == 'true';

  static Future<void> removeRegularAcc() async {
    _regularAcc = null;
    await const FlutterSecureStorage().delete(key: _KEY_MICROSOFT_ACC);
  }

  static Future<void> writeRegularAcc(bool value) async {
    _regularAcc = value?'true':'false';
    if (value == null)
      return await removeRegularAcc();
    else
      return await const FlutterSecureStorage().write(key: _KEY_REGULAR_ACC, value: value?'true':'false');
  }


  static Future<void> forgetAccount() async {
    await AccSecData.removeKey();
    await AccSecData.removeEmail();
    await AccSecData.removeName();
    await AccSecData.removeNick();
    await AccSecData.removeJwt();
    await AccSecData.removeSex();
    await AccSecData.removeNameEditable();
    await AccSecData.removeNickEditable();
    await AccSecData.removeMicrosoftAcc();
    await AccSecData.removeRegularAcc();

  }
}


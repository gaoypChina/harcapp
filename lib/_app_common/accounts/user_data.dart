import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp/values/rank_instr.dart';

enum Sex{
  male, female,
}

Map<Sex, bool> sexToBool = {
  Sex.male: true,
  Sex.female: false,
};

Map<bool, Sex> boolToSex = {
  true: Sex.male,
  false: Sex.female,
};

Map<Sex, String> sexToString = {
  Sex.male: 'Male',
  Sex.female: 'Female',
};

Map<String, Sex> strToSex = {
  'Male': Sex.male,
  'Female': Sex.female,
};

class UserData{

  final String key;
  final String name;
  final bool verified;
  final bool shadow;
  final Sex sex;
  final Org? org;
  final String? hufiec;
  final String? druzyna;
  final RankHarc? rankHarc;
  final RankInstr? rankInstr;

  bool get isMale => sex == Sex.male;

  const UserData({
    required this.key,
    required this.name,
    required this.verified,
    required this.shadow,
    required this.sex,
    required this.org,
    required this.hufiec,
    required this.druzyna,
    required this.rankHarc,
    required this.rankInstr,
  });

  static UserData fromRespMap(Map respMap, {String? key}) => UserData(
    key: key??respMap['_key']??(throw InvalidResponseError('_key')),
    name: respMap['name']??(throw InvalidResponseError('name')),
    verified: respMap['verified']??false,
    shadow: respMap['shadow']??(throw InvalidResponseError('shadow')),
    sex: strToSex[respMap['sex']]??(throw InvalidResponseError('sex')),
    org: respMap['org']==null?null:paramToOrg[respMap['org']],
    hufiec: respMap['hufiec'],
    druzyna: respMap['druzyna'],
    rankHarc: respMap['rankHarc']==null?null:paramToRankHarc[respMap['rankHarc']],
    rankInstr: respMap['rankInstr']==null?null:paramToRankInstr[respMap['rankInstr']],
    //nick: nick,
  );

  Map toJsonMap() => {
    '_key': key,
    'name': name,
    'verified': verified,
    'shadow': shadow,
    'sex': sexToString[sex]
  };

}

class UserDataNick extends UserData{

  final String nick;

  const UserDataNick({
    required super.key,
    required super.name,
    required super.verified,
    required super.shadow,
    required super.sex,
    required super.org,
    required super.hufiec,
    required super.druzyna,
    required super.rankHarc,
    required super.rankInstr,

    required this.nick,
  });

  static UserDataNick fromRespMap(Map respMap, String nick, {String? key}){
    UserData userData = UserData.fromRespMap(respMap, key: key);
    return UserDataNick(
        key: userData.key,
        name: userData.name,
        verified: userData.verified,
        shadow: userData.shadow,
        sex: userData.sex,
        org: userData.org,
        hufiec: userData.hufiec,
        druzyna: userData.druzyna,
        rankHarc: userData.rankHarc,
        rankInstr: userData.rankInstr,

        nick: nick
    );
  }


  static const String _paramKey = '_key';
  static const String _paramName = 'name';
  static const String _paramVerified = 'verified';
  static const String _paramShadow = 'shadow';
  static const String _paramSex = 'sex';
  static const String _paramOrg = 'org';
  static const String _paramHufiec = 'hufiec';
  static const String _paramDruzyna = 'druzyna';
  static const String _paramRankHarc = 'rankHarc';
  static const String _paramRankInstr = 'rankInstr';

  static const String _paramNick = 'nick';

  Map<String, dynamic> toJsonMap() => {
    _paramKey: key,
    _paramName: name,
    _paramVerified: verified,
    _paramShadow: shadow,
    _paramSex: sexToString[sex],
    _paramOrg: org==null?null:orgToParam(org!),
    _paramHufiec: hufiec,
    _paramDruzyna: druzyna,
    _paramRankHarc: rankHarc==null?null:rankHarcToParam(rankHarc!),
    _paramRankInstr: rankInstr==null?null:rankInstrToParam(rankInstr!),

    _paramNick: nick
  };

  @override
  int get hashCode => key.hashCode + name.hashCode + verified.hashCode + shadow.hashCode + sex.hashCode + nick.hashCode;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

}
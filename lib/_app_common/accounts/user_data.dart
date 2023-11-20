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

  static const String paramKey = '_key';
  static const String paramName = 'name';
  static const String paramVerified = 'verified';
  static const String paramShadow = 'shadow';
  static const String paramSex = 'sex';
  static const String paramOrg = 'org';
  static const String paramHufiec = 'hufiec';
  static const String paramDruzyna = 'druzyna';
  static const String paramRankHarc = 'rankHarc';
  static const String paramRankInstr = 'rankInstr';
  
  static UserData fromRespMap(Map respMap, {String? key}) => UserData(
    key: key??respMap[paramKey]??(throw InvalidResponseError(paramKey)),
    name: respMap[paramName]??(throw InvalidResponseError(paramName)),
    verified: respMap[paramVerified]??false,
    shadow: respMap[paramShadow]??(throw InvalidResponseError(paramShadow)),
    sex: strToSex[respMap[paramSex]]??(throw InvalidResponseError(paramSex)),
    org: respMap[paramOrg]==null?null:paramToOrg[respMap[paramOrg]],
    hufiec: respMap[paramHufiec],
    druzyna: respMap[paramDruzyna],
    rankHarc: respMap[paramRankHarc]==null?null:paramToRankHarc[respMap[paramRankHarc]],
    rankInstr: respMap[paramRankInstr]==null?null:paramToRankInstr[respMap[paramRankInstr]],
  );

  Map<String, dynamic> toJsonMap() => {
    paramKey: key,
    paramName: name,
    paramVerified: verified,
    paramShadow: shadow,
    paramSex: sexToString[sex],
    paramOrg: org==null?null:orgToParam(org!),
    paramHufiec: hufiec,
    paramDruzyna: druzyna,
    paramRankHarc: rankHarc==null?null:rankHarcToParam(rankHarc!),
    paramRankInstr: rankInstr==null?null:rankInstrToParam(rankInstr!),
  };

  @override
  int get hashCode =>
          key.hashCode +
          name.hashCode +
          verified.hashCode +
          shadow.hashCode +
          sex.hashCode +
          org.hashCode +
          hufiec.hashCode +
          druzyna.hashCode +
          rankHarc.hashCode +
          rankInstr.hashCode;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

}

class UserDataNick extends UserData{

  String nick;

  UserDataNick({
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

  static UserDataNick fromRespMap(Map respMap, {String? key}){
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

        nick: respMap[paramNick],
    );
  }

  static const String paramNick = 'nick';

  @override
  Map<String, dynamic> toJsonMap(){
    Map<String, dynamic> map = super.toJsonMap();
    map[paramNick] = nick;
    return map;
  }

  @override
  int get hashCode =>
      super.hashCode + nick.hashCode;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

}

class ShadowUserData extends UserDataNick{

  bool nickSearchable;
  Set<String> indivCompKeys;

  ShadowUserData({
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

    required super.nick,
    required this.nickSearchable,
    required this.indivCompKeys,
  });

  static ShadowUserData fromRespMap(Map respMap, {String? key}){
    UserDataNick userDataNick = UserDataNick.fromRespMap(respMap, key: key);
    return ShadowUserData(
        key: userDataNick.key,
        name: userDataNick.name,
        verified: userDataNick.verified,
        shadow: userDataNick.shadow,
        sex: userDataNick.sex,
        org: userDataNick.org,
        hufiec: userDataNick.hufiec,
        druzyna: userDataNick.druzyna,
        rankHarc: userDataNick.rankHarc,
        rankInstr: userDataNick.rankInstr,

        nick: userDataNick.nick,
        nickSearchable: respMap[paramNickSearchable],
        indivCompKeys: Set.from(respMap[paramIndivComps]),
    );
  }

  static const String paramNickSearchable = 'nickSearchable';
  static const String paramIndivComps = 'indivComps';

  @override
  Map<String, dynamic> toJsonMap(){
    Map<String, dynamic> map = super.toJsonMap();
    map[paramNickSearchable] = nickSearchable;
    map[paramIndivComps] = indivCompKeys.toList();
    return map;
  }

  @override
  int get hashCode =>
      super.hashCode + nickSearchable.hashCode;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

}
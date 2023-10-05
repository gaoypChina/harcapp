import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp/values/rank_instr.dart';

class TropUser extends UserData{

  final TropRole role;

  TropUser({
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

    required this.role,
  });

  static TropUser fromUserData(
      UserDataNick userData,
      { required TropRole role
      })
  => TropUser(
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

    role: role,
  );

  static TropUser fromRespMap(Map respMap, {String? key}) => TropUser(
    key: key??respMap['_key']??(throw InvalidResponseError('_key')),
    name: respMap['name']??(throw InvalidResponseError('name')),
    verified: respMap['verified']??(throw InvalidResponseError('verified')),
    shadow: respMap['shadow']??(throw InvalidResponseError('shadow')),
    sex: strToSex[respMap['sex']]??(throw InvalidResponseError('sex')),
    org: paramToOrg[respMap['org']],
    hufiec: respMap['hufiec'],
    druzyna: respMap['druzyna'],
    rankHarc: paramToRankHarc[respMap['rankHarc']],
    rankInstr: paramToRankInstr[respMap['rankInstr']],

    role: strToTropRole[respMap['role']]??(throw InvalidResponseError('role')),
  );

  @override
  Map<String, dynamic> toJsonMap(){
    Map<String, dynamic> map = super.toJsonMap();
    map.addAll({
      'role': tropRoleToStr[role],
    });
    return map;
  }

  UserData toUserData() => UserData(
      key: key,
      name: name,
      verified: verified,
      shadow: shadow,
      sex: sex,
      org: org,
      hufiec: hufiec,
      druzyna: druzyna,
      rankHarc: rankHarc,
      rankInstr: rankInstr
  );

}

class TropUserNick extends TropUser{

  String? nick;

  TropUserNick({
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

    required super.role,
    required this.nick,
  });

  static TropUserNick fromUserDataNick(
      UserDataNick userData,
      { required TropRole role,
      })
  => TropUserNick(
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

    role: role,
    nick: userData.nick
  );

}
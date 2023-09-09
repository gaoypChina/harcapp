import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';

import '../circle_role.dart';

class Member extends UserData{
  //
  // final UserData _userData;
  //
  // String get key => _userData.key;
  // String get name => _userData.name;
  // bool get shadow => _userData.shadow;
  // Sex get sex => _userData.sex;

  final CircleRole role;
  final String? patrol;

  const Member({
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
      required this.patrol
  });

  static Member fromUserData(
      UserData userData,
      { required CircleRole role,
        required String? patrol
      }) => Member(
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
      patrol: patrol
  );

  static Member fromRespMap(Map respMap, {String? key}) => Member.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    role: strToCircleRole[respMap['role']]??(throw InvalidResponseError('role')),
    patrol: respMap['patrol'],
  );

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
import 'package:harcapp/_app_common/accounts/user_data.dart';

import '../../../api/_api.dart';
import 'community_role.dart';

class CommunityManager extends UserData{

  final CommunityRole role;

  const CommunityManager({
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

    required this.role
  });


  static CommunityManager fromUserData(
      UserData userData,
      { required CommunityRole role})
  => CommunityManager(
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

  static CommunityManager fromRespMap(Map respMap, {String? key}) => CommunityManager.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    role: strToCommunityRole[respMap['role']]??(throw InvalidResponseError('role')),
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
import 'package:harcapp/_app_common/accounts/user_data.dart';

import '../../../api/_api.dart';
import 'community_role.dart';

class CommunityManager extends UserData{

  final CommunityRole role;

  const CommunityManager({
    required super.key,
    required super.name,
    required super.shadow,
    required super.sex,
    required this.role
  });


  static CommunityManager fromUserData(
      UserData userData,
      { required CommunityRole role})
  => CommunityManager(
    key: userData.key,
    name: userData.name,
    shadow: userData.shadow,
    sex: userData.sex,
    role: role,
  );

  static CommunityManager fromRespMap(Map respMap, {String? key}) => CommunityManager.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    role: strToCommunityRole[respMap['role']]??(throw InvalidResponseError('role')),
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
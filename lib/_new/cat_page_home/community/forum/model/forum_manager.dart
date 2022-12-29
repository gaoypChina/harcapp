import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';

import '../forum_role.dart';

class ForumManager extends UserData{

  final ForumRole role;

  const ForumManager({
    required super.key,
    required super.name,
    required super.shadow,
    required super.sex,
    required this.role
  });

  static ForumManager fromUserData(
      UserData userData,
      { required ForumRole role})
  => ForumManager(
      key: userData.key,
      name: userData.name,
      shadow: userData.shadow,
      sex: userData.sex,
      role: role,
  );

  static ForumManager fromRespMap(Map respMap, {String? key}) => ForumManager.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    role: strToForumRole[respMap['role']]??(throw InvalidResponseError('role')),
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
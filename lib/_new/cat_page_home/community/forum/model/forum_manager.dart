import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';

import '../forum_role.dart';

class ForumManager{

  final UserData _userData;

  String get key => _userData.key;
  String get name => _userData.name;
  bool get shadow => _userData.shadow;
  Sex get sex => _userData.sex;

  final ForumRole role;

  const ForumManager(
    this._userData, {
    required this.role
  });

  static ForumManager fromMap(Map map, {String? key}) => ForumManager(
    UserData.fromMap(map, key: key),
    role: strToForumRole[map['role']]??(throw InvalidResponseError('role')),
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
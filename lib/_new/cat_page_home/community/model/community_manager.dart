import 'package:harcapp/_app_common/accounts/user_data.dart';

import '../../../api/_api.dart';
import '../community_role.dart';

class CommunityManager{

  final UserData _userData;

  String get key => _userData.key;
  String get name => _userData.name;
  bool get shadow => _userData.shadow;
  Sex get sex => _userData.sex;

  final CommunityRole role;

  const CommunityManager(
    this._userData, {
    required this.role
  });

  static CommunityManager fromMap(Map map, {String? key}) => CommunityManager(
    UserData.fromMap(map, key: key),
    role: strToCommunityRole[map['role']]??(throw InvalidResponseError('role')),
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
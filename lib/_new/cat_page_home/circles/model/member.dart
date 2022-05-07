import 'package:harcapp/_app_common/accounts/user_data.dart';

import '../../../api/_api.dart';
import '../circle_role.dart';

class Member extends UserData{

  final UserData _userData;

  String get key => _userData.key;
  String get name => _userData.name;
  bool get shadow => _userData.shadow;
  Sex get sex => _userData.sex;

  final CircleRole role;

  const Member(this._userData, this.role);

  static Member fromMap(Map map, {String key}) => Member(
    UserData.fromMap(map, key: key),
    strToCircleRole[map['role']]??(throw InvalidResponseError('role')),
  );
}
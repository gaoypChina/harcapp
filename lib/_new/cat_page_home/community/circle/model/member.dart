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
      required super.shadow,
      required super.sex,
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
      shadow: userData.shadow,
      sex: userData.sex,
      role: role,
      patrol: patrol
  );

  static Member fromMap(Map map, {String? key}) => Member.fromUserData(
    UserData.fromMap(map, key: key),
    role: strToCircleRole[map['role']]??(throw InvalidResponseError('role')),
    patrol: map['patrol'],
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
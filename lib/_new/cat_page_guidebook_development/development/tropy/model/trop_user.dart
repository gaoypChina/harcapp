import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';

class TropUser extends UserData{

  final TropRole role;

  const TropUser({
    required super.key,
    required super.name,
    required super.shadow,
    required super.sex,
    required this.role
  });


  static TropUser fromUserData(
      UserData userData,
      { required TropRole role})
  => TropUser(
    key: userData.key,
    name: userData.name,
    shadow: userData.shadow,
    sex: userData.sex,
    role: role,
  );

  static TropUser fromRespMap(Map respMap, {String? key}) => TropUser.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    role: strToTropRole[respMap['role']]??(throw InvalidResponseError('role')),
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
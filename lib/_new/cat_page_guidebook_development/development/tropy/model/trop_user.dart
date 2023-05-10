import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';

class TropUser extends UserData{

  final TropRole role;

  TropUser({
    required super.key,
    required super.name,
    required super.shadow,
    required super.sex,
    required this.role,
  });

  static TropUser fromUserData(
      UserDataNick userData,
      { required TropRole role,
      })
  => TropUser(
    key: userData.key,
    name: userData.name,
    shadow: userData.shadow,
    sex: userData.sex,
    role: role,
  );

  static TropUser fromRespMap(Map respMap, {String? key}) => TropUser(
    key: key??respMap['_key']??(throw InvalidResponseError('_key')),
    name: respMap['name']??(throw InvalidResponseError('name')),
    shadow: respMap['shadow']??(throw InvalidResponseError('shadow')),
    sex: strToSex[respMap['sex']]??(throw InvalidResponseError('sex')),
    role: strToTropRole[respMap['role']]??(throw InvalidResponseError('role')),
  );

  @override
  Map toJsonMap(){
    Map map = super.toJsonMap();
    map.addAll({
      'role': tropRoleToStr[role],
    });
    return map;
  }

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
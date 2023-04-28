import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop_role.dart';
import 'package:optional/optional_internal.dart';

class TropUser extends UserData{

  final TropRole role;
  // Holding nick for sync shortly after trop is created.
  // null -> no change.
  // Optional.empty() -> remove nick.
  // Optional.of('nick') -> set nick.
  final Optional<String>? tmpNick;

  TropUser({
    required super.key,
    required super.name,
    required super.shadow,
    required super.sex,
    required this.role,
    required this.tmpNick,
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
    tmpNick: Optional.of(userData.nick),
  );

  static TropUser fromRespMap(Map respMap, {String? key}) => TropUser(
    key: key??respMap['_key']??(throw InvalidResponseError('_key')),
    name: respMap['name']??(throw InvalidResponseError('name')),
    shadow: respMap['shadow']??(throw InvalidResponseError('shadow')),
    sex: strToSex[respMap['sex']]??(throw InvalidResponseError('sex')),
    role: strToTropRole[respMap['role']]??(throw InvalidResponseError('role')),
    tmpNick: !respMap.containsKey('assigneeNick')?
    null:
    respMap['assigneeNick'] == null?
    const Optional.empty():
    // respMap['assigneeNick'] != null
    Optional.of(respMap['assigneeNick']),
  );

  @override
  Map toJsonMap(){
    Map map = super.toJsonMap();
    map.addAll({
      'role': tropRoleToStr[role],
      if(tmpNick != null) 'assigneeNick': tmpNick!.orElseNull
    });
    return map;
  }

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/api/_api.dart';

import 'marker_role.dart';

class MarkerManager extends UserData{

  final MarkerRole role;

  const MarkerManager({
    required super.key,
    required super.name,
    required super.verified,
    required super.shadow,
    required super.sex,
    required this.role
  });


  static MarkerManager fromUserData(
      UserData userData,
      { required MarkerRole role})
  => MarkerManager(
    key: userData.key,
    name: userData.name,
    verified: userData.verified,
    shadow: userData.shadow,
    sex: userData.sex,
    role: role,
  );

  static MarkerManager fromRespMap(Map respMap, {String? key}) => MarkerManager.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    role: strToMarkerRole[respMap['role']]??(throw InvalidResponseError('role')),
  );

  UserData toUserData() => UserData(key: key, name: name, verified: verified, shadow: shadow, sex: sex);

}
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';

import '../../../../../_app_common/accounts/user_data.dart';

class IndivCompParticip extends UserData{

  final IndivCompProfile profile;

  IndivCompParticip({
    required super.key,
    required super.name,
    required super.shadow,
    required super.sex,
    required this.profile,
  });

  static IndivCompParticip fromUserData(
      UserData userData,
      { required IndivCompProfile profile
      }) => IndivCompParticip(
      key: userData.key,
      name: userData.name,
      shadow: userData.shadow,
      sex: userData.sex,
      profile: profile
  );

  static IndivCompParticip fromRespMap(Map respMap, {String? key}) => IndivCompParticip.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    profile: IndivCompProfile.fromRespMap(respMap['profile']??(throw InvalidResponseError('profile'))),
  );

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

  @override
  int get hashCode => key.hashCode + name.hashCode + shadow.hashCode + sex.hashCode + profile.hashCode;

  @override
  bool operator ==(Object other) => other is IndivCompParticip && key == other.key;

}
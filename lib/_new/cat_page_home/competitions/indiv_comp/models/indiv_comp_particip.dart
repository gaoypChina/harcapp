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

  static IndivCompParticip fromMap(String key, Map map) => IndivCompParticip.fromUserData(
    UserData.fromMap(map, key: key),
    profile: IndivCompProfile.fromResponse(map['profile']??(throw InvalidResponseError('profile'))),
  );

  get isMale => sex == Sex.male;

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
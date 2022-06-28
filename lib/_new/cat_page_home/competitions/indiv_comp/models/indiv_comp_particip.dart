import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';

import '../../../../../_app_common/accounts/user_data.dart';

class IndivCompParticip{

  final UserData _userData;

  String get key => _userData.key;
  String get name => _userData.name;
  bool get shadow => _userData.shadow;
  Sex get sex => _userData.sex;

  final IndivCompProfile profile;

  IndivCompParticip(
      this._userData,
      this.profile,
  );

  static IndivCompParticip fromMap(String key, Map map) => IndivCompParticip(
    UserData.fromMap(map, key: key),
    IndivCompProfile.fromResponse(map['profile']??(throw InvalidResponseError('profile'))),
  );

  get isMale => sex == Sex.male;

  UserData toUserData() => UserData(key: key, name: name, shadow: shadow, sex: sex);

}
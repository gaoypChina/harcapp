import 'package:flutter/foundation.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';

enum Sex{male, female}

Map<Sex, bool> sexToBool = {
  Sex.male: true,
  Sex.female: false,
};

Map<bool, Sex> boolToSex = {
  true: Sex.male,
  false: Sex.female,
};

Map<Sex, String> sexToString = {
  Sex.male: 'Male',
  Sex.female: 'Female',
};

Map<String, Sex> strToSex = {
  'Male': Sex.male,
  'Female': Sex.female,
};

class IndivCompParticip{

  final String key;
  final String name;
  final Sex sex;
  final IndivCompProfile profile;

  IndivCompParticip({
    @required this.key,
    @required this.name,
    @required this.sex,
    @required this.profile,
  });

  static IndivCompParticip fromMap(String key, Map map) => IndivCompParticip(
    key: key,
    name: map['name']??(throw InvalidResponseError('name')),
    sex: strToSex[map['sex']]??(throw InvalidResponseError('sex')),
    profile: IndivCompProfile.fromResponse(map['profile']??(throw InvalidResponseError('profile'))),
  );

  get isMale => sex == Sex.male;

}
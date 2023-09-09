import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';

import '../../../../../_app_common/accounts/user_data.dart';
import 'indiv_comp.dart';

class IndivCompParticip extends UserData{

  final IndivCompProfile profile;

  IndivCompParticip({
    required super.key,
    required super.name,
    required super.verified,
    required super.shadow,
    required super.sex,
    required super.org,
    required super.hufiec,
    required super.druzyna,
    required super.rankHarc,
    required super.rankInstr,

    required this.profile,
  });

  void adjustToOtherParticipChange(IndivCompParticip? participOld, IndivCompParticip? participNew) =>
      profile.adjustToOtherProfileChange(participOld?.profile, participNew?.profile);

  static IndivCompParticip fromUserData(
      UserData userData,
      { required IndivCompProfile profile
      }) => IndivCompParticip(
      key: userData.key,
      name: userData.name,
      verified: userData.verified,
      shadow: userData.shadow,
      sex: userData.sex,
      org: userData.org,
      hufiec: userData.hufiec,
      druzyna: userData.druzyna,
      rankHarc: userData.rankHarc,
      rankInstr: userData.rankInstr,

      profile: profile
  );

  static IndivCompParticip fromRespMap(Map respMap, IndivComp comp, {String? key}) => IndivCompParticip.fromUserData(
    UserData.fromRespMap(respMap, key: key),
    profile: IndivCompProfile.fromRespMap(respMap['profile']??(throw InvalidResponseError('profile')), comp),
  );

  UserData toUserData() => UserData(
      key: key,
      name: name,
      verified: verified,
      shadow: shadow,
      sex: sex,
      org: org,
      hufiec: hufiec,
      druzyna: druzyna,
      rankHarc: rankHarc,
      rankInstr: rankInstr
  );

  @override
  int get hashCode => key.hashCode + name.hashCode + verified.hashCode + shadow.hashCode + sex.hashCode + profile.hashCode;

  @override
  bool operator ==(Object other) => other is IndivCompParticip && key == other.key;

}
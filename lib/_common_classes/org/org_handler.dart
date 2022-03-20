import 'package:harcapp/_common_classes/org/org_entity_resp.dart';
import 'package:harcapp/sync/syncable_new.dart';

import '../sha_pref.dart';
import 'org.dart';

class OrgHandler extends SyncableParamSingle_ with SyncNode<OrgEntityResp>{

  static Org get current{
    int orgInt = shaPref.getInt(ShaPref.SHA_PREF_ORG, orgToInt[Org.zhp]);
    return orgFromInt[orgInt];
  }

  static set current(Org value){
    shaPref.setInt(ShaPref.SHA_PREF_ORG, orgToInt[value]);
  }

  static Org nextFrom(List<Org> allowedOrgs){
    int currIndex = allowedOrgs.indexOf(current);
    Org nextOrg = allowedOrgs[(currIndex + 1) % allowedOrgs.length];
    current = nextOrg;
    return nextOrg;
  }

  static Org currentFrom(List<Org> allowedOrgs){

    Org org = current;
    if(allowedOrgs.contains(org)) return org;

    if(org == Org.zhr_c || org == Org.zhr_d)
      if(allowedOrgs.contains(Org.zhr_o)) return Org.zhr_o;

    if(org == Org.fse)
      if(allowedOrgs.contains(Org.zhr_o)) return Org.zhr_o;

    if(allowedOrgs.contains(Org.zhp)) return Org.zhp;

    return null;
  }

  @override
  void applySyncGetResp(OrgEntityResp resp) {
    current = resp.org;
  }

  @override
  bool get isNotSet => false;

  @override
  String get paramId => 'org';

  @override
  get value => orgName[current];

}
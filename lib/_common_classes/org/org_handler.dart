import 'package:harcapp/_common_classes/org/org_entity_resp.dart';
import 'package:harcapp/sync/syncable.dart';

import '../../sync/synchronizer_engine.dart';
import '../sha_pref.dart';
import 'org.dart';

class OrgHandler with SyncableParamSingleMixin, SyncGetRespNode<OrgEntityResp>{

  static Org get current{
    int orgInt = ShaPref.getInt(ShaPref.SHA_PREF_ORG, orgToInt[Org.zhp]!);
    return orgFromInt[orgInt]??Org.zhp;
  }

  static set current(Org value){
    ShaPref.setInt(ShaPref.SHA_PREF_ORG, orgToInt[value]!);
    OrgHandler().state = SyncableParamSingleMixin.stateNotSynced;
    synchronizer.post(aggregateDelay: const Duration(seconds: 3));
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

    return Org.zhp;
  }

  @override
  void applySyncGetResp(OrgEntityResp resp) {
    current = resp.org;
  }

  @override
  bool get isNotSet => false;

  static const String syncClassId = 'org';

  @override
  String get debugClassId => syncClassId;

  @override
  SyncableParam? get parentParam => null;

  @override
  String get paramId => syncClassId;

  @override
  get value => orgToInt[current];

}
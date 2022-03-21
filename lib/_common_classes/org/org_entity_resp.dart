import '../../_new/api/sync_resp_body/sync_entity_resp.dart';
import 'org.dart';
import 'org_handler.dart';

class OrgEntityResp extends SyncGetResp{

  static const String collName = OrgHandler.syncClassId;

  final Org org;

  const OrgEntityResp({this.org});

  static OrgEntityResp from(dynamic respData) => OrgEntityResp(
      org: orgFromInt[respData]
  );

}
import 'package:harcapp/_new/api/sync_resp_body/rank_def_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/data/data_zhp_old.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/data/data_zhr_c.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/data/data_zhr_d.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/sync/syncable.dart';

class RankDefData extends RankData{

  RankDefData({
    required super.titleMale,
    super.titleFemale,
    required super.version,
    required super.org,
    required super.id,
    required super.catData,
  });

  @override
  RankDef build() {
    RankDef rank = RankDef(this, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank;
  }

  @override
  RankDefPreview buildPreview(RankStateShared state) {
    RankDefPreview rank = RankDefPreview(this, state, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank;
  }

}

abstract class RankDefTempl<T extends RankState> extends Rank<RankDefData, RankDefGetResp, T> {

  RankDefTempl(super.data, super.cats);

  @override
  SyncableParam? get parentParam => SyncGetRespNode.rankDefNodes;
  
  @override
  String get debugClassId => RankDef.syncClassId;
  
}

class RankDef extends RankDefTempl<RankStateLocal>{

  static List<Rank> all = [
    rankZhpOldZuch1,
    rankZhpOldZuch2,
    rankZhpOldZuch3,

    rankZhrZuchC1,
    rankZhrZuchC2,
    rankZhrZuchC3,

    rankZhrZuchD1,
    rankZhrZuchD2,
    rankZhrZuchD3,
  ];

  static Map<String, Rank> allMap = {for (Rank rank in all) rank.uniqRankName: rank};

  @override
  RankStateLocal get state => RankStateLocal(this);

  @override
  RankDefPreview preview(RankStateShared sharedState) => data.buildPreview(sharedState);

  RankDef(super.data, super.cats);

  static const String syncClassId = 'rank_def';
  
//@override
//SyncableParam get parentParam => RootSyncable(syncClassId);

}

class RankDefPreview extends RankDefTempl<RankStateShared>{

  @override
  RankDefPreview preview(RankStateShared sharedState) => this;

  @override
  RankStateShared state;

  RankDefPreview(super.data, this.state, super.cats);

}
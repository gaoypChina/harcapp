
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_def_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/data/data_zhp_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/list_header_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/sector_sep_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_header_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_line_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../sync/syncable_new.dart';
import 'rank_def.dart';


class RankZHPOldData extends RankData{

  final String czasTrw;
  final String idea;
  final List<String> warOtw;

  RankZHPOldData({
    @required String titleMale,
    @required String titleFemale,
    @required this.czasTrw,
    @required int version,
    @required Org org,
    @required String id,
    @required this.idea,
    @required this.warOtw,
    @required List<RankCatData> catData,
  }):super(
    titleMale: titleMale,
    titleFemale: titleFemale,
    version: version,
    org: org,
    id: id,
    catData: catData,
  );

  @override
  RankZHPOld build() {
    RankZHPOld rank = RankZHPOld(this, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank;
  }

  @override
  RankZHPOldPreview buildPreview(RankStateShared state) {
    RankZHPOldPreview rank = RankZHPOldPreview(this, state, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank;
  }

}

abstract class RankZHPOldTempl<T extends RankState> extends Rank<RankZHPOldData, RankDefResp, T>{

  RankZHPOldTempl(
    RankZHPOldData data,
    List<RankCat> cats,
  ):super(data, cats);

  @override
  buildHeader(BuildContext context) => Column(
    children: [
      SingleLineWidget(MdiIcons.clockOutline, data.czasTrw),

      const SizedBox(height: 3*Dimen.SIDE_MARG),

      ListHeaderWidget('Warunki otwarcia', data.warOtw, icon: MdiIcons.flagVariantOutline,),

      const SizedBox(height: 3*Dimen.SIDE_MARG),
      SingleHeaderWidget('Idea stopnia', data.idea, icon: MdiIcons.lightbulbOutline,),

      const SizedBox(height: 3*Dimen.SIDE_MARG),
      const SectorSepWidget('Zadania'),
    ],
  );

}

class RankZHPOld extends RankZHPOldTempl<RankStateLocal>{

  static List<Rank> all = [

    rankZhpOld0,
    rankZhpOld1,
    rankZhpOld2,
    rankZhpOld3,
    rankZhpOld4,
    rankZhpOld5,
    rankZhpOld6,
  ];

  static Map<String, Rank> allMap = {for (Rank rank in all) rank.uniqRankName: rank};

  @override
  RankStateLocal get state => RankStateLocal(this);

  @override
  RankZHPOldPreview preview(RankStateShared sharedState) => data.buildPreview(sharedState);

  RankZHPOld(
    RankZHPOldData data,
    List<RankCat> cats,
  ):super(data, cats);

  static const String syncClassId = RankDef.syncClassId;

  @override
  SyncableParam get parentParam => const RootSyncable(syncClassId);

}

class RankZHPOldPreview extends RankZHPOldTempl<RankStateShared>{

  @override
  RankZHPOldPreview preview(RankStateShared sharedState) => this;

  @override
  RankStateShared state;

  RankZHPOldPreview(RankZHPOldData data, this.state, List<RankCat> cats) : super(data, cats);

}
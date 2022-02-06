import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_def_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/data/data_zhr_c.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/sector_sep_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_header_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_line_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_cat_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RankZHRCData extends RankData{

  final String minWiek;
  final String czasTrw;
  final String idea;
  final List<RankGroupData> koment;

  RankZHRCData({
    @required String title,
    @required int version,
    @required Org org,
    @required String id,
    @required this.minWiek,
    @required this.czasTrw,
    @required this.idea,
    @required this.koment,
    @required List<RankCatData> catData,
  }):super(
    titleMale: title,
    version: version,
    org: org,
    id: id,
    catData: catData,
  );

  @override
  RankZHRC build() {
    RankZHRC rank = RankZHRC(this, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];;
    return rank;
  }

  @override
  RankZHRCPreview buildPreview(RankStateShared state) {
    RankZHRCPreview rank = RankZHRCPreview(this, state, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];;
    return rank;
  }

  static RankZHRCData from({
    @required String title,
    @required int version,
    @required Org org,
    @required String id,
    @required String minWiek,
    @required String czasTrw,
    @required String idea,
    @required List<RankGroupData> koment,
    @required List<RankCatData> cats,
  }){

    List<RankCatData> allCats = [];
    //if(koment != null)
    //  allCats.add(StopCat(title: 'Komentarze', groups: koment));

    if(cats != null)
      allCats.addAll(cats);

    return RankZHRCData(
        title: title,
        version: version,
        org: org,
        id: id,
        minWiek: minWiek,
        czasTrw: czasTrw,
        idea: idea,
        koment: koment,
        catData: allCats
    );

  }

}

abstract class RankZHRCTempl<T extends RankState> extends Rank<RankZHRCData, RankDefResp, T>{

  String get minWiek => data.minWiek;
  String get czasTrw => data.czasTrw;
  String get idea => data.idea;
  List<RankGroupData> get koment => data.koment;

  RankZHRCTempl(
    RankZHRCData data,
    List<RankCat> cats,
  ):super(data, cats);

  @override
  buildHeader(BuildContext context) => Column(
    children: [
      SingleLineWidget(MdiIcons.cakeVariantOutline, minWiek),
      SingleLineWidget(MdiIcons.clockOutline, czasTrw),

      if(idea != null) SizedBox(height: 3*Dimen.SIDE_MARG),
      if(idea != null) SingleHeaderWidget('Idea stopnia', idea, icon: MdiIcons.lightbulbOutline),

      if(koment != null) SizedBox(height: 3*Dimen.SIDE_MARG),
      if(koment != null) SectorSepWidget('Komentarz'),
      if(koment != null) SizedBox(height: Dimen.SIDE_MARG),
      if(koment != null)
        RankCatWidget(
          RankCatData(groupData: koment).buildUnregistered(),
        ),

      SizedBox(height: 3*Dimen.SIDE_MARG),
      SectorSepWidget('Zadania'),
    ],
  );

  static const String REQ_GROUP = RankDefTempl.REQ_GROUP;

  @override
  String get classId => REQ_GROUP;

}

class RankZHRC<T extends RankState> extends RankZHRCTempl<RankStateLocal>{

  static List<Rank> all = [
    rankZhrHarcC0,
    rankZhrHarcC0S,
    rankZhrHarcC1,
    rankZhrHarcC2,
    rankZhrHarcC3,
    rankZhrHarcC4,
    rankZhrHarcC5
  ];

  static Map<String, Rank> allMap = {for (Rank rank in all) rank.uniqRankName: rank};

  RankZHRC(
    RankZHRCData data,
    List<RankCat> cats,
  ):super(data, cats);

  RankStateLocal get state => RankStateLocal(this);

  RankZHRCPreview preview(RankStateShared sharedState) => data.buildPreview(sharedState);

}

class RankZHRCPreview extends RankZHRCTempl<RankStateShared>{

  RankZHRCPreview preview(RankStateShared sharedState) => this;

  RankStateShared state;

  RankZHRCPreview(RankZHRCData data, this.state, List<RankCat> cats) : super(data, cats);

}
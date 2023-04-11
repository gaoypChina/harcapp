import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_def_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/data/data_zhr_d.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/sector_sep_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/single_header_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/single_line_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_task.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RankZHRDData extends RankData{

  final String minWiek;
  final String czasTrw;
  final String? zalozenia;
  final String? punktWyjsc;
  final String? wskazowki;
  final String? sylwetka;

  RankZHRDData({
    required String title,
    required super.version,
    required super.org,
    required super.id,
    required this.minWiek,
    required this.czasTrw,
    required this.zalozenia,
    required this.punktWyjsc,
    required this.wskazowki,
    required this.sylwetka,
    required super.catData,
  }):super(
      titleMale: title
  );

  @override
  RankZHRD build() {
    RankZHRD rank = RankZHRD(this, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank;
  }

  @override
  RankZHRDPreview buildPreview(RankStateShared state) {
    RankZHRDPreview rank = RankZHRDPreview(this, state, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank;
  }

  static RankZHRDData from({
    required String title,
    required int version,
    required Org org,
    required String id,
    required String minWiek,
    required String czasTrw,
    required String? zalozenia,
    required String? punktWyjsc,
    required String? wskazowki,
    required String? sylwetka,

    List<RankGroupData>? postawa,
    List<RankTaskData>? postawaItems,
    List<RankGroupData>? wiedzaHarc,
    List<RankTaskData>? wiedzaHarcItems,
    List<RankGroupData>? umiejetnosci,
    List<RankTaskData>? umiejetnosciItems,
    List<RankGroupData>? doswiadczenie,
    List<RankTaskData>? doswiadczenieItems,

    required List<RankCatData>? catData,
  }){

    assert(!(postawa != null && postawaItems != null));
    assert(!(wiedzaHarc != null && wiedzaHarcItems != null));
    assert(!(umiejetnosci != null && umiejetnosciItems != null));
    assert(!(doswiadczenie != null && doswiadczenieItems != null));

    RankCatData? postawaCat;
    if(postawa != null)
      postawaCat = RankCatData(title: 'Postawa', icon: MdiIcons.faceWomanShimmerOutline, groupData: postawa);
    else if(postawaItems != null)
      postawaCat = RankCatData.fromItems('Postawa', MdiIcons.faceWomanShimmerOutline, postawaItems);

    RankCatData? wiedzaHarcCat;
    if(wiedzaHarc != null)
      wiedzaHarcCat = RankCatData(title: 'Wiedza harcerska', icon: MdiIcons.bookEducationOutline, groupData: wiedzaHarc);
    else if(wiedzaHarcItems != null)
      wiedzaHarcCat = RankCatData.fromItems('Wiedza harcerska', MdiIcons.bookEducationOutline, wiedzaHarcItems);

    RankCatData? umiejetnosciCat;
    if(umiejetnosci != null)
      umiejetnosciCat = RankCatData(title: 'Umiejętności', icon: MdiIcons.hammerScrewdriver, groupData: umiejetnosci);
    else if(umiejetnosciItems != null)
      umiejetnosciCat = RankCatData.fromItems('Umiejętności', MdiIcons.hammerScrewdriver, umiejetnosciItems);

    RankCatData? doswiadczenieCat;
    if(doswiadczenie != null)
      doswiadczenieCat = RankCatData(title: 'Doświadczenie', icon: MdiIcons.timerSand, groupData: doswiadczenie);
    else if(doswiadczenieItems != null)
      doswiadczenieCat = RankCatData.fromItems('Doświadczenie', MdiIcons.timerSand, doswiadczenieItems);

    List<RankCatData> allCats = [];
    if(postawaCat != null)
      allCats.add(postawaCat);
    if(wiedzaHarcCat != null)
      allCats.add(wiedzaHarcCat);
    if(umiejetnosciCat != null)
      allCats.add(umiejetnosciCat);
    if(doswiadczenieCat != null)
      allCats.add(doswiadczenieCat);
    if(catData != null)
      allCats.addAll(catData);

    return RankZHRDData(
        title: title,
        version: version,
        org: org,
        id: id,
        minWiek: minWiek,
        czasTrw: czasTrw,
        zalozenia: zalozenia,
        punktWyjsc: punktWyjsc,
        wskazowki: wskazowki,
        sylwetka: sylwetka,

        catData: allCats
    );
  }

}

abstract class RankZHRDTempl<T extends RankState> extends Rank<RankZHRDData, RankDefGetResp, T>{

  RankZHRDTempl(super.data, super.cats);

  @override
  buildHeader(BuildContext context, bool previewOnly) => Column(
    children: [
      SingleLineWidget(MdiIcons.cakeVariantOutline, data.minWiek),
      SingleLineWidget(MdiIcons.clockOutline, data.czasTrw),

      if(data.sylwetka != null) const SizedBox(height: 3*Dimen.SIDE_MARG),

      if(data.sylwetka != null)
        SingleHeaderWidget('Sylwetka', data.sylwetka, icon: MdiIcons.faceWomanShimmerOutline),

      const SizedBox(height: 3*Dimen.SIDE_MARG),
      const SectorSepWidget('Zadania'),
    ],
  );
  
  @override
  String get debugClassId => RankZHRD.syncClassId;
  
}

class RankZHRD extends RankZHRDTempl<RankStateLocal>{

  static List<Rank> all = [
    rankZhrHarcD0,
    rankZhrHarcD0S,
    rankZhrHarcD0W,
    rankZhrHarcD1,
    rankZhrHarcD2,
    rankZhrHarcD2S,
    rankZhrHarcD3,
    rankZhrHarcD3S,
    rankZhrHarcD4,
    rankZhrHarcD4S,
    rankZhrHarcD5,
  ];

  static Map<String, Rank> allMap = {for (Rank rank in all) rank.uniqRankName: rank};

  RankZHRD(super.data, super.cats);

  @override
  RankStateLocal get state => RankStateLocal(this);

  @override
  RankZHRDPreview preview(RankStateShared sharedState) => data.buildPreview(sharedState);

  static const String syncClassId = RankDef.syncClassId;

  @override
  SyncableParam? get parentParam => SyncGetRespNode.rankDefNodes;

}

class RankZHRDPreview extends RankZHRDTempl<RankStateShared>{

  @override
  RankZHRDPreview preview(RankStateShared stateShared) => this;

  @override
  RankStateShared state;

  RankZHRDPreview(RankZHRDData data, this.state, List<RankCat>? cats) : super(data, cats);

  @override
  // TODO: Separate the rank template stuff do that preview is not syncable.
  SyncableParam? get parentParam => SyncGetRespNode.rankDefNodes;

}
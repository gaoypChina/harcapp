import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/sync/syncable.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_zhp_sim_2022_get_resp.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/sector_sep_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/single_header_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/header_widgets/single_line_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file_safe_plus/open_file_safe_plus.dart';

import '../data/data_zhp.dart';
import '../rank_widgets/rank_widget.dart';

class RankZHPSim2022Data extends RankData{

  final String minWiek;
  final String czasTrw;
  final String idea;

  final int sprawCount;
  final int tropCount;
  final int wyzwCount;
  final int? wyzwCountReq;

  RankZHPSim2022Data({
    required super.titleMale,
    required super.titleFemale,
    required this.minWiek,
    required this.czasTrw,
    required super.version,

    required this.sprawCount,
    required this.tropCount,
    required this.wyzwCount,
    this.wyzwCountReq,

    required super.org,
    required super.id,
    required this.idea,

    required super.catData,
  });

  @override
  RankZHPSim2022 build() {
    Rank rank = RankZHPSim2022(this, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank as RankZHPSim2022;
  }

  @override
  RankZHPSim2022Preview buildPreview(RankStateShared state) {
    Rank rank = RankZHPSim2022Preview(this, state, null);
    rank.cats = [for (int i = 0; i < catData.length; i++) catData[i].build(rank, i)];
    return rank as RankZHPSim2022Preview;
  }

}

abstract class RankZHPSim2022Templ<T extends RankState> extends Rank<RankZHPSim2022Data, RankZhpSim2022GetResp, T>{

  static const extSprawCode = 'spraw';
  static const extTropCode = 'trop';
  static const extWyzwCode = 'wyzw';

  static String? getExtText(String stopId, String code, int position) => ShaPref.getStringOrNull(ShaPref.SHA_PREF_STOP_ZHP_EXT_TEXT_(stopId, code, position));
  static Future<void> setExtText(String stopId, String code, int position, String value) => ShaPref.setString(ShaPref.SHA_PREF_STOP_ZHP_EXT_TEXT_(stopId, code, position), value);
  static Future<void> removeExtText(String stopId, String code, int position) => ShaPref.remove(ShaPref.SHA_PREF_STOP_ZHP_EXT_TEXT_(stopId, code, position));

  static bool getExtChecked(String stopId, String code, int position) => ShaPref.getBool(ShaPref.SHA_PREF_STOP_ZHP_EXT_COMPLETED_(stopId, code, position), false);
  static Future<void> setExtChecked(String stopId, String code, int position, bool checked) => ShaPref.setBool(ShaPref.SHA_PREF_STOP_ZHP_EXT_COMPLETED_(stopId, code, position), checked);

  String get minWiek => data.minWiek;
  String get czasTrw => data.czasTrw;
  String get idea => data.idea;

  int get sprawCount => data.sprawCount;
  int get tropCount => data.tropCount;
  int get wyzwCount => data.wyzwCount;
  int? get wyzwCountReq => data.wyzwCountReq;

  bool isSprawCompleted(int index){
    String? extText = getExtText(id, extSprawCode, index);
    if(extText == null) return false;

    bool isCustomNoteCompleted = extText.startsWith(SprawSelectedListWidget.customPrefix) && getExtChecked(id, extSprawCode, index);
    bool isSampleSprawCompleted = extText.startsWith(SprawSelectedListWidget.samplePrefix) && (Spraw.fromUID(extText.substring(SprawSelectedListWidget.samplePrefix.length))?.completed??false);
    return isCustomNoteCompleted || isSampleSprawCompleted;
  }

  @override
  bool get isReadyToComplete{
    for(int i=0; i<sprawCount; i++) {
      if(!isSprawCompleted(i))
        return false;
    }

    for(int i=0; i<tropCount; i++)
      if(!getExtChecked(id, extTropCode, i))
        return false;

    for(int i=0; i<(wyzwCountReq??wyzwCount); i++)
      if(!getExtChecked(id, extWyzwCode, i))
        return false;

    return super.isReadyToComplete;
  }

  @override
  int get completenessPercent{
    int complReqLen = 0;
    for(RankTaskState task in state.taskVals)
      complReqLen += task.completed?1:0;

    int allTasks = state.taskVals.length + data.sprawCount + data.tropCount + (data.wyzwCountReq??data.wyzwCount);

    for(int i=0; i<sprawCount; i++)
      if(isSprawCompleted(i))
        complReqLen++;

    for(int i=0; i<tropCount; i++)
      if(getExtChecked(id, extTropCode, i))
        complReqLen++;

    for(int i=0; i<(wyzwCountReq??wyzwCount); i++)
      if(getExtChecked(id, extWyzwCode, i))
        complReqLen++;

    if(allTasks == 0) return 100;

    return (100*complReqLen/allTasks).round();
  }

  @override
  @protected
  set completed(bool value) {
    for(int i=0; i<sprawCount; i++)
      setExtChecked(id, extSprawCode, i, value);

    for(int i=0; i<tropCount; i++)
      setExtChecked(id, extTropCode, i, value);

    for(int i=0; i<(wyzwCountReq??wyzwCount); i++)
      setExtChecked(id, extWyzwCode, i, value);

    super.completed = value;
  }

  RankZHPSim2022Templ(super.data, super.cats);

  @override
  buildHeader(BuildContext context, bool previewOnly) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SingleLineWidget(MdiIcons.cakeVariantOutline, minWiek),

      SingleLineWidget(MdiIcons.clockOutline, czasTrw),

      const SizedBox(height: 3*Dimen.SIDE_MARG),
      SingleHeaderWidget('Idea stopnia', idea, icon: MdiIcons.lightbulbOutline),

      const SizedBox(height: 3*Dimen.SIDE_MARG),
      const SectorSepWidget('Zadania'),
    ],
  );

  @override
  Widget buildFooter(BuildContext context, bool previewOnly){

    late String metoAbbr;

    if(data == rankZhp1Data || data == rankZhp2Data)
      metoAbbr = 'h';
    else if(data == rankZhp3Data || data == rankZhp4Data)
      metoAbbr = 'hs';
    else if(data == rankZhp5Data || data == rankZhp6Data)
      metoAbbr = 'w';

    return Column(
      children: [

        if(sprawCount != 0) Column(
          children: [
            const SizedBox(height: 3*Dimen.SIDE_MARG),

            const SectorSepWidget('Sprawności', showSlidePrompt: true),
            const SizedBox(height: Dimen.SIDE_MARG),

            SprawSelectedListWidget(
              id,
              'Sprawność',
              count: sprawCount,
              rankColor: inProgress?RankData.colors[data]!.avgColor(false):iconDisab_(context),
              checkVisible: inProgress|| completed,
              checkable: inProgress,
              onNewSprawSelected: (_, __, ___) => RankProgressProvider.notify_(context),
              onCheckChanged: (_, __) => RankProgressProvider.notify_(context),
              onSprawStateChanged: () => RankProgressProvider.notify_(context),
              enabled: !previewOnly,
            ),
          ],
        ),

        if(tropCount != 0) Column(
          children: [
            const SizedBox(height: 3*Dimen.SIDE_MARG),

            const SectorSepWidget('Tropy', showSlidePrompt: true),
            const SizedBox(height: Dimen.SIDE_MARG),

            TropSelectedListWidget(
              id,
              'Trop',
              count: tropCount,
              rankColor: inProgress?RankData.colors[data]!.avgColor(false):iconDisab_(context),
              checkVisible: inProgress || completed,
              checkable: inProgress,
              onCheckChanged: (_, __) => RankProgressProvider.notify_(context),
              onTropStateChanged: () => RankProgressProvider.notify_(context),
              enabled: !previewOnly,
            ),

          ],
        ),

        if(wyzwCount != 0) Column(
          children: [
            const SizedBox(height: 3*Dimen.SIDE_MARG),

            const SectorSepWidget('Wyzwania', showSlidePrompt: true),
            const SizedBox(height: Dimen.SIDE_MARG),

            Align(
              alignment: Alignment.topRight,
              child: SimpleButton.from(
                  context: context,
                  icon: MdiIcons.formatListBulleted,
                  text: 'Lista wyzwań ${metoAbbr.toUpperCase()}',
                  onTap: () async {
                    OpenResult result = await openAsset('assets/documents/zhp_sim_2022_wyzwania_$metoAbbr.pdf');
                    if(result.type == ResultType.noAppToOpen) {
                      showAppToast(context, text: 'Nie znaleziono aplikacji do otwarcia pliku PDF');
                      logger.d(result.message);
                    }
                  }
              ),
            ),

            WyzwanieSelectedListWidget(
              id,
              'Wyzwanie',
              count: tropCount,
              rankColor: inProgress?RankData.colors[data]!.avgColor(false):iconDisab_(context),
              checkVisible: inProgress || completed,
              checkable: inProgress,
              onCheckChanged: (_, __) => RankProgressProvider.notify_(context),
              onWyzwanieStateChanged: () => RankProgressProvider.notify_(context),
              enabled: !previewOnly,
            ),

          ],
        ),

      ],
    );
  }
  
  @override
  String get debugClassId => RankZHPSim2022.syncClassId;
  
}

class RankZHPSim2022 extends RankZHPSim2022Templ<RankStateLocal>{

  static List<Rank> all = [
    rankZhp0,
    rankZhp1,
    rankZhp2,
    rankZhp3,
    rankZhp4,
    rankZhp5,
    rankZhp6,
  ];

  static Map<String, Rank> allMap = {for (Rank rank in all) rank.uniqRankName: rank};

  RankZHPSim2022(super.data, super.cats);

  @override
  RankStateLocal get state => RankStateLocal(this);

  @override
  RankZHPSim2022Preview preview(RankStateShared sharedState) => data.buildPreview(sharedState);

  static const String syncClassId = 'rank_zhp_sim_2022';

  @override
  SyncableParam? get parentParam => SyncGetRespNode.rankZHPSim2022Nodes;

}

class RankZHPSim2022Preview extends RankZHPSim2022Templ<RankStateShared>{

  @override
  RankStateShared state;

  @override
  RankZHPSim2022Preview preview(RankStateShared stateShared) => this;

  RankZHPSim2022Preview(super.data, this.state, super.cats);

  @override
  // TODO: Separate the rank template stuff do that preview is not syncable.
  SyncableParam? get parentParam => SyncGetRespNode.rankZHPSim2022Nodes;

}
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_zhp_sim_2022_get_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/sector_sep_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_header_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/header_widgets/single_line_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_local.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file/open_file.dart';

import '../data/data_zhp.dart';

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

  static String? getExtTextKey(String stopId, String code, int position) => ShaPref.getString(ShaPref.SHA_PREF_STOP_ZHP_EXT_TEXT_(stopId, code, position), '');
  static void setExtTextKey(String stopId, String code, int position, String value) => ShaPref.setString(ShaPref.SHA_PREF_STOP_ZHP_EXT_TEXT_(stopId, code, position), value);

  static bool getExtCheckedKey(String stopId, String code, int position) => ShaPref.getBool(ShaPref.SHA_PREF_STOP_ZHP_EXT_COMPLETED_(stopId, code, position), false);
  static void setExtCheckedKey(String stopId, String code, int position, bool checked) => ShaPref.setBool(ShaPref.SHA_PREF_STOP_ZHP_EXT_COMPLETED_(stopId, code, position), checked);

  String get minWiek => data.minWiek;
  String get czasTrw => data.czasTrw;
  String get idea => data.idea;

  int get sprawCount => data.sprawCount;
  int get tropCount => data.tropCount;
  int get wyzwCount => data.wyzwCount;
  int? get wyzwCountReq => data.wyzwCountReq;

  @override
  bool get isReadyToComplete{
    for(int i=0; i<sprawCount; i++)
      if(!getExtCheckedKey(id, extSprawCode, i))
        return false;

    for(int i=0; i<tropCount; i++)
      if(!getExtCheckedKey(id, extTropCode, i))
        return false;

    for(int i=0; i<wyzwCount; i++)
      if(!getExtCheckedKey(id, extWyzwCode, i))
        return false;

    return super.isReadyToComplete;
  }

  @override
  @protected
  set completed(bool value) {
    for(int i=0; i<sprawCount; i++)
      setExtCheckedKey(id, extSprawCode, i, value);

    for(int i=0; i<tropCount; i++)
      setExtCheckedKey(id, extTropCode, i, value);

    for(int i=0; i<wyzwCount; i++)
      setExtCheckedKey(id, extWyzwCode, i, value);

    super.completed = value;
  }

  RankZHPSim2022Templ(super.data, super.cats);

  @override
  buildHeader(BuildContext context) => Column(
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
  Widget buildFooter(BuildContext context){

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

            const SectorSepWidget('Sprawności'),
            const SizedBox(height: Dimen.SIDE_MARG),

            Material(
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                color: cardEnab_(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SimpleButton.from(
                        context: context,
                        icon: MdiIcons.formatListBulleted,
                        text: 'Lista sprawności',
                        onTap: () async {
                          OpenResult result = await openAsset('assets/documents/zhp_sim_2022_sprawnosci.pdf');
                          if(result.type == ResultType.noAppToOpen) {
                            showAppToast(context, text: 'Nie znaleziono aplikacji do otwarcia pliku PDF');
                            logger.d(result.message);
                          }
                        }
                    ),

                    SprawNamesWidget(
                        id,
                        extSprawCode,
                        'Sprawność',
                        count: sprawCount,
                        backgroundColor: Colors.transparent,
                        stopColor: inProgress?RankData.colors[data]!.avgColor(false):iconDisab_(context),
                        checkVisible: inProgress|| completed,
                        checkable: inProgress
                    ),

                  ],
                )
            )
          ],
        ),

        if(tropCount != 0) Column(
          children: [
            const SizedBox(height: 3*Dimen.SIDE_MARG),

            const SectorSepWidget('Tropy'),
            const SizedBox(height: Dimen.SIDE_MARG),

            Material(
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                color: cardEnab_(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SimpleButton.from(
                        context: context,
                        icon: MdiIcons.formatListBulleted,
                        text: 'Lista tropów ${metoAbbr.toUpperCase()}',
                        onTap: () async {
                          OpenResult result = await openAsset('assets/documents/zhp_sim_2022_tropy_$metoAbbr.pdf');
                          if(result.type == ResultType.noAppToOpen) {
                            showAppToast(context, text: 'Nie znaleziono aplikacji do otwarcia pliku PDF');
                            logger.d(result.message);
                          }
                        }
                    ),

                    SprawNamesWidget(
                        id,
                        extTropCode,
                        'Trop',
                        count: tropCount,
                        backgroundColor: Colors.transparent,
                        stopColor: inProgress?RankData.colors[data]!.avgColor(false):iconDisab_(context),
                        checkVisible: inProgress|| completed,
                        checkable: inProgress
                    ),

                  ],
                )
            )
          ],
        ),

        if(wyzwCount != 0) Column(
          children: [
            const SizedBox(height: 3*Dimen.SIDE_MARG),

            const SectorSepWidget('Wyzwania'),
            const SizedBox(height: Dimen.SIDE_MARG),

            Material(
                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                color: cardEnab_(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SimpleButton.from(
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

                    SprawNamesWidget(
                        id,
                        extWyzwCode,
                        'Wyzwanie',
                        count: wyzwCount,
                        reqCount: wyzwCountReq,
                        backgroundColor: Colors.transparent,
                        stopColor: inProgress?RankData.colors[data]!.avgColor(false):iconDisab_(context),
                        checkVisible: inProgress|| completed,
                        checkable: inProgress
                    ),

                  ],
                )
            )

          ],
        ),

      ],
    );
  }

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

}

class RankZHPSim2022Preview extends RankZHPSim2022Templ<RankStateShared>{

  @override
  RankStateShared state;

  @override
  RankZHPSim2022Preview preview(RankStateShared stateShared) => this;

  RankZHPSim2022Preview(super.data, this.state, super.cats);

}
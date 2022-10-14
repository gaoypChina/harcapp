import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_get_resp.dart';
import 'package:harcapp/_new/api/sync_resp_body/rank_task_resp.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhp_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhp_sim_2022.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhr_c.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhr_d.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_state_shared.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie_sprawnosci_common/rank_spraw_template.dart';
import 'package:harcapp/_new/cat_page_guide_book/providers.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:intl/intl.dart';

import '../../../../logger.dart';
import '../../../../sync/syncable_new.dart';
import '../data/data_zhp.dart';
import '../data/data_zhp_old.dart';
import '../data/data_zhr_c.dart';
import '../data/data_zhr_d.dart';
import '../rank_tile_widget_template.dart';

class RankColors{

  final Color colorStartLight;
  final Color colorEndLight;
  final Color colorStartDark;
  final Color colorEndDark;

  const RankColors(this.colorStartLight, this.colorEndLight, this.colorStartDark, this.colorEndDark);

  Color avgColor(bool isDark){

    Color colorStart = start(isDark);
    Color colorEnd = end(isDark);

    return Color.fromARGB(
        255,
        (colorStart.red + colorEnd.red)~/2,
        (colorStart.green + colorEnd.green)~/2,
        (colorStart.blue + colorEnd.blue)~/2
    );
  }

  Color start(bool isDark) => isDark?colorStartDark:colorStartLight;
  Color end(bool isDark) => isDark?colorEndDark:colorEndLight;
}

abstract class RankData{

  static const String ZUCH_RANK_ZHR_STREF_COLOR_1 = 'Kolor czerwony';
  static const String ZUCH_RANK_ZHR_STREF_TITLE_1 = 'Rozwój duchowości zucha';

  static const String ZUCH_RANK_ZHR_STREF_COLOR_2 = 'Kolor żółty';
  static const String ZUCH_RANK_ZHR_STREF_TITLE_2 = 'Rozwój obywatelski i społeczny zucha';

  static const String ZUCH_RANK_ZHR_STREF_COLOR_3 = 'Kolor zielony';
  static const String ZUCH_RANK_ZHR_STREF_TITLE_3 = 'Rozwój zucha w przyrodzie';

  static const String ZUCH_RANK_ZHR_STREF_COLOR_4 = 'Kolor niebieski';
  static const String ZUCH_RANK_ZHR_STREF_TITLE_4 = 'Rozwój zucha w rodzinie';

  static const String ZUCH_RANK_ZHR_STREF_COLOR_5 = 'Kolor fioletowy';
  static const String ZUCH_RANK_ZHR_STREF_TITLE_5 = 'Rozwój zucha w grupie rówieśniczej';

  static const String GROUP_TITLE_OGOLNE = 'Ogólne';
  static const String GROUP_TITLE_POZOSTALE = 'Pozostałe';

  static const IconData iconTozsHarcerska = MdiIcons.fleurDeLis;
  static const IconData iconObozow = MdiIcons.tent;
  static const IconData iconPierwszaPomoc = MdiIcons.hospitalBox;
  static const IconData iconZywienie = MdiIcons.noodles;
  static const IconData iconZdrowie = MdiIcons.heartPulse;
  static const IconData iconSwiatCyfrowy = MdiIcons.cellphoneLink;
  static const IconData iconEkologia = MdiIcons.tree;
  static const IconData iconEkonomia = MdiIcons.gold;
  static const IconData iconPostawaObyw = MdiIcons.accountTie;
  static const IconData iconZaradnosc = MdiIcons.hammerScrewdriver;

  static const IconData iconRodzina = MdiIcons.home;
  static const IconData iconPracaNadSoba = MdiIcons.accountCog;
  static const IconData iconTechHarc = MdiIcons.knifeMilitary;
  static const IconData iconSluzba = MdiIcons.handshake;
  static const IconData iconKoncowa = MdiIcons.stopCircle;

  static const IconData iconSilaCiala = MdiIcons.human;
  static const IconData iconSilaRozumu = MdiIcons.bookEducation;
  static const IconData iconSilaDucha = MdiIcons.handsPray;

  static const IconData iconCatRozwoj = MdiIcons.trendingUp;
  static const IconData iconCatCharakter = MdiIcons.candle;
  static const IconData iconCatHarcWtajem = MdiIcons.fleurDeLis;
  static const IconData iconCatSluzba = MdiIcons.handshakeOutline;
  static const IconData iconCatSylwetka = MdiIcons.faceManShimmerOutline;
  static const IconData iconCatProbaKoncowa = MdiIcons.flagCheckered;
  static const IconData iconCatIdea = MdiIcons.starOutline;
  static const IconData iconCatStopZadania = MdiIcons.checkboxMarkedCircleOutline;

  static RankColors colorsZhp = RankColors(
    Colors.lightGreenAccent,
    Colors.teal[600]!,
    Colors.lightGreen[800]!,
    Colors.teal[900]!,
  );

  static RankColors colorsZhpOldZuch = RankColors(
    Colors.grey[700]!,
    ColorPackBlack.CARD_ENAB,
    Colors.grey[400]!,
    Colors.grey[200]!,
  );

  static RankColors colorsZhpOld = RankColors(
    ColorPackBlack.CARD_ENAB,
    Colors.grey[700]!,
    Colors.grey[200]!,
    Colors.grey[400]!,
  );

  static RankColors colorsZhrDZuch = RankColors(
    Colors.purple[500]!,
    Colors.pink[500]!,
    Colors.purple[900]!,
    Colors.pink[900]!,
  );

  static RankColors colorsZhrD = RankColors(
    Colors.pink[500]!,
    Colors.purple[500]!,
    Colors.pink[900]!,
    Colors.purple[900]!,
  );

  static RankColors colorsZhrCZuch = RankColors(
    Colors.red[500]!,
    Colors.orange[500]!,
    Colors.red[900]!,
    Colors.orange[900]!,
  );

  static RankColors colorsZhrC = RankColors(
    Colors.orange[500]!,
    Colors.red[500]!,
    Colors.orange[900]!,
    Colors.red[900]!,
  );

  static Map<RankData, RankColors> colors = {
    rankZhpOldZuch1Data: colorsZhpOldZuch,
    rankZhpOldZuch2Data: colorsZhpOldZuch,
    rankZhpOldZuch3Data: colorsZhpOldZuch,

    rankZhpOld0Data: colorsZhpOld,
    rankZhp1Data: colorsZhp,
    rankZhpOld1Data: colorsZhpOld,
    rankZhp2Data: colorsZhp,
    rankZhpOld2Data: colorsZhpOld,
    rankZhp3Data: colorsZhp,
    rankZhpOld3Data: colorsZhpOld,
    rankZhp4Data: colorsZhp,
    rankZhpOld4Data: colorsZhpOld,
    rankZhp5Data: colorsZhp,
    rankZhpOld5Data: colorsZhpOld,
    rankZhp6Data: colorsZhp,
    rankZhpOld6Data: colorsZhpOld,

    rankZhrZuchD1Data: colorsZhrDZuch,
    rankZhrZuchD2Data: colorsZhrDZuch,
    rankZhrZuchD3Data: colorsZhrDZuch,

    rankZhrHarcD0Data: colorsZhrD,
    rankZhrHarcD0WData: colorsZhrD,
    rankZhrHarcD0SData: colorsZhrD,
    rankZhrHarcD1Data: colorsZhrD,
    rankZhrHarcD2Data: colorsZhrD,
    rankZhrHarcD2SData: colorsZhrD,
    rankZhrHarcD3Data: colorsZhrD,
    rankZhrHarcD3SData: colorsZhrD,
    rankZhrHarcD4Data: colorsZhrD,
    rankZhrHarcD4SData: colorsZhrD,
    rankZhrHarcD5Data: colorsZhrD,

    rankZhrZuchC1Data: colorsZhrCZuch,
    rankZhrZuchC2Data: colorsZhrCZuch,
    rankZhrZuchC3Data: colorsZhrCZuch,

    rankZhrHarcC0Data: colorsZhrC,
    rankZhrHarcC0SData: colorsZhrC,
    rankZhrHarcC1Data: colorsZhrC,
    rankZhrHarcC2Data: colorsZhrC,
    rankZhrHarcC3Data: colorsZhrC,
    rankZhrHarcC4Data: colorsZhrC,
    rankZhrHarcC5Data: colorsZhrC,
  };

  static const iconSizeBig = RankTileWidgetTemplate.defTileIconSize;
  static const iconSizeSmall = 24.0;

  static Map<RankData, Tuple2<List<IconData>, double>> iconSizeMap = {

    rankZhpOldZuch1Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhpOldZuch2Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),
    rankZhpOldZuch3Data: const Tuple2([MdiIcons.star, MdiIcons.star, MdiIcons.star], iconSizeSmall),

    rankZhpOld0Data: const Tuple2([MdiIcons.crossBolnisi], 28.0),
    rankZhp1Data: const Tuple2([MdiIcons.minus], iconSizeBig),
    rankZhpOld1Data: const Tuple2([MdiIcons.minus], iconSizeBig),
    rankZhp2Data: const Tuple2([MdiIcons.equal], iconSizeBig),
    rankZhpOld2Data: const Tuple2([MdiIcons.equal], iconSizeBig),
    rankZhp3Data: const Tuple2([MdiIcons.chevronUp], iconSizeBig),
    rankZhpOld3Data: const Tuple2([MdiIcons.chevronUp], iconSizeBig),
    rankZhp4Data: const Tuple2([MdiIcons.chevronDoubleUp], iconSizeBig),
    rankZhpOld4Data: const Tuple2([MdiIcons.chevronDoubleUp], iconSizeBig),
    rankZhp5Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhpOld5Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhp6Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),
    rankZhpOld6Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),

    rankZhrZuchD1Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhrZuchD2Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),
    rankZhrZuchD3Data: const Tuple2([MdiIcons.star, MdiIcons.star, MdiIcons.star], iconSizeSmall),

    rankZhrHarcD0Data: const Tuple2([MdiIcons.crossBolnisi], 28.0),
    rankZhrHarcD0WData: const Tuple2([MdiIcons.crossBolnisi], 28.0),
    rankZhrHarcD0SData: const Tuple2([MdiIcons.crossBolnisi], 28.0),
    rankZhrHarcD1Data: const Tuple2([MdiIcons.minus], iconSizeBig),
    rankZhrHarcD2Data: const Tuple2([MdiIcons.equal], iconSizeBig),
    rankZhrHarcD2SData: const Tuple2([MdiIcons.equal], iconSizeBig),
    rankZhrHarcD3Data: const Tuple2([MdiIcons.chevronUp], iconSizeBig),
    rankZhrHarcD3SData: const Tuple2([MdiIcons.chevronUp], iconSizeBig),
    rankZhrHarcD4Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhrHarcD4SData: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhrHarcD5Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),

    rankZhrZuchC1Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhrZuchC2Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),
    rankZhrZuchC3Data: const Tuple2([MdiIcons.star, MdiIcons.star, MdiIcons.star], iconSizeSmall),

    rankZhrHarcC0Data: const Tuple2([MdiIcons.crossBolnisi], 28.0),
    rankZhrHarcC0SData: const Tuple2([MdiIcons.crossBolnisi], 28.0),
    rankZhrHarcC1Data: const Tuple2([MdiIcons.minus], iconSizeBig),
    rankZhrHarcC2Data: const Tuple2([MdiIcons.equal], iconSizeBig),
    rankZhrHarcC3Data: const Tuple2([MdiIcons.chevronUp], iconSizeBig),
    rankZhrHarcC4Data: const Tuple2([MdiIcons.star], iconSizeSmall),
    rankZhrHarcC5Data: const Tuple2([MdiIcons.star, MdiIcons.star], iconSizeSmall),

  };

  static const String uidSep = '\$';

  String get uniqRankName => version.toString() + uidSep + id + uidSep + org.name;

  final String titleMale;
  final String? titleFemale;

  final int version;
  final Org org;
  final String id;

  final List<RankCatData> catData;

  RankData({
    required this.titleMale,
    this.titleFemale,
    required this.version,
    required this.org,
    required this.id,
    required this.catData,
  });

  Rank build();
  Rank buildPreview(RankStateShared state);

}

abstract class Rank<TData extends RankData, TResp extends RankGetResp, TState extends RankState> extends RankSprawTemplate<TResp>{

  static Map<Rank, List<UserData>> sharedUsers = {};

  static List<Rank> get allSyncClassIdDef{
    List<Rank> allRanks = [];

    allRanks.addAll(RankDef.all);
    allRanks.addAll(RankZHPOld.all);
    allRanks.addAll(RankZHRD.all);
    allRanks.addAll(RankZHRC.all);

    return allRanks;
  }

  static List<Rank> get all{
    List<Rank> allRanks = [];

    allRanks.addAll(allSyncClassIdDef);
    allRanks.addAll(RankZHPSim2022.all);

    return allRanks;
  }

  static Map<String, Rank> allMap = {for(Rank rank in all) rank.uniqRankName: rank};

  static Rank? last(Org org, {bool zuch = false, bool newSim = true}){

    switch(org){
      case Org.zhp:
        if(newSim)
          if(!zuch) {
            if (rankZhp6.inProgress|| rankZhp6.completed) return rankZhp6;
            if (rankZhp5.inProgress|| rankZhp5.completed) return rankZhp5;
            if (rankZhp4.inProgress|| rankZhp4.completed) return rankZhp4;
            if (rankZhp3.inProgress|| rankZhp3.completed) return rankZhp3;
            if (rankZhp2.inProgress|| rankZhp2.completed) return rankZhp2;
            if (rankZhp1.inProgress|| rankZhp1.completed) return rankZhp1;
            if (rankZhp0.inProgress|| rankZhp0.completed) return rankZhp0;
          } else {
            //if (STOP_ZHP_OLD_ZUCH_3.inProgress || STOP_ZHP_OLD_ZUCH_3.completed)
            //  return STOP_ZHP_OLD_ZUCH_3;
            //if (STOP_ZHP_OLD_ZUCH_2.inProgress || STOP_ZHP_OLD_ZUCH_2.completed)
            //  return STOP_ZHP_OLD_ZUCH_2;
            //if (STOP_ZHP_OLD_ZUCH_1.inProgress || STOP_ZHP_OLD_ZUCH_1.completed)
            //  return STOP_ZHP_OLD_ZUCH_1;
          }
        else
        if(!zuch) {
          if (rankZhpOld6.inProgress|| rankZhpOld6.completed) return rankZhpOld6;
          if (rankZhpOld5.inProgress|| rankZhpOld5.completed) return rankZhpOld5;
          if (rankZhpOld4.inProgress|| rankZhpOld4.completed) return rankZhpOld4;
          if (rankZhpOld3.inProgress|| rankZhpOld3.completed) return rankZhpOld3;
          if (rankZhpOld2.inProgress|| rankZhpOld2.completed) return rankZhpOld2;
          if (rankZhpOld1.inProgress|| rankZhpOld1.completed) return rankZhpOld1;
          if (rankZhpOld0.inProgress|| rankZhpOld0.completed) return rankZhpOld0;
        }else {
          if (rankZhpOldZuch3.inProgress|| rankZhpOldZuch3.completed)
            return rankZhpOldZuch3;
          if (rankZhpOldZuch2.inProgress|| rankZhpOldZuch2.completed)
            return rankZhpOldZuch2;
          if (rankZhpOldZuch1.inProgress|| rankZhpOldZuch1.completed)
            return rankZhpOldZuch1;
        }
        break;
      case Org.zhr_c:
        if(!zuch) {
          if (rankZhrHarcC5.inProgress|| rankZhrHarcC5.completed)
            return rankZhrHarcC5;
          if (rankZhrHarcC4.inProgress|| rankZhrHarcC4.completed)
            return rankZhrHarcC4;
          if (rankZhrHarcC3.inProgress|| rankZhrHarcC3.completed)
            return rankZhrHarcC3;
          if (rankZhrHarcC2.inProgress|| rankZhrHarcC2.completed)
            return rankZhrHarcC2;
          if (rankZhrHarcC1.inProgress|| rankZhrHarcC1.completed)
            return rankZhrHarcC1;
          if (rankZhrHarcC0S.inProgress|| rankZhrHarcC0S.completed)
            return rankZhrHarcC0S;
          if (rankZhrHarcC0.inProgress|| rankZhrHarcC0.completed)
            return rankZhrHarcC0;
        }else {
          if (rankZhrZuchC3.inProgress|| rankZhrZuchC3.completed)
            return rankZhrZuchC3;
          if (rankZhrZuchC2.inProgress|| rankZhrZuchC2.completed)
            return rankZhrZuchC2;
          if (rankZhrZuchC1.inProgress|| rankZhrZuchC1.completed)
            return rankZhrZuchC1;
        }
        break;
      case Org.zhr_d:
        if(!zuch) {
          if (rankZhrHarcD5.inProgress|| rankZhrHarcD5.completed)
            return rankZhrHarcD5;
          if (rankZhrHarcD4S.inProgress|| rankZhrHarcD4S.completed)
            return rankZhrHarcD4S;
          if (rankZhrHarcD4.inProgress|| rankZhrHarcD4.completed)
            return rankZhrHarcD4;
          if (rankZhrHarcD3S.inProgress|| rankZhrHarcD3S.completed)
            return rankZhrHarcD3S;
          if (rankZhrHarcD3.inProgress|| rankZhrHarcD3.completed)
            return rankZhrHarcD3;
          if (rankZhrHarcD2S.inProgress|| rankZhrHarcD2S.completed)
            return rankZhrHarcD2S;
          if (rankZhrHarcD2.inProgress|| rankZhrHarcD2.completed)
            return rankZhrHarcD2;
          if (rankZhrHarcD1.inProgress|| rankZhrHarcD1.completed)
            return rankZhrHarcD1;
          if (rankZhrHarcD0S.inProgress|| rankZhrHarcD0S.completed)
            return rankZhrHarcD0S;
          if (rankZhrHarcD0W.inProgress|| rankZhrHarcD0W.completed)
            return rankZhrHarcD0W;
          if (rankZhrHarcD0.inProgress|| rankZhrHarcD0.completed)
            return rankZhrHarcD0;
        }else {
          if (rankZhrZuchD3.inProgress|| rankZhrZuchD3.completed)
            return rankZhrZuchD3;
          if (rankZhrZuchD2.inProgress|| rankZhrZuchD2.completed)
            return rankZhrZuchD2;
          if (rankZhrZuchD1.inProgress|| rankZhrZuchD1.completed)
            return rankZhrZuchD1;
        }
        break;
      case Org.fse:
        break;
    }
    return null;
  }

  static Rank? fromStateShared(String? uniqRankName, RankStateShared stateShared){

    stateShared.dump();

    Rank? preview = Rank.allMap[uniqRankName!]?.preview(stateShared);
    if(preview == null){
      logger.w('Cannot find uniqRankName: $uniqRankName');
      return null;
    }

    return preview;

  }

  Rank<TData, TResp, RankStateShared> preview(RankStateShared state);

  String get uniqRankName => data.uniqRankName;

  @override
  bool get inProgress => state.inProgress;
  @override
  @protected
  set inProgress(bool value) => state.inProgress = value;
  @override
  void changeInProgress(BuildContext context, {bool? value, bool localOnly = false}){

    value ??= !inProgress;
    inProgress = value;

    setSingleState(paramInProgress, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();

    Provider.of<RankProv>(context, listen: false).notify();
  }

  @override
  DateTime? get completionDate => state.completionDate;
  @override
  @protected
  set completionDate(DateTime? value) => state.completionDate = value;
  @override
  void setCompletionDate(DateTime value, {localOnly = false}){
    completionDate = value;
    setSingleState(paramCompletionDate, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();
  }

  @override
  bool get completed => state.completed;
  @override
  @protected
  set completed(bool value) => state.completed = value;
  @override
  void changeCompleted(BuildContext context, {bool? value, bool localOnly = false}){

    value ??= !completed;
    completed = value;

    setSingleState(paramCompleted, SyncableParamSingle_.stateNotSynced);
    if(!localOnly) synchronizer.post();

    Provider.of<RankProv>(context, listen: false).notify();
  }

  final TData data;
  TState get state;

  String get titleMale => data.titleMale;
  String? get titleFemale => data.titleFemale;

  int get version => data.version;
  Org get org => data.org;
  String get id => data.id;

  List<RankCat>? _cats;
  List<RankCat>? get cats => _cats;
  set cats(List<RankCat>? value){
    _cats = value;
    _catsMap = {for (RankCat cat in _cats??[]) cat.index: cat};
  }
  Map<int?, RankCat> _catsMap;

  Rank(this.data, this._cats):_catsMap = {for (RankCat cat in _cats??[]) cat.index: cat};

  Widget buildHeader(BuildContext context) => Container();
  Widget buildFooter(BuildContext context) => Container();

  @override
  bool get isReadyToComplete => state.isReadyToComplete;

  @override
  int get completenessPercent => state.completenessPercent;

  static const String paramInProgress = 'inProgress';
  static const String paramCompleted = 'completed';
  static const String paramCompletionDate = 'completionDate';

  @override
  String get paramId => uniqRankName;

  @override
  List<SyncableParam> get childParams{

    List<RankTask> rankTasks = [];

    for(RankCat cat in _cats!)
      for(RankGroup group in cat.groups!)
        for(RankTask task in group.tasks!)
          rankTasks.add(task);

    SyncableParam rankTasksParam = SyncableParamGroup(
        this,
        paramId: 'tasks',
        childParams: rankTasks
    );

    return [

      SyncableParamSingle(
        this,
        paramId: paramInProgress,
        value_: () => inProgress,
      ),

      SyncableParamSingle(
        this,
        paramId: paramCompleted,
        value_: () => completed,
      ),

      SyncableParamSingle(
        this,
        paramId: paramCompletionDate,
        value_: () => completionDate==null?null:DateFormat('yyyy-MM-dd').format(completionDate!),
      ),

      rankTasksParam

    ];

  }



  @override
  void applySyncGetResp(TResp resp) {
    inProgress = resp.inProgress;
    completed = resp.completed;
    completionDate = resp.completionDate;
    for(String taskKey in resp.tasks!.keys){
      RankTaskResp taskResp = resp.tasks![taskKey]!;
      int? catIndex = taskResp.catIndex;
      int? groupIndex = taskResp.groupIndex;
      int? taskIndex = taskResp.taskIndex;
      _catsMap[catIndex]!.groupsMap[groupIndex]!.taskMap[taskIndex]!.applySyncGetResp(resp.tasks![taskKey]!);
    }
  }

}
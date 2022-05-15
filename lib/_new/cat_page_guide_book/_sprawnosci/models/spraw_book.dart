import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhp_harc_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhp_wodne_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhr_harc_c.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhr_harc_d.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SprawBookData{

  static const String ZHP_HARC_OLD_ID = 'zhp_harc_old';
  static const String ZHP_HARC_OLD_WOD_ID = 'zhp_harc_wodne_old';
  static const String ZHR_HARC_C = 'zhr_harc_c';
  static const String ZHR_HARC_D = 'zhr_harc_d';

  static RankColors SPRAW_BOOK_ZHP_ZUCH_OLD_COLOR = RankData.colorsZhpOldZuch;
  static RankColors SPRAW_BOOK_ZHP_HARC_OLD_COLOR = RankData.colorsZhp;
  static RankColors SPRAW_BOOK_ZHP_WODNE_OLD_COLOR = RankColors(Colors.lightBlueAccent, Colors.blue[700]!, Colors.lightBlueAccent, Colors.blue[700]!);
  static RankColors SPRAW_BOOK_ZHR_H_RZE_COLOR = RankData.colorsZhrC;
  static RankColors SPRAW_BOOK_ZHR_H_RKI_COLOR = RankData.colorsZhrD;

  static const IconData SPRAW_BOOK_ZHP_ZUCH_OLD_ICON = MdiIcons.dramaMasks;
  static const IconData SPRAW_BOOK_ZHP_HARC_OLD_ICON = MdiIcons.hammerScrewdriver;
  static const IconData SPRAW_BOOK_ZHP_WODNE_OLD_ICON = MdiIcons.shipWheel;
  static const IconData SPRAW_BOOK_ZHR_H_RZE_ICON = MdiIcons.campfire;
  static const IconData SPRAW_BOOK_ZHR_H_RKI_ICON = MdiIcons.tent;

  static Map<String, RankColors> mapIdColorMap = {
    SprawBookData.ZHP_HARC_OLD_ID: SPRAW_BOOK_ZHP_HARC_OLD_COLOR,
    SprawBookData.ZHP_HARC_OLD_WOD_ID: SPRAW_BOOK_ZHP_WODNE_OLD_COLOR,
    SprawBookData.ZHR_HARC_C: SPRAW_BOOK_ZHR_H_RZE_COLOR,
    SprawBookData.ZHR_HARC_D: SPRAW_BOOK_ZHR_H_RKI_COLOR,
  };

  static Map<String, IconData> mapIdIconMap = {
    SprawBookData.ZHP_HARC_OLD_ID: SPRAW_BOOK_ZHP_HARC_OLD_ICON,
    SprawBookData.ZHP_HARC_OLD_WOD_ID: SPRAW_BOOK_ZHP_WODNE_OLD_ICON,
    SprawBookData.ZHR_HARC_C: SPRAW_BOOK_ZHR_H_RZE_ICON,
    SprawBookData.ZHR_HARC_D: SPRAW_BOOK_ZHR_H_RKI_ICON,
  };

  static SprawBook? get lastViewedSprawBook{
    String? lastViewedSprawBook = ShaPref.getString(ShaPref.SHA_PREF_LAST_VIEWED_SPRAWBOOK, ZHP_HARC_OLD_ID);
    if(lastViewedSprawBook == ZHP_HARC_OLD_ID)
      return sprawBookZHP;
    else if(lastViewedSprawBook == ZHP_HARC_OLD_WOD_ID)
      return sprawBookZHPWodneOld;
    else if(lastViewedSprawBook == ZHR_HARC_C)
      return sprawBookZHRC;
    else if(lastViewedSprawBook == ZHR_HARC_D)
      return sprawBookZHRD;

    return null;
  }
  static set lastViewedSprawBook(SprawBook? sprawBook){
    if(sprawBook == null) ShaPref.remove(ShaPref.SHA_PREF_LAST_VIEWED_SPRAWBOOK);
    else ShaPref.setString(ShaPref.SHA_PREF_LAST_VIEWED_SPRAWBOOK, sprawBook.id);
  }

  final String id;
  final String title;
  final String source;
  final RankColors color;
  final IconData icon;
  final bool male;
  final bool female;

  final List<SprawGroupData> groupData;

  const SprawBookData({
    required this.id,
    required this.title,
    required this.source,
    required this.color,
    required this.icon,
    this.male = false,
    this.female = false,

    required this.groupData,
  });

  SprawBook build(){

    SprawBook sprawBook = SprawBook(this, null);

    List<SprawGroup> groups = [];
    for(int i=0; i<groupData.length; i++)
      groups.add(groupData[i].build(sprawBook));

    sprawBook.groups = groups;

    return sprawBook;

  }

}

class SprawBook{

  SprawBookData data;

  String get id => data.id;
  String get title => data.title;
  String get source => data.source;
  RankColors get color => data.color;
  IconData get icon => data.icon;
  bool get male => data.male;
  bool get female => data.female;

  List<SprawGroup>? groups;

  List<Spraw> get allSpraws{
    List<Spraw> result = [];
    for(SprawGroup group in groups!)
      result.addAll(group.allSpraws);
    return result;
  }

  SprawBook(this.data, this.groups);

}
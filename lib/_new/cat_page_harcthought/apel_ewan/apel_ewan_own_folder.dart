import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/data.dart';

import 'apel_ewan.dart';
import 'apel_ewan_folder.dart';

class ApelEwanOwnFolder extends ApelEwanFolder{

  const ApelEwanOwnFolder({
    required super.id,
    required super.generalApelEwans,
    required super.notedApelEwans
  });

  @override
  bool get isEmpty => generalApelEwanSigla.isEmpty && notedApelEwanSigla.isEmpty;

  static List<String> get allFolderIds => ShaPref.getStringList(ShaPref.SHA_PREF_APEL_EWAN_ALL_FOLDER_IDS, []);
  static set allFolderIds(List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_APEL_EWAN_ALL_FOLDER_IDS, value);

  static List<ApelEwanOwnFolder> get allOwnFolders{
    List<ApelEwanOwnFolder> folders = [];
    for(String folderName in ApelEwanOwnFolder.allFolderIds)
      folders.add(ApelEwanOwnFolder.from(folderName));

    return folders;
  }

  static String getName(String id) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NAME_(id), '');
  static void setName(String id, String value) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NAME_(id), value);
  @override
  String get name => getName(id);
  set name(String value) => setName(id, value);

  static List<String> getGeneralApelEwanSigla(String id) => ShaPref.getStringList(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_GENERAL_SIGLA_(id), []);
  static void setGeneralApelEwanSigla(String id, List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_GENERAL_SIGLA_(id), value);
  List<String> get generalApelEwanSigla => getGeneralApelEwanSigla(id);
  set generalApelEwanSigla(List<String> value) => setGeneralApelEwanSigla(id, value);

  static Map<String, String> getNotedApelEwanSigla(String id) => ShaPref.getMap(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NOTED_SIGLA_(id), {});
  static void setNotedApelEwanSigla(String id, Map<String, String> value) => ShaPref.setMap(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NOTED_SIGLA_(id), value);
  Map<String, String> get notedApelEwanSigla => getNotedApelEwanSigla(id);
  set notedApelEwanSigla(Map<String, String> value) => setNotedApelEwanSigla(id, value);

  static String? getColorKey(String id) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_COLOR_(id), CommonColorData.DEF_COLORS_KEY);

  @override
  String get colorsKey => getColorKey(id)!;

  static void setColorKey(String id, String colorKey) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_COLOR_(id), colorKey);
  set colorsKey(String value) => setColorKey(id, value);

  static CommonColorData getColorData(String id) => CommonColorData.ALL[getColorKey(id)]??
      CommonColorData.ALL[CommonColorData.DEF_COLORS_KEY]!;
  CommonColorData get colorData => getColorData(id);

  static String getIconKey(String id) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_ICON_(id), CommonIconData.DEF_ICON_KEY);
  @override
  String get iconKey => getIconKey(id);

  static void setIconKey(String id, String iconKey) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_ICON_(id), iconKey);
  set iconKey(String value) => setIconKey(id, value);

  static IconData getIcon(String id) => CommonIconData.ALL[getIconKey(id)]??CommonIconData.FOLDER_ICON;

  static void setIcon(String id, IconData icon){

    List<IconData> icons = CommonIconData.ALL.values.toList();
    List<String> iconKeys = CommonIconData.ALL.keys.toList();

    int i;
    for(i=0; i<icons.length; i++)
      if(icons[i] == icon)
        break;

    String iconKey = iconKeys[i];

    ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_ICON_(id), iconKey);
  }
  set icon(IconData value) => setIcon(id, value);

  static ApelEwanOwnFolder from(String id){

    List<ApelEwan> apelEwans = [];
    for(String apelEwanSiglum in getGeneralApelEwanSigla(id)) {
      ApelEwan? apelEwan = allApelEwanMap[apelEwanSiglum];
      if(apelEwan != null) apelEwans.add(apelEwan);
    }
    return ApelEwanOwnFolder(id: id, generalApelEwans: apelEwans, notedApelEwans: {});
  }

  static bool exists(String id) =>  allFolderIds.contains(id);

  static ApelEwanOwnFolder create(){

    int lastUsedId = ShaPref.getInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, 0);
    int _id = lastUsedId + 1;
    ShaPref.setInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, _id);

    String id = _id.toString();

    List<String> allIds = allFolderIds;
    allIds.add(id);
    allFolderIds = allIds;

    return ApelEwanOwnFolder(id: id, generalApelEwans: [], notedApelEwans: {});
  }

  bool delete(){
    List<String> allIds = allFolderIds;
    if(!allIds.contains(id))
      return false;
    allIds.remove(id);
    allFolderIds = allIds;

    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id));

    return true;
  }

  bool addGeneral(String apelEwanSiglum, {bool validate = true}){

    if (validate && generalApelEwanSigla.contains(apelEwanSiglum))
      return false;

    ApelEwan? apelEwan = allApelEwanMap[apelEwanSiglum];
    if(apelEwan == null) return false;

    List<String> _apelEwanSigla = generalApelEwanSigla;
    _apelEwanSigla.add(apelEwanSiglum);
    allApelEwans.add(apelEwan);
    generalApelEwanSigla = _apelEwanSigla;

    return true;
  }

  bool addNoted(String apelEwanSiglum, {required String note, bool validate = true}){

    if (validate && notedApelEwanSigla.containsKey(apelEwanSiglum))
      return false;

    ApelEwan? apelEwan = allApelEwanMap[apelEwanSiglum];
    if(apelEwan == null) return false;

    Map<String, String> _apelEwanSigla = notedApelEwanSigla;
    _apelEwanSigla[apelEwanSiglum] = note;
    notedApelEwans[apelEwan] = note;
    notedApelEwanSigla = _apelEwanSigla;

    return true;
  }
  
  bool removeGeneral(String apelEwanSiglum){
    List<String> _apelEwanSigla = generalApelEwanSigla;
    bool success = _apelEwanSigla.remove(apelEwanSiglum);
    allApelEwans.removeWhere((apelEwan) => apelEwan.siglum == apelEwanSiglum);
    generalApelEwanSigla = _apelEwanSigla;
    
    return success;
  }

  bool removeNoted(String apelEwanSiglum){
    Map<String, String> _apelEwanSigla = notedApelEwanSigla;
    bool success = _apelEwanSigla.remove(apelEwanSiglum) != null;
    notedApelEwans.removeWhere((apelEwan, value) => apelEwan.siglum == apelEwanSiglum);
    allApelEwans.removeWhere((apelEwan) => apelEwan.siglum == apelEwanSiglum);
    notedApelEwanSigla = _apelEwanSigla;

    return success;
  }
  
  @override
  bool operator == (Object other) =>
      other is ApelEwanOwnFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;

}
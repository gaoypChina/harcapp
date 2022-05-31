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
    required super.apelEwans,
    required super.apelEwanNotes
  });

  @override
  int get count => apelEwans.length;

  @override
  bool get isEmpty => apelEwanSigla.isEmpty;

  static List<String> get allFolderIds => ShaPref.getStringList(ShaPref.SHA_PREF_APEL_EWAN_ALL_FOLDER_IDS, []);
  static set allFolderIds(List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_APEL_EWAN_ALL_FOLDER_IDS, value);

  static late List<ApelEwanOwnFolder> allOwnFolders;

  static void loadAllOwnFolders(){
    List<ApelEwanOwnFolder> folders = [];
    for(String folderName in ApelEwanOwnFolder.allFolderIds)
      folders.add(ApelEwanOwnFolder.from(folderName));

    allOwnFolders = folders;
  }

  static void addOwnFolder(ApelEwanOwnFolder folder){
    allOwnFolders.add(folder);
  }

  static String getName(String id) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NAME_(id), '');
  static Future<void> setName(String id, String value) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NAME_(id), value);
  @override
  String get name => getName(id);
  set name(String value) => setName(id, value);

  static List<String> getApelEwanFolderSigla(String id) => ShaPref.getStringList(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_SIGLA_(id), []);
  static Future<void> setApelEwanFolderSigla(String id, List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_SIGLA_(id), value);
  List<String> get apelEwanSigla => getApelEwanFolderSigla(id);
  set apelEwanSigla(List<String> value) => setApelEwanFolderSigla(id, value);

  static String? getColorsKey(String id) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_COLOR_(id), CommonColorData.DEF_COLORS_KEY);

  @override
  String get colorsKey => getColorsKey(id)!;

  static Future<void> setColorsKey(String id, String colorKey) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_COLOR_(id), colorKey);
  set colorsKey(String value) => setColorsKey(id, value);

  static CommonColorData getColorsData(String id) => CommonColorData.ALL[getColorsKey(id)]??
      CommonColorData.ALL[CommonColorData.DEF_COLORS_KEY]!;
  CommonColorData get colorData => getColorsData(id);

  static String getIconKey(String id) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_ICON_(id), CommonIconData.DEF_ICON_KEY);
  @override
  String get iconKey => getIconKey(id);

  static Future<void> setIconKey(String id, String iconKey) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_ICON_(id), iconKey);
  set iconKey(String value) => setIconKey(id, value);

  static IconData getIcon(String id) => CommonIconData.ALL[getIconKey(id)]??CommonIconData.FOLDER_ICON;

  static Future<void> setIcon(String id, IconData icon) async {

    List<IconData> icons = CommonIconData.ALL.values.toList();
    List<String> iconKeys = CommonIconData.ALL.keys.toList();

    int i;
    for(i=0; i<icons.length; i++)
      if(icons[i] == icon)
        break;

    String iconKey = iconKeys[i];

    await ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_ICON_(id), iconKey);
  }
  set icon(IconData value) => setIcon(id, value);

  static String getNote_(String folderId, String siglum) => ShaPref.getString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NOTES_(folderId, siglum), '');
  String getNote(String siglum) => getNote_(id, siglum);

  static Future<void> removeNote_(String folderId, String siglum) => ShaPref.remove(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NOTES_(folderId, siglum));
  Future<void> removeNote(String siglum) => removeNote_(id, siglum);

  static Future<void> setNote_(String folderId, String siglum, String note) => ShaPref.setString(ShaPref.SHA_PREF_APEL_EWAN_FOLDER_NOTES_(folderId, siglum), note);
  Future<void> setNote(String siglum, String note) => setNote_(id, siglum, note);

  static ApelEwanOwnFolder from(String id){

    List<ApelEwan> apelEwans = [];
    for(String apelEwanSiglum in getApelEwanFolderSigla(id)) {
      ApelEwan? apelEwan = allApelEwanMap[apelEwanSiglum];
      if(apelEwan != null) apelEwans.add(apelEwan);
    }

    Map<String, String> apelEwanNotes = {};
    for(ApelEwan apelEwan in apelEwans)
      apelEwanNotes[apelEwan.siglum] = getNote_(id, apelEwan.siglum);

    return ApelEwanOwnFolder(id: id, apelEwans: apelEwans, apelEwanNotes: apelEwanNotes);
  }

  static bool exists(String id) =>  allFolderIds.contains(id);

  static Future<ApelEwanOwnFolder> create({String? name, String? iconKey, String? colorsKey}) async {

    int lastUsedId = ShaPref.getInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, 0);
    int _id = lastUsedId + 1;
    await ShaPref.setInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, _id);

    String id = _id.toString();

    List<String> allIds = allFolderIds;
    allIds.add(id);
    allFolderIds = allIds;

    if(name != null) await setName(id, name);
    if(iconKey != null) await setIconKey(id, iconKey);
    if(colorsKey != null) await setColorsKey(id, colorsKey);

    return ApelEwanOwnFolder(id: id, apelEwans: [], apelEwanNotes: {});
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

  Future<bool> add(String apelEwanSiglum, {bool validate = true}) async {

    if (validate && apelEwanSigla.contains(apelEwanSiglum))
      return false;

    ApelEwan? apelEwan = allApelEwanMap[apelEwanSiglum];
    if(apelEwan == null) return false;

    List<String> _apelEwanSigla = apelEwanSigla;
    _apelEwanSigla.add(apelEwanSiglum);
    apelEwans.add(apelEwan);
    await setApelEwanFolderSigla(id, _apelEwanSigla);
    return true;
  }

  Future<bool> remove(String apelEwanSiglum) async {
    List<String> _apelEwanSigla = apelEwanSigla;
    bool success = _apelEwanSigla.remove(apelEwanSiglum);
    apelEwans.removeWhere((apelEwan) => apelEwan.siglum == apelEwanSiglum);
    await setApelEwanFolderSigla(id, _apelEwanSigla);

    return success;
  }

  @override
  bool operator == (Object other) =>
      other is ApelEwanOwnFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;

}

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';

import '../../../details/app_settings.dart';

class SprawFolder{
  
  final String id;
  final List<Spraw> spraws;

  const SprawFolder({required this.id, required this.spraws});

  static const String omegaFolderId = '__omega__';
  static const String omegaFolderName = 'Zapisane';
  static String get omegaFolderColorKey => AppSettings.isDark?'white':'black';
  static CommonColorData? get omegaFolderColor => getColorData(omegaFolderColorKey);
  static const String omegaFolderIconKey = 'bookCheckOutline';
  static IconData? get omegaFolderIcon => getIcon(omegaFolderId);

  static SprawFolder get omega => SprawFolder.from(omegaFolderId);

  static List<String> get ownFolderIds => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_IDS, []);
  static List<String> get allFolderIds{
    List<String> folderNames = ownFolderIds;
    folderNames.insert(0, omegaFolderId);
    return folderNames;
  }

  static List<SprawFolder> get allFolders{
    List<SprawFolder> folders = [];
    for(String folderName in SprawFolder.allFolderIds)
      folders.add(SprawFolder.from(folderName));

    return folders;
  }

  static set ownFolderIds(List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_IDS, value);

  static String getName(String id) =>
      id == omegaFolderId?omegaFolderName:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_FOLDER_NAME_(id), '');

  static void setName(String id, String value) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_NAME_(id), value);

  String get name => getName(id);
  set name(String value) => setName(id, value);

  static List<String> getSprawUIDs(String id) => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id), []);
  static void setSprawUIDs(String id, List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id), value);

  List<String> get sprawUIDs => getSprawUIDs(id);
  set sprawUIDs(List<String> value) => setSprawUIDs(id, value);

  static String? getColorKey(String id) =>
      id == omegaFolderId? omegaFolderColorKey:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_FOLDER_COLOR_(id), CommonColorData.DEF_COLORS_KEY);

  String get colorsKey => getColorKey(id)!;

  static void setColorKey(String id, String colorKey) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_COLOR_(id), colorKey);
  set colorsKey(String value) => setColorKey(id, value);

  static CommonColorData getColorData(String id) => CommonColorData.ALL[getColorKey(id)]??
      CommonColorData.ALL[CommonColorData.DEF_COLORS_KEY]!;
  CommonColorData get colorData => getColorData(id);

  static String getIconKey(String id) =>
      id == omegaFolderId?
      omegaFolderIconKey:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id), CommonIconData.DEF_ICON_KEY);
  String get iconKey => getIconKey(id);

  static void setIconKey(String id, String iconKey) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id), iconKey);
  set iconKey(String value) => setIconKey(id, value);

  static IconData getIcon(String id) => CommonIconData.ALL[getIconKey(id)]??CommonIconData.FOLDER_ICON;
  IconData get icon => CommonIconData.ALL[iconKey]??CommonIconData.FOLDER_ICON;

  static void setIcon(String id, IconData icon){

    List<IconData> icons = CommonIconData.ALL.values.toList();
    List<String> iconKeys = CommonIconData.ALL.keys.toList();

    int i;
    for(i=0; i<icons.length; i++)
      if(icons[i] == icon)
        break;

    String iconKey = iconKeys[i];

    ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id), iconKey);
  }
  set icon(IconData value) => setIcon(id, value);

  static SprawFolder from(String id){

    List<Spraw> spraws = [];
    for(String sprawUID in getSprawUIDs(id)) {
      Spraw? spraw = Spraw.fromUID(sprawUID);
      if(spraw != null) spraws.add(spraw);
    }
    return SprawFolder(id: id, spraws: spraws);
  }

  static bool exists(String id) =>  allFolderIds.contains(id);

  static SprawFolder create(){

    int lastUsedId = ShaPref.getInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, 0);
    int _id = lastUsedId + 1;
    ShaPref.setInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, _id);

    String id = _id.toString();

    List<String> allIds = ownFolderIds;
    allIds.add(id);
    ownFolderIds = allIds;

    return SprawFolder(id: id, spraws: []);
  }

  bool delete(){
    List<String> all = ownFolderIds;
    if(!all.contains(id))
      return false;
    all.remove(id);
    ownFolderIds = all;

    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id));
    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id));
    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_FOLDER_COLOR_(id));
    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_FOLDER_NAME_(id));

    return true;
  }
  
  bool add(String sprawUID, {bool validate = true}){

    if(validate && sprawUIDs.contains(sprawUID))
      return false;

    Spraw? spraw = Spraw.fromUID(sprawUID);

    if(spraw == null) return false;

    List<String> _sprawUIDs = getSprawUIDs(id);

    _sprawUIDs.add(sprawUID);
    spraws.add(spraw);
    sprawUIDs = _sprawUIDs;
    
    return true;
  }

  bool remove(String sprawUniqName){

    bool success = sprawUIDs.remove(sprawUniqName);
    List<String> _sprawUIDs = getSprawUIDs(id);

    _sprawUIDs.remove(sprawUniqName);
    spraws.removeWhere((spraw) => spraw.uniqName == sprawUniqName);

    sprawUIDs = _sprawUIDs;

    return success;
  }

  @override
  bool operator == (Object other) =>
      other is SprawFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;


}
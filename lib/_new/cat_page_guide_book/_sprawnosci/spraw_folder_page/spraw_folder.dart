import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';

import '../../../details/app_settings.dart';

class SprawFolder extends Folder{
  
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

  static set ownFolderIds(List<String> value) => setOwnFolderIds(value);
  static Future<void> setOwnFolderIds(List<String> value) async => await ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_IDS, value);

  static String getName(String id) =>
      id == omegaFolderId?omegaFolderName:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_FOLDER_NAME_(id), '');

  static Future<void> setName(String id, String value) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_NAME_(id), value);

  @override
  String get name => getName(id);

  set name(String value) => setName(id, value);

  static List<String> getSprawUIDs(String id) => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id), []);
  static void setSprawUIDs(String id, List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id), value);

  List<String> get sprawUIDs => getSprawUIDs(id);
  set sprawUIDs(List<String> value) => setSprawUIDs(id, value);

  @override
  int get count => sprawUIDs.length;

  static String? getColorKey(String id) =>
      id == omegaFolderId? omegaFolderColorKey:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_FOLDER_COLOR_(id), CommonColorData.DEF_COLORS_KEY);

  @override
  String get colorsKey => getColorKey(id)!;

  static Future<void> setColorKey(String id, String colorKey) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_COLOR_(id), colorKey);
  set colorsKey(String value) => setColorKey(id, value);

  static CommonColorData getColorData(String id) => CommonColorData.ALL[getColorKey(id)]??
      CommonColorData.ALL[CommonColorData.DEF_COLORS_KEY]!;

  static String getIconKey(String id) =>
      id == omegaFolderId?
      omegaFolderIconKey:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id), CommonIconData.DEF_ICON_KEY);

  @override
  String get iconKey => getIconKey(id);

  static Future<void> setIconKey(String id, String iconKey) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id), iconKey);
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

    await ShaPref.setString(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id), iconKey);
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

  static bool exists(String id) => allFolderIds.contains(id);

  static Future<SprawFolder> create({String? name, String? iconKey, String? colorsKey}) async {

    int lastUsedId = ShaPref.getInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, 0);
    int _id = lastUsedId + 1;
    await ShaPref.setInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, _id);

    String id = _id.toString();

    List<String> allIds = ownFolderIds;
    allIds.add(id);
    await setOwnFolderIds(allIds);

    if(name != null) await setName(id, name);
    if(iconKey != null) await setIconKey(id, iconKey);
    if(colorsKey != null) await setColorKey(id, colorsKey);

    return SprawFolder(id: id, spraws: []);
  }

  Future<bool> delete() async {
    List<String> allIds = ownFolderIds;
    if(!allIds.contains(id))
      return false;
    allIds.remove(id);
    await setOwnFolderIds(allIds);

    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id));
    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_FOLDER_ICON_(id));
    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_FOLDER_COLOR_(id));
    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_FOLDER_NAME_(id));

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
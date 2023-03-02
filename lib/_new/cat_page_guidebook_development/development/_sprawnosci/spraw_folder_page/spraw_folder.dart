import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


abstract class BaseSprawFolder extends Folder{

  static List<String> get allFolderIds{
    List<String> folderNames = OwnSprawFolder.ownFolderIds;
    folderNames.insert(0, SavedSprawFolder().id);
    folderNames.insert(1, InProgressSprawFolder().id);
    folderNames.insert(2, CompletedSprawFolder().id);
    return folderNames;
  }
  static bool exists(String id) => allFolderIds.contains(id);

  static List<BaseSprawFolder> get allFolders{
    List<BaseSprawFolder> folders = [
      SavedSprawFolder(),
      InProgressSprawFolder(),
      CompletedSprawFolder()
    ];
    for(String folderName in OwnSprawFolder.ownFolderIds)
      folders.add(OwnSprawFolder.from(folderName));

    return folders;
  }

  String get id;
  List<Spraw> get spraws;

  const BaseSprawFolder();

  List<String> get sprawUIDs => BaseSprawFolder.getSprawUIDs(id);
  set sprawUIDs(List<String> value) => BaseSprawFolder.setSprawUIDs(id, value);
  static List<String> getSprawUIDs(String id) => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id), []);
  static void setSprawUIDs(String id, List<String> value) => ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id), value);

  bool add(String sprawUniqName, {bool validate = true});
  bool remove(String sprawUniqName);
  FutureOr<bool> delete();

}

class SavedSprawFolder extends BaseSprawFolder{

  @override
  String get id => '__omega__';

  @override
  String get colorsKey => AppSettings.isDark?'white':'black';

  @override
  int get count => BaseSprawFolder.getSprawUIDs(id).length;

  @override
  String get iconKey => 'bookCheckOutline';

  @override
  IconData get icon => MdiIcons.bookCheckOutline;

  @override
  String get name => 'Zapisane';

  @override
  List<Spraw> get spraws{
    List<Spraw> result = [];
    for(String sprawUID in sprawUIDs) {
      Spraw? spraw = Spraw.fromUID(sprawUID);
      if(spraw != null) result.add(spraw);
    }
    return result;
  }

  void changeSavedInOmega(String sprawUniqName, {bool? value}){

    List<String> updatedSprawUniqNames = sprawUIDs;

    value ??= !updatedSprawUniqNames.contains(sprawUniqName);

    if (value) {
      if (!updatedSprawUniqNames.contains(sprawUniqName)) updatedSprawUniqNames.insert(0, sprawUniqName);
    } else
      updatedSprawUniqNames.remove(sprawUniqName);

    BaseSprawFolder.setSprawUIDs(id, updatedSprawUniqNames);
  }

  @override
  bool add(String sprawUniqName, {bool validate = true}) {
    if(validate && sprawUIDs.contains(sprawUniqName))
      return false;

    List<String> updatedSprawUniqNames = sprawUIDs;
    if (!updatedSprawUniqNames.contains(sprawUniqName)) updatedSprawUniqNames.insert(0, sprawUniqName);
    BaseSprawFolder.setSprawUIDs(id, updatedSprawUniqNames);
    return true;
  }

  @override
  bool remove(String sprawUniqName) {
    List<String> updatedSprawUniqNames = sprawUIDs;
    bool success = updatedSprawUniqNames.remove(sprawUniqName);
    BaseSprawFolder.setSprawUIDs(id, updatedSprawUniqNames);
    return success;
  }

  @override
  bool delete() => false;

}

class InProgressSprawFolder extends BaseSprawFolder{

  @override
  String get id => '__inProgress__';

  @override
  String get colorsKey => AppSettings.isDark?'white':'black';

  @override
  int get count => sprawUIDs.length;

  @override
  String get iconKey => 'timerSandEmpty';

  @override
  IconData get icon => MdiIcons.timerSandEmpty;

  @override
  String get name => 'W trakcie';

  @override
  List<Spraw> get spraws{
    List<Spraw> result = [];
    for(String sprawUID in sprawUIDs) {
      Spraw? spraw = Spraw.fromUID(sprawUID);
      if(spraw != null) result.add(spraw);
    }
    return result;
  }

  @override
  List<String> get sprawUIDs => Spraw.inProgressList;

  @override
  set sprawUIDs(List<String> value) => Spraw.inProgressList = value;

  @override
  bool add(String sprawUniqName, {bool validate = true}) {
    if(validate && sprawUIDs.contains(sprawUniqName))
      return false;

    List<String> updatedSprawUniqNames = sprawUIDs;
    if (!updatedSprawUniqNames.contains(sprawUniqName)) updatedSprawUniqNames.insert(0, sprawUniqName);
    BaseSprawFolder.setSprawUIDs(id, updatedSprawUniqNames);
    return true;
  }

  @override
  bool remove(String sprawUniqName) {
    List<String> updatedSprawUniqNames = sprawUIDs;
    bool success = updatedSprawUniqNames.remove(sprawUniqName);
    sprawUIDs = updatedSprawUniqNames;
    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_IN_PROGRESS_(sprawUniqName));
    return success;
  }

  @override
  bool delete() => false;

}

class CompletedSprawFolder extends BaseSprawFolder{

  @override
  String get id => '__completed__';

  @override
  String get colorsKey => AppSettings.isDark?'white':'black';

  @override
  int get count => sprawUIDs.length;

  @override
  String get iconKey => 'trophyOutline';

  @override
  IconData get icon => MdiIcons.trophyOutline;

  @override
  String get name => 'Zrealizowane';

  @override
  List<Spraw> get spraws{
    List<Spraw> result = [];
    for(String sprawUID in sprawUIDs) {
      Spraw? spraw = Spraw.fromUID(sprawUID);
      if(spraw != null) result.add(spraw);
    }
    return result;
  }

  @override
  List<String> get sprawUIDs => Spraw.completedList;

  @override
  set sprawUIDs(List<String> value) => Spraw.completedList = value;

  @override
  bool add(String sprawUniqName, {bool validate = true}) {
    if(validate && sprawUIDs.contains(sprawUniqName))
      return false;

    List<String> updatedSprawUniqNames = sprawUIDs;
    if (!updatedSprawUniqNames.contains(sprawUniqName)) updatedSprawUniqNames.insert(0, sprawUniqName);
    BaseSprawFolder.setSprawUIDs(id, updatedSprawUniqNames);
    return true;
  }

  @override
  bool remove(String sprawUniqName) {
    List<String> updatedSprawUniqNames = sprawUIDs;
    bool success = updatedSprawUniqNames.remove(sprawUniqName);
    sprawUIDs = updatedSprawUniqNames;
    ShaPref.remove(ShaPref.SHA_PREF_SPRAW_COMPLETED_(sprawUniqName));
    return success;
  }

  @override
  bool delete() => false;

}

class OwnSprawFolder extends BaseSprawFolder{

  final String id;
  final List<Spraw> spraws;

  const OwnSprawFolder({required this.id, required this.spraws});

  static List<String> get ownFolderIds => ShaPref.getStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_IDS, []);
  static set ownFolderIds(List<String> value) => setOwnFolderIds(value);
  static Future<void> setOwnFolderIds(List<String> value) async => await ShaPref.setStringList(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_IDS, value);

  static String _getName(String id) =>
      // id == savedFolderId?savedFolderName:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_NAME_(id), '');

  static Future<void> _setName(String id, String value) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_NAME_(id), value);

  @override
  String get name => _getName(id);

  set name(String value) => _setName(id, value);

  @override
  int get count => sprawUIDs.length;

  static String _getColorKey(String id) =>
      // id == savedFolderId? savedFolderColorKey:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_COLOR_(id), CommonColorData.defColorsKey);

  @override
  String get colorsKey => _getColorKey(id);

  static Future<void> setColorKey(String id, String colorKey) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_COLOR_(id), colorKey);
  set colorsKey(String value) => setColorKey(id, value);

  static CommonColorData getColorData(String id) => CommonColorData.get(_getColorKey(id));

  static String _getIconKey(String id) =>
      // id == savedFolderId?
      // savedFolderIconKey:
      ShaPref.getString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_ICON_(id), CommonIconData.defIconKey);

  @override
  String get iconKey => _getIconKey(id);

  static Future<void> setIconKey(String id, String iconKey) => ShaPref.setString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_ICON_(id), iconKey);
  set iconKey(String value) => setIconKey(id, value);

  static IconData getIcon(String id) => CommonIconData.get(_getIconKey(id), defKey: CommonIconData.folderIconKey);

  static Future<void> setIcon(String id, IconData icon) async {

    List<IconData> icons = CommonIconData.all.values.toList();
    List<String> iconKeys = CommonIconData.all.keys.toList();

    int i;
    for(i=0; i<icons.length; i++)
      if(icons[i] == icon)
        break;

    String iconKey = iconKeys[i];

    await ShaPref.setString(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_ICON_(id), iconKey);
  }
  set icon(IconData value) => setIcon(id, value);

  static OwnSprawFolder from(String id){

    List<Spraw> spraws = [];
    for(String sprawUID in BaseSprawFolder.getSprawUIDs(id)) {
      Spraw? spraw = Spraw.fromUID(sprawUID);
      if(spraw != null) spraws.add(spraw);
    }
    return OwnSprawFolder(id: id, spraws: spraws);
  }

  static Future<OwnSprawFolder> create({String? name, String? iconKey, String? colorsKey}) async {

    int lastUsedId = ShaPref.getInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, 0);
    int _id = lastUsedId + 1;
    await ShaPref.setInt(ShaPref.SHA_PREF_SPRAW_FOLDER_LAST_USED_ID, _id);

    String id = _id.toString();

    List<String> allIds = ownFolderIds;
    allIds.add(id);
    await setOwnFolderIds(allIds);

    if(name != null) await _setName(id, name);
    if(iconKey != null) await setIconKey(id, iconKey);
    if(colorsKey != null) await setColorKey(id, colorsKey);

    return OwnSprawFolder(id: id, spraws: []);
  }

  @override
  Future<bool> delete() async {
    List<String> allIds = ownFolderIds;
    if(!allIds.contains(id))
      return false;
    allIds.remove(id);
    await setOwnFolderIds(allIds);

    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_SPRAW_UIDS_(id));
    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_ICON_(id));
    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_COLOR_(id));
    await ShaPref.remove(ShaPref.SHA_PREF_SPRAW_OWN_FOLDER_NAME_(id));

    return true;
  }

  @override
  bool add(String sprawUniqName, {bool validate = true}){

    if(validate && sprawUIDs.contains(sprawUniqName))
      return false;

    Spraw? spraw = Spraw.fromUID(sprawUniqName);

    if(spraw == null) return false;

    List<String> updatedSprawUniqNames = sprawUIDs;

    updatedSprawUniqNames.add(sprawUniqName);
    spraws.add(spraw);
    sprawUIDs = updatedSprawUniqNames;

    return true;
  }

  @override
  bool remove(String sprawUniqName){

    bool success = sprawUIDs.remove(sprawUniqName);
    List<String> _sprawUIDs = BaseSprawFolder.getSprawUIDs(id);

    _sprawUIDs.remove(sprawUniqName);
    spraws.removeWhere((spraw) => spraw.uniqName == sprawUniqName);

    sprawUIDs = _sprawUIDs;

    return success;
  }

  @override
  bool operator == (Object other) =>
      other is OwnSprawFolder && id == other.id;

  @override
  int get hashCode => id.hashCode;


}
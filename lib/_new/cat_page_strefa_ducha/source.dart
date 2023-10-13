import 'dart:io';

import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';

import '_main.dart';
import 'image_loader.dart';

class Source{

  static List<Source>? all;
  static List<SourceItem>? allItems;

  static void aggrAllDisplayableItems({bool favoriteOnly = false, bool cachedOnly = false}){
    List<SourceItem> allItems = [];

    if(cachedOnly){
      allItems.addAll(ImageLoader.allCachedItems);
      allItems.shuffle();
      allItems = allItems;
      return;
    }

    if(Source.all == null) return;

    for(Source source in Source.all!)
      for(SourceItem item in source.items)
        if(source.display &&
          (!favoriteOnly || item.isFavorite) &&
          (!cachedOnly || item.cachedFile.existsSync()))
          allItems.add(item);

    allItems.shuffle();
    allItems = allItems;
  }

  String uniqId;
  String? sourceUrl;
  String? name;

  List<SourceItem> items;

  Source(this.uniqId, this.sourceUrl, this.name, this.items);

  static Source decode(String code) {
    List<String> lines = code.split('\n');
    List<String> elements = lines[0].split(';');

    String sourceUniqId = elements[0];
    String sourceName = elements[1];
    String sourceUrl = elements[2];

    if(elements.length<3) throw Exception();
    ShaPref.setString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_URL_FROM_UNIQ_ID_(sourceUniqId), sourceUrl);
    ShaPref.setString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_FROM_UNIQ_ID_(sourceUniqId), sourceName);

    List<SourceItem> sourceItems = [];
    for(int i=1; i<lines.length; i++) {
      if(lines[i].isEmpty) continue;
      sourceItems.add(SourceItem(sourceUniqId, sourceName, sourceUrl, lines[i]));
    }
    return Source(sourceUniqId, sourceName, sourceUrl, sourceItems);
  }

  static Source fromFolderName(String folderPath) {
    String folderName = folderPath.split('/').last;
    String? sourceUrl = ShaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_URL_FROM_UNIQ_ID_(folderName), '');
    String? sourceName = ShaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_FROM_UNIQ_ID_(folderName), '');
    return Source(folderName, sourceName, sourceUrl, []);
  }

  void addAll(List<SourceItem> items) => this.items.addAll(items);

  bool get display => ShaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_SOURCE_DISPLAY_(this), true);
  set display(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_DUCHOWE_SOURCE_DISPLAY_(this), value);

  void removeItemsSavedLocally(){
    Directory dir = Directory(getDuchoweSourceFolderPath(uniqId));
    if(dir.existsSync())
      dir.deleteSync(recursive: true);
  }
}

class SourceItem{

  static const String codeSeparator = ';';
  static const String fileSeparator = '~';

  final String sourceUniqId;
  final String? sourceName;
  final String? sourceUrl;
  final String fileName;

  const SourceItem(this.sourceUniqId, this.sourceName, this.sourceUrl, this.fileName);

  static SourceItem? get pinned {
    String? stringCode = ShaPref.getStringOrNull(ShaPref.SHA_PREF_DUCHOWE_ITEM_PINNED);
    if(stringCode == null) return null;
    else return SourceItem.decode(stringCode);
  }

  static set pinned(SourceItem? value) {
    if(value == null) ShaPref.remove(ShaPref.SHA_PREF_DUCHOWE_ITEM_PINNED);
    else ShaPref.setString(ShaPref.SHA_PREF_DUCHOWE_ITEM_PINNED, value.toString());
  }

  static List<SourceItem> favoriteItems({bool displayableOnly = false}){
    List<String> itemCodes = ShaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);

    List<SourceItem> result = [];

    for(String itemCode in itemCodes) {
      SourceItem item = SourceItem.decode(itemCode);
      Source source = Source.decode(itemCode);
      if(source.display) result.add(item);
    }

    return result;
  }

  static SourceItem decode(String code) {
    List<String> elements = code.split(codeSeparator);

    String sourceUniqId = elements[0];
    String sourceName = elements[1];
    String sourceUrl = elements[2];
    String fileName = elements[3];

    return SourceItem(sourceUniqId, sourceName, sourceUrl, fileName);
  }

  static SourceItem fromSource(Source source, String fileName) =>
      SourceItem(source.uniqId, source.name, source.sourceUrl, fileName);

  static SourceItem fromFile(String path) {

    List<String> elements = path.split('/').last.split(fileSeparator);

    String sourceUniqId = elements[0];
    String fileName = elements[1];
    String? sourceUrl = ShaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_URL_FROM_UNIQ_ID_(sourceUniqId), '');
    String? sourceName = ShaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_FROM_UNIQ_ID_(sourceUniqId), '');

    return SourceItem(sourceUniqId, sourceName, sourceUrl, fileName);
  }

  String get cachedFileName => sourceUniqId + fileSeparator + fileName;

  File get cachedFile => File(getDuchoweSourceFolderPath(sourceUniqId) + cachedFileName);

  @override
  String toString() =>
      sourceUniqId + codeSeparator +
      sourceName! + codeSeparator +
      sourceUrl! + codeSeparator +
      fileName;

  String get downloadUrl => CatPageStrefaDucha.gitDuchoweImageUrl(sourceUniqId, fileName);

  bool get isFavorite {
    List<String> encodedItems = ShaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);
    return encodedItems.contains(toString());
  }

  void addToFavorite() {
    List<String> encodedItems = ShaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);
    if(encodedItems.contains(toString())) return;
    encodedItems.add(toString());
    ShaPref.setStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, encodedItems);
  }

  void removeFromFavorite() {
    List<String> encodedItems = ShaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);
    encodedItems.remove(toString());
    ShaPref.setStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, encodedItems);
  }

  @override
  bool operator == (Object other) => other is SourceItem && toString() == other.toString();
  
  @override
  int get hashCode => toString().hashCode;
}
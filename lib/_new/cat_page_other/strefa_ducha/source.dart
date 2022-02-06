import 'dart:io';

import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_classes/storage.dart';

import '_main.dart';

class Source{

  String code;
  String sourceUrl;
  String name;

  List<SourceItem> items;

  Source(this.code, this.sourceUrl, this.name, this.items);

  static Source decode(ShaPref shaPref, String code) {
    List<String> lines = code.split('\n');
    List<String> elements = lines[0].split(';');
    if(elements.length<3) throw Exception();
    shaPref.setString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_(elements[0]), elements[1]);
    shaPref.setString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_(elements[0]), elements[2]);

    List<SourceItem> sourceItems = [];
    for(int i=1; i<lines.length; i++) {
      if(lines[i].length==0) continue;
      sourceItems.add(SourceItem(elements[2], elements[0], lines[i], elements[1]));
    }
    return Source(elements[0], elements[1], elements[2], sourceItems);
  }

  static Source fromFolderName(ShaPref shaPref, String folderPath) {
    String folderName = folderPath.split('/').last;
    String sourceUrl = shaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_(folderName), '');
    String sourceName = shaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_(folderName), '');
    return Source(folderName, sourceUrl, sourceName, []);
  }

  void addAll(List<SourceItem> items) => this.items.addAll(items);

  bool get display => shaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_SOURCE_DISPLAY_(this), true);
  set display(bool value) => shaPref.setBool(ShaPref.SHA_PREF_DUCHOWE_SOURCE_DISPLAY_(this), value);

  void removeItemsSavedLocally(){
    Directory dir = Directory(getDuchoweSourceFolderPath(code));
    dir.deleteSync(recursive: true);
  }
}

class SourceItem{

  static const String CODE_SEPARATOR = ';';
  static const String FILE_SEPARATOR = '~';

  final String sourceName;
  final String sourceCode;
  final String fileName;
  final String sourceUrl;

  const SourceItem(this.sourceName, this.sourceCode, this.fileName, this.sourceUrl);

  static SourceItem get pinned {
    String stringCode = shaPref.getString(ShaPref.SHA_PREF_DUCHOWE_ITEM_LOCKED, null);
    if(stringCode == null) return null;
    else return SourceItem.fromStringCode(stringCode);
  }

  static SourceItem fromStringCode(String stringCode) {
    List<String> elements = stringCode.split(CODE_SEPARATOR);

    String sourceCode = elements[0];
    String fileName = elements[1];
    String sourceUrl = elements[2];
    String sourceName = shaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_(sourceCode), '');

    return SourceItem(sourceName, sourceCode, fileName, sourceUrl);
  }

  static SourceItem fromSource(Source source, String fileName) {
    String sourceName = source.name;
    String sourceCode = source.code;

    return SourceItem(sourceName, sourceCode, fileName, source.sourceUrl);
  }

  static SourceItem fromFile(ShaPref shaPref, String path) {

    List<String> elements = path.split('/').last.split(FILE_SEPARATOR);

    String sourceCode = elements[0];
    String fileName = elements[1];
    String sourceUrl = shaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_URL_OF_CODE_(sourceCode), '');
    String sourceName = shaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_(sourceCode), '');

    return SourceItem(sourceName, sourceCode, fileName, sourceUrl);
  }
/*
  static Future<SourceItem> decodeLocal(String code) async {
    List<String> elements = code.split(CODE_SEPARATOR);
    String sourceCode = elements[0];
    String fileName = elements[1];
    String sourceUrl = elements[2];
    String sourceName = await ShaPref.getString(ShaPref.SHA_PREF_DUCHOWE_SOURCE_NAME_OF_CODE_(sourceCode), '');

    return SourceItem(sourceName, sourceCode, fileName, sourceUrl);
  }
*/
  //static SourceItem noInternet() => null;

  String get cachedFileName => sourceCode + FILE_SEPARATOR + fileName;

  File get cachedFile => File(getDuchoweSourceFolderPath(sourceCode) + cachedFileName);

  @override
  String toString() => sourceCode + CODE_SEPARATOR + fileName + CODE_SEPARATOR + sourceUrl + CODE_SEPARATOR + sourceName;

  String downloadUrl() => SpiritPage.gitDuchoweImageUrl(sourceCode, fileName);

  static void pin(SourceItem item) => shaPref.setString(ShaPref.SHA_PREF_DUCHOWE_ITEM_LOCKED, item.toString());
  static void removePin() => shaPref.remove(ShaPref.SHA_PREF_DUCHOWE_ITEM_LOCKED);

  bool get isFavorite {
    List<String> itemCodes = shaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);
    return itemCodes.contains(toString());
  }

  void addToFavorite() {
    List<String> itemsFavorite = shaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);
    if(itemsFavorite.contains(toString())) return;
    itemsFavorite.add(toString());
    shaPref.setStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, itemsFavorite);
  }

  void removeFromFavorite() {
    List<String> itemsFavorite = shaPref.getStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, []);
    itemsFavorite.remove(toString());
    shaPref.setStringList(ShaPref.SHA_PREF_DUCHOWE_FAVORITE_ITEMS, itemsFavorite);
  }

  bool operator == (Object other) => other is SourceItem && toString() == other.toString();
  int get hashCode => toString().hashCode;
}